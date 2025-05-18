<?php
require_once 'utils/Database.php';
require_once 'dao/TimetableDAO.php';

header('Content-Type: application/json');

try {
    // Get query parameters
    $session = $_GET['session'] ?? '';
    $semester = $_GET['semester'] ?? '';
    $course = $_GET['course'] ?? '';

    // Validate required parameters
    if (empty($session) || empty($semester) || empty($course)) {
        throw new Exception('Missing required parameters');
    }

    // Get database connection
    $db = Database::getInstance()->getConnection();
    
    // Prepare the query
    $sql = "SELECT 
                t.timetable_id,
                t.day_of_week as day,
                TIME_FORMAT(t.start_time, '%H:%i') as timeStart,
                TIME_FORMAT(t.end_time, '%H:%i') as timeEnd,
                s.subject_name as subjectName,
                s.subject_code as subjectCode,
                f.faculty_name as facultyName,
                r.room_number as roomNumber
            FROM timetable t
            JOIN subjects s ON t.subject_id = s.subject_id
            JOIN faculty f ON s.faculty_id = f.faculty_id
            JOIN rooms r ON t.room_id = r.room_id
            JOIN semesters sem ON t.semester_id = sem.semester_id
            JOIN courses c ON t.course_id = c.course_id
            JOIN Batch_Year b ON t.Batch_ID = b.Batch_ID
            WHERE b.BatchYear = ?
            AND sem.semester_no = ?
            AND c.course_name = ?
            ORDER BY 
                CASE 
                    WHEN t.day_of_week = 'Monday' THEN 1
                    WHEN t.day_of_week = 'Tuesday' THEN 2
                    WHEN t.day_of_week = 'Wednesday' THEN 3
                    WHEN t.day_of_week = 'Thursday' THEN 4
                    WHEN t.day_of_week = 'Friday' THEN 5
                    WHEN t.day_of_week = 'Saturday' THEN 6
                END,
                t.start_time";

    $stmt = $db->prepare($sql);
    $stmt->bind_param('sss', $session, $semester, $course);
    $stmt->execute();
    $result = $stmt->get_result();

    $entries = [];
    while ($row = $result->fetch_assoc()) {
        $entries[] = $row;
    }

    $stmt->close();

    echo json_encode([
        'success' => true,
        'data' => $entries
    ]);

} catch (Exception $e) {
    echo json_encode([
        'success' => false,
        'message' => $e->getMessage()
    ]);
} 