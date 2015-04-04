INSERT INTO `users` (`first_name`, `last_name`, `gender`, `birth_date`, `contact_number`, `email`, `password`) 
VALUES 
('admin', 'admin', 'M', '1990-01-01', '0000', 'admin@admin.com', sha2('password', 512));

INSERT INTO `admins` (`user_id`)
VALUES
(1);