
-- Insert demo users
INSERT INTO users (username, password, role) VALUES
('employee1', 'pass123', 'Employee'),
('manager1', 'pass123', 'Manager'),
('admin1', 'pass123', 'Admin');

-- Insert demo software
INSERT INTO software (name, description, access_levels) VALUES
('HR System', 'HR management tool', 'Read,Write,Admin'),
('Finance System', 'Handles company finances', 'Read,Write,Admin'),
('IT Support', 'IT support platform', 'Read,Write,Admin');
