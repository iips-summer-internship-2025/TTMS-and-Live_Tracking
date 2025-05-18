<?php
require_once 'utils/Database.php';
require_once 'dao/TimetableDAO.php';

header('Content-Type: application/json');

try {
    // Get JSON input
    $input = json_decode(file_get_contents('php://input'), true);
    
    if (!$input) {
        throw new Exception('Invalid input data');
    }

    // Validate required fields
    $requiredFields = ['day', 'startTime', 'endTime', 'subject', 'subjectCode', 'faculty', 'room', 'session', 'semester', 'course'];
    foreach ($requiredFields as $field) {
        if (empty($input[$field])) {
            throw new Exception("Missing required field: $field");
        }
    }

    // Get database connection
    $db = Database::getInstance()->getConnection();
    $dao = TimetableDAO::getInstance();

    // Start transaction
    $db->begin_transaction();

    try {
        // Get or create IDs for related entities
        $sessionId = getOrCreateId($db, 'Batch_Year', 'Batch_ID', 'BatchYear', $input['session']);
        $semesterId = getOrCreateId($db, 'semesters', 'semester_id', 'semester_no', $input['semester']);
        $courseId = getOrCreateId($db, 'courses', 'course_id', 'course_name', $input['course']);
        $roomId = getOrCreateId($db, 'rooms', 'room_id', 'room_number', $input['room']);
        
        // Get or create faculty
        $facultyId = getFacultyId($db, $input['faculty']);
        
        // Get or create subject
        $subjectId = getOrUpdateSubject($db, $input['subject'], $input['subjectCode'], $facultyId);

        // Check for existing entry at the same time slot
        $stmt = $db->prepare("SELECT timetable_id FROM timetable 
                           WHERE day_of_week = ? 
                           AND start_time = ? 
                           AND end_time = ? 
                           AND semester_id = ? 
                           AND course_id = ? 
                           AND Batch_ID = ?");
        
        $stmt->bind_param('sssiis', 
            $input['day'], 
            $input['startTime'], 
            $input['endTime'], 
            $semesterId, 
            $courseId, 
            $sessionId
        );
        
        $stmt->execute();
        $result = $stmt->get_result();
        $existingEntry = $result->fetch_assoc();
        $stmt->close();

        if ($existingEntry) {
            // Update existing entry
            $stmt = $db->prepare("UPDATE timetable 
                               SET room_id = ?, subject_id = ? 
                               WHERE timetable_id = ?");
            
            $stmt->bind_param('iii', 
                $roomId, 
                $subjectId, 
                $existingEntry['timetable_id']
            );
        } else {
            // Insert new entry
            $stmt = $db->prepare("INSERT INTO timetable 
                               (day_of_week, start_time, end_time, semester_id, course_id, 
                                room_id, subject_id, Batch_ID) 
                               VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
            
            $stmt->bind_param('sssiiiis', 
                $input['day'], 
                $input['startTime'], 
                $input['endTime'], 
                $semesterId, 
                $courseId, 
                $roomId, 
                $subjectId, 
                $sessionId
            );
        }

        if (!$stmt->execute()) {
            throw new Exception("Failed to save timetable entry: " . $stmt->error);
        }

        $stmt->close();
        
        // Commit transaction
        $db->commit();
        
        echo json_encode([
            'success' => true,
            'message' => 'Timetable entry updated successfully'
        ]);

    } catch (Exception $e) {
        // Rollback transaction on error
        $db->rollback();
        throw $e;
    }

} catch (Exception $e) {
    echo json_encode([
        'success' => false,
        'message' => $e->getMessage()
    ]);
}

/**
 * Get ID from table by value, or create if it doesn't exist
 */
function getOrCreateId($db, $table, $idColumn, $valueColumn, $value) {
    // Check if value exists
    $stmt = $db->prepare("SELECT $idColumn FROM $table WHERE $valueColumn = ?");
    $stmt->bind_param('s', $value);
    $stmt->execute();
    $result = $stmt->get_result();
    
    if ($row = $result->fetch_assoc()) {
        $id = $row[$idColumn];
        $stmt->close();
        return $id;
    }
    
    $stmt->close();
    
    // Create new entry
    $stmt = $db->prepare("INSERT INTO $table ($valueColumn) VALUES (?)");
    $stmt->bind_param('s', $value);
    $stmt->execute();
    $id = $db->insert_id;
    $stmt->close();
    
    return $id;
}

/**
 * Get faculty ID, create if not exists
 */
function getFacultyId($db, $facultyName) {
    // Check if faculty exists
    $stmt = $db->prepare("SELECT faculty_id FROM faculty WHERE faculty_name = ?");
    $stmt->bind_param('s', $facultyName);
    $stmt->execute();
    $result = $stmt->get_result();
    
    if ($row = $result->fetch_assoc()) {
        $facultyId = $row['faculty_id'];
        $stmt->close();
        return $facultyId;
    }
    
    $stmt->close();
    
    // Create new faculty
    $stmt = $db->prepare("INSERT INTO faculty (faculty_name) VALUES (?)");
    $stmt->bind_param('s', $facultyName);
    $stmt->execute();
    $facultyId = $db->insert_id;
    $stmt->close();
    
    return $facultyId;
}

/**
 * Get or update subject with faculty
 */
function getOrUpdateSubject($db, $subjectName, $subjectCode, $facultyId) {
    // Check if subject exists with this code
    $stmt = $db->prepare("SELECT subject_id, faculty_id FROM subjects WHERE subject_code = ?");
    $stmt->bind_param('s', $subjectCode);
    $stmt->execute();
    $result = $stmt->get_result();
    
    if ($row = $result->fetch_assoc()) {
        $subjectId = $row['subject_id'];
        $currentFacultyId = $row['faculty_id'];
        $stmt->close();
        
        // Update faculty if changed
        if ($currentFacultyId != $facultyId) {
            $stmt = $db->prepare("UPDATE subjects SET faculty_id = ? WHERE subject_id = ?");
            $stmt->bind_param('ii', $facultyId, $subjectId);
            $stmt->execute();
            $stmt->close();
        }
        
        return $subjectId;
    }
    
    $stmt->close();
    
    // Create new subject
    $stmt = $db->prepare("INSERT INTO subjects (subject_name, subject_code, faculty_id) VALUES (?, ?, ?)");
    $stmt->bind_param('ssi', $subjectName, $subjectCode, $facultyId);
    $stmt->execute();
    $subjectId = $db->insert_id;
    $stmt->close();
    
    return $subjectId;
} 