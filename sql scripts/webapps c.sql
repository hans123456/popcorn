DROP TABLE IF EXISTS `days`;

	CREATE TABLE `days` (
		`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
		`name` varchar(10) NOT NULL,
		PRIMARY KEY (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `times`;

	CREATE TABLE `times` (
		`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
		`time` time NOT NULL,
		PRIMARY KEY (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `specializations`;

	CREATE TABLE `specializations` (
		`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
		`name` varchar(100) NOT NULL,
		`description` varchar(300) NOT NULL,
		PRIMARY KEY (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;
	
DROP TABLE IF EXISTS `cities`;

	CREATE TABLE `cities` (
		`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
		`name` varchar(50) NOT NULL,
		PRIMARY KEY (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `hospitals`;

	CREATE TABLE `hospitals` (
		`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
		`name` varchar(200) NOT NULL,
		`city_id` int(11) unsigned NOT NULL,
		PRIMARY KEY (`id`),
		FOREIGN KEY fk_city(`city_id`) REFERENCES `cities`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `users`;

	CREATE TABLE `users` (
		`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
		`first_name` varchar(50) NOT NULL,
		`last_name` varchar(50) NOT NULL,
		`gender` varchar(1) NOT NULL,
		`birth_date` date NOT NULL,
		`contact_number` varchar(100) NOT NULL,
		`email` varchar(50) NOT NULL,
		`password` varchar(512) NOT NULL,
		PRIMARY KEY (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `admins`;

	CREATE TABLE `admins` (
		`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
		`user_id` int(11) unsigned NOT NULL,
		PRIMARY KEY (`id`),
		FOREIGN KEY fk_user(`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;
	
DROP TABLE IF EXISTS `doctors`;

	CREATE TABLE `doctors` (
		`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
		`specialization_id` int(11) unsigned NOT NULL,
		`city_id` int(11) unsigned NOT NULL,
		`hospital_id` int(11) unsigned NOT NULL,
		`user_id` int(11) unsigned NOT NULL,
		PRIMARY KEY (`id`),
		FOREIGN KEY fk_specialization(`specialization_id`) REFERENCES `specializations`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
		FOREIGN KEY fk_city(`city_id`) REFERENCES `cities`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
		FOREIGN KEY fk_hospital(`hospital_id`) REFERENCES `hospitals`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
		FOREIGN KEY fk_user(`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `available times`;

	CREATE TABLE `available times` (
		`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
		`day_id` int(11) unsigned NOT NULL,
		`time_id` int(11) unsigned NOT NULL,
		`doctor_id` int(11) unsigned NOT NULL,
		PRIMARY KEY (`id`),
		FOREIGN KEY fk_day(`day_id`) REFERENCES `days`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
		FOREIGN KEY fk_time(`time_id`) REFERENCES `times`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
		FOREIGN KEY fk_doctor(`doctor_id`) REFERENCES `doctors`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `unavailable times`;

	CREATE TABLE `unavailable times` (
		`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
		`date` date NOT NULL,
		`time_id` int(11) unsigned NOT NULL,
		`doctor_id` int(11) unsigned NOT NULL,
		PRIMARY KEY (`id`),
		FOREIGN KEY fk_time(`time_id`) REFERENCES `times`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
		FOREIGN KEY fk_doctor(`doctor_id`) REFERENCES `doctors`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `medications`;

	CREATE TABLE `medications` (
		`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
		`name` varchar(200) NOT NULL,
		`user_id` int(11) unsigned NOT NULL,
		PRIMARY KEY (`id`),
		FOREIGN KEY fk_user(`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;
	
DROP TABLE IF EXISTS `hospitalizations`;

	CREATE TABLE `hospitalizations` (
		`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
		`sickness` varchar(100) NOT NULL,
		`date` date NOT NULL,
		`user_id` int(11) unsigned NOT NULL,
		PRIMARY KEY (`id`),
		FOREIGN KEY fk_user(`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;
	
DROP TABLE IF EXISTS `appointments`;

	CREATE TABLE `appointments` (
		`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
		`date` date NOT NULL,
		`time_id` int(11) unsigned,
		`user_id` int(11) unsigned,
		`doctor_id` int(11) unsigned,
		PRIMARY KEY (`id`),
		FOREIGN KEY fk_user(`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
		FOREIGN KEY fk_doctor(`doctor_id`) REFERENCES `doctors`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `feedbacks`;

	CREATE TABLE `feedbacks` (
		`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
		`rate` int(1) unsigned NOT NULL,
		`comment` varchar(300) NOT NULL,
		`user_id` int(11) unsigned NOT NULL,
		`doctor_id` int(11) unsigned,
		PRIMARY KEY (`id`),
		FOREIGN KEY fk_user(`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
		FOREIGN KEY fk_doctor(`doctor_id`) REFERENCES `doctors`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `applied doctors`;

	CREATE TABLE `applied doctors` (
		`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
		`first_name` varchar(50) NOT NULL,
		`last_name` varchar(50) NOT NULL,
		`contact_number` varchar(100) NOT NULL,
		`email` varchar(50) NOT NULL,
		PRIMARY KEY (`id`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `cancelled appointments`;

	CREATE TABLE `cancelled appointments` (
		`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
		`date` date NOT NULL,
		`time_id` int(11) unsigned NOT NULL,
		`user_id` int(11) unsigned NOT NULL,
		`doctor_id` int(11) unsigned NOT NULL,
		`reason` varchar(200),
		PRIMARY KEY (`id`),
		FOREIGN KEY fk_time(`time_id`) REFERENCES `times`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
		FOREIGN KEY fk_user(`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
		FOREIGN KEY fk_doctor(`doctor_id`) REFERENCES `doctors`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;
	