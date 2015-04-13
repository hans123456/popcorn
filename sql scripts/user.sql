INSERT INTO `users` (`first_name`, `last_name`, `gender`, `birth_date`, `contact_number`, `email`, `password`) 
VALUES 
('admin', 'admin', 'M', '1990-01-01', '0000', 'admin@admin.com', sha2('password', 512));

INSERT INTO `admins` (`user_id`)
VALUES
(1);

INSERT INTO `doctors` (`specialization_id`, `city_id`, `hospital_id`, `user_id`) 
VALUE
(9, 11, 277, 1);

INSERT INTO `available times` (`day_id`, `time_id`, `doctor_id`)
VALUE
(1, 1, 1), (1, 2, 1), (1, 4, 1), (1, 5, 1);

INSERT INTO `users` (`first_name`, `last_name`, `gender`, `birth_date`, `contact_number`, `email`, `password`) 
VALUES 
('a', 'a', 'M', '1990-01-01', '0000', 'a@a.com', sha2('b', 512));

INSERT INTO `appointments` (`date`, `time_id`, `user_id`, `doctor_id`)
VALUE
('2015-04-20', 2, 2, 1), ('2015-04-20', 1, 2, 1)