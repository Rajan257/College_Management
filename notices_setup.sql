-- ============================================================
-- College Management System - Database Setup Script
-- Run this script once before deploying the application.
-- Database: project
-- ============================================================

USE project;

-- Create notices table (new table - existing tables are NOT modified)
CREATE TABLE IF NOT EXISTS notices (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    content TEXT NOT NULL,
    posted_by VARCHAR(100) NOT NULL,
    posted_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Verify existing tables are intact
-- SELECT * FROM student_signup;
-- SELECT * FROM faculty_signup;
-- SELECT * FROM admin_signup;
-- SELECT * FROM notices;
