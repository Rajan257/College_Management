-- ============================================================
-- College Management System - Full Database Dump & Schema
-- Generated for deployment on Aiven / Render / MySQL 8.0+
-- Database Name: defaultdb (or project)
-- ============================================================

CREATE TABLE IF NOT EXISTS admin_signup (
  uid VARCHAR(50) PRIMARY KEY,
  Name VARCHAR(50),
  Email VARCHAR(80),
  contact BIGINT,
  password INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS faculty_signup (
  uid VARCHAR(50) PRIMARY KEY,
  Name VARCHAR(50),
  Email VARCHAR(80),
  contact BIGINT,
  password INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS student_signup (
  uid VARCHAR(50),
  Name VARCHAR(50),
  Email VARCHAR(80),
  contact BIGINT,
  password INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS notices (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(200) NOT NULL,
  content TEXT NOT NULL,
  posted_by VARCHAR(100) NOT NULL,
  posted_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================================
-- Seed Data from Local Database
-- ============================================================

INSERT IGNORE INTO admin_signup (uid, Name, Email, contact, password) VALUES
('123', 'Rajan Rai', 'rajanbhatt257@gmail.com', 9580811395, 12345);

INSERT IGNORE INTO faculty_signup (uid, Name, Email, contact, password) VALUES
('123', 'Rajan Rai', 'rajanbhatt257@gmail.com', 9580811395, 12345);

INSERT INTO student_signup (uid, Name, Email, contact, password) VALUES
('123', 'Rajan Rai', 'rajanbhatt257@gmail.com', 9580811395, 12345),
('121', 'Rajan Rai', 'rajanbhatt257@gmail.com', 9580811395, 123);
