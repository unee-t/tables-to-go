create database unee_t_enterprise;
use unee_t_enterprise;

SET character_set_client = utf8mb4 ;
CREATE TABLE `person_salutations` (
  `id_salutation` int(11) NOT NULL AUTO_INCREMENT COMMENT 'unique ID in this table',
  `creation_system_id` int(11) NOT NULL DEFAULT '1' COMMENT 'What is the id of the sytem that was used for the creation of the record?',
  `update_system_id` int(11) DEFAULT NULL COMMENT 'What is the id of the sytem that was used for the update of the record?',
  `is_obsolete` tinyint(1) DEFAULT '0' COMMENT 'is this obsolete?',
  `order` int(10) NOT NULL DEFAULT '0' COMMENT 'Order in the list',
  `salutation` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'Designation',
  `salutation_description` mediumtext COLLATE utf8mb4_unicode_520_ci COMMENT 'Description/help text)',
  PRIMARY KEY (`id_salutation`,`salutation`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci ROW_FORMAT=DYNAMIC;

LOCK TABLES `person_salutations` WRITE;
/*!40000 ALTER TABLE `person_salutations` DISABLE KEYS */;
INSERT INTO `person_salutations` VALUES (1,1,NULL,0,1000,'---',NULL),(2,1,NULL,0,10,'Mr',NULL),(3,1,NULL,0,20,'Mrs',NULL),(4,1,NULL,0,30,'Ms',NULL),(5,1,NULL,0,40,'Dr',NULL),(6,1,NULL,0,50,'Prof.',NULL);
/*!40000 ALTER TABLE `person_salutations` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `person_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `person_statuses` (
  `id_person_status` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Uniquer ID in this table',
  `creation_system_id` int(11) NOT NULL DEFAULT '1' COMMENT 'What is the id of the sytem that was used for the creation of the record?',
  `update_system_id` int(11) DEFAULT NULL COMMENT 'What is the id of the sytem that was used for the last update the record?',
  `is_obsolete` tinyint(1) DEFAULT '0' COMMENT 'is this obsolete?',
  `is_default` tinyint(1) DEFAULT '0' COMMENT 'This is the default value in our systems',
  `is_active` tinyint(1) DEFAULT '0' COMMENT 'This satus is considered as ACTIVE',
  `order` int(11) NOT NULL COMMENT 'Order in the list',
  `person_status` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'Designation',
  `person_status_definition` mediumtext COLLATE utf8mb4_unicode_520_ci COMMENT 'Description/help text',
  PRIMARY KEY (`id_person_status`,`person_status`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci ROW_FORMAT=DYNAMIC;

LOCK TABLES `person_statuses` WRITE;
/*!40000 ALTER TABLE `person_statuses` DISABLE KEYS */;
INSERT INTO `person_statuses` VALUES (1,1,NULL,0,1,1,0,'---','Unknown status'),(2,1,NULL,0,0,1,10,'Active','We are still in contact with this person.'),(3,1,NULL,0,0,0,20,'Inactive','We have not been in contact with this person for the past 6 months.'),(4,1,NULL,0,0,0,30,'Duplicate','This is a duplicate of another record in the same table.'),(5,1,NULL,0,0,0,40,'Obsolete','Do not use this anymore.');
/*!40000 ALTER TABLE `person_statuses` ENABLE KEYS */;
UNLOCK TABLES;

CREATE TABLE `persons` (
  `id_person` int(11) NOT NULL AUTO_INCREMENT COMMENT 'unique ID in this table',
  `external_id` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'The id of the record in an external system',
  `external_system` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'The id of the system which provides the external_system_id',
  `external_table` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'The table in the external system where this record is stored',
  `syst_created_datetime` timestamp NULL DEFAULT NULL COMMENT 'When was this record created?',
  `creation_system_id` int(11) DEFAULT NULL COMMENT 'What is the id of the sytem that was used for the creation of the record?',
  `created_by_id` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The MEFE ID of the user who created this record',
  `syst_updated_datetime` timestamp NULL DEFAULT NULL COMMENT 'When was this record last updated?',
  `update_system_id` int(11) DEFAULT NULL COMMENT 'What is the id of the sytem that was used for the last update the record?',
  `updated_by_id` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The MEFE ID of the user who updated this record',
  `person_status_id` int(11) DEFAULT '1' COMMENT 'The id of the person status in the table 164_person_statuses',
  `dupe_id` int(11) DEFAULT NULL COMMENT 'This is a duplicate of this other record in this table',
  `handler_id` int(11) DEFAULT NULL COMMENT 'id of the person in charge of this person in the organization',
  `is_unee_t_account_needed` tinyint(1) DEFAULT '0' COMMENT '1 if we have decided to create a Unee-T account for that person',
  `country_code` varchar(10) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The 2 letter version of the country code',
  `gender` tinyint(1) DEFAULT '0' COMMENT '0: Unknown; 1: Male; 2: Female',
  `salutation_id` int(11) DEFAULT '1' COMMENT 'The salutation, a link to the table 150_salutations',
  `given_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'given name',
  `middle_name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'middle name',
  `family_name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'family name',
  `date_of_birth` date DEFAULT NULL COMMENT 'The birth date of the person',
  `alias` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'V4.35.0 - an Alias for the person',
  `job_title` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The job title of the person in the company',
  `organization` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'In which organization inside the company is the person working on?',
  `email` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'The primary email address of the person',
  `tel_1` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'Primary phone number for the person',
  `tel_2` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'Secondary Phone number for the person',
  `whatsapp` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'whatsapp id for that person',
  `linkedin` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'the url to the linkedin profile of that person',
  `facebook` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT 'the url to the facebook profile for that person',
  `adr1` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `adr2` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `adr3` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `City` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `zip_postcode` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `region_or_state` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id_person`),
  KEY `person_person_salutation` (`salutation_id`),
  KEY `person_person_status` (`person_status_id`),
  CONSTRAINT `person_person_salutation` FOREIGN KEY (`salutation_id`) REFERENCES `person_salutations` (`id_salutation`) ON UPDATE CASCADE,
  CONSTRAINT `person_person_status` FOREIGN KEY (`person_status_id`) REFERENCES `person_statuses` (`id_person_status`) ON UPDATE CASCADE
)

