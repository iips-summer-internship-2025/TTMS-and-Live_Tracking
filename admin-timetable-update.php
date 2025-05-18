<?php
require_once __DIR__ . '/utils/SessionUtils.php';
require_once __DIR__ . '/dao/TimetableDAO.php';

// Start the session if not started
SessionUtils::startSessionIfNeeded();

// Enforce admin role access
SessionUtils::requireAdmin();

// Initialize DAO
$dao = TimetableDAO::getInstance();

// Hard-code all semester options to ensure they appear
$allSemesters = [
    ['semester_id' => 1, 'semester_no' => 'I'],
    ['semester_id' => 2, 'semester_no' => 'II'],
    ['semester_id' => 3, 'semester_no' => 'III'],
    ['semester_id' => 4, 'semester_no' => 'IV'],
    ['semester_id' => 5, 'semester_no' => 'V'],
    ['semester_id' => 6, 'semester_no' => 'VI'],
    ['semester_id' => 7, 'semester_no' => 'VII'],
    ['semester_id' => 8, 'semester_no' => 'VIII'],
    ['semester_id' => 9, 'semester_no' => 'IX'],
    ['semester_id' => 10, 'semester_no' => 'X']
];

// Get dropdown values for the form
try {
    $courses = $dao->getDistinctValues('courses', 'course_name');
    $rooms = $dao->getDistinctValues('rooms', 'room_number');
    $sessions = $dao->getSessions();
    
    // DEBUG: Check if sessions data is correctly loaded
    if (empty($sessions)) {
        error_log("WARNING: No sessions loaded from database");
        // Add a fallback dummy session for testing
        $sessions = [
            ['Batch_ID' => 1, 'BatchYear' => '2023-2024'],
            ['Batch_ID' => 2, 'BatchYear' => '2022-2023']
        ];
    } else {
        error_log("INFO: " . count($sessions) . " sessions loaded from database");
    }
    
    // Get faculty and subject data for autocomplete
    $faculty = $dao->getAllFaculty();
    $subjects = $dao->getAllSubjects();
} catch (Exception $e) {
    $error = "Error loading dropdown values: " . $e->getMessage();
    error_log($error);
}

// Get filter values from query string (for selecting a timetable to edit)
$selectedSemester = $_GET['semester'] ?? '';
$selectedCourse = $_GET['course'] ?? '';
$selectedSession = $_GET['session'] ?? '';
// Room option has been removed
$selectedRoom = '';

// Check if we have enough parameters to load a timetable
$canLoadTimetable = !empty($selectedSemester) && !empty($selectedCourse);

// Fetch timetable data if we have sufficient parameters
$timetableEntries = [];
if ($canLoadTimetable) {
    $filters = [
        'semester' => $selectedSemester,
        'course' => $selectedCourse
    ];
    
    if (!empty($selectedSession)) {
        $filters['session'] = $selectedSession;
    }
    
    // Room filtering has been removed
    
    try {
        $timetableEntries = $dao->getTimetableEntries($filters);
    } catch (Exception $e) {
        $error = "Error loading timetable: " . $e->getMessage();
        error_log($error);
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Timetable</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        :root {
            --primary-color: #007bff;
            --secondary-color: #2c3e50;
            --success-color: #28a745;
            --warning-color: #ffc107;
            --danger-color: #dc3545;
            --light-color: #f8f9fa;
            --dark-color: #343a40;
            --shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            --transition: all 0.3s ease;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background: #f4f6f9;
            color: var(--dark-color);
            line-height: 1.6;
        }

        /* Navbar */
        .navbar {
            background: var(--secondary-color);
            padding: 1rem 2rem;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: var(--shadow);
            position: sticky;
            top: 0;
            z-index: 100;
        }

        .navbar h1 {
            font-size: 1.5rem;
            font-weight: 600;
            display: flex;
            align-items: center;
        }

        .navbar h1 i {
            margin-right: 0.5rem;
        }

        .navbar-actions {
            display: flex;
            gap: 0.75rem;
        }

        /* Container */
        .container {
            max-width: 1400px;
            margin: 2rem auto;
            padding: 0 1.5rem;
        }

        /* Cards */
        .card {
            background: white;
            border-radius: 10px;
            box-shadow: var(--shadow);
            margin-bottom: 2rem;
            overflow: hidden;
        }

        .card-header {
            background: var(--secondary-color);
            color: white;
            padding: 1.25rem 1.5rem;
            font-size: 1.25rem;
            font-weight: 600;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .card-header i {
            margin-right: 0.75rem;
        }

        .card-body {
            padding: 1.5rem;
        }

        /* Forms */
        .form-row {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 1.5rem;
            margin-bottom: 1.5rem;
        }

        .form-group {
            margin-bottom: 1rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
        }

        .form-group select,
        .form-group input {
            width: 100%;
            padding: 0.5rem;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 1rem;
        }

        /* Buttons */
        .btn {
            display: inline-flex;
            align-items: center;
            padding: 0.5rem 1rem;
            border: none;
            border-radius: 4px;
            font-size: 1rem;
            cursor: pointer;
            transition: var(--transition);
            text-decoration: none;
            color: white;
        }

        .btn i {
            margin-right: 0.5rem;
        }

        .btn-primary {
            background: var(--primary-color);
        }

        .btn-success {
            background: var(--success-color);
        }

        .btn-warning {
            background: var(--warning-color);
            color: var(--dark-color);
        }

        .btn-danger {
            background: var(--danger-color);
        }

        .btn-group {
            display: flex;
            gap: 0.75rem;
            margin-top: 1rem;
        }

        /* Update Form */
        .update-form {
            background: white;
            padding: 1.5rem;
            border-radius: 8px;
            box-shadow: var(--shadow);
        }

        .update-form-header {
            margin-bottom: 1.5rem;
            padding-bottom: 1rem;
            border-bottom: 1px solid #eee;
        }

        .update-form-body {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 1.5rem;
        }

        /* Toast Messages */
        .toast-container {
            position: fixed;
            top: 1rem;
            right: 1rem;
            z-index: 1000;
        }

        .toast {
            background: white;
            color: var(--dark-color);
            padding: 1rem;
            border-radius: 4px;
            box-shadow: var(--shadow);
            margin-bottom: 0.5rem;
            display: flex;
            align-items: center;
            animation: slideIn 0.3s ease;
        }

        .toast.success {
            border-left: 4px solid var(--success-color);
        }

        .toast.error {
            border-left: 4px solid var(--danger-color);
        }

        @keyframes slideIn {
            from {
                transform: translateX(100%);
                opacity: 0;
            }
            to {
                transform: translateX(0);
                opacity: 1;
            }
        }

        @media (max-width: 768px) {
            .form-row {
                grid-template-columns: 1fr;
            }

            .update-form-body {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <nav class="navbar">
        <h1><i class="fas fa-calendar-alt"></i> Update Timetable</h1>
        <div class="navbar-actions">
            <a href="admin-dashboard.php" class="btn btn-primary"><i class="fas fa-home"></i> Dashboard</a>
            <a href="logout.php" class="btn btn-danger"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </div>
    </nav>

    <div class="container">
        <!-- Select Timetable Section -->
        <div class="card">
            <div class="card-header">
                <div>
                    <i class="fas fa-search"></i>
                    Select Timetable to Update
                </div>
            </div>
            <div class="card-body">
                <form id="timetableFilterForm" method="GET" action="admin-timetable-update.php">
                    <div class="form-row">
                        <div class="form-group">
                            <label for="session">Academic Session:</label>
                            <select id="session" name="session" class="plain-select">
                                <option value="">Select Session</option>
                                <?php foreach ($sessions as $session): ?>
                                    <option value="<?php echo htmlspecialchars($session['BatchYear']); ?>" 
                                            <?php echo ($selectedSession == $session['BatchYear']) ? 'selected' : ''; ?>>
                                        <?php echo htmlspecialchars($session['BatchYear']); ?>
                                    </option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="semester">Semester:</label>
                            <select id="semester" name="semester" class="plain-select">
                                <option value="">Select Semester</option>
                                <?php foreach ($allSemesters as $sem): ?>
                                    <option value="<?php echo htmlspecialchars($sem['semester_no']); ?>" 
                                            <?php echo ($selectedSemester == $sem['semester_no']) ? 'selected' : ''; ?>>
                                        Semester <?php echo htmlspecialchars($sem['semester_no']); ?>
                                    </option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="course">Course:</label>
                            <select id="course" name="course" class="plain-select">
                                <option value="">Select Course</option>
                                <?php foreach ($courses as $c): ?>
                                    <option value="<?php echo htmlspecialchars($c); ?>" 
                                            <?php echo ($selectedCourse == $c) ? 'selected' : ''; ?>>
                                        <?php echo htmlspecialchars($c); ?>
                                    </option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                    </div>
                    <div class="btn-group">
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-search"></i> Filter Timetable
                        </button>
                        <button type="button" id="resetFilters" class="btn btn-warning">
                            <i class="fas fa-undo"></i> Reset Filters
                        </button>
                    </div>
                </form>
            </div>
        </div>

        <!-- Update Form Section -->
        <?php if ($selectedSession && $selectedSemester && $selectedCourse): ?>
        <div class="card">
            <div class="card-header">
                <div>
                    <i class="fas fa-edit"></i>
                    Update Timetable Entry
                </div>
            </div>
            <div class="card-body">
                <form id="updateEntryForm" class="update-form">
                    <div class="update-form-body">
                        <div class="form-group">
                            <label for="day">Day:</label>
                            <select id="day" name="day" required>
                                <option value="">Select Day</option>
                                <option value="Monday">Monday</option>
                                <option value="Tuesday">Tuesday</option>
                                <option value="Wednesday">Wednesday</option>
                                <option value="Thursday">Thursday</option>
                                <option value="Friday">Friday</option>
                                <option value="Saturday">Saturday</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="timeSlot">Time Slot:</label>
                            <div style="display: flex; gap: 1rem;">
                                <input type="time" id="startTime" name="startTime" required>
                                <input type="time" id="endTime" name="endTime" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="subject">Subject:</label>
                            <select id="subject" name="subject" required>
                                <option value="">Select Subject</option>
                                <?php foreach ($subjects as $subject): ?>
                                    <option value="<?php echo htmlspecialchars($subject['subject_name']); ?>" 
                                            data-code="<?php echo htmlspecialchars($subject['subject_code']); ?>">
                                        <?php echo htmlspecialchars($subject['subject_name']); ?>
                                    </option>
                                <?php endforeach; ?>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="subjectCode">Subject Code:</label>
                            <input type="text" id="subjectCode" name="subjectCode" required readonly>
                        </div>

                        <div class="form-group">
                            <label for="faculty">Faculty:</label>
                            <select id="faculty" name="faculty" required>
                                <option value="">Select Faculty</option>
                                <?php foreach ($faculty as $f): ?>
                                    <option value="<?php echo htmlspecialchars($f['faculty_name']); ?>">
                                        <?php echo htmlspecialchars($f['faculty_name']); ?>
                                    </option>
                                <?php endforeach; ?>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="room">Room:</label>
                            <select id="room" name="room" required>
                                <option value="">Select Room</option>
                                <?php foreach ($rooms as $room): ?>
                                    <option value="<?php echo htmlspecialchars($room); ?>">
                                        <?php echo htmlspecialchars($room); ?>
                                    </option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                    </div>

                    <div class="btn-group">
                        <button type="submit" class="btn btn-success">
                            <i class="fas fa-save"></i> Update Entry
                        </button>
                        <button type="reset" class="btn btn-warning">
                            <i class="fas fa-undo"></i> Reset Form
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <?php endif; ?>
    </div>

    <!-- Toast Container -->
    <div id="toastContainer" class="toast-container"></div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const updateForm = document.getElementById('updateEntryForm');
            const subjectSelect = document.getElementById('subject');
            const subjectCodeInput = document.getElementById('subjectCode');
            const toastContainer = document.getElementById('toastContainer');

            // Handle subject selection
            subjectSelect.addEventListener('change', function() {
                const selectedOption = this.options[this.selectedIndex];
                const subjectCode = selectedOption.dataset.code;
                subjectCodeInput.value = subjectCode || '';
            });

            // Handle form submission
            updateForm.addEventListener('submit', async function(e) {
                e.preventDefault();

                const formData = {
                    day: document.getElementById('day').value,
                    startTime: document.getElementById('startTime').value,
                    endTime: document.getElementById('endTime').value,
                    subject: document.getElementById('subject').value,
                    subjectCode: document.getElementById('subjectCode').value,
                    faculty: document.getElementById('faculty').value,
                    room: document.getElementById('room').value,
                    session: document.getElementById('session').value,
                    semester: document.getElementById('semester').value,
                    course: document.getElementById('course').value
                };

                try {
                    const response = await fetch('update-timetable-entry.php', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify(formData)
                    });

                    const result = await response.json();

                    if (result.success) {
                        showToast('Timetable entry updated successfully', 'success');
                        updateForm.reset();
                    } else {
                        showToast(result.message || 'Failed to update timetable entry', 'error');
                    }
                } catch (error) {
                    showToast('An error occurred while updating the timetable', 'error');
                    console.error('Error:', error);
                }
            });

            // Show toast message
            function showToast(message, type = 'success') {
                const toast = document.createElement('div');
                toast.className = `toast ${type}`;
                toast.textContent = message;

                toastContainer.appendChild(toast);

                setTimeout(() => {
                    toast.remove();
                }, 3000);
            }

            // Reset filters
            document.getElementById('resetFilters').addEventListener('click', function() {
                document.getElementById('session').value = '';
                document.getElementById('semester').value = '';
                document.getElementById('course').value = '';
                document.getElementById('timetableFilterForm').submit();
            });
        });
    </script>
</body>
</html>