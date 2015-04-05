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
		FOREIGN KEY fk_time(`time_id`) REFERENCES `times`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
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

INSERT INTO `cities` (`name`)
VALUES
('Caloocan'),
('Las Piñas'),
('Makati'),
('Malabon'),
('Mandaluyong'),
('Manila'),
('Marikina'),
('Muntinlupa'),
('Navotas'),
('Parañaque'),
('Pasay'),
('Pasig'),
('Pateros'),
('Quezon City'),
('San Juan'),
('Taguig'),
('Valenzuela');

INSERT INTO `days` (`name`)
VALUES
('Monday'),
('Tuesday'),
('Wednesday'),
('Thursday'),
('Friday'),
('Saturday'),
('Sunday');

INSERT INTO `times` (`time`)
VALUES
('08:00'),
('09:00'),
('10:00'),
('11:00'),
('12:00'),
('13:00'),
('14:00'),
('15:00'),
('16:00'),
('17:00');

INSERT INTO `hospitals` (`name`, `city_id`)
VALUES
("Acebedo General Hospital", 1),
("Baesa Advent Polyclinic and General Hospital", 1),
("Bazarte Well Family Midlife Clinic", 1),
("Col. Salvador T. Villa Memorial Hospital", 1),
("Committee of German Doctors", 1),
("Dante's Well Family Midlife Clinic", 1),
("Dr. Jose N. Rodriguez Memorial Hospital", 1),
("Fernandez General Hospital", 1),
("Francisca dela Cruz Well Family Midwife Clinic", 1),
("Jean Demegillo Maternity and Lying", 1),
("John Paul Hospital", 1),
("Lady of Lourdes Hospital of Caybiga, Inc.", 1),
("MCU–Filemon Dionisio Tanchoco Medical Foundation Hospital", 1),
("Martinez Memorial Hospital[2]", 1),
("Nephrology Center of Caloocan Dialysis Center, Inc.", 1),
("Nodado General Hospital", 1),
("North Caloocan Doctors' Hospital", 1),
("Our Lady of Grace Hospital", 1),
("President Diosdado Macapagal Memorial Medical Center", 1),
("Ronn", 1),
("San Lorenzo General Hospital", 1);

INSERT INTO `hospitals` (`name`, `city_id`)
VALUES
("A. Zarate General Hospital", 2),
("Alabang Medical Clinic", 2),
("Callejo Medical Clinic", 2),
("Christ the King General Hospital", 2),
("Golden Acres Doctors' Hospital", 2),
("Las Piñas City Medical Center", 2),
("Las Piñas Doctors' Hospital", 2),
("Las Piñas General Hospital and Satellite Trauma Center", 2),
("Pamplona Medical Clinic", 2),
("University of Perpetual Help Rizal Delta Medical Center", 2);

INSERT INTO `hospitals` (`name`, `city_id`)
VALUES
("Beverly Hills Medical Group", 3),
("M. Tech Medical Center", 3),
("Makati Medical Center[5]", 3),
("Maria Lourdes Maternity Hospital", 3),
("Ospital ng Makati", 3),
("Ospital ng Makati", 3),
("St. Clare's Medical Center", 3),
("Fort Bonifacio Hospital", 3);

INSERT INTO `hospitals` (`name`, `city_id`)
VALUES
("A. P. Cruz Community Hospital", 4),
("Alfonso Medical Clinic", 4),
("Dela Cruz Well Family Midwife Clinic", 4),
("Franco Clinic", 4),
("Punzalan Clinic", 4),
("San Lorenzo Ruiz Women's Hospital", 4);

INSERT INTO `hospitals` (`name`, `city_id`)
VALUES
("Asia Renal Care Philippines, Inc.", 5),
("Jocson Well Family Midwife Clinic", 5),
("Health Delivery Systems, Inc. (UNILAB DOTS Center)", 5),
("Mandaluyong City Medical Center", 5),
("National Center for Mental Health", 5),
("Nephro Systems Philippines, Inc.", 5),
("Perez-Mendoza Birthplace Lying", 5),
("Unciano General Hospital (Mandaluyong Branch)", 5),
("Victor R. Potenciano Medical Center", 5),
("Divine Mercy The Home That Cares Inc. Psychiatric Custodial Hospital", 5),
("Johnvier Laboratory Clinic", 5);

INSERT INTO `hospitals` (`name`, `city_id`)
VALUES
("Amisola Maternity Hospital", 6),
("Canossa Health and Social Center Foundation, Inc.", 6),
("Chinese General Hospital and Medical Center", 6),
("Clinica Arellano General Hospital", 6),
("De Ocampo Memorial Medical Center", 6),
("Dr. Jose Fabella Memorial Hospital", 6),
("Dr. Mirando Unciano, Sr. Medical Center", 6),
("Esperanza Health Center", 6),
("F. Lanuza Health Center and Lying", 6),
("GAT Andres Bonifacio Memorial Medical Center", 6),
("Hospital of the Infant Jesus", 6),
("Jose R. Reyes Memorial Medical Center", 6),
("Manila Doctors' Hospital", 6),
("Maria Clara Health Center and Lying", 6),
("Mary Chiles General Hospital", 6),
("Mary Johnston Hospital", 6),
("Medical Center Manila", 6),
("Metropolitan Medical Center", 6),
("Nephrology Center of Manila", 6),
("Ospital ng Maynila Medical Center", 6),
("Ospital ng Sampaloc", 6),
("Ospital ng Tondo", 6),
("Our Lady of Lourdes Hospital", 6),
("Pedro Gil Health Center and Lying", 6),
("Perpetual Help Hospital", 6),
("Perpetual Succor Hospital", 6),
("Philippine General Hospital", 6),
("Presidential Security Group Station Hospital", 6),
("Saint Jude Hospital and Medical Center", 6),
("San Lazaro Hospital", 6),
("Santa Ana Hospital", 6),
("Seamen's Hospital", 6),
("The Family Clinic, Inc.", 6),
("Tondo Foreshore Health Center", 6),
("Tondo Health Center", 6),
("Tondo Medical Center", 6),
("Trinity Woman and Child Center \"The Birthplace\"", 6),
("Unciano General Hospital", 6),
("United Doctor's Medical Center", 6),
("University of Santo Tomas Hospital", 6);

INSERT INTO `hospitals` (`name`, `city_id`)
VALUES
("Amang Rodriguez Medical Center", 7),
("Garcia General Hospital", 7),
("Jesus Immaculate Concepcion Hospital", 7),
("Marikina Valley Medical Center", 7),
("P. Gonzales Memorial Hospital, Inc.", 7),
("San Ramon Hospital", 7),
("SDS Medical Center, Inc.", 7),
("St. John the Baptist Hospital of Marikina", 7),
("St. Victoria Hospital", 7),
("St. Vincent Hospital", 7),
("Sta. Monica Hospital", 7);

INSERT INTO `hospitals` (`name`, `city_id`)
VALUES
("Alabang Medical Center", 8),
("Alabang Medical Clinic (Muntinlupa Branch)", 8),
("Asian Hospital and Medical Center", 8),
("Babaran Echavez Medical and Psychiatric Clinic", 8),
("Beato-Cauilan Hospital", 8),
("Clinic Systems, Inc.", 8),
("League of Government Information Practitioners of the Philippines, Inc.", 8),
("Medical Center Muntinlupa", 8),
("New Bilibid Prisons Hospital", 8),
("Ospital ng Muntinlupa", 8),
("Research Institute for Tropical Medicine", 8),
("San Roque Medical Clinic", 8);

INSERT INTO `hospitals` (`name`, `city_id`)
VALUES
("Bagong Lipunan Health Center", 9),
("Bagumbayan North Health Center", 9),
("Bangkulasi Health Center", 9),
("Kaunlaran Village Health Center", 9),
("Linchangco/North Bay Health Center", 9),
("Navotas Emergency and Lying", 9),
("Saint Joseph Maternity and Medical Clinic", 9),
("San Roque Health Center", 9),
("Tangos Health Center", 9),
("Tanza Health Center", 9);

INSERT INTO `hospitals` (`name`, `city_id`)
VALUES
("Medical Center Paranaque", 10),
("Olivarez General Hospital", 10),
("Our Lady of Peace Hospital", 10),
("Parañaque Community Hospital", 10),
("Protacio Medical Services", 10),
("South Superhighway Medical Center", 10),
("Sta. Rita de Baclaran Hospital", 10),
("Sto. Niño de Cebu Maternity Hospital", 10),
("UHBI Parañaque Doctors' Hospital", 10);

INSERT INTO `specializations` (`name`, `description`)
VALUES
('Allergy & Immunology','Allergic and immunologic diseases and their respiratory complications (such as pollen, chemical and food allergies, asthma and AIDS).'),
('Anesthesia','Anesthesia or relief of pain during surgery and childbirth, and control of paid due to various causes.'),
('Cardiovascular Disease','Diseases of the heart and blood vessels.'),
('Dermatology','Diseases of the skin.'),
('Emergency Medicine','Diseases that are acute medical or surgical conditions or injuries that require urgent or immediate care (usually in a hospital emergency room).'),
('Endocrinology and Metabolism','Diseases of the internal glands of the body, including diabetes mellitus.'),
('Family Practice','All diseases and related total health care of an individual and the family.'),
('Gastroenterology','Diseases of the digestive tract, including the stomach, bowel, liver and pancreas.'),
('General Practice','All diseases and related total health care of an individual and the family.'),
('Geriatric Medicine','Diseases of the elderly.'),
('Gynecology','See "Obstetrics and Gynecology".'),
('Gynecologic Oncology','Cancer diseases of the female reproductive system.'),
('Hematology','Disorders of the blood and blood-forming organs (including cancerous disorders of the blood) such as anemia, leukemia and lymphoma (see Oncology, Medical).'),
('Infectious Diseases','Infections of all types.'),
('Internal Medicine','All diseases and total health care of adults, usually 18 years of age and older.'),
('Neonatology','Disease of the newborn child.'),
('Nephrology','Diseases of the kidney, including dialysis.'),
('Neurology','Diseases of the brain, spinal cord, nervous system and related structures.'),
('Neurological Surgery','Diseases of the brain, spinal cord, nervous system and related structures requiring surgery.'),
('Obstetrics and Gynecology','Normal and abnormal pregnancy, diseases of the female reproductive system and fertility disorders.'),
('Oncology, Medical','Cancer and disorders of the blood and blood-forming organs (see Hematology).'),
('Ophthalmology','Diseases of the eye.'),
('Orthopedic Surgery','Diseases of the bones, joints, muscles and tendons.'),
('Otorhinolaryngology','Diseases of the ears, nose, sinuses, throat and upper airway passages.'),
('Pathology','Tissues and specimens removed by biopsy and surgery to diagnose normal from diseased tissues and specimens; supervises and interprets laboratory tests on blood, urine and other body fluids.'),
('Pediatrics','All diseases and total health care of newborns, infants, children and adolescents.'),
('Physical Medicine and Rehabilitation','Diseases with major and minor disabilities requiring restoration of functional ability such as assistance, retraining and recondition of muscles, tendons and extremities for ambulation and other activities of daily living.'),
('Plastic Surgery','Diseases and conditions requiring surgical reconstruction for deformity or loss of a body part, or for cosmetic purposes to improve appearance or function.'),
('Podiatric Medicine','Disease of the foot and ankle as they affect the conditions of the feet.'),
('Preventative Medicine','Health care and other measures to avoid delay or prevent disease or illness from occurring.'),
('Psychiatry','Diseases affecting mental health including diseases of the brain, nervous system and substance abuse of drugs or chemicals.'),
('Pulmonary Disease','Diseases of the lung.'),
('Radiology, Diagnostic','X-ray, ultrasound and other imaging techniques such as Computerized Tomography (CT) and Magnetic Resonance Imaging (MRI).'),
('Radiology, Nuclear','Diseases requiring use of radioactive isotopes or as an aid in diagnosis and/or therapy.'),
('Radiation Oncology','Cancer and other diseases with x-ray therapy, radioactive isotopes and linear accelerator particle radiation.'),
('Rheumatology','Diseases of the joints including arthritis and autoimmune diseases.'),
('Sports Medicine','Diseases and injuries acquired in sports.'),
('Surgery, General','Disease that require surgical operation for diagnosis or treatment.'),
('Surgery, Hand','Diseases and injuries of the nerves, tendons, muscles, bones or skin of the hand requiring surgery.'),
('Surgery, Thoracic','Diseases of the chest, including lungs, heart, blood vessels and chest wall, that require surgical operation for diagnosis and/or treatment.'),
('Surgery, Vascular','Diseases of the blood vessels that require surgical operation for diagnosis or treatment.'),
('Surgery, Colon and Rectal','Diseases of the large intestine (bowel), rectum and anus that require surgical operation for diagnosis or treatment.'),
('Surgery, Urology','Diseases of the kidneys, bladder and male reproductive tract that require surgical operation.');

INSERT INTO `hospitals` (`name`, `city_id`)
VALUES
("Manila Adventist Medical Center", 11),
("Pasay City General Hospital", 11),
("Philippine Air Force General Hospital", 11),
("San Juan De Dios Hospital", 11);

INSERT INTO `hospitals` (`name`, `city_id`)
VALUES
("Alfonso Specialist Hospital", 12),
("Glen Eagles Healthcare", 12),
("Health Solutions Corporation", 12),
("Javillonar Clinic and Hospital", 12),
("John F. Cotton Hospital", 12),
("Mary Immaculate Hospital", 12),
("Medicomm Pacific, Inc.", 12),
("Metro Psych Facility", 12),
("Mission Hospital", 12),
("Mother Regina Hospital", 12),
("Pasig City General Hospital", 12),
("Pasig Doctors Medical Center", 12),
("Pasig Medical and Maternity Hospital Foundation", 12),
("Rizal Medical Center", 12),
("Sabater General Hospital", 12),
("Salve Regina General Hospital", 12),
("Saint Threse Hospital", 12),
("The Medical City", 12),
("Wellness Pro, Inc.", 12);

INSERT INTO `hospitals` (`name`, `city_id`)
VALUES
("Ann Francis Maternity Hospital", 14),
("AFP Medical Center", 14),
("Bernardino General Hospital", 14),
("Bernardino General Hospital II", 14),
("Camp General Emilio Aguinaldo Station Hospital", 14),
("Capitol Medical Center", 14),
("Casaul General Hospital", 14),
("Commonwealth Hospital and Medical Center", 14),
("Cruz Dalida Maternity Hospital", 14),
("De Los Santos–STI Medical Center", 14),
("Dihmesco General Hospital", 14),
("Dr. Fe del Mundo Medical Center Foundation Philippines", 14),
("Dr. Carlos Lanting Hospital", 14),
("Dr. Jesus C. Delgado Memorial Medical Center", 14),
("Dr. Montano Ramos General Hospital", 14),
("East Avenue Medical Center", 14),
("Fairview General Hospital", 14),
("Far Eastern University – Nicanor Reyes Medical Foundation", 14),
("General Miguel Malvar Medical Foundation Hospital", 14),
("J. P. Sioson General Hospital and Colleges, Inc.", 14),
("Lung Center of the Philippines", 14),
("National Children's Hospital", 14),
("National Kidney and Transplant Institute", 14),
("Neopolitan General Hospital", 14),
("New Era General Hospital", 14),
("Nodado General Hospital", 14),
("Novaliches District Hospital", 14),
("Novaliches General Hospital", 14),
("OCW General Hospital", 14),
("PNP General Hospital", 14),
("PNP General Hospital Annex", 14),
("Pascual General Hospital", 14),
("Philippine Children's Medical Center", 14),
("Philippine Heart Center", 14),
("Philippine Orthopedic Center", 14),
("Quezon City General Hospital", 14),
("Queensberry Hospital", 14),
("Quezon Institute", 14),
("Quirino Memorial Medical Center", 14),
("St. Luke's Medical Center", 14),
("Saint Agnes General Hospital", 14),
("San Lorenzo General Hospital", 14),
("Santa Teresita General Hospital", 14),
("United Doctors Medical Center", 14),
("University of the East Ramon Magsaysay Memorial Medical Center", 14),
("University of the Philippines Medical Services", 14),
("Valdez Padron Hospital", 14),
("Villarosa Hospital", 14),
("Veterans Memorial Medical Center", 14),
("World Citi Medical Center", 14);

INSERT INTO `hospitals` (`name`, `city_id`)
VALUES
("Cardinal Santos Medical Center", 15),
("Saint Martin de Porres Charity Hospital", 15),
("San Juan Medical Center", 15);

INSERT INTO `hospitals` (`name`, `city_id`)
VALUES
("Angelus Medical and Maternity Clinic", 17),
("Calalang General Hospital", 17),
("Carlos Clinic", 17),
("Fatima Medical Center", 17),
("F and P Hernandez Maternity and Lying", 17),
("Pasolo Maternity and Medical Clinic", 17),
("Saint John's Hospital", 17),
("Sanctissimo Rosario General Hospital", 17),
("Valenzuela City Emergency Hospital", 17),
("Valenzuela City General Hospital", 17),
("Vian Family Hospital", 17);

INSERT INTO `hospitals` (`name`, `city_id`)
VALUES
("Cruz Rabe General Hospital", 16),
("Dr. Sabili General Hospital and Health Services", 16),
("Fort Bonifacio General Hospital", 16),
("Holy Mary Family Hospital", 16),
("Jovince Medical Hospital", 16),
("St. Luke's Medical Center Global City", 16),
("Manila Naval Hospital", 16),
("Taguig Doctors' Hospital", 16),
("Taguig City Hospital", 16);

INSERT INTO `users` (`first_name`, `last_name`, `gender`, `birth_date`, `contact_number`, `email`, `password`) 
VALUES 
('admin', 'admin', 'M', '1990-01-01', '0000', 'admin@admin.com', sha2('password', 512));

INSERT INTO `admins` (`user_id`)
VALUES
(1);

INSERT INTO `doctors` (`specialization_id`, `city_id`, `hospital_id`, `user_id`)
VALUES
(9, 11, 277, 1);