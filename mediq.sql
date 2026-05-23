-- MEDIQ database schema inferred from the application code
-- Import this file into phpMyAdmin after creating the database `mediq`.

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";
CREATE DATABASE IF NOT EXISTS `mediq` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `mediq`;

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `doctorSpecilization`;
CREATE TABLE `doctorSpecilization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `specilization` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullName` varchar(150) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `regDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `doctors`;
CREATE TABLE `doctors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `specilization` varchar(255) NOT NULL,
  `doctorName` varchar(150) NOT NULL,
  `address` varchar(255) NOT NULL,
  `docFees` varchar(50) NOT NULL,
  `contactno` varchar(20) NOT NULL,
  `docEmail` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `docEmail` (`docEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `appointment`;
CREATE TABLE `appointment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doctorSpecialization` varchar(255) NOT NULL,
  `doctorId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `consultancyFees` varchar(50) NOT NULL,
  `appointmentDate` date NOT NULL,
  `appointmentTime` varchar(50) NOT NULL,
  `userStatus` tinyint(1) NOT NULL DEFAULT 1,
  `doctorStatus` tinyint(1) NOT NULL DEFAULT 1,
  `postingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `doctorId` (`doctorId`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tblpatient`;
CREATE TABLE `tblpatient` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Docid` int(11) NOT NULL,
  `PatientName` varchar(150) NOT NULL,
  `PatientContno` varchar(20) NOT NULL,
  `PatientEmail` varchar(150) NOT NULL,
  `PatientGender` varchar(20) NOT NULL,
  `PatientAdd` varchar(255) NOT NULL,
  `PatientAge` int(11) NOT NULL,
  `PatientMedhis` text NOT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `Docid` (`Docid`),
  KEY `PatientEmail` (`PatientEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tblmedicalhistory`;
CREATE TABLE `tblmedicalhistory` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PatientID` int(11) NOT NULL,
  `BloodPressure` varchar(50) DEFAULT NULL,
  `BloodSugar` varchar(50) DEFAULT NULL,
  `Weight` varchar(50) DEFAULT NULL,
  `Temperature` varchar(50) DEFAULT NULL,
  `MedicalPres` text DEFAULT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `PatientID` (`PatientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tblpage`;
CREATE TABLE `tblpage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PageType` varchar(50) NOT NULL,
  `PageTitle` varchar(255) NOT NULL,
  `PageDescription` longtext DEFAULT NULL,
  `Email` varchar(150) DEFAULT NULL,
  `MobileNumber` varchar(20) DEFAULT NULL,
  `OpenningTime` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `PageType` (`PageType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `tblcontactus`;
CREATE TABLE `tblcontactus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `contactno` varchar(20) NOT NULL,
  `message` text NOT NULL,
  `AdminRemark` text DEFAULT NULL,
  `IsRead` varchar(10) DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `userlog`;
CREATE TABLE `userlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `username` varchar(150) NOT NULL,
  `userip` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `loginTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `logout` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `doctorslog`;
CREATE TABLE `doctorslog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `username` varchar(150) NOT NULL,
  `userip` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `loginTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `logout` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `doctorSpecilization` (`specilization`) VALUES
  ('General Physician'),
  ('Dentist'),
  ('Cardiologist'),
  ('Dermatologist'),
  ('Gynecologist');

INSERT INTO `tblpage` (`PageType`, `PageTitle`, `PageDescription`, `Email`, `MobileNumber`, `OpenningTime`) VALUES
  ('aboutus', 'About Us', 'MEDIQ is a patient-focused healthcare management system that helps patients book appointments, doctors manage care, and administrators keep everything organized.', NULL, NULL, NULL),
  ('contactus', 'Contact Us', '', '', '', 'Mon - Fri: 9:00 AM to 5:00 PM');