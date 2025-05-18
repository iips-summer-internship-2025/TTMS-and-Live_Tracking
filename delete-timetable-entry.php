<?php
require_once 'utils/Database.php';
require_once 'dao/TimetableDAO.php';

header('Content-Type: application/json');

try {
    // Get JSON input
    $input = json_decode(file_get_contents('php://input'), true);
    
    if (!$input || !isset($input['id'])) {
        throw new Exception('Invalid input data');
    }

    // Get database connection
    $db = Database::getInstance()->getConnection();
    
    // Start transaction
    $db->begin_transaction();

    try {
        // Delete the timetable entry
        $stmt = $db->prepare("DELETE FROM timetable WHERE timetable_id = ?");
        $stmt->bind_param('i', $input['id']);
        
        if (!$stmt->execute()) {
            throw new Exception("Failed to delete timetable entry: " . $stmt->error);
        }

        if ($stmt->affected_rows === 0) {
            throw new Exception("No timetable entry found with ID: " . $input['id']);
        }

        $stmt->close();
        
        // Commit transaction
        $db->commit();
        
        echo json_encode([
            'success' => true,
            'message' => 'Timetable entry deleted successfully'
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