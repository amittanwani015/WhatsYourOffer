/*
SQLyog Community v10.3 
MySQL - 5.5.56 : Database - tasktracker
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tasktracker` /*!40100 DEFAULT CHARACTER SET latin1 */;

/*Table structure for table `employee_leave` */

DROP TABLE IF EXISTS `employee_leave`;456

CREATE TABLE `employee_leave` (
  `leave_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `end_date` datetime DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`leave_id`),
  KEY `FK1c856roc6lf8fn21lvtueltph` (`user_id`),
  CONSTRAINT `FK1c856roc6lf8fn21lvtueltph` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `employee_leave` */

/*Table structure for table `issue` */

DROP TABLE IF EXISTS `issue`;

CREATE TABLE `issue` (
  `issue_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `raised_on` datetime DEFAULT NULL,
  `status` int(11) NOT NULL,
  `raised_by` int(11) DEFAULT NULL,
  `task_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`issue_id`),
  KEY `FKs756hab2rg4v5k5x29x8moa5i` (`raised_by`),
  KEY `FKp9msm7mx8nk2qo2xs8td3clg7` (`task_id`),
  CONSTRAINT `FKp9msm7mx8nk2qo2xs8td3clg7` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`),
  CONSTRAINT `FKs756hab2rg4v5k5x29x8moa5i` FOREIGN KEY (`raised_by`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `issue` */

/*Table structure for table `issue_log` */

DROP TABLE IF EXISTS `issue_log`;

CREATE TABLE `issue_log` (
  `issue_log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comments` varchar(255) DEFAULT NULL,
  `logged_date` datetime DEFAULT NULL,
  `status_changed_from` int(11) NOT NULL,
  `status_changed_to` int(11) NOT NULL,
  `issue_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`issue_log_id`),
  KEY `FKlvrlu82uy4jkchcyo8fwa1mwc` (`issue_id`),
  CONSTRAINT `FKlvrlu82uy4jkchcyo8fwa1mwc` FOREIGN KEY (`issue_id`) REFERENCES `issue` (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `issue_log` */

/*Table structure for table `mile_stone` */

DROP TABLE IF EXISTS `mile_stone`;

CREATE TABLE `mile_stone` (
  `mile_stone_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`mile_stone_id`),
  KEY `FKdvvryhp1gb83ywi59jvjijdvp` (`project_id`),
  CONSTRAINT `FKdvvryhp1gb83ywi59jvjijdvp` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `mile_stone` */

/*Table structure for table `project` */

DROP TABLE IF EXISTS `project`;

CREATE TABLE `project` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_soc` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `project_description` varchar(255) DEFAULT NULL,
  `project_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `project` */

/*Table structure for table `project_user_mapping` */

DROP TABLE IF EXISTS `project_user_mapping`;

CREATE TABLE `project_user_mapping` (
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`project_id`,`user_id`),
  KEY `FKg4rwcdperr4fi5bu85cnwhne8` (`user_id`),
  CONSTRAINT `FKesuhpca6viownt2teeamica4t` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`),
  CONSTRAINT `FKg4rwcdperr4fi5bu85cnwhne8` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `project_user_mapping` */

/*Table structure for table `task` */

DROP TABLE IF EXISTS `task`;

CREATE TABLE `task` (
  `task_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `domain_model` varchar(255) DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `estimated_hr` float NOT NULL,
  `jira_no` varchar(255) DEFAULT NULL,
  `layer` varchar(255) DEFAULT NULL,
  `production_release_date` datetime DEFAULT NULL,
  `sit_date` datetime DEFAULT NULL,
  `sql_query` varchar(255) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `status` int(11) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `uat_date` datetime DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`task_id`),
  KEY `FKk8qrwowg31kx7hp93sru1pdqa` (`project_id`),
  CONSTRAINT `FKk8qrwowg31kx7hp93sru1pdqa` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `task` */

/*Table structure for table `task_log` */

DROP TABLE IF EXISTS `task_log`;

CREATE TABLE `task_log` (
  `task_log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comments` varchar(255) DEFAULT NULL,
  `logged_date` datetime DEFAULT NULL,
  `status_changed_from` int(11) NOT NULL,
  `status_changed_to` int(11) NOT NULL,
  `task_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`task_log_id`),
  KEY `FKi3dteus6yty5vyv7hui42n77q` (`task_id`),
  CONSTRAINT `FKi3dteus6yty5vyv7hui42n77q` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `task_log` */

/*Table structure for table `task_user_mapping` */

DROP TABLE IF EXISTS `task_user_mapping`;

CREATE TABLE `task_user_mapping` (
  `task_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`task_id`,`user_id`),
  KEY `FK87km60p344o82sxbc1oko7a8q` (`user_id`),
  CONSTRAINT `FKbvm0j9b31behou4vfwj3wilnp` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`),
  CONSTRAINT `FK87km60p344o82sxbc1oko7a8q` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `task_user_mapping` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user` */

/*Table structure for table `work_log` */

DROP TABLE IF EXISTS `work_log`;

CREATE TABLE `work_log` (
  `work_log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `working_hour` float NOT NULL,
  `task_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`work_log_id`),
  KEY `FK9x8a96oqyjudur6f9q0mlyrsf` (`task_id`),
  CONSTRAINT `FK9x8a96oqyjudur6f9q0mlyrsf` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `work_log` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
