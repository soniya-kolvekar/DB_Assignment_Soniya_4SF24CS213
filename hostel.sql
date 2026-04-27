CREATE TABLE Students (
    student_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT UNIQUE,
    phone TEXT,
    course TEXT,
    year INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Hostels (
    hostel_id INTEGER PRIMARY KEY AUTOINCREMENT,
    hostel_name TEXT,
    location TEXT,
    capacity INTEGER
);

CREATE TABLE Rooms (
    room_id INTEGER PRIMARY KEY AUTOINCREMENT,
    hostel_id INTEGER,
    room_number TEXT,
    room_type TEXT,
    capacity INTEGER,
    FOREIGN KEY (hostel_id) REFERENCES Hostels(hostel_id)
);

CREATE TABLE Allocations (
    allocation_id INTEGER PRIMARY KEY AUTOINCREMENT,
    student_id INTEGER,
    room_id INTEGER,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id)
);

CREATE TABLE Complaints (
    complaint_id INTEGER PRIMARY KEY AUTOINCREMENT,
    student_id INTEGER,
    description TEXT,
    status TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

CREATE TABLE Visitors (
    visitor_id INTEGER PRIMARY KEY AUTOINCREMENT,
    student_id INTEGER,
    visitor_name TEXT,
    visit_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

CREATE TABLE Attendance (
    attendance_id INTEGER PRIMARY KEY AUTOINCREMENT,
    student_id INTEGER,
    date DATE,
    status TEXT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

INSERT INTO Students (name, email, phone, course, year) VALUES
('Aarav Sharma', 'aarav@gmail.com', '9876543210', 'CSE', 2),
('Riya Patel', 'riya@gmail.com', '9876543211', 'ECE', 1),
('Karan Mehta', 'karan@gmail.com', '9876543212', 'ME', 3),
('Sneha Iyer', 'sneha@gmail.com', '9876543213', 'CSE', 4),
('Rahul Das', 'rahul@gmail.com', '9876543214', 'EEE', 2),
('Priya Nair', 'priya@gmail.com', '9876543215', 'IT', 1),
('Vikram Singh', 'vikram@gmail.com', '9876543216', 'CSE', 3),
('Anjali Verma', 'anjali@gmail.com', '9876543217', 'ECE', 2),
('Rohan Kapoor', 'rohan@gmail.com', '9876543218', 'ME', 4),
('Meera Joshi', 'meera@gmail.com', '9876543219', 'IT', 1);

INSERT INTO Hostels VALUES
(1, 'Block A', 'North Campus', 100),
(2, 'Block B', 'South Campus', 120),
(3, 'Block C', 'East Campus', 80);

INSERT INTO Rooms (hostel_id, room_number, room_type, capacity) VALUES
(1, 'A101', 'Single', 1),
(1, 'A102', 'Double', 2),
(1, 'A103', 'Triple', 3),
(2, 'B201', 'Single', 1),
(2, 'B202', 'Double', 2),
(2, 'B203', 'Triple', 3),
(3, 'C301', 'Single', 1),
(3, 'C302', 'Double', 2),
(3, 'C303', 'Triple', 3);

INSERT INTO Allocations (student_id, room_id, start_date) VALUES
(1, 1, '2025-01-01'),
(2, 2, '2025-01-01'),
(3, 3, '2025-01-01'),
(4, 4, '2025-01-01'),
(5, 5, '2025-01-01'),
(6, 6, '2025-01-01'),
(7, 2, '2025-01-01'),
(8, 3, '2025-01-01'),
(9, 4, '2025-01-01'),
(10, 5, '2025-01-01');

INSERT INTO Complaints (student_id, description, status) VALUES
(1, 'Fan not working', 'Pending'),
(2, 'Water leakage', 'Resolved'),
(3, 'WiFi issue', 'Pending'),
(4, 'Light problem', 'In Progress'),
(5, 'Broken chair', 'Pending'),
(6, 'Bathroom issue', 'Resolved'),
(7, 'Noise complaint', 'Pending'),
(8, 'AC not cooling', 'In Progress'),
(9, 'Window broken', 'Pending'),
(10, 'Cleaning issue', 'Resolved');

INSERT INTO Visitors (student_id, visitor_name, visit_date) VALUES
(1, 'Father', '2025-03-01'),
(2, 'Mother', '2025-03-02'),
(3, 'Friend', '2025-03-03'),
(4, 'Brother', '2025-03-04'),
(5, 'Guardian', '2025-03-05'),
(6, 'Friend', '2025-03-06'),
(7, 'Father', '2025-03-07'),
(8, 'Mother', '2025-03-08'),
(9, 'Friend', '2025-03-09'),
(10, 'Brother', '2025-03-10');

INSERT INTO Attendance (student_id, date, status) VALUES
(1, '2025-04-01', 'Present'),
(2, '2025-04-01', 'Absent'),
(3, '2025-04-01', 'Present'),
(4, '2025-04-01', 'Present'),
(5, '2025-04-01', 'Absent'),
(6, '2025-04-01', 'Present'),
(7, '2025-04-01', 'Present'),
(8, '2025-04-01', 'Absent'),
(9, '2025-04-01', 'Present'),
(10, '2025-04-01', 'Present');

SELECT name, course
FROM Students;

SELECT room_number, capacity
FROM Rooms
WHERE capacity > 1;

SELECT Students.name, Rooms.room_number
FROM Students
JOIN Allocations ON Students.student_id = Allocations.student_id
JOIN Rooms ON Allocations.room_id = Rooms.room_id;

SELECT Students.name, Hostels.hostel_name
FROM Students
JOIN Allocations ON Students.student_id = Allocations.student_id
JOIN Rooms ON Allocations.room_id = Rooms.room_id
JOIN Hostels ON Rooms.hostel_id = Hostels.hostel_id
WHERE Hostels.hostel_name = 'Block A';

SELECT description
FROM Complaints
WHERE status = 'Pending';

SELECT Students.name, Complaints.status
FROM Complaints
JOIN Students ON Complaints.student_id = Students.student_id;

SELECT visitor_name, visit_date
FROM Visitors;

SELECT COUNT(complaint_id)
FROM Complaints;

