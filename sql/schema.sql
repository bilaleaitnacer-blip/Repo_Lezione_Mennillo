-- MySQL Database Schema for Corporate Training Management

CREATE DATABASE corporate_training_management;

USE corporate_training_management;

-- Table for courses
CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(255) NOT NULL,
    description TEXT,
    duration_hours INT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Table for training sessions
CREATE TABLE sessions (
    session_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT NOT NULL,
    session_date DATETIME NOT NULL,
    location VARCHAR(255) NOT NULL,
    instructor VARCHAR(255) NOT NULL,
    FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE
);

-- Table for pricing
CREATE TABLE pricing (
    pricing_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    currency VARCHAR(3) NOT NULL,
    FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE
);

-- Example Data Insertion
INSERT INTO courses (course_name, description, duration_hours) VALUES
('Intro to Corporate Training', 'Learn the basics of corporate training.', 20),
('Advanced Corporate Training', 'In-depth training for professionals.', 40);

INSERT INTO sessions (course_id, session_date, location, instructor) VALUES
(1, '2026-05-14 09:00:00', 'Room A', 'John Doe'),
(2, '2026-05-15 09:00:00', 'Room B', 'Jane Smith');

INSERT INTO pricing (course_id, price, currency) VALUES
(1, 500.00, 'USD'),
(2, 1000.00, 'USD');
