# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.6.35)
# Datenbank: kittncb
# Erstellt am: 2018-04-21 11:02:55 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Export von Tabelle craft_amnav_navs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_amnav_navs`;

CREATE TABLE `craft_amnav_navs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_amnav_navs_handle_unq_idx` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_amnav_navs` WRITE;
/*!40000 ALTER TABLE `craft_amnav_navs` DISABLE KEYS */;

INSERT INTO `craft_amnav_navs` (`id`, `name`, `handle`, `settings`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'Main Navigation','mainNavigation','{\"entrySources\":\"*\",\"maxLevels\":\"\",\"canMoveFromLevel\":\"\",\"canDeleteFromLevel\":\"\"}','2017-07-04 22:04:01','2017-07-04 22:04:01','48cb752a-1a5b-4473-80c1-02f738d85929'),
	(2,'Footer Navigation','footerNavigation','{\"entrySources\":\"*\",\"maxLevels\":\"\",\"canMoveFromLevel\":\"\",\"canDeleteFromLevel\":\"\"}','2017-07-04 22:04:12','2017-07-04 22:04:12','9114cf43-4d10-4f85-baa0-34cddc8d9ccc');

/*!40000 ALTER TABLE `craft_amnav_navs` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_amnav_nodes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_amnav_nodes`;

CREATE TABLE `craft_amnav_nodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `navId` int(10) NOT NULL,
  `parentId` int(10) DEFAULT NULL,
  `order` int(10) DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `listClass` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blank` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `elementId` int(10) DEFAULT NULL,
  `elementType` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_amnav_nodes_elementId_elementType_locale_idx` (`elementId`,`elementType`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_assetfiles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_assetfiles`;

CREATE TABLE `craft_assetfiles` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kind` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assetfiles_filename_folderId_unq_idx` (`filename`,`folderId`),
  KEY `craft_assetfiles_sourceId_fk` (`sourceId`),
  KEY `craft_assetfiles_folderId_fk` (`folderId`),
  CONSTRAINT `craft_assetfiles_folderId_fk` FOREIGN KEY (`folderId`) REFERENCES `craft_assetfolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_assetfiles_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_assetfiles_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_assetsources` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_assetfolders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_assetfolders`;

CREATE TABLE `craft_assetfolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assetfolders_name_parentId_sourceId_unq_idx` (`name`,`parentId`,`sourceId`),
  KEY `craft_assetfolders_parentId_fk` (`parentId`),
  KEY `craft_assetfolders_sourceId_fk` (`sourceId`),
  CONSTRAINT `craft_assetfolders_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `craft_assetfolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_assetfolders_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_assetsources` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_assetfolders` WRITE;
/*!40000 ALTER TABLE `craft_assetfolders` DISABLE KEYS */;

INSERT INTO `craft_assetfolders` (`id`, `parentId`, `sourceId`, `name`, `path`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,NULL,1,'Bilder','','2017-07-04 22:00:58','2017-07-04 22:00:58','4ce5a23f-3510-4a3a-a93f-901e27d329ae'),
	(2,NULL,2,'Videos','','2018-04-20 23:56:17','2018-04-20 23:56:17','9702f6ca-a121-4c83-9f04-8e2985429e70'),
	(3,NULL,3,'Files','','2018-04-20 23:56:44','2018-04-20 23:56:44','3bef94e8-9d1d-4242-ad86-30386b95bb6f');

/*!40000 ALTER TABLE `craft_assetfolders` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_assetindexdata
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_assetindexdata`;

CREATE TABLE `craft_assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` varchar(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sourceId` int(10) NOT NULL,
  `offset` int(10) NOT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recordId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assetindexdata_sessionId_sourceId_offset_unq_idx` (`sessionId`,`sourceId`,`offset`),
  KEY `craft_assetindexdata_sourceId_fk` (`sourceId`),
  CONSTRAINT `craft_assetindexdata_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_assetsources` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_assetsources
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_assetsources`;

CREATE TABLE `craft_assetsources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `fieldLayoutId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assetsources_name_unq_idx` (`name`),
  UNIQUE KEY `craft_assetsources_handle_unq_idx` (`handle`),
  KEY `craft_assetsources_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_assetsources_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_assetsources` WRITE;
/*!40000 ALTER TABLE `craft_assetsources` DISABLE KEYS */;

INSERT INTO `craft_assetsources` (`id`, `name`, `handle`, `type`, `settings`, `sortOrder`, `fieldLayoutId`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'Bilder','images','Local','{\"path\":\"{basePath}uploads\\/images\\/\",\"publicURLs\":1,\"url\":\"{baseUrl}uploads\\/images\\/\"}',1,70,'2017-07-04 22:00:57','2017-07-04 22:01:04','5cdce67f-c18e-450f-b05f-67cd30e0c7e8'),
	(2,'Videos','videos','Local','{\"path\":\"{basePath}uploads\\/videos\\/\",\"publicURLs\":\"1\",\"url\":\"{baseUrl}uploads\\/videos\\/\"}',2,280,'2018-04-20 23:56:17','2018-04-20 23:56:17','eda594d9-38b0-4744-a045-1c383ccaf93d'),
	(3,'Files','files','Local','{\"path\":\"{basePath}uploads\\/files\\/\",\"publicURLs\":\"1\",\"url\":\"{baseUrl}uploads\\/files\\/\"}',3,281,'2018-04-20 23:56:44','2018-04-20 23:56:44','80ea1594-785c-48a2-8712-6186aa1f6974');

/*!40000 ALTER TABLE `craft_assetsources` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_assettransformindex
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_assettransformindex`;

CREATE TABLE `craft_assettransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileId` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT NULL,
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_assettransformindex_sourceId_fileId_location_idx` (`sourceId`,`fileId`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_assettransforms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_assettransforms`;

CREATE TABLE `craft_assettransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'center-center',
  `height` int(10) DEFAULT NULL,
  `width` int(10) DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quality` int(10) DEFAULT NULL,
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assettransforms_name_unq_idx` (`name`),
  UNIQUE KEY `craft_assettransforms_handle_unq_idx` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_categories`;

CREATE TABLE `craft_categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_categories_groupId_fk` (`groupId`),
  CONSTRAINT `craft_categories_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_categories_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_categories` WRITE;
/*!40000 ALTER TABLE `craft_categories` DISABLE KEYS */;

INSERT INTO `craft_categories` (`id`, `groupId`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(7,2,'2017-07-05 20:08:13','2017-07-05 20:08:13','e9544ba7-4930-435b-914f-f5ee135aea68'),
	(15,4,'2018-03-07 10:37:36','2018-03-19 14:39:20','12199539-49bc-45a8-8cbc-21aef81cfa30'),
	(17,4,'2018-03-07 10:38:05','2018-03-19 14:39:30','82fac64e-71a8-4d6e-b9cd-a724c2678d99'),
	(19,4,'2018-03-07 10:38:42','2018-03-19 14:39:10','eab13e68-0783-499a-855a-b3e31741a30a'),
	(21,4,'2018-03-07 10:39:57','2018-03-19 14:40:07','994ce59b-3c73-415e-850b-33de888b888e'),
	(23,4,'2018-03-07 10:40:24','2018-03-19 14:39:42','10566cb9-ba35-4493-a53b-624c7b82044e'),
	(25,4,'2018-03-07 10:41:02','2018-03-19 14:39:54','a8d2229f-037a-4366-9809-1a80e1245d86'),
	(27,4,'2018-03-07 10:42:05','2018-03-19 16:25:02','e4f0176a-6592-4f66-b95d-29c324d1b77f'),
	(29,4,'2018-03-07 10:42:47','2018-03-19 16:54:53','988e6105-6d07-4a2f-be48-a57ecbd99178'),
	(31,4,'2018-03-07 10:43:20','2018-03-19 16:54:45','1804d0b9-a4b5-48c2-9279-4b598c0d6f36'),
	(33,4,'2018-03-07 10:44:01','2018-03-07 10:44:01','87ed4327-bf2f-49e0-b9b5-4933d609252a'),
	(35,4,'2018-03-07 10:45:27','2018-03-07 10:45:27','7ef03b69-8dbd-428a-a258-32f2741da821'),
	(37,4,'2018-03-07 10:46:50','2018-03-07 12:13:10','eab04fc9-84cb-4ebd-b469-3ba9abe69c92'),
	(39,4,'2018-03-07 10:48:12','2018-03-07 10:48:12','db72e64e-5a3d-405f-bf48-f17b44648173'),
	(41,4,'2018-03-07 10:49:04','2018-03-07 11:47:08','de85958c-c460-4980-a9ac-01a5025b349b'),
	(43,4,'2018-03-07 10:49:58','2018-03-07 11:47:15','50e4a9f2-9226-432a-bb08-d8e947fe4988'),
	(63,4,'2018-03-18 21:45:20','2018-03-18 21:45:20','a0bb052f-66e0-4766-bf30-244347beba39'),
	(65,4,'2018-03-18 21:45:44','2018-03-18 21:45:44','e277d2d0-7e5b-455e-9c71-1787f8a537a9'),
	(67,4,'2018-03-18 21:46:06','2018-03-18 21:46:06','0ade88b6-3c2c-4312-9585-d34b42358b57'),
	(71,4,'2018-03-18 21:47:21','2018-03-19 16:57:09','725e6e08-90ae-4283-8a0d-01877cc75ad2'),
	(73,4,'2018-03-18 21:47:51','2018-03-18 21:47:51','abc459d4-0774-40ee-9da5-ad771640dff6'),
	(75,4,'2018-03-18 21:48:09','2018-03-18 21:48:09','4cb5125d-ca99-4f2f-adf8-d12eaad27688'),
	(77,4,'2018-03-18 21:48:26','2018-03-18 21:48:26','3294210f-c9cb-425f-8b64-cb6c8e0b4fc4'),
	(89,4,'2018-03-19 10:45:23','2018-03-19 10:45:23','5f0f7669-7939-41e4-96d2-4d9eefbd7ebd'),
	(91,4,'2018-03-19 10:45:38','2018-04-21 00:34:18','c14b331e-f1fe-42f2-b26a-4c3a753923fc'),
	(93,4,'2018-03-19 11:14:39','2018-03-19 11:14:49','9c26d9ca-d56d-4cc6-ac7e-434549b97c44'),
	(95,4,'2018-03-19 11:15:06','2018-03-19 11:15:06','506d63c2-e64d-49e5-b47d-21e8e0c8b5be'),
	(97,4,'2018-03-19 11:16:04','2018-03-19 11:16:14','153f858d-e252-4d1a-a396-584464937f39'),
	(99,4,'2018-03-19 11:16:33','2018-03-19 11:16:33','419ec8e4-73ec-49a9-a28b-36c874c0663d'),
	(101,4,'2018-03-19 16:23:37','2018-03-19 16:52:45','5570fb87-d89c-4b42-a2f6-552ee97ce7c4'),
	(105,4,'2018-03-19 16:48:46','2018-03-19 16:48:46','a9306c16-5721-4316-8e7e-254f1d7155f2'),
	(107,4,'2018-03-19 16:49:24','2018-03-19 16:49:24','5ab4476d-3f9b-4c84-bb29-dc630ec67af4'),
	(109,4,'2018-03-19 16:50:51','2018-03-19 16:50:51','04c565e0-ce1c-4416-ace6-844a25d6bde0'),
	(111,4,'2018-03-19 16:51:17','2018-03-19 16:51:17','a2f6621a-bdd6-494f-826e-6d5c1ddf60d4'),
	(113,4,'2018-03-19 16:56:11','2018-03-19 16:56:11','7eccb71a-f0c7-4788-a5ac-56625d722cdd'),
	(125,3,'2018-04-21 00:53:00','2018-04-21 10:50:32','0db468b8-787b-4a9d-8424-3912bb9469aa'),
	(131,3,'2018-04-21 10:14:11','2018-04-21 10:51:03','c7895830-ec11-428f-9367-b301410ce178'),
	(146,3,'2018-04-21 10:36:13','2018-04-21 10:51:28','b881b0c7-8292-453a-96b8-6a39cd370282'),
	(148,3,'2018-04-21 10:38:08','2018-04-21 10:51:51','7abad90a-035a-4f78-b072-85d785fa3839');

/*!40000 ALTER TABLE `craft_categories` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_categorygroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_categorygroups`;

CREATE TABLE `craft_categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_categorygroups_name_unq_idx` (`name`),
  UNIQUE KEY `craft_categorygroups_handle_unq_idx` (`handle`),
  KEY `craft_categorygroups_structureId_fk` (`structureId`),
  KEY `craft_categorygroups_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_categorygroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_categorygroups_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_categorygroups` WRITE;
/*!40000 ALTER TABLE `craft_categorygroups` DISABLE KEYS */;

INSERT INTO `craft_categorygroups` (`id`, `structureId`, `fieldLayoutId`, `name`, `handle`, `hasUrls`, `template`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,3,78,'Blog Categories','blogCategories',1,'general/category','2017-07-04 22:00:58','2017-07-04 22:01:04','a32bf9fe-87b8-4594-8d01-39a6855da07f'),
	(2,4,157,'Settings: Image Slider','settingsImageSlider',0,NULL,'2017-07-04 22:00:58','2018-03-07 12:28:35','15e70a07-1e99-48e4-afe7-d7038e9dbe7a'),
	(3,7,151,'Settings: Grid Setup','settingsGridSetup',0,NULL,'2018-03-07 10:06:03','2018-03-07 10:25:49','212fcac2-be7b-40b8-ae12-f29a9af02442'),
	(4,8,154,'Settings: Style Classes','settingsStyleClasses',0,NULL,'2018-03-07 10:06:03','2018-03-07 10:28:23','8955f1c6-5154-4f66-b83f-c353f8ff28e1');

/*!40000 ALTER TABLE `craft_categorygroups` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_categorygroups_i18n
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_categorygroups_i18n`;

CREATE TABLE `craft_categorygroups_i18n` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `urlFormat` text COLLATE utf8_unicode_ci,
  `nestedUrlFormat` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_categorygroups_i18n_groupId_locale_unq_idx` (`groupId`,`locale`),
  KEY `craft_categorygroups_i18n_locale_fk` (`locale`),
  CONSTRAINT `craft_categorygroups_i18n_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_categorygroups_i18n_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_categorygroups_i18n` WRITE;
/*!40000 ALTER TABLE `craft_categorygroups_i18n` DISABLE KEYS */;

INSERT INTO `craft_categorygroups_i18n` (`id`, `groupId`, `locale`, `urlFormat`, `nestedUrlFormat`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'de','blog/c/{slug}',NULL,'2017-07-04 22:00:58','2017-07-04 22:00:58','b2f2623e-4e85-4e3d-a961-e66877435f0a'),
	(2,2,'de',NULL,NULL,'2017-07-04 22:00:58','2017-07-04 22:00:58','a24764ea-a405-4cfa-9384-d376fd718ece'),
	(3,1,'en','blog/c/{slug}',NULL,'2017-07-04 22:03:19','2017-07-04 22:03:19','e97ff6c0-3bbb-4eb0-80f2-2df223bef3d8'),
	(4,2,'en',NULL,NULL,'2017-07-04 22:03:19','2017-07-04 22:03:19','ab888d7b-0d11-451f-8c31-e618adf685be'),
	(5,3,'de',NULL,NULL,'2018-03-07 10:06:03','2018-03-07 10:06:03','02f56110-2d57-47de-910a-61f94d906552'),
	(6,3,'en',NULL,NULL,'2018-03-07 10:06:03','2018-03-07 10:06:03','4c9eaa56-3c6f-4be1-a005-6744842bac25'),
	(7,4,'de',NULL,NULL,'2018-03-07 10:06:03','2018-03-07 10:06:03','7968fe65-7f76-4e81-8f37-94e99f764d85'),
	(8,4,'en',NULL,NULL,'2018-03-07 10:06:03','2018-03-07 10:06:03','d4a35887-448b-42cb-8282-932588e3dd94');

/*!40000 ALTER TABLE `craft_categorygroups_i18n` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_content
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_content`;

CREATE TABLE `craft_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_body` text COLLATE utf8_unicode_ci,
  `field_objAccordion` text COLLATE utf8_unicode_ci,
  `field_objAnchor` text COLLATE utf8_unicode_ci,
  `field_objButton` text COLLATE utf8_unicode_ci,
  `field_objCardSlider` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_commentSwitch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_copyright` text COLLATE utf8_unicode_ci,
  `field_disqusName` text COLLATE utf8_unicode_ci,
  `field_focalpoint` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_objHeadline` text COLLATE utf8_unicode_ci,
  `field_objList` text COLLATE utf8_unicode_ci,
  `field_objMarkdown` longtext COLLATE utf8_unicode_ci,
  `field_objRichtext` text COLLATE utf8_unicode_ci,
  `field_objSectionColumn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_objSection` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_seo` text COLLATE utf8_unicode_ci,
  `field_objSpacer` varchar(255) COLLATE utf8_unicode_ci DEFAULT '--050',
  `field_objTab` text COLLATE utf8_unicode_ci,
  `field_objGridBox` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_objGrid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_objGeneric` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_content_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_content_title_idx` (`title`),
  KEY `craft_content_locale_fk` (`locale`),
  CONSTRAINT `craft_content_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_content_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_content` WRITE;
/*!40000 ALTER TABLE `craft_content` DISABLE KEYS */;

INSERT INTO `craft_content` (`id`, `elementId`, `locale`, `title`, `field_body`, `field_objAccordion`, `field_objAnchor`, `field_objButton`, `field_objCardSlider`, `field_commentSwitch`, `field_copyright`, `field_disqusName`, `field_focalpoint`, `field_objHeadline`, `field_objList`, `field_objMarkdown`, `field_objRichtext`, `field_objSectionColumn`, `field_objSection`, `field_seo`, `field_objSpacer`, `field_objTab`, `field_objGridBox`, `field_objGrid`, `field_objGeneric`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'de',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2017-07-04 21:45:00','2017-07-16 14:02:16','cbaf4989-9591-427d-8938-162b4d17915b'),
	(2,2,'de','Home','<p>It’s true, this site doesn’t have a whole lot of content yet, but don’t worry. Our web developers have just installed the CMS, and they’re setting things up for the content editors this very moment. Soon Ktest10.local will be an oasis of fresh perspectives, sharp analyses, and astute opinions that will keep you coming back again and again.</p>',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'{\"id\":null,\"enabled\":1,\"archived\":0,\"locale\":\"de\",\"localeEnabled\":1,\"slug\":null,\"uri\":null,\"dateCreated\":null,\"dateUpdated\":null,\"root\":null,\"lft\":null,\"rgt\":null,\"level\":null,\"searchScore\":null,\"elementId\":0,\"metaType\":\"template\",\"metaPath\":\"\",\"seoMainEntityCategory\":\"CreativeWork\",\"seoMainEntityOfPage\":\"Article\",\"seoTitle\":\"Home\",\"seoDescription\":\"Home\",\"seoKeywords\":\"\",\"seoImageTransform\":\"\",\"seoFacebookImageTransform\":\"\",\"seoTwitterImageTransform\":\"\",\"twitterCardType\":\"summary_large_image\",\"openGraphType\":\"article\",\"robots\":\"all\",\"seoImageId\":\"\",\"seoTwitterImageId\":\"\",\"seoFacebookImageId\":\"\",\"canonicalUrlOverride\":\"\",\"seoTitleUnparsed\":\"Home\",\"seoDescriptionUnparsed\":\"Home\",\"seoKeywordsUnparsed\":\"\",\"seoTitleSource\":\"field\",\"seoTitleSourceField\":\"title\",\"seoDescriptionSource\":\"field\",\"seoDescriptionSourceField\":\"title\",\"seoKeywordsSource\":\"custom\",\"seoKeywordsSourceField\":\"title\",\"seoImageIdSource\":\"field\",\"seoImageIdSourceField\":\"\",\"seoTwitterImageIdSource\":\"field\",\"seoTwitterImageIdSourceField\":\"\",\"seoFacebookImageIdSource\":\"field\",\"seoFacebookImageIdSourceField\":\"\",\"seoCommerceVariants\":null,\"__model__\":\"Craft\\\\Seomatic_MetaFieldModel\"}','--050',NULL,NULL,NULL,NULL,'2017-07-04 21:45:04','2018-04-21 07:29:53','9fb54827-4097-4fa5-a8fd-1d35d9c8bd38'),
	(4,4,'de','404',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2017-07-04 22:00:57','2017-07-05 21:33:48','0276ef36-ab9b-4ef1-a923-788dd824faf2'),
	(5,5,'de',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2017-07-04 22:01:04','2017-07-04 22:03:20','2403fbb2-6815-4688-9579-12f44c00389e'),
	(6,6,'de',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2017-07-04 22:01:04','2018-04-21 00:32:38','7252c02a-aa48-4507-8a8a-f101ab29f8d4'),
	(7,5,'en',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2017-07-04 22:03:20','2017-07-04 22:03:20','f0e44c50-1591-4839-99f2-35b7e6ad43dc'),
	(8,6,'en',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2017-07-04 22:03:20','2017-07-04 22:03:20','c225a677-ac00-479a-8b2f-6add1e66827c'),
	(9,7,'de','Carousel',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2017-07-05 20:08:13','2017-07-05 20:08:13','261ced72-8fae-449e-b661-441803e6aed8'),
	(10,7,'en','Carousel',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2017-07-05 20:08:13','2017-07-05 20:08:13','140b40f2-6bd4-44cf-b725-606af79ceab2'),
	(11,4,'en','404',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2017-07-05 21:33:48','2017-07-05 21:33:48','a6a1aa02-76c4-40ea-8709-e78a77f4fa97'),
	(12,2,'en','Home','<p>It’s true, this site doesn’t have a whole lot of content yet, but don’t worry. Our web developers have just installed the CMS, and they’re setting things up for the content editors this very moment. Soon Ktest10.local will be an oasis of fresh perspectives, sharp analyses, and astute opinions that will keep you coming back again and again.</p>',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'{\"id\":null,\"enabled\":1,\"archived\":0,\"locale\":\"de\",\"localeEnabled\":1,\"slug\":null,\"uri\":null,\"dateCreated\":null,\"dateUpdated\":null,\"root\":null,\"lft\":null,\"rgt\":null,\"level\":null,\"searchScore\":null,\"elementId\":0,\"metaType\":\"template\",\"metaPath\":\"\",\"seoMainEntityCategory\":\"CreativeWork\",\"seoMainEntityOfPage\":\"Article\",\"seoTitle\":\"Home\",\"seoDescription\":\"Home\",\"seoKeywords\":\"\",\"seoImageTransform\":\"\",\"seoFacebookImageTransform\":\"\",\"seoTwitterImageTransform\":\"\",\"twitterCardType\":\"summary_large_image\",\"openGraphType\":\"article\",\"robots\":\"all\",\"seoImageId\":\"\",\"seoTwitterImageId\":\"\",\"seoFacebookImageId\":\"\",\"seoTitleUnparsed\":\"Home\",\"seoDescriptionUnparsed\":\"Home\",\"seoKeywordsUnparsed\":\"\",\"seoTitleSource\":\"field\",\"seoTitleSourceField\":\"title\",\"seoDescriptionSource\":\"field\",\"seoDescriptionSourceField\":\"title\",\"seoKeywordsSource\":\"custom\",\"seoKeywordsSourceField\":\"title\",\"seoImageIdSource\":\"field\",\"seoImageIdSourceField\":\"\",\"seoTwitterImageIdSource\":\"field\",\"seoTwitterImageIdSourceField\":\"\",\"seoFacebookImageIdSource\":\"field\",\"seoFacebookImageIdSourceField\":\"\",\"seoCommerceVariants\":null,\"__model__\":\"Craft\\\\Seomatic_MetaFieldModel\"}','--050',NULL,NULL,NULL,NULL,'2017-07-05 21:34:43','2017-07-05 21:34:43','a6ab581b-b6ea-4919-abac-ed9597442825'),
	(13,11,'de','Hello World','<p>This is for SEO, OG and RSS Feed Content</p>',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'{\"id\":null,\"enabled\":1,\"archived\":0,\"locale\":\"de\",\"localeEnabled\":1,\"slug\":null,\"uri\":null,\"dateCreated\":null,\"dateUpdated\":null,\"root\":null,\"lft\":null,\"rgt\":null,\"level\":null,\"searchScore\":null,\"elementId\":0,\"metaType\":\"template\",\"metaPath\":\"\",\"seoMainEntityCategory\":\"CreativeWork\",\"seoMainEntityOfPage\":\"Article\",\"seoTitle\":\"Hello World\",\"seoDescription\":\"This is for SEO, OG and RSS Feed Content\",\"seoKeywords\":\"\",\"seoImageTransform\":\"\",\"seoFacebookImageTransform\":\"\",\"seoTwitterImageTransform\":\"\",\"twitterCardType\":\"summary_large_image\",\"openGraphType\":\"article\",\"robots\":\"all\",\"seoImageId\":\"\",\"seoTwitterImageId\":\"\",\"seoFacebookImageId\":\"\",\"seoTitleUnparsed\":\"Hello World\",\"seoDescriptionUnparsed\":\"This is for SEO, OG and RSS Feed Content\",\"seoKeywordsUnparsed\":\"\",\"seoTitleSource\":\"field\",\"seoTitleSourceField\":\"title\",\"seoDescriptionSource\":\"field\",\"seoDescriptionSourceField\":\"body\",\"seoKeywordsSource\":\"custom\",\"seoKeywordsSourceField\":\"title\",\"seoImageIdSource\":\"field\",\"seoImageIdSourceField\":\"featuredImage\",\"seoTwitterImageIdSource\":\"field\",\"seoTwitterImageIdSourceField\":\"featuredImage\",\"seoFacebookImageIdSource\":\"field\",\"seoFacebookImageIdSourceField\":\"featuredImage\",\"seoCommerceVariants\":null,\"__model__\":\"Craft\\\\Seomatic_MetaFieldModel\"}','--050',NULL,NULL,NULL,NULL,'2017-07-16 14:05:54','2017-07-16 14:05:54','315cb79b-92ce-4a59-81b1-bcbf0c0cfa29'),
	(14,11,'en','Hello World','<p>This is for SEO, OG and RSS Feed Content</p>',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'{\"id\":null,\"enabled\":1,\"archived\":0,\"locale\":\"de\",\"localeEnabled\":1,\"slug\":null,\"uri\":null,\"dateCreated\":null,\"dateUpdated\":null,\"root\":null,\"lft\":null,\"rgt\":null,\"level\":null,\"searchScore\":null,\"elementId\":0,\"metaType\":\"template\",\"metaPath\":\"\",\"seoMainEntityCategory\":\"CreativeWork\",\"seoMainEntityOfPage\":\"Article\",\"seoTitle\":\"Hello World\",\"seoDescription\":\"This is for SEO, OG and RSS Feed Content\",\"seoKeywords\":\"\",\"seoImageTransform\":\"\",\"seoFacebookImageTransform\":\"\",\"seoTwitterImageTransform\":\"\",\"twitterCardType\":\"summary_large_image\",\"openGraphType\":\"article\",\"robots\":\"all\",\"seoImageId\":\"\",\"seoTwitterImageId\":\"\",\"seoFacebookImageId\":\"\",\"seoTitleUnparsed\":\"\",\"seoDescriptionUnparsed\":\"\",\"seoKeywordsUnparsed\":\"\",\"seoTitleSource\":\"field\",\"seoTitleSourceField\":\"title\",\"seoDescriptionSource\":\"field\",\"seoDescriptionSourceField\":\"body\",\"seoKeywordsSource\":\"custom\",\"seoKeywordsSourceField\":\"title\",\"seoImageIdSource\":\"field\",\"seoImageIdSourceField\":\"featuredImage\",\"seoTwitterImageIdSource\":\"field\",\"seoTwitterImageIdSourceField\":\"featuredImage\",\"seoFacebookImageIdSource\":\"field\",\"seoFacebookImageIdSourceField\":\"featuredImage\",\"seoCommerceVariants\":null,\"__model__\":\"Craft\\\\Seomatic_MetaFieldModel\"}','--050',NULL,NULL,NULL,NULL,'2017-07-16 14:05:54','2017-07-16 14:05:54','0972d0e1-a5c5-4af3-bd27-d1f0524cf107'),
	(17,15,'de','Align: Horizontal - Left',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-07 10:37:35','2018-03-19 14:38:05','bf7bd03d-45ec-460d-b024-6e9fa037baad'),
	(18,15,'en','Align: Horizontal - Left',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-07 10:37:36','2018-03-19 14:39:20','c123b58a-885a-4e6b-ba33-6e84eed1fd25'),
	(19,17,'de','Align: Horizontal - Right',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-07 10:38:05','2018-03-19 14:38:15','1a38bebe-f3ff-4a75-b7af-e55a3b9d3757'),
	(20,17,'en','Align: Horizontal - Right',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-07 10:38:05','2018-03-19 14:39:30','819ccfdd-86aa-43bf-b986-fdd2436d8a5b'),
	(21,19,'de','Align: Horizontal - Center',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-07 10:38:42','2018-03-19 14:37:51','d82cd49b-81f9-461f-b610-b0b29a66d512'),
	(22,19,'en','Align: Horizontal - Center',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-07 10:38:42','2018-03-19 14:39:10','8bfac50f-5140-48f4-af45-b119dc251c09'),
	(23,21,'de','Align: Vertical - Top',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-07 10:39:57','2018-03-19 14:38:51','790c7742-a18e-4f12-aea4-256488af526d'),
	(24,21,'en','Align: Vertical - Top',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-07 10:39:57','2018-03-19 14:40:07','5cca2dfd-3ea7-4c14-b137-e0e5cd329db7'),
	(25,23,'de','Align: Vertical - Bottom',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-07 10:40:24','2018-03-19 14:38:28','fabac82b-39cf-4093-aeb5-b2584e94d9d1'),
	(26,23,'en','Align: Vertical - Bottom',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-07 10:40:24','2018-03-19 14:39:42','32e4bf88-6f78-4b53-933c-248cc17e204c'),
	(27,25,'de','Align: Vertical - Center',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-07 10:41:02','2018-03-19 14:38:39','0ba44804-33c5-4711-a590-b2884b90be65'),
	(28,25,'en','Align: Vertical - Center',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-07 10:41:02','2018-03-19 14:39:54','140fa0c8-3fa9-4509-a77a-971cd525f464'),
	(29,27,'de','Wrapper: Fullheight',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-07 10:42:05','2018-03-07 12:01:16','3eb5721a-872e-45da-944b-9dc069c8d0b9'),
	(30,27,'en','Wrapper: Fullheight',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-07 10:42:05','2018-03-19 16:25:02','b890f835-6fed-4bf6-b6a5-10b234dd56b2'),
	(31,29,'de','Button: Size - Big',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-07 10:42:47','2018-03-19 16:54:52','fff1838e-4e06-478d-94db-6c7bf757eb78'),
	(32,29,'en','Button: Size - big',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-07 10:42:47','2018-03-07 10:42:47','ab17be2b-7eed-4737-8b5b-1b0b2fea8912'),
	(33,31,'de','Button: Size - Small',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-07 10:43:20','2018-03-19 16:54:45','0a4b9a8b-53fc-4dff-bd76-df7563e4735b'),
	(34,31,'en','Button: Size - small',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-07 10:43:20','2018-03-07 10:43:20','b47f09c7-ddf1-49c9-9d9e-ce315bab55cd'),
	(35,33,'de','Button: Style - Default',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-07 10:44:01','2018-03-07 10:44:01','a7f55d64-f230-4f09-8c06-4227664ba0cf'),
	(36,33,'en','Button: Style - Default',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-07 10:44:01','2018-03-07 10:44:01','f66af59f-c511-48b4-81f1-aff99f496d16'),
	(37,35,'de','Jumpnavigation: Style - Button',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-07 10:45:26','2018-03-07 10:45:26','dea5d93a-f541-4113-a176-3429cd6fcedc'),
	(38,35,'en','Jumpnavigation: Style - Button',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-07 10:45:27','2018-03-07 10:45:27','687a6c01-bd2e-48a5-a6bc-eafa33bf9cc6'),
	(39,37,'de','Color: Text - Primary',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-07 10:46:50','2018-03-07 12:13:09','dfeb7ebe-7d41-4613-80a1-3f7da7cd2c0c'),
	(40,37,'en','Color: Text - Primary',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-07 10:46:50','2018-03-07 10:46:50','df428a11-7958-41db-a842-f64b7937491b'),
	(41,39,'de','Quote: Style - Lined',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-07 10:48:12','2018-03-07 10:48:12','003499be-230e-43a4-96ef-0def5933baf8'),
	(42,39,'en','Quote: Style - Lined',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-07 10:48:12','2018-03-07 10:48:12','630a640b-441a-4069-a558-7b9a0ab18824'),
	(43,41,'de','Typo: Scale - Lead',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-07 10:49:04','2018-03-07 11:47:08','e54ba2e3-7d5d-4ad1-a9a0-418d3298423f'),
	(44,41,'en','Typo: Scale - Lead',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-07 10:49:04','2018-03-07 10:49:04','bdd28514-012e-4a43-8da6-b8416ded5da7'),
	(45,43,'de','Typo: Scale - Small',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-07 10:49:58','2018-03-07 11:47:15','b12cb80c-c2e3-42c0-9b1a-c695f1c0c9a5'),
	(46,43,'en','Typo: Scale - Small',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-07 10:49:58','2018-03-07 10:49:58','5e5a6e9b-4e7e-4d00-9c6e-d1976ba5a9c1'),
	(61,59,'de',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'Hello World',NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-07 12:25:19','2018-04-21 07:29:52','6cec4e58-cb86-4065-9f34-d17b5911115a'),
	(62,59,'en',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'Hello World',NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-07 12:25:19','2018-03-07 12:25:19','9bda58ea-2651-4029-b4a3-5338378617a1'),
	(65,63,'de','Reset: Margin Top',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-18 21:45:20','2018-03-18 21:45:20','63c6b996-787c-4151-bc25-6d7a7bce76d5'),
	(66,63,'en','Reset: Margin Top',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-18 21:45:20','2018-03-18 21:45:20','ac21c364-10aa-480f-8c54-838c76d96e46'),
	(67,65,'de','Reset: Margin Bottom',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-18 21:45:44','2018-03-18 21:45:44','67a9d041-4b52-415f-b024-71706dfafb2e'),
	(68,65,'en','Reset: Margin Bottom',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-18 21:45:44','2018-03-18 21:45:44','589b4b1c-593b-4240-84fa-073d8c783078'),
	(69,67,'de','Reset: Margin Side',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-18 21:46:06','2018-03-18 21:46:06','dae480bd-00ac-407f-a472-327d840a331f'),
	(70,67,'en','Reset: Margin Side',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-18 21:46:06','2018-03-18 21:46:06','8486db72-cd49-4b97-905e-a6f95814a86f'),
	(73,71,'de','Reset: Last Margin Bottom',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-18 21:47:21','2018-03-19 16:57:09','aac87028-0d4f-4e07-b67e-49e15dbbe644'),
	(74,71,'en','Reset: Margin Bottom - Last Child',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-18 21:47:21','2018-03-18 21:47:21','491e861b-0b1a-4a28-9cf0-58c281bbe864'),
	(75,73,'de','Reset: Padding Top',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-18 21:47:51','2018-03-18 21:47:51','5175d31c-cc33-4fc0-8eab-c4bf3bee0e97'),
	(76,73,'en','Reset: Padding Top',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-18 21:47:51','2018-03-18 21:47:51','a3b2c5bb-2ab1-462c-860b-3d91f1e67ec8'),
	(77,75,'de','Reset: Padding Bottom',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-18 21:48:09','2018-03-18 21:48:09','b102417c-2335-4e0c-a2ec-3a19f7df4787'),
	(78,75,'en','Reset: Padding Bottom',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-18 21:48:09','2018-03-18 21:48:09','ad394ff5-df35-43c7-84f3-c530b80312cf'),
	(79,77,'de','Reset: Padding Side',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-18 21:48:26','2018-03-18 21:48:26','d8997083-00f7-44eb-93e1-24e03e387c74'),
	(80,77,'en','Reset: Padding Side',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-18 21:48:26','2018-03-18 21:48:26','244cd7d5-99f6-4df2-9683-f508ecbe100c'),
	(83,80,'de',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,'',NULL,'2018-03-19 10:02:06','2018-03-19 18:20:17','5e5d9743-179e-437f-96a2-b38d72c83428'),
	(84,80,'en',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,'',NULL,'2018-03-19 10:02:06','2018-03-19 18:20:17','d51e0a57-9b13-410c-8530-f15d383c9115'),
	(85,83,'de',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,'',NULL,NULL,'2018-03-19 10:02:06','2018-03-19 18:20:17','fe44b129-b224-4837-8903-d9f5fccd859e'),
	(86,83,'en',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,'',NULL,NULL,'2018-03-19 10:02:06','2018-03-19 18:20:17','bb76f2d6-80a6-4343-bb37-34c7f643c199'),
	(87,85,'de',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'Blubb',NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-19 10:02:06','2018-03-19 18:20:17','5a3c3a17-871b-4d43-9d42-821968d81f5f'),
	(88,85,'en',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'Blubb',NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-19 10:02:06','2018-03-19 16:41:26','2f4e4342-a376-4930-ac3e-c416258201af'),
	(89,89,'de','Wrapper: Fullwidth',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-19 10:45:23','2018-03-19 10:45:23','3248d0a6-84a6-4440-9608-99a0fd0f9397'),
	(90,89,'en','Wrapper: Fullwidth',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-19 10:45:23','2018-03-19 10:45:23','0123a2da-c604-4235-a14f-f4d5f4fee18f'),
	(91,91,'de','Wrapper: Fullbleed',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-19 10:45:38','2018-04-21 00:34:18','4ac080ed-1a56-4f2f-9d69-69126a363626'),
	(92,91,'en','Wrapper: Fullbleed',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-19 10:45:38','2018-03-19 10:45:38','957dcff9-f609-46de-a262-3c59fccf2dca'),
	(93,93,'de','Wrapper: Spacer Vertical 20px',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-19 11:14:39','2018-03-19 11:14:49','a4862c00-b603-4739-b709-8f21653eddd8'),
	(94,93,'en','Wrapper: Spacer Vertical 20px',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-19 11:14:39','2018-03-19 11:14:39','45ade711-6eec-4892-8584-a08ae0c70cc8'),
	(95,95,'de','Wrapper: Spacer Horizontal 20px',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-19 11:15:06','2018-03-19 11:15:06','b97c2e43-6715-415c-9e78-33d58fcb58e7'),
	(96,95,'en','Wrapper: Spacer Horizontal 20px',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-19 11:15:06','2018-03-19 11:15:06','b52f82ac-fa5f-47e1-b072-27c6f647bc96'),
	(97,97,'de','Wrapper: Flexspacer Vertical 1to3',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-19 11:16:04','2018-03-19 11:16:14','8ed90693-fda6-4eda-bf46-148c29a9fca9'),
	(98,97,'en','Wrapper: Flexspacer Vertical 1to3',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-19 11:16:04','2018-03-19 11:16:04','7ea0784d-b9be-4e73-b64e-4d88f2ed077e'),
	(99,99,'de','Wrapper: Flexspacer Horizontal 1to3',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-19 11:16:33','2018-03-19 11:16:33','89b20f3f-c270-4be8-aa3d-fd6df3c5a5a6'),
	(100,99,'en','Wrapper: Flexspacer Horizontal 1to3',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-19 11:16:33','2018-03-19 11:16:33','540806cf-a1f6-4ffb-98fd-8512886aeb6b'),
	(101,101,'de','Typo: Scale Flex - 50px to 80px',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-19 16:23:37','2018-03-19 16:52:45','697566d6-2634-41d1-87ba-ce6f6b3c4409'),
	(102,101,'en','Typo: Flexscale - 50px to 80px',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-19 16:23:37','2018-03-19 16:23:37','46d06cea-bd56-4072-ba53-648767465134'),
	(103,103,'de',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'<p>Die neue Age Protection Range von LOGONA ist das einzige komplette Pflegesystem natrue-zertifizierter Naturkosmetik. Ein Relaunch von hoher Bedeutung, denn Gesichtspflege-Produkte für die Zielgruppe der LOHAS-Best-ager gehören zu den wichtigsten Wachstumstreibern im Naturkosmetik-Bereich.</p>',NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-19 16:41:26','2018-03-19 18:20:17','a8dcfd6c-f70f-44b7-95c5-79dbcb2f183f'),
	(104,103,'en',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'<p>Die neue Age Protection Range von LOGONA ist das einzige komplette Pflegesystem natrue-zertifizierter Naturkosmetik. Ein Relaunch von hoher Bedeutung, denn Gesichtspflege-Produkte für die Zielgruppe der LOHAS-Best-ager gehören zu den wichtigsten Wachstumstreibern im Naturkosmetik-Bereich.</p>',NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-19 16:41:26','2018-03-19 16:41:26','15eba812-4467-4564-becd-d247c72fbe09'),
	(105,105,'de','Typo: Layout - Max Chars 50',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-19 16:48:46','2018-03-19 16:48:46','a6401abc-ebe2-4ed1-8041-1aa881894cb5'),
	(106,105,'en','Typo: Layout - Max Chars 50',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-19 16:48:46','2018-03-19 16:48:46','10d7aa80-a65b-46c0-8621-e8c753c3c611'),
	(107,107,'de','Typo: Layout - Max Chars 75',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-19 16:49:24','2018-03-19 16:49:24','99aba943-34a9-40ee-a64c-cb5968c94ebf'),
	(108,107,'en','Typo: Layout - Max Chars 75',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-19 16:49:24','2018-03-19 16:49:24','ee11b011-585a-4359-bba9-8469ed4a7dea'),
	(109,109,'de','Typo: Layout - 2 CSS Columns',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-19 16:50:51','2018-03-19 16:50:51','3fa9c9e8-1dcf-4d2e-9665-354ef97fca71'),
	(110,109,'en','Typo: Layout - 2 CSS Columns',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-19 16:50:51','2018-03-19 16:50:51','3ace3d21-4d32-4085-8099-fdc2571e8aa0'),
	(111,111,'de','Typo: Layout - Responsive 3 Columns',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-19 16:51:17','2018-03-19 16:51:17','164fe80f-4583-45a3-bbbd-1da846147a36'),
	(112,111,'en','Typo: Layout - Responsive 3 Columns',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-19 16:51:17','2018-03-19 16:51:17','fcd1bd1a-5f47-43a4-b61e-14cede9387e0'),
	(113,113,'de','Slideoutbox: Style - Simple (Specific)',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-19 16:56:11','2018-03-19 16:56:11','7b3a31b7-bbe9-4b9a-9c8e-5f4a3534c920'),
	(114,113,'en','Slideoutbox: Style - Simple (Specific)',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-19 16:56:11','2018-03-19 16:56:11','2f1cbda1-28cd-4c7e-b829-7a2abd6e4cfa'),
	(115,115,'de',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-19 17:23:15','2018-03-19 18:20:17','b1c920ef-a661-47db-b819-f719995120cf'),
	(116,115,'en',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-03-19 17:23:15','2018-03-19 17:23:15','bde3fd8e-1b73-43f9-b598-a1016b157263'),
	(123,125,'de','2to4 Grid [Grid with Flexbox Fallback] (Infinite Boxes)',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-04-21 00:53:00','2018-04-21 10:50:23','725d2429-9081-4ab9-aefd-b04b4f96531a'),
	(124,125,'en','2to4 Grid [Grid with Flexbox Fallback] (Infinite Boxes)',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-04-21 00:53:00','2018-04-21 10:50:32','6a1ebcb6-8273-41a5-9176-2e90462d7c92'),
	(129,131,'de','2 Column Grid [Grid] (2 Boxes)',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-04-21 10:14:11','2018-04-21 10:50:53','ce5a34d0-8524-4569-8901-3efc1442aac7'),
	(130,131,'en','2 Column Grid [Grid] (2 Boxes)',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-04-21 10:14:11','2018-04-21 10:51:03','c120d609-3f59-4ecd-a3e0-b40fe8a8bb07'),
	(133,134,'de',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,'',NULL,'2018-04-21 10:18:52','2018-04-21 10:47:51','4b244527-6495-4119-8c2a-0c21bd561d21'),
	(134,134,'en',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,'',NULL,'2018-04-21 10:18:52','2018-04-21 10:47:51','e10af60e-7639-4678-bb5f-9c880dab2701'),
	(135,137,'de',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,'',NULL,NULL,'2018-04-21 10:18:52','2018-04-21 10:47:51','7fe4cc33-1e76-4fa5-8187-4903b8a2760d'),
	(136,137,'en',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,'',NULL,NULL,'2018-04-21 10:18:52','2018-04-21 10:47:51','cf8c6eb9-2e74-4f99-a7b1-3b432d310983'),
	(137,139,'de',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'Test1',NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-04-21 10:18:52','2018-04-21 10:47:51','38d39487-a25b-4f8e-b459-3462d7d3579a'),
	(138,139,'en',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'Test1',NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-04-21 10:18:52','2018-04-21 10:18:52','c3ef2c22-8f91-4440-948c-f20c9b0d71f4'),
	(139,141,'de',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,'',NULL,NULL,'2018-04-21 10:18:52','2018-04-21 10:47:51','ca5ecd88-1579-427e-bbad-65b02e42c203'),
	(140,141,'en',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,'',NULL,NULL,'2018-04-21 10:18:52','2018-04-21 10:47:51','5186c6fe-981d-4f99-80df-a1a0c39925e3'),
	(141,143,'de',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'Test2',NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-04-21 10:18:52','2018-04-21 10:47:51','35ed7497-3855-466a-8567-08ed0a24660f'),
	(142,143,'en',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'Test2',NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-04-21 10:18:52','2018-04-21 10:18:52','4c766c85-c700-4bc1-9bf9-e237815c81d2'),
	(143,146,'de','3 Column Grid [Grid] (3 Boxes)',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-04-21 10:36:13','2018-04-21 10:51:22','3cb33568-3bef-422b-a074-a2d9d55df82a'),
	(144,146,'en','3 Column Grid [Grid] (3 Boxes)',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-04-21 10:36:13','2018-04-21 10:51:28','cdb3f3f0-2c45-483e-bd98-6e7604c036bc'),
	(145,148,'de','4 Column Grid [Grid] (4 Boxes)',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-04-21 10:38:08','2018-04-21 10:51:44','e166a92a-9bd8-4448-94b7-6daa8a4ee2ce'),
	(146,148,'en','4 Column Grid [Grid] (4 Boxes)',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-04-21 10:38:08','2018-04-21 10:51:51','0dddaec9-4b15-4bca-a7a1-f323908aaed4'),
	(147,150,'de',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,'',NULL,NULL,'2018-04-21 10:44:28','2018-04-21 10:47:51','ad82b628-82f8-427e-af55-c032e4a053d0'),
	(148,150,'en',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,'',NULL,NULL,'2018-04-21 10:44:28','2018-04-21 10:47:51','71266e23-a5ee-4507-8f39-db96fec4be03'),
	(149,152,'de',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'Test3',NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-04-21 10:44:28','2018-04-21 10:47:51','0ee81bcf-a4da-44c6-b9d9-6dd278a7d0d6'),
	(150,152,'en',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'Test3',NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-04-21 10:44:28','2018-04-21 10:44:28','cb87483d-ed59-4ade-a6af-606023f86c84'),
	(151,154,'de',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,'',NULL,NULL,'2018-04-21 10:47:52','2018-04-21 10:47:52','698538e7-9ff8-461a-b4b2-b129fd2723b3'),
	(152,154,'en',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,'',NULL,NULL,'2018-04-21 10:47:52','2018-04-21 10:47:52','37e6ce56-24dd-4236-b142-977e92e1b003'),
	(153,156,'de',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'test4',NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-04-21 10:47:52','2018-04-21 10:47:52','187c15ab-5650-4227-82ff-03fc9c9c5141'),
	(154,156,'en',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'test4',NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,NULL,NULL,NULL,'2018-04-21 10:47:52','2018-04-21 10:47:52','eb70143a-93ab-4799-8d8a-9339a98b0e4f');

/*!40000 ALTER TABLE `craft_content` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_deprecationerrors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_deprecationerrors`;

CREATE TABLE `craft_deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fingerprint` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `line` smallint(6) unsigned NOT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `templateLine` smallint(6) unsigned DEFAULT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `traces` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_deprecationerrors_key_fingerprint_unq_idx` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_elementindexsettings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_elementindexsettings`;

CREATE TABLE `craft_elementindexsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_elementindexsettings_type_unq_idx` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_elementindexsettings` WRITE;
/*!40000 ALTER TABLE `craft_elementindexsettings` DISABLE KEYS */;

INSERT INTO `craft_elementindexsettings` (`id`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'Entry','{\"sourceOrder\":[[\"key\",\"*\"],[\"key\",\"singles\"],[\"heading\",\"Kan\\u00e4le\"],[\"key\",\"section:2\"],[\"heading\",\"Strukturen\"],[\"key\",\"section:6\"],[\"heading\",\"Blog\"],[\"key\",\"section:4\"],[\"key\",\"section:5\"]],\"sources\":{\"section:4\":{\"tableAttributes\":{\"1\":\"postDate\",\"2\":\"expiryDate\",\"3\":\"author\",\"4\":\"link\"}}}}','2017-07-04 22:05:44','2017-07-04 22:06:06','ee0c7b23-4a47-42d2-ad30-9dbfcfa2e455'),
	(3,'Category','{\"sourceOrder\":[[\"heading\",\"Settings\"],[\"key\",\"group:2\"],[\"key\",\"group:3\"],[\"key\",\"group:4\"],[\"heading\",\"Blog\"],[\"key\",\"group:1\"],[\"heading\",\"\"]],\"sources\":{\"group:1\":{\"tableAttributes\":{\"1\":\"link\"}},\"group:2\":{\"tableAttributes\":{\"1\":\"link\"}}}}','2017-07-04 22:08:08','2018-03-07 10:24:51','5800665a-e36c-41ce-b880-f87a7a03d925');

/*!40000 ALTER TABLE `craft_elementindexsettings` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_elements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_elements`;

CREATE TABLE `craft_elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `archived` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_elements_type_idx` (`type`),
  KEY `craft_elements_enabled_idx` (`enabled`),
  KEY `craft_elements_archived_dateCreated_idx` (`archived`,`dateCreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_elements` WRITE;
/*!40000 ALTER TABLE `craft_elements` DISABLE KEYS */;

INSERT INTO `craft_elements` (`id`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'User',1,0,'2017-07-04 21:45:00','2017-07-16 14:02:16','c217e49e-c721-4924-9348-928638224692'),
	(2,'Entry',1,0,'2017-07-04 21:45:04','2018-04-21 07:29:52','e03cba08-abbf-4500-ba9c-502704e48f78'),
	(4,'Entry',1,0,'2017-07-04 22:00:57','2017-07-05 21:33:47','cba1ee13-1a0f-4ba9-aefd-54b2c80a7e55'),
	(5,'GlobalSet',1,0,'2017-07-04 22:01:04','2017-07-04 22:03:20','708ae318-3f09-49e3-9839-4e530ae511a9'),
	(6,'GlobalSet',1,0,'2017-07-04 22:01:04','2018-04-21 00:32:38','db06c4ce-1cb8-4c2b-bce8-2402f56b953f'),
	(7,'Category',1,0,'2017-07-05 20:08:13','2017-07-05 20:08:13','80dfd2d2-abac-4878-a8d5-2c6ced2f8f15'),
	(10,'SuperTable_Block',1,0,'2017-07-05 21:33:19','2018-04-21 07:29:52','7364e1ea-afed-4617-a0b6-edd67ffa7777'),
	(11,'Entry',1,0,'2017-07-16 14:05:54','2017-07-16 14:05:54','7021e756-3fd2-46a0-ad2a-ee0309c9d166'),
	(12,'SuperTable_Block',1,0,'2017-07-16 14:05:54','2017-07-16 14:05:54','d2e32ad1-b529-4c82-a358-bc90967809c8'),
	(15,'Category',1,0,'2018-03-07 10:37:35','2018-03-19 14:39:20','b232605d-9979-49f8-8e1c-011b11ab7cb2'),
	(16,'SuperTable_Block',1,0,'2018-03-07 10:37:36','2018-03-19 14:39:20','0fc1acc6-e3bd-471a-b7d2-c138b6836c9e'),
	(17,'Category',1,0,'2018-03-07 10:38:05','2018-03-19 14:39:30','f4589c1f-5eb8-4a53-9f46-7f97e30064bd'),
	(18,'SuperTable_Block',1,0,'2018-03-07 10:38:05','2018-03-19 14:39:30','74d15517-42d7-4590-aae9-a3a6b12be80e'),
	(19,'Category',1,0,'2018-03-07 10:38:42','2018-03-19 14:39:10','e512ebad-efcc-4c6d-a892-d1cc099323c4'),
	(20,'SuperTable_Block',1,0,'2018-03-07 10:38:42','2018-03-19 14:39:10','8162cee9-bf8e-4627-951a-643307318647'),
	(21,'Category',1,0,'2018-03-07 10:39:57','2018-03-19 14:40:07','01e120b4-4f2d-48a9-aa5a-94591715d89d'),
	(22,'SuperTable_Block',1,0,'2018-03-07 10:39:57','2018-03-19 14:40:07','628a6d09-d5c3-4aa0-ad7c-bd2aa06e3d01'),
	(23,'Category',1,0,'2018-03-07 10:40:24','2018-03-19 14:39:42','e0927aa2-c349-4c2a-b63f-62c052d0f782'),
	(24,'SuperTable_Block',1,0,'2018-03-07 10:40:24','2018-03-19 14:39:42','95711262-c881-4660-bf6c-a078400fe3ad'),
	(25,'Category',1,0,'2018-03-07 10:41:02','2018-03-19 14:39:54','49a1db5c-89a0-4ff3-b7b2-735876f883fa'),
	(26,'SuperTable_Block',1,0,'2018-03-07 10:41:02','2018-03-19 14:39:54','b1449796-631b-46b7-a45b-d5f92717c8f5'),
	(27,'Category',1,0,'2018-03-07 10:42:05','2018-03-19 16:25:02','8d6035cd-f201-4557-9f72-7c6e9b47407e'),
	(28,'SuperTable_Block',1,0,'2018-03-07 10:42:05','2018-03-19 16:25:02','dfec40a4-8a50-4163-b58d-bff8c92f6581'),
	(29,'Category',1,0,'2018-03-07 10:42:47','2018-03-19 16:54:52','f55b0d61-7b9a-44e6-8b64-d1c7691fa288'),
	(30,'SuperTable_Block',1,0,'2018-03-07 10:42:47','2018-03-19 16:54:53','3b22fd33-9f58-40e5-99e7-4ede7c8f4dc8'),
	(31,'Category',1,0,'2018-03-07 10:43:20','2018-03-19 16:54:45','31d01fa4-a50f-4f05-a196-aea54a7addbd'),
	(32,'SuperTable_Block',1,0,'2018-03-07 10:43:20','2018-03-19 16:54:45','d9d92d7f-8c74-44e6-86bb-ef0a664aa6c5'),
	(33,'Category',1,0,'2018-03-07 10:44:01','2018-03-07 10:44:01','d785421c-c825-4ee3-bb32-2516ef10b464'),
	(34,'SuperTable_Block',1,0,'2018-03-07 10:44:01','2018-03-07 10:44:01','9ba00a19-80ec-4f31-b8e1-7daae32bdfc7'),
	(35,'Category',1,0,'2018-03-07 10:45:26','2018-03-07 10:45:26','17690715-b37d-486f-b0c8-71418ad19685'),
	(36,'SuperTable_Block',1,0,'2018-03-07 10:45:27','2018-03-07 10:45:27','2760084f-b3ad-4400-90c0-babef1f0b3d3'),
	(37,'Category',1,0,'2018-03-07 10:46:50','2018-03-07 12:13:09','1c750fbe-2b29-42e4-ae3d-29291b521402'),
	(38,'SuperTable_Block',1,0,'2018-03-07 10:46:50','2018-03-07 12:13:09','03f03ac2-1d92-4b97-bd0b-88e1652ece40'),
	(39,'Category',1,0,'2018-03-07 10:48:12','2018-03-07 10:48:12','636ad94b-d138-4a22-b5fc-a950f3e42167'),
	(40,'SuperTable_Block',1,0,'2018-03-07 10:48:12','2018-03-07 10:48:12','f1a7f1df-46c8-499c-ad49-9e583dca9ca1'),
	(41,'Category',1,0,'2018-03-07 10:49:04','2018-03-07 11:47:08','48b54a6b-b944-464f-be2f-d1b8f940dab2'),
	(42,'SuperTable_Block',1,0,'2018-03-07 10:49:04','2018-03-07 11:47:08','18427a6b-0270-4ce0-bbcf-2c9e7878d95a'),
	(43,'Category',1,0,'2018-03-07 10:49:58','2018-03-07 11:47:15','63989d8f-1f38-4be3-9d33-3229d20fa38e'),
	(44,'SuperTable_Block',1,0,'2018-03-07 10:49:58','2018-03-07 11:47:15','59d29c77-649b-4f41-a890-984724787d5d'),
	(59,'Neo_Block',1,0,'2018-03-07 12:25:19','2018-04-21 07:29:52','81d9dee0-b677-496d-8693-6529b5086b19'),
	(60,'SuperTable_Block',1,0,'2018-03-07 12:25:19','2018-04-21 07:29:52','e248e26e-614f-4333-9412-27cc64a62e61'),
	(63,'Category',1,0,'2018-03-18 21:45:20','2018-03-18 21:45:20','d6084571-6c7d-4483-99c8-6a406aa6b53d'),
	(64,'SuperTable_Block',1,0,'2018-03-18 21:45:20','2018-03-18 21:45:20','3ee2d2b4-5048-41dd-aedd-9f73f3593256'),
	(65,'Category',1,0,'2018-03-18 21:45:44','2018-03-18 21:45:44','ba7c4214-b337-455a-b734-143c6cc354bc'),
	(66,'SuperTable_Block',1,0,'2018-03-18 21:45:44','2018-03-18 21:45:44','953d1c51-babb-4ab2-b35e-4f21f0acf762'),
	(67,'Category',1,0,'2018-03-18 21:46:06','2018-03-18 21:46:06','8526cc83-7282-43cf-8fcd-ae460c7b553d'),
	(68,'SuperTable_Block',1,0,'2018-03-18 21:46:06','2018-03-18 21:46:06','e0122eab-f4a6-4def-91ad-1d68a2b9f359'),
	(71,'Category',1,0,'2018-03-18 21:47:21','2018-03-19 16:57:09','1bf79658-fe16-40cc-bdd0-1cc45775a426'),
	(72,'SuperTable_Block',1,0,'2018-03-18 21:47:21','2018-03-19 16:57:09','f205c54f-6d9f-44a1-ac1b-664a2c409b7e'),
	(73,'Category',1,0,'2018-03-18 21:47:51','2018-03-18 21:47:51','6e798de5-6e64-4249-afc9-70a80d86cbc3'),
	(74,'SuperTable_Block',1,0,'2018-03-18 21:47:51','2018-03-18 21:47:51','b3713c9f-ebef-4dad-a877-aef8988419ed'),
	(75,'Category',1,0,'2018-03-18 21:48:09','2018-03-18 21:48:09','8782181c-a9b9-44de-a46a-185e2968f1a6'),
	(76,'SuperTable_Block',1,0,'2018-03-18 21:48:09','2018-03-18 21:48:09','defdfdec-34e8-4f78-8a5f-35af94cb5175'),
	(77,'Category',1,0,'2018-03-18 21:48:26','2018-03-18 21:48:26','74ae5943-09b3-4e9b-b9fc-c6df3558673d'),
	(78,'SuperTable_Block',1,0,'2018-03-18 21:48:26','2018-03-18 21:48:26','3e69366d-8c73-4a45-8716-283be499f1fe'),
	(80,'Neo_Block',1,0,'2018-03-19 10:02:06','2018-03-19 18:20:17','391d665b-b364-45f5-a166-c1edbd54aeb5'),
	(81,'SuperTable_Block',1,0,'2018-03-19 10:02:06','2018-03-19 18:20:17','1c1272c9-bc65-4d10-a0ce-34f4df2f6cc0'),
	(82,'SuperTable_Block',1,0,'2018-03-19 10:02:06','2018-03-19 18:20:17','559e05a7-458d-4dba-abe7-76f5d587e0a6'),
	(83,'Neo_Block',1,0,'2018-03-19 10:02:06','2018-03-19 18:20:17','a6e084c1-0c80-4b32-a3d9-b36b29457c0f'),
	(84,'SuperTable_Block',1,0,'2018-03-19 10:02:06','2018-03-19 18:20:17','a9e693b3-25c8-4223-8a91-69bb7f3331ab'),
	(85,'Neo_Block',1,0,'2018-03-19 10:02:06','2018-03-19 18:20:17','4e1c1735-ac48-4b2b-98ee-93d3d3376555'),
	(86,'SuperTable_Block',1,0,'2018-03-19 10:02:06','2018-03-19 18:20:17','5ae4cca4-14c9-4a9d-98ec-1174da8e7cea'),
	(89,'Category',1,0,'2018-03-19 10:45:23','2018-03-19 10:45:23','b12e779c-895b-43e0-8339-98de155aaa85'),
	(90,'SuperTable_Block',1,0,'2018-03-19 10:45:23','2018-03-19 10:45:23','e94cb9c1-3d1c-497b-a386-d90bceebf8c2'),
	(91,'Category',1,0,'2018-03-19 10:45:38','2018-04-21 00:34:18','1eb94c47-57cd-42a3-9bb2-f3ea009f8182'),
	(92,'SuperTable_Block',1,0,'2018-03-19 10:45:38','2018-04-21 00:34:18','677c2338-bf8b-41a4-bf9f-2a848453de86'),
	(93,'Category',1,0,'2018-03-19 11:14:39','2018-03-19 11:14:49','d5ae447f-0394-4b6b-8fe9-d533fac6f0f9'),
	(94,'SuperTable_Block',1,0,'2018-03-19 11:14:39','2018-03-19 11:14:49','adef7819-5e19-4e53-af14-de15ec590f33'),
	(95,'Category',1,0,'2018-03-19 11:15:06','2018-03-19 11:15:06','d6d80869-a212-4c1c-9af0-ea6c34d809a7'),
	(96,'SuperTable_Block',1,0,'2018-03-19 11:15:06','2018-03-19 11:15:06','18a6d634-3b33-4b74-9285-61a02ccc49b3'),
	(97,'Category',1,0,'2018-03-19 11:16:04','2018-03-19 11:16:14','5e53f236-8be2-4256-81e4-0496d8497304'),
	(98,'SuperTable_Block',1,0,'2018-03-19 11:16:04','2018-03-19 11:16:14','6336b6b5-0c48-4616-af1e-ffb283dea743'),
	(99,'Category',1,0,'2018-03-19 11:16:33','2018-03-19 11:16:33','3f5d7fc8-e538-4d1b-9375-f970ffd1ac48'),
	(100,'SuperTable_Block',1,0,'2018-03-19 11:16:33','2018-03-19 11:16:33','67b315f4-aa20-4cde-9d96-cf55cd528cb8'),
	(101,'Category',1,0,'2018-03-19 16:23:37','2018-03-19 16:52:45','e9143625-9cfb-4db7-a3b1-349f68bf2d7a'),
	(102,'SuperTable_Block',1,0,'2018-03-19 16:23:37','2018-03-19 16:52:45','2e2d9681-7efc-4a55-aa35-f7d3d5174bd3'),
	(103,'Neo_Block',1,0,'2018-03-19 16:41:26','2018-03-19 18:20:17','2e704b7b-d47d-4475-8e87-1c80b55f57cf'),
	(104,'SuperTable_Block',1,0,'2018-03-19 16:41:26','2018-03-19 18:20:17','48357cb7-56e0-4fce-a784-e639a7623765'),
	(105,'Category',1,0,'2018-03-19 16:48:46','2018-03-19 16:48:46','a345e0f7-6cfa-466f-ad94-47c9bae30fe8'),
	(106,'SuperTable_Block',1,0,'2018-03-19 16:48:46','2018-03-19 16:48:46','ebdcabac-1873-4306-b287-edbe0d2e907b'),
	(107,'Category',1,0,'2018-03-19 16:49:24','2018-03-19 16:49:24','30c3a9c8-c244-4e60-82b3-66b7a3478804'),
	(108,'SuperTable_Block',1,0,'2018-03-19 16:49:24','2018-03-19 16:49:24','d86b7849-ee44-4b53-94ed-e1ed59ce75c3'),
	(109,'Category',1,0,'2018-03-19 16:50:51','2018-03-19 16:50:51','2219da4a-a840-4e00-bf78-b9d87e39fa6b'),
	(110,'SuperTable_Block',1,0,'2018-03-19 16:50:51','2018-03-19 16:50:51','86b4b4ab-ee03-4ea7-a9f7-73aaf34b7202'),
	(111,'Category',1,0,'2018-03-19 16:51:17','2018-03-19 16:51:17','8c2c7e1c-6284-46ed-bdf4-bd9fdcd94939'),
	(112,'SuperTable_Block',1,0,'2018-03-19 16:51:17','2018-03-19 16:51:17','2dfdd98a-f9b2-462c-887c-dee26c92aa56'),
	(113,'Category',1,0,'2018-03-19 16:56:11','2018-03-19 16:56:11','bd50d8da-d864-411a-b296-93dcbaa680e5'),
	(114,'SuperTable_Block',1,0,'2018-03-19 16:56:11','2018-03-19 16:56:11','128ad688-d977-4277-b14b-f28b56dd9ea4'),
	(115,'Neo_Block',1,0,'2018-03-19 17:23:15','2018-03-19 18:20:17','57e4f128-9d21-4089-a170-9445a0bb53f6'),
	(116,'SuperTable_Block',1,0,'2018-03-19 17:23:15','2018-03-19 18:20:17','6fd67ed9-3ff3-4265-9f39-c491859d1972'),
	(117,'SuperTable_Block',1,0,'2018-03-19 17:23:15','2018-03-19 18:20:17','10b234c4-bec7-4a26-860d-758f67194bf8'),
	(125,'Category',1,0,'2018-04-21 00:53:00','2018-04-21 10:50:32','42c37463-d6cb-4967-8f27-8a94d52a552b'),
	(126,'SuperTable_Block',1,0,'2018-04-21 00:53:00','2018-04-21 10:50:32','036f1e46-be3c-4348-915f-5035cdb7befb'),
	(131,'Category',1,0,'2018-04-21 10:14:11','2018-04-21 10:51:03','195d5d73-8636-49f3-ac0c-20d4e72e9413'),
	(132,'SuperTable_Block',1,0,'2018-04-21 10:14:11','2018-04-21 10:51:03','e003369b-c898-4672-afea-046926b8f4fe'),
	(134,'Neo_Block',1,0,'2018-04-21 10:18:52','2018-04-21 10:47:51','a1c2e9a5-d489-4191-a406-40de9ec88553'),
	(135,'SuperTable_Block',1,0,'2018-04-21 10:18:52','2018-04-21 10:47:51','11913f60-60ee-491e-9364-c4c53a99c87d'),
	(136,'SuperTable_Block',1,0,'2018-04-21 10:18:52','2018-04-21 10:47:51','83231f92-f012-43f0-bab8-59082a8e77f9'),
	(137,'Neo_Block',1,0,'2018-04-21 10:18:52','2018-04-21 10:47:51','70d2cb52-3a31-4d54-b135-5ee31aa9fba1'),
	(138,'SuperTable_Block',1,0,'2018-04-21 10:18:52','2018-04-21 10:47:51','0d88b6ef-bf92-4742-b9ed-d2f723c9215c'),
	(139,'Neo_Block',1,0,'2018-04-21 10:18:52','2018-04-21 10:47:51','57e4f4f2-5368-4dac-9086-abe4aed88a91'),
	(140,'SuperTable_Block',1,0,'2018-04-21 10:18:52','2018-04-21 10:47:51','4740a8f7-7c9e-44fa-9825-919a1bd20a70'),
	(141,'Neo_Block',1,0,'2018-04-21 10:18:52','2018-04-21 10:47:51','ae66d392-7d2e-43d5-b326-7352fe43acc0'),
	(142,'SuperTable_Block',1,0,'2018-04-21 10:18:52','2018-04-21 10:47:51','a2742a58-6018-4a0f-8d99-ec1959f59693'),
	(143,'Neo_Block',1,0,'2018-04-21 10:18:52','2018-04-21 10:47:51','a8f6b0fe-09a0-4e12-b381-08568cbb18a2'),
	(144,'SuperTable_Block',1,0,'2018-04-21 10:18:52','2018-04-21 10:47:51','43145b5f-f56d-4a6f-929e-a0b097586d71'),
	(146,'Category',1,0,'2018-04-21 10:36:13','2018-04-21 10:51:28','5eba66dc-c8fc-4a8b-9f23-8fbc5dad2ab0'),
	(147,'SuperTable_Block',1,0,'2018-04-21 10:36:13','2018-04-21 10:51:28','abf932c9-8fdd-417f-9aaa-57a6e9dfa1b5'),
	(148,'Category',1,0,'2018-04-21 10:38:08','2018-04-21 10:51:51','e1c5cfde-60f1-48db-8ffc-e21647da5c25'),
	(149,'SuperTable_Block',1,0,'2018-04-21 10:38:08','2018-04-21 10:51:51','77398c8f-e769-4973-a1fa-b245514e7f17'),
	(150,'Neo_Block',1,0,'2018-04-21 10:44:28','2018-04-21 10:47:51','6de8e82f-ce70-4e4e-8346-42a16833d8e6'),
	(151,'SuperTable_Block',1,0,'2018-04-21 10:44:28','2018-04-21 10:47:51','fbb42755-48b6-4668-8857-b44073fc48b6'),
	(152,'Neo_Block',1,0,'2018-04-21 10:44:28','2018-04-21 10:47:51','b5ab962b-aea2-4e19-b56f-953d34eb975f'),
	(153,'SuperTable_Block',1,0,'2018-04-21 10:44:28','2018-04-21 10:47:52','c43162be-7e9c-449d-a861-dc8e731da73c'),
	(154,'Neo_Block',1,0,'2018-04-21 10:47:52','2018-04-21 10:47:52','23eb9f17-d665-4914-8fcd-70d2caac86b7'),
	(155,'SuperTable_Block',1,0,'2018-04-21 10:47:52','2018-04-21 10:47:52','90a36d69-73bc-42af-89a8-55b49a98ad38'),
	(156,'Neo_Block',1,0,'2018-04-21 10:47:52','2018-04-21 10:47:52','dea902df-1446-4491-9c8a-4bb5e51e4bdb'),
	(157,'SuperTable_Block',1,0,'2018-04-21 10:47:52','2018-04-21 10:47:52','126dbb8b-cde8-43ca-a57b-369bf86d09f2');

/*!40000 ALTER TABLE `craft_elements` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_elements_i18n
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_elements_i18n`;

CREATE TABLE `craft_elements_i18n` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_elements_i18n_elementId_locale_unq_idx` (`elementId`,`locale`),
  UNIQUE KEY `craft_elements_i18n_uri_locale_unq_idx` (`uri`,`locale`),
  KEY `craft_elements_i18n_slug_locale_idx` (`slug`,`locale`),
  KEY `craft_elements_i18n_enabled_idx` (`enabled`),
  KEY `craft_elements_i18n_locale_fk` (`locale`),
  CONSTRAINT `craft_elements_i18n_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_elements_i18n_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_elements_i18n` WRITE;
/*!40000 ALTER TABLE `craft_elements_i18n` DISABLE KEYS */;

INSERT INTO `craft_elements_i18n` (`id`, `elementId`, `locale`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'de','',NULL,1,'2017-07-04 21:45:00','2017-07-16 14:02:16','0cb638ff-c30e-4e0f-9e2d-ee6db00d3115'),
	(2,2,'de','homepage','__home__',1,'2017-07-04 21:45:04','2018-04-21 07:29:52','974d33f2-d7ef-425f-959f-022b86c304c5'),
	(4,4,'de','404','404',1,'2017-07-04 22:00:57','2017-07-05 21:33:48','8e3d67f1-9249-4c1f-a99b-9aa785e2b239'),
	(5,5,'de','',NULL,1,'2017-07-04 22:01:04','2017-07-04 22:03:20','eab58c53-7331-412e-bdda-86dedb7ee256'),
	(6,6,'de','',NULL,1,'2017-07-04 22:01:04','2018-04-21 00:32:38','0544ef7d-f059-4c71-a262-f1579e86421f'),
	(7,5,'en','',NULL,1,'2017-07-04 22:03:20','2017-07-04 22:03:20','d39f95b0-d625-4895-9c27-1e36d74296ed'),
	(8,6,'en','',NULL,1,'2017-07-04 22:03:20','2018-04-21 00:32:38','74b24024-1f9e-4726-a798-c6d1254fd0e1'),
	(9,7,'de','carousel',NULL,1,'2017-07-05 20:08:13','2017-07-05 20:08:15','05195cb8-b220-48de-93e2-517c0f2704a9'),
	(10,7,'en','carousel',NULL,1,'2017-07-05 20:08:13','2017-07-05 20:08:15','217b24cd-352d-4c01-bf70-c3204ae434b2'),
	(15,10,'de','',NULL,1,'2017-07-05 21:33:19','2018-04-21 07:29:53','2a645fcf-c92e-46fd-bb98-01bf9fa06b11'),
	(16,4,'en','404','404',1,'2017-07-05 21:33:48','2017-07-05 21:33:48','7459f1b5-ce3f-454a-9f7f-b1687b2eea15'),
	(17,2,'en','homepage','__home__',1,'2017-07-05 21:34:43','2018-04-21 07:29:52','3f9118d4-db28-4343-aa89-0908b07ec43f'),
	(18,11,'de','hello-world','blog/e/hello-world',1,'2017-07-16 14:05:54','2017-07-16 14:05:54','f0544f07-10fc-4eed-98eb-699504007849'),
	(19,11,'en','hello-world','blog/e/hello-world',1,'2017-07-16 14:05:54','2017-07-16 14:05:54','eef10dc6-05b4-403d-8d21-654b1df146f2'),
	(20,12,'de','',NULL,1,'2017-07-16 14:05:54','2017-07-16 14:05:54','7049b39a-1368-46e1-9a78-a231b84adab9'),
	(21,12,'en','',NULL,1,'2017-07-16 14:05:54','2017-07-16 14:05:54','512e3fb2-2182-4468-9256-301539afa596'),
	(26,15,'de','align-left',NULL,1,'2018-03-07 10:37:36','2018-03-19 14:39:20','eb55494e-d043-4b4d-ad1a-9a460b60dd66'),
	(27,15,'en','align-left',NULL,1,'2018-03-07 10:37:36','2018-03-19 14:39:20','49c083fd-247c-49bb-8250-1f3148f26bb3'),
	(28,16,'de','',NULL,1,'2018-03-07 10:37:36','2018-03-19 14:39:20','b437ffce-e389-49e9-87fd-404e1da6e84e'),
	(29,16,'en','',NULL,1,'2018-03-07 10:37:36','2018-03-19 14:39:20','3e76e6e6-415e-4e55-9f99-ef1aede28b62'),
	(30,17,'de','align-right',NULL,1,'2018-03-07 10:38:05','2018-03-19 14:39:30','737d5a7a-c957-4dd2-9b6d-e6ddc2d2b911'),
	(31,17,'en','align-right',NULL,1,'2018-03-07 10:38:05','2018-03-19 14:39:30','f6c0a316-7f99-49b7-aae5-3dcb61747e8c'),
	(32,18,'de','',NULL,1,'2018-03-07 10:38:05','2018-03-19 14:39:30','d2118d5d-9c85-4454-8681-e9a2d0cb9eb0'),
	(33,18,'en','',NULL,1,'2018-03-07 10:38:05','2018-03-19 14:39:30','bfbb296d-d00a-4426-b8f6-ced761c681bf'),
	(34,19,'de','align-center',NULL,1,'2018-03-07 10:38:42','2018-03-19 14:39:10','7c2e2a8a-c34d-46d4-a5a5-69deb7779cd6'),
	(35,19,'en','align-center',NULL,1,'2018-03-07 10:38:42','2018-03-19 14:39:10','7200ad6a-d2a7-44ff-be93-7350a757e312'),
	(36,20,'de','',NULL,1,'2018-03-07 10:38:42','2018-03-19 14:39:10','8fa7bc4f-6533-4ab7-8e51-14c9ff145e03'),
	(37,20,'en','',NULL,1,'2018-03-07 10:38:42','2018-03-19 14:39:10','c0a88b3f-5467-4ff6-971a-fe814115ce65'),
	(38,21,'de','valign-top',NULL,1,'2018-03-07 10:39:57','2018-03-19 14:40:07','b7389571-d2c9-4c5f-969a-4a7ad4b98361'),
	(39,21,'en','valign-top',NULL,1,'2018-03-07 10:39:57','2018-03-19 14:40:07','7fe60ceb-4fb9-40e3-b22f-a7364663aac5'),
	(40,22,'de','',NULL,1,'2018-03-07 10:39:57','2018-03-19 14:40:07','0a0a3c02-1cd3-46f9-8ba1-cbca37498535'),
	(41,22,'en','',NULL,1,'2018-03-07 10:39:57','2018-03-19 14:40:07','c5b0f89a-ebb1-44df-aa10-9166b4d9c086'),
	(42,23,'de','valign-bottom',NULL,1,'2018-03-07 10:40:24','2018-03-19 14:39:42','b64f2e2d-4299-425d-a29f-a5ec09b53334'),
	(43,23,'en','valign-bottom',NULL,1,'2018-03-07 10:40:24','2018-03-19 14:39:42','00b80f9f-d7e4-42d5-8fcb-2ae12104ac0c'),
	(44,24,'de','',NULL,1,'2018-03-07 10:40:24','2018-03-19 14:39:42','3e148c84-3791-4ead-9f9f-37e8b7b1f0d2'),
	(45,24,'en','',NULL,1,'2018-03-07 10:40:24','2018-03-19 14:39:42','a83f6381-258a-41ae-989b-08d7e1c51351'),
	(46,25,'de','valign-center',NULL,1,'2018-03-07 10:41:02','2018-03-19 14:39:54','13eae929-fa75-4fd4-9ef4-f915e78d047f'),
	(47,25,'en','valign-center',NULL,1,'2018-03-07 10:41:02','2018-03-19 14:39:54','a10ba33a-a196-49a2-8897-f5eec3cb0c3e'),
	(48,26,'de','',NULL,1,'2018-03-07 10:41:02','2018-03-19 14:39:54','70302d66-4c8c-4b3e-b9de-f6789bbb5568'),
	(49,26,'en','',NULL,1,'2018-03-07 10:41:02','2018-03-19 14:39:54','4c40e2ce-cdb3-45c0-97dd-9c073e43b941'),
	(50,27,'de','container-fullheight',NULL,1,'2018-03-07 10:42:05','2018-03-19 16:25:02','e90a58c4-46e8-4353-a94f-22dc8f35a550'),
	(51,27,'en','container-fullheight',NULL,1,'2018-03-07 10:42:05','2018-03-19 16:25:02','65ec4d44-6618-4f57-96e1-a5b47901da0d'),
	(52,28,'de','',NULL,1,'2018-03-07 10:42:05','2018-03-19 16:25:02','06db4930-d077-4843-b713-c7eb5e4df975'),
	(53,28,'en','',NULL,1,'2018-03-07 10:42:05','2018-03-19 16:25:02','4e0cb6ab-4203-497e-a26b-44ae0ccc5d5d'),
	(54,29,'de','button-size-big',NULL,1,'2018-03-07 10:42:47','2018-03-19 16:54:53','373805ec-b82e-4151-87d7-b1e28fcb6b05'),
	(55,29,'en','button-size-big',NULL,1,'2018-03-07 10:42:47','2018-03-19 16:54:53','de4bd7c5-230d-4132-bb0e-1ef5e1fdd3e1'),
	(56,30,'de','',NULL,1,'2018-03-07 10:42:47','2018-03-19 16:54:53','fc088f0f-2b90-4753-8826-10610b3ae75d'),
	(57,30,'en','',NULL,1,'2018-03-07 10:42:47','2018-03-19 16:54:53','7c1b2c5e-8b72-4927-8460-e38eef7f570c'),
	(58,31,'de','button-size-small',NULL,1,'2018-03-07 10:43:20','2018-03-19 16:54:45','9ff92b94-e5b0-4d3e-8db1-f8dd444bcbb3'),
	(59,31,'en','button-size-small',NULL,1,'2018-03-07 10:43:20','2018-03-19 16:54:45','ab4c2e68-6206-4515-9c3b-52943ac05e2c'),
	(60,32,'de','',NULL,1,'2018-03-07 10:43:20','2018-03-19 16:54:45','0825452a-1c40-4765-92a1-d2c1bc2fb54f'),
	(61,32,'en','',NULL,1,'2018-03-07 10:43:20','2018-03-19 16:54:45','d01e51f0-1b98-4c91-b50b-c1aa3234160a'),
	(62,33,'de','button-style-default',NULL,1,'2018-03-07 10:44:01','2018-03-07 10:44:02','725c8fa8-fff5-4a40-b7c8-85324e39cd8d'),
	(63,33,'en','button-style-default',NULL,1,'2018-03-07 10:44:01','2018-03-07 10:44:02','e2979379-6579-4c1d-93e9-c708c38993f3'),
	(64,34,'de','',NULL,1,'2018-03-07 10:44:01','2018-03-07 10:44:01','1ce86d66-3e0d-4052-be80-68d96cc6c562'),
	(65,34,'en','',NULL,1,'2018-03-07 10:44:01','2018-03-07 10:44:01','cc26fdc6-1c5d-4193-b4eb-55bfbb413d56'),
	(66,35,'de','jumpnavigation-style-button',NULL,1,'2018-03-07 10:45:27','2018-03-07 10:45:28','043a538b-1b1e-4278-8ca9-86bb3379c3fb'),
	(67,35,'en','jumpnavigation-style-button',NULL,1,'2018-03-07 10:45:27','2018-03-07 10:45:28','2d3abc76-9aa7-411a-be94-ebd1d663ace4'),
	(68,36,'de','',NULL,1,'2018-03-07 10:45:27','2018-03-07 10:45:27','cbae97ef-458c-47c3-bcc3-60ff920f0632'),
	(69,36,'en','',NULL,1,'2018-03-07 10:45:27','2018-03-07 10:45:27','af1021c6-72a6-4b35-b483-f44156750651'),
	(70,37,'de','color-text-primary',NULL,1,'2018-03-07 10:46:50','2018-03-07 12:13:09','3258e1d8-e701-47e4-9780-8622789b235e'),
	(71,37,'en','color-text-primary',NULL,1,'2018-03-07 10:46:50','2018-03-07 12:13:09','358ea84c-bbff-4c84-902e-1c48797090b2'),
	(72,38,'de','',NULL,1,'2018-03-07 10:46:50','2018-03-07 12:13:09','1bf39b72-c067-4799-bb2d-9b7bb470bc34'),
	(73,38,'en','',NULL,1,'2018-03-07 10:46:50','2018-03-07 12:13:09','3e5fc571-b694-4860-bfca-709c722f2330'),
	(74,39,'de','quote-style-lined',NULL,1,'2018-03-07 10:48:12','2018-03-07 10:48:13','84fad045-0911-498a-85a3-9146d51fb35c'),
	(75,39,'en','quote-style-lined',NULL,1,'2018-03-07 10:48:12','2018-03-07 10:48:13','4756ec90-ca5a-486c-83bb-40f5b2125347'),
	(76,40,'de','',NULL,1,'2018-03-07 10:48:12','2018-03-07 10:48:12','993480b2-3787-48f7-8250-5b479026a35f'),
	(77,40,'en','',NULL,1,'2018-03-07 10:48:12','2018-03-07 10:48:12','c5a5d0d5-1c2f-4e66-9cbe-6e4aeb130419'),
	(78,41,'de','typo-scale-lead',NULL,1,'2018-03-07 10:49:04','2018-03-07 11:47:08','85729542-7bc2-4bbb-9525-6e077fda49c3'),
	(79,41,'en','typo-scale-lead',NULL,1,'2018-03-07 10:49:04','2018-03-07 11:47:08','05313af7-f27b-4c81-b520-9f7296da7010'),
	(80,42,'de','',NULL,1,'2018-03-07 10:49:04','2018-03-07 11:47:08','cc34fd79-7faa-4a03-916a-7645a295b9e3'),
	(81,42,'en','',NULL,1,'2018-03-07 10:49:04','2018-03-07 11:47:08','6e0978b4-94ce-45da-9df6-0587150733dc'),
	(82,43,'de','typo-scale-small',NULL,1,'2018-03-07 10:49:58','2018-03-07 11:47:15','954b8af2-5cfd-407e-bdcd-697dba900748'),
	(83,43,'en','typo-scale-small',NULL,1,'2018-03-07 10:49:58','2018-03-07 11:47:15','35bad4d3-43f2-4566-aa9c-16116873d33f'),
	(84,44,'de','',NULL,1,'2018-03-07 10:49:58','2018-03-07 11:47:15','0b939afa-5352-4937-b109-3b1aa723f592'),
	(85,44,'en','',NULL,1,'2018-03-07 10:49:58','2018-03-07 11:47:15','2f745c2b-c5c3-4b38-b554-df8a55304d9a'),
	(104,10,'en','',NULL,1,'2018-03-07 11:12:23','2018-04-21 07:29:53','3c7adc4e-5055-4552-a1f0-022f1d24c6c4'),
	(115,59,'de','',NULL,1,'2018-03-07 12:25:19','2018-04-21 07:29:52','01dc4291-d72b-43df-bbfd-8c4f09489e74'),
	(116,59,'en','',NULL,1,'2018-03-07 12:25:19','2018-04-21 07:29:52','baefea8c-bc4e-463f-be18-2f833920da15'),
	(117,60,'de','',NULL,1,'2018-03-07 12:25:19','2018-04-21 07:29:52','b41b769a-f90b-4374-b17d-3d3b9c8aea63'),
	(118,60,'en','',NULL,1,'2018-03-07 12:25:19','2018-04-21 07:29:52','a861ba1a-2af6-4e22-a8b0-c0d507013887'),
	(123,63,'de','reset-margin-top',NULL,1,'2018-03-18 21:45:20','2018-03-18 21:45:21','603335f1-cdcb-47f5-937d-50c26fc25573'),
	(124,63,'en','reset-margin-top',NULL,1,'2018-03-18 21:45:20','2018-03-18 21:45:21','ae6dc7cb-74ef-487a-9d9e-42017b4d4355'),
	(125,64,'de','',NULL,1,'2018-03-18 21:45:20','2018-03-18 21:45:20','e42e55f3-5542-4aa6-bdc6-3107a7960db3'),
	(126,64,'en','',NULL,1,'2018-03-18 21:45:20','2018-03-18 21:45:20','7e7d7f01-66ec-4df6-a6e1-2b4735c37e8f'),
	(127,65,'de','reset-margin-bottom',NULL,1,'2018-03-18 21:45:44','2018-03-18 21:45:45','0265b5c1-0197-492f-9a93-3178bfac0fc7'),
	(128,65,'en','reset-margin-bottom',NULL,1,'2018-03-18 21:45:44','2018-03-18 21:45:45','f27caa1f-4eed-411d-917e-8d8a701bc562'),
	(129,66,'de','',NULL,1,'2018-03-18 21:45:44','2018-03-18 21:45:44','5f36f115-d762-4bf6-be1b-103bc2149772'),
	(130,66,'en','',NULL,1,'2018-03-18 21:45:44','2018-03-18 21:45:44','1fecf473-34a4-4712-a3c3-5971076c8df4'),
	(131,67,'de','reset-margin-side',NULL,1,'2018-03-18 21:46:06','2018-03-18 21:46:07','78bb54bc-1937-4e7d-92cb-b8361c51dfd8'),
	(132,67,'en','reset-margin-side',NULL,1,'2018-03-18 21:46:06','2018-03-18 21:46:07','a32adb9b-bb84-4483-843c-f1b1ab3b2a1c'),
	(133,68,'de','',NULL,1,'2018-03-18 21:46:06','2018-03-18 21:46:06','f8e4175e-a47b-4d5e-a12b-f4881170423c'),
	(134,68,'en','',NULL,1,'2018-03-18 21:46:06','2018-03-18 21:46:06','51a67ac6-0f93-4454-b5ca-053465e2e401'),
	(139,71,'de','reset-margin-bottom-last-child',NULL,1,'2018-03-18 21:47:21','2018-03-19 16:57:09','bdfd737a-65f5-44f6-a910-c190f8897e11'),
	(140,71,'en','reset-margin-bottom-last-child',NULL,1,'2018-03-18 21:47:21','2018-03-19 16:57:09','6f732869-ff26-4c8d-b66b-8e19bbad6174'),
	(141,72,'de','',NULL,1,'2018-03-18 21:47:21','2018-03-19 16:57:09','f771ea9c-6b54-4906-a15a-f401f39d5f0d'),
	(142,72,'en','',NULL,1,'2018-03-18 21:47:21','2018-03-19 16:57:09','aac2e634-0468-42e0-843d-9d5deefc6b46'),
	(143,73,'de','reset-padding-top',NULL,1,'2018-03-18 21:47:51','2018-03-18 21:47:53','5ccd02bc-c4b8-45a1-9d93-780726b746dd'),
	(144,73,'en','reset-padding-top',NULL,1,'2018-03-18 21:47:51','2018-03-18 21:47:53','e8dd922b-7e1b-4493-946d-3405d295dd0f'),
	(145,74,'de','',NULL,1,'2018-03-18 21:47:51','2018-03-18 21:47:51','c0ec3ac4-643a-4ea4-9e60-c6628d3583f3'),
	(146,74,'en','',NULL,1,'2018-03-18 21:47:51','2018-03-18 21:47:51','cab06d14-e969-48b6-a2ee-28e8ebf8ba7e'),
	(147,75,'de','reset-padding-bottom',NULL,1,'2018-03-18 21:48:09','2018-03-18 21:48:11','ee2a61c7-520c-4b71-b8d5-ab0ab02c48db'),
	(148,75,'en','reset-padding-bottom',NULL,1,'2018-03-18 21:48:09','2018-03-18 21:48:11','6fdfe2bb-e156-47d9-94f8-0637c000cb7c'),
	(149,76,'de','',NULL,1,'2018-03-18 21:48:09','2018-03-18 21:48:09','36e4f940-d1f6-4113-a863-09c22c40bd5a'),
	(150,76,'en','',NULL,1,'2018-03-18 21:48:09','2018-03-18 21:48:09','3e855e50-0a85-4175-b477-82db9f764dbf'),
	(151,77,'de','reset-padding-side',NULL,1,'2018-03-18 21:48:26','2018-03-18 21:48:28','a3fa2106-c64b-4aa3-8245-31f961d2cc8b'),
	(152,77,'en','reset-padding-side',NULL,1,'2018-03-18 21:48:26','2018-03-18 21:48:28','9c667860-0cdd-4eb5-ae0f-e49fbc6dc1ef'),
	(153,78,'de','',NULL,1,'2018-03-18 21:48:26','2018-03-18 21:48:26','28991aa6-e6b6-4a12-8d60-ad4fbc727578'),
	(154,78,'en','',NULL,1,'2018-03-18 21:48:26','2018-03-18 21:48:26','bfa76a46-6006-44fe-88ca-2129453f97b6'),
	(157,80,'de','',NULL,1,'2018-03-19 10:02:06','2018-03-19 18:20:17','b754cb18-f016-4daf-a4e3-d14a04f5fef6'),
	(158,80,'en','',NULL,1,'2018-03-19 10:02:06','2018-03-19 18:20:17','9ebe10d1-8402-4311-a855-1baaebb3cc44'),
	(159,81,'de','',NULL,1,'2018-03-19 10:02:06','2018-03-19 18:20:17','1ce24ac7-570a-453f-990b-5e8eef9a6a5f'),
	(160,81,'en','',NULL,1,'2018-03-19 10:02:06','2018-03-19 18:20:17','811bf6f5-490c-4bda-8d67-fa29bfe4e44c'),
	(161,82,'de','',NULL,1,'2018-03-19 10:02:06','2018-03-19 18:20:17','4b43df86-b13e-4aad-a6b2-74d72765fbfb'),
	(162,82,'en','',NULL,1,'2018-03-19 10:02:06','2018-03-19 18:20:17','816ffbd9-8fbf-4fca-b4d9-4b4d35bdbbde'),
	(163,83,'de','',NULL,1,'2018-03-19 10:02:06','2018-03-19 18:20:17','7223b2a9-9975-4142-b0b1-171a56ab857a'),
	(164,83,'en','',NULL,1,'2018-03-19 10:02:06','2018-03-19 18:20:17','95d51d15-fc11-4027-ac7a-eb33707bbf9f'),
	(165,84,'de','',NULL,1,'2018-03-19 10:02:06','2018-03-19 18:20:17','ad442ee5-a60c-4ba3-93a4-86caec05164d'),
	(166,84,'en','',NULL,1,'2018-03-19 10:02:06','2018-03-19 18:20:17','8700ab39-ae42-47f4-a57c-13e2a4095ca8'),
	(167,85,'de','',NULL,1,'2018-03-19 10:02:06','2018-03-19 18:20:17','5701db18-afed-4da7-a37a-9657f29748ec'),
	(168,85,'en','',NULL,1,'2018-03-19 10:02:06','2018-03-19 18:20:17','d03b6b9e-7399-4654-a7c3-dcc5009e09ce'),
	(169,86,'de','',NULL,1,'2018-03-19 10:02:06','2018-03-19 18:20:17','f243ba93-4077-488b-a5d9-c7db243d3a2f'),
	(170,86,'en','',NULL,1,'2018-03-19 10:02:06','2018-03-19 18:20:17','d7f56a6b-7379-441a-ad03-e82f877854bb'),
	(175,89,'de','wrapper-fullwidth',NULL,1,'2018-03-19 10:45:23','2018-03-19 10:45:25','0391868b-3b1f-48d9-a44b-42a02ec62b3e'),
	(176,89,'en','wrapper-fullwidth',NULL,1,'2018-03-19 10:45:23','2018-03-19 10:45:25','e25c0878-92be-46b1-abec-87572ae8b5d2'),
	(177,90,'de','',NULL,1,'2018-03-19 10:45:23','2018-03-19 10:45:23','a1d4dd70-dda7-4b39-951a-e1e0d4fefc8a'),
	(178,90,'en','',NULL,1,'2018-03-19 10:45:23','2018-03-19 10:45:23','88ce07bf-2c47-4567-87c5-96227b797ba6'),
	(179,91,'de','wrapper-fullbleed',NULL,1,'2018-03-19 10:45:38','2018-04-21 00:34:18','94ed3c32-1495-46ce-baf5-769a49b596c2'),
	(180,91,'en','wrapper-fullbleed',NULL,1,'2018-03-19 10:45:38','2018-04-21 00:34:18','8c5494a9-029c-4226-bece-08c388b86600'),
	(181,92,'de','',NULL,1,'2018-03-19 10:45:38','2018-04-21 00:34:18','8418564d-b96b-445a-beb7-ff8d18681ede'),
	(182,92,'en','',NULL,1,'2018-03-19 10:45:38','2018-04-21 00:34:18','43649749-e507-4876-9ec6-b07728b26686'),
	(183,93,'de','wrapper-spacer-vertical-20px',NULL,1,'2018-03-19 11:14:39','2018-03-19 11:14:49','ff3cebc9-f70d-4918-b170-e207f64d554e'),
	(184,93,'en','wrapper-spacer-vertical-20px',NULL,1,'2018-03-19 11:14:39','2018-03-19 11:14:49','c4db0691-da55-4870-8c81-7d471d29d964'),
	(185,94,'de','',NULL,1,'2018-03-19 11:14:39','2018-03-19 11:14:49','2514ba5f-dd68-4b01-ae69-748a18e4ce5b'),
	(186,94,'en','',NULL,1,'2018-03-19 11:14:39','2018-03-19 11:14:49','1ca99317-d1f9-4a4c-9cf2-b7a3c0cb7a6b'),
	(187,95,'de','wrapper-spacer-horizontal-20px',NULL,1,'2018-03-19 11:15:06','2018-03-19 11:15:07','2dc80439-557f-4dfb-bdde-fea64e277af3'),
	(188,95,'en','wrapper-spacer-horizontal-20px',NULL,1,'2018-03-19 11:15:06','2018-03-19 11:15:07','11b016e8-dc4d-43fd-bd17-6d3194ad44b8'),
	(189,96,'de','',NULL,1,'2018-03-19 11:15:06','2018-03-19 11:15:06','708aff51-dcdf-4f28-a812-1ff4f3894cf0'),
	(190,96,'en','',NULL,1,'2018-03-19 11:15:06','2018-03-19 11:15:06','5b6c4fb4-977c-41ce-845a-14d7c66a5962'),
	(191,97,'de','wrapper-flexspacer-vertical-1to3',NULL,1,'2018-03-19 11:16:04','2018-03-19 11:16:14','42b1040b-45d2-410e-9dfd-8a346d3f343e'),
	(192,97,'en','wrapper-flexspacer-vertical-1to3',NULL,1,'2018-03-19 11:16:04','2018-03-19 11:16:14','e300210b-3e11-4f15-9ecf-fe48f301507e'),
	(193,98,'de','',NULL,1,'2018-03-19 11:16:04','2018-03-19 11:16:14','5165a109-29e3-4263-8f51-ce4bd9b9447f'),
	(194,98,'en','',NULL,1,'2018-03-19 11:16:04','2018-03-19 11:16:14','24a55d2a-4f3e-4ff3-9bf4-dacb029080af'),
	(195,99,'de','wrapper-flexspacer-horizontal-1to3',NULL,1,'2018-03-19 11:16:33','2018-03-19 11:16:34','b87b0d79-3dc1-44f2-a796-f464f2955e65'),
	(196,99,'en','wrapper-flexspacer-horizontal-1to3',NULL,1,'2018-03-19 11:16:33','2018-03-19 11:16:34','75baef92-ce5e-4cb9-ab80-abcc3a1495e1'),
	(197,100,'de','',NULL,1,'2018-03-19 11:16:33','2018-03-19 11:16:33','e525c951-7f8c-47f4-b97f-9554c7b9302c'),
	(198,100,'en','',NULL,1,'2018-03-19 11:16:33','2018-03-19 11:16:33','527603fd-e2f1-40a5-aab2-1b03b782c805'),
	(199,101,'de','typo-flexscale-50px-to-80px',NULL,1,'2018-03-19 16:23:37','2018-03-19 16:52:45','341d127c-2f33-4599-a6d0-612ae00e251e'),
	(200,101,'en','typo-flexscale-50px-to-80px',NULL,1,'2018-03-19 16:23:37','2018-03-19 16:52:45','ef50108f-2af5-43ab-b6a7-bbd86c07d74b'),
	(201,102,'de','',NULL,1,'2018-03-19 16:23:37','2018-03-19 16:52:45','440e17d5-89cb-456e-b5e4-ad102b094e79'),
	(202,102,'en','',NULL,1,'2018-03-19 16:23:37','2018-03-19 16:52:45','a7101ae7-3101-4f04-b8e2-4c425726f318'),
	(203,103,'de','',NULL,1,'2018-03-19 16:41:26','2018-03-19 18:20:17','06dce814-1fc1-4155-921d-0c303d90ef2a'),
	(204,103,'en','',NULL,1,'2018-03-19 16:41:26','2018-03-19 18:20:17','45c06c1d-dd89-4532-971f-33e5813ce357'),
	(205,104,'de','',NULL,1,'2018-03-19 16:41:26','2018-03-19 18:20:17','9c1ebdf4-f155-43f0-bcb5-7eef30a6b53c'),
	(206,104,'en','',NULL,1,'2018-03-19 16:41:26','2018-03-19 18:20:17','5a1b44d7-9cee-4a84-8bd0-dfe118ad079e'),
	(207,105,'de','typo-layout-max-chars-50',NULL,1,'2018-03-19 16:48:46','2018-03-19 16:48:48','d193a1ec-492f-4768-bae5-a806a098671e'),
	(208,105,'en','typo-layout-max-chars-50',NULL,1,'2018-03-19 16:48:46','2018-03-19 16:48:48','fce52775-c71b-4683-9f71-d4ef0791fc2e'),
	(209,106,'de','',NULL,1,'2018-03-19 16:48:46','2018-03-19 16:48:46','1a4f3b3d-6a52-4df3-8eea-cc615f5a62bb'),
	(210,106,'en','',NULL,1,'2018-03-19 16:48:46','2018-03-19 16:48:46','a04cb0a7-ec34-4fb1-9940-c4563597df79'),
	(211,107,'de','typo-layout-max-chars-75',NULL,1,'2018-03-19 16:49:24','2018-03-19 16:49:26','e4b774f4-c635-4c6c-acf4-e3b19fd3ed5d'),
	(212,107,'en','typo-layout-max-chars-75',NULL,1,'2018-03-19 16:49:24','2018-03-19 16:49:26','10f41953-4030-4ac9-acde-5d051ed3a3e3'),
	(213,108,'de','',NULL,1,'2018-03-19 16:49:24','2018-03-19 16:49:24','d32dae8d-be3e-4809-9a7a-95923d7824e4'),
	(214,108,'en','',NULL,1,'2018-03-19 16:49:24','2018-03-19 16:49:24','79c21b9d-b1cc-475e-ad57-a2619ed8a636'),
	(215,109,'de','typo-layout-2-css-columns',NULL,1,'2018-03-19 16:50:51','2018-03-19 16:50:53','ddc974d3-e681-49c5-bbb0-33adbcb63711'),
	(216,109,'en','typo-layout-2-css-columns',NULL,1,'2018-03-19 16:50:51','2018-03-19 16:50:53','f88e12b7-0a59-47ff-9797-c3153fa1db66'),
	(217,110,'de','',NULL,1,'2018-03-19 16:50:51','2018-03-19 16:50:51','6b63c36a-1424-46e9-b30b-fdbd3fc140bb'),
	(218,110,'en','',NULL,1,'2018-03-19 16:50:51','2018-03-19 16:50:51','64c2e4fc-6b33-4030-a8d5-172b18ecbc30'),
	(219,111,'de','typo-layout-responsive-3-columns',NULL,1,'2018-03-19 16:51:17','2018-03-19 16:51:18','f5e53c3b-76d6-4a5c-be7f-ce4e163e1939'),
	(220,111,'en','typo-layout-responsive-3-columns',NULL,1,'2018-03-19 16:51:17','2018-03-19 16:51:18','947ddae1-a821-4650-a955-f75aeed69c43'),
	(221,112,'de','',NULL,1,'2018-03-19 16:51:17','2018-03-19 16:51:17','f51ef6f4-a497-4097-b145-e3a0564e7dbb'),
	(222,112,'en','',NULL,1,'2018-03-19 16:51:17','2018-03-19 16:51:17','960255f7-da60-4522-9a1c-24402ae7524b'),
	(223,113,'de','slideoutbox-style-simple-specific',NULL,1,'2018-03-19 16:56:11','2018-03-19 16:56:12','407648e3-1195-4f51-913d-851186c50d3b'),
	(224,113,'en','slideoutbox-style-simple-specific',NULL,1,'2018-03-19 16:56:11','2018-03-19 16:56:12','519a0448-dd16-4e50-ba09-56d6538099c0'),
	(225,114,'de','',NULL,1,'2018-03-19 16:56:11','2018-03-19 16:56:11','486c1592-ffdb-4a59-a927-0df4f61e1d70'),
	(226,114,'en','',NULL,1,'2018-03-19 16:56:11','2018-03-19 16:56:11','d3212986-cb9c-4664-849c-967ad1d1142f'),
	(227,115,'de','',NULL,1,'2018-03-19 17:23:15','2018-03-19 18:20:17','d785cd18-745c-4512-9882-731e529fcd2a'),
	(228,115,'en','',NULL,1,'2018-03-19 17:23:15','2018-03-19 18:20:17','9ab6e352-d578-4e93-8fa5-855af60f524a'),
	(229,116,'de','',NULL,1,'2018-03-19 17:23:15','2018-03-19 18:20:17','40727b04-34b9-4fc3-a293-5725c9666b5d'),
	(230,116,'en','',NULL,1,'2018-03-19 17:23:15','2018-03-19 18:20:17','be6af443-52a0-4def-9fd6-dc5739ba9721'),
	(231,117,'de','',NULL,1,'2018-03-19 17:23:15','2018-03-19 18:20:17','daa2b2b3-e898-4898-aba2-932084fed743'),
	(232,117,'en','',NULL,1,'2018-03-19 17:23:15','2018-03-19 18:20:17','f9d58e17-06d7-4cd7-ad71-317e4cc772fa'),
	(247,125,'de','2to4-grid',NULL,1,'2018-04-21 00:53:00','2018-04-21 10:50:32','a57527b0-09c7-4afa-bfc0-209af5586a4a'),
	(248,125,'en','2to4-grid',NULL,1,'2018-04-21 00:53:00','2018-04-21 10:50:32','10a7e03a-f97f-44be-aab4-2bb3b8f990bf'),
	(249,126,'de','',NULL,1,'2018-04-21 00:53:00','2018-04-21 10:50:32','8ac7487f-1a46-4639-9bb6-a489cc27b78a'),
	(250,126,'en','',NULL,1,'2018-04-21 00:53:00','2018-04-21 10:50:32','7b4f9505-7d50-44c3-b1b8-d164f2db151a'),
	(259,131,'de','2-column-grid-grid',NULL,1,'2018-04-21 10:14:11','2018-04-21 10:51:03','cbaeab6a-b1c9-41eb-a28d-1f1d6f498c99'),
	(260,131,'en','2-column-grid-grid',NULL,1,'2018-04-21 10:14:11','2018-04-21 10:51:03','05a7d970-429f-4378-bb28-eb91077bdd94'),
	(261,132,'de','',NULL,1,'2018-04-21 10:14:11','2018-04-21 10:51:03','a726557e-e273-4067-bf9d-23fe2bcfc1d4'),
	(262,132,'en','',NULL,1,'2018-04-21 10:14:11','2018-04-21 10:51:03','518dba4b-127f-4a5b-9fab-52730e126439'),
	(265,134,'de','',NULL,1,'2018-04-21 10:18:52','2018-04-21 10:47:51','70b7a431-7e64-4ecd-a1bc-42a0e2e13a29'),
	(266,134,'en','',NULL,1,'2018-04-21 10:18:52','2018-04-21 10:47:51','badde3c8-975d-46eb-8c80-dc2397284168'),
	(267,135,'de','',NULL,1,'2018-04-21 10:18:52','2018-04-21 10:47:51','df90f997-48a4-410f-b598-4ab5edc38b13'),
	(268,135,'en','',NULL,1,'2018-04-21 10:18:52','2018-04-21 10:47:51','2b92cbbf-870b-4fce-9666-d64abf07f405'),
	(269,136,'de','',NULL,1,'2018-04-21 10:18:52','2018-04-21 10:47:51','a91b49ab-c5ce-4d22-a23f-745b5a446773'),
	(270,136,'en','',NULL,1,'2018-04-21 10:18:52','2018-04-21 10:47:51','89d7451f-31c0-47cc-9577-2664cab7bb5c'),
	(271,137,'de','',NULL,1,'2018-04-21 10:18:52','2018-04-21 10:47:51','f2b63d56-f6ff-48ec-ab29-bb4e7343b76c'),
	(272,137,'en','',NULL,1,'2018-04-21 10:18:52','2018-04-21 10:47:51','bdfad311-9817-41b0-8773-3f1403f7aff1'),
	(273,138,'de','',NULL,1,'2018-04-21 10:18:52','2018-04-21 10:47:51','d425d100-51be-4ef4-bcf8-eb3f17992b8c'),
	(274,138,'en','',NULL,1,'2018-04-21 10:18:52','2018-04-21 10:47:51','06f66432-6f33-474a-86b2-8910662b6cb0'),
	(275,139,'de','',NULL,1,'2018-04-21 10:18:52','2018-04-21 10:47:51','5b647343-802a-4cef-a1b4-19e925624736'),
	(276,139,'en','',NULL,1,'2018-04-21 10:18:52','2018-04-21 10:47:51','e0c6f844-ee79-43dd-b6d6-2a4051ea9345'),
	(277,140,'de','',NULL,1,'2018-04-21 10:18:52','2018-04-21 10:47:51','d74fcc47-e82b-46c8-b098-346939df0408'),
	(278,140,'en','',NULL,1,'2018-04-21 10:18:52','2018-04-21 10:47:51','e4e58869-c502-43a8-95bf-3d4dc0da0876'),
	(279,141,'de','',NULL,1,'2018-04-21 10:18:52','2018-04-21 10:47:51','85757c5f-85a9-419a-ab08-4a521bc09113'),
	(280,141,'en','',NULL,1,'2018-04-21 10:18:52','2018-04-21 10:47:51','adc6b96c-200a-454e-9223-0ee7b1037752'),
	(281,142,'de','',NULL,1,'2018-04-21 10:18:52','2018-04-21 10:47:51','8efa0f02-70bf-4b1f-b272-f714425fee83'),
	(282,142,'en','',NULL,1,'2018-04-21 10:18:52','2018-04-21 10:47:51','3c30c1bd-6317-42a9-a366-bb6c65b9506a'),
	(283,143,'de','',NULL,1,'2018-04-21 10:18:52','2018-04-21 10:47:51','9c58db9b-8a97-44bc-b33f-4ad8f434fef0'),
	(284,143,'en','',NULL,1,'2018-04-21 10:18:52','2018-04-21 10:47:51','c0ad2d3a-9305-4e4f-8a65-be763f381d3d'),
	(285,144,'de','',NULL,1,'2018-04-21 10:18:52','2018-04-21 10:47:51','32b0d58c-8ad9-46cd-aebc-d036751cb78e'),
	(286,144,'en','',NULL,1,'2018-04-21 10:18:52','2018-04-21 10:47:51','2ae89fe0-b092-4402-a6f5-b2c2f784ef1d'),
	(289,146,'de','3-column-grid-grid',NULL,1,'2018-04-21 10:36:13','2018-04-21 10:51:28','b58841c8-6998-4a16-9cfd-ff4ab2c2f3ac'),
	(290,146,'en','3-column-grid-grid',NULL,1,'2018-04-21 10:36:13','2018-04-21 10:51:28','042ef592-f44d-446a-9de1-56d84d1514ef'),
	(291,147,'de','',NULL,1,'2018-04-21 10:36:13','2018-04-21 10:51:28','0d4d3fbf-a3f5-40b4-877c-48033b5c6973'),
	(292,147,'en','',NULL,1,'2018-04-21 10:36:13','2018-04-21 10:51:28','d8d2936d-779e-4380-a62e-5cede014efc0'),
	(293,148,'de','4-column-grid-grid',NULL,1,'2018-04-21 10:38:08','2018-04-21 10:51:51','0ec1ab7b-8f07-4422-9e09-66b5757cb177'),
	(294,148,'en','4-column-grid-grid',NULL,1,'2018-04-21 10:38:08','2018-04-21 10:51:51','919bc7c0-0f0e-4f75-84ed-f851b6596508'),
	(295,149,'de','',NULL,1,'2018-04-21 10:38:08','2018-04-21 10:51:51','788a79ae-2bb2-443f-9034-7990c5bd2ba7'),
	(296,149,'en','',NULL,1,'2018-04-21 10:38:08','2018-04-21 10:51:51','6c1c6953-9d20-4d83-a5ab-f535b3785762'),
	(297,150,'de','',NULL,1,'2018-04-21 10:44:28','2018-04-21 10:47:51','9623269c-4790-4e0f-9c37-422f7d2f8936'),
	(298,150,'en','',NULL,1,'2018-04-21 10:44:28','2018-04-21 10:47:51','8d2de207-15bf-4ff2-aa81-1c9bb5ebe73c'),
	(299,151,'de','',NULL,1,'2018-04-21 10:44:28','2018-04-21 10:47:51','1eb1c77a-428b-4e6d-9d5f-a44f0beacbb2'),
	(300,151,'en','',NULL,1,'2018-04-21 10:44:28','2018-04-21 10:47:51','c1d2c8bd-1808-490e-90b2-192a48394654'),
	(301,152,'de','',NULL,1,'2018-04-21 10:44:28','2018-04-21 10:47:52','2bd527ff-8049-4409-a2e7-b741d6b960a2'),
	(302,152,'en','',NULL,1,'2018-04-21 10:44:28','2018-04-21 10:47:52','0c15bbf8-141f-4071-9f9c-f176ea56a900'),
	(303,153,'de','',NULL,1,'2018-04-21 10:44:28','2018-04-21 10:47:52','8d5f8d0b-915a-458f-932f-3ecc527e7ca8'),
	(304,153,'en','',NULL,1,'2018-04-21 10:44:28','2018-04-21 10:47:52','8704a559-78d2-475e-9bf8-783e4fc40bdd'),
	(305,154,'de','',NULL,1,'2018-04-21 10:47:52','2018-04-21 10:47:52','9fdb61a0-dab9-4945-b0b6-ebf9edf3342d'),
	(306,154,'en','',NULL,1,'2018-04-21 10:47:52','2018-04-21 10:47:52','a3fc72df-046f-4854-b233-4ada3d93b835'),
	(307,155,'de','',NULL,1,'2018-04-21 10:47:52','2018-04-21 10:47:52','e0bb724c-57c3-4df6-ab37-622770b345bb'),
	(308,155,'en','',NULL,1,'2018-04-21 10:47:52','2018-04-21 10:47:52','ba67cb7c-d33f-4a5a-8bf8-a8c1bf65d552'),
	(309,156,'de','',NULL,1,'2018-04-21 10:47:52','2018-04-21 10:47:52','6ba99c32-2712-4c85-921c-755dc02ceb83'),
	(310,156,'en','',NULL,1,'2018-04-21 10:47:52','2018-04-21 10:47:52','b3150cb7-9f82-46ab-8716-735c0af9d346'),
	(311,157,'de','',NULL,1,'2018-04-21 10:47:52','2018-04-21 10:47:52','9ceec88f-bc5c-4baf-9c77-6cf938c86ea5'),
	(312,157,'en','',NULL,1,'2018-04-21 10:47:52','2018-04-21 10:47:52','38553c6a-d237-4f17-9750-657b93fcdcf6');

/*!40000 ALTER TABLE `craft_elements_i18n` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_emailmessages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_emailmessages`;

CREATE TABLE `craft_emailmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` char(150) COLLATE utf8_unicode_ci NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_emailmessages_key_locale_unq_idx` (`key`,`locale`),
  KEY `craft_emailmessages_locale_fk` (`locale`),
  CONSTRAINT `craft_emailmessages_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_entries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_entries`;

CREATE TABLE `craft_entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `typeId` int(11) DEFAULT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_entries_sectionId_idx` (`sectionId`),
  KEY `craft_entries_typeId_idx` (`typeId`),
  KEY `craft_entries_postDate_idx` (`postDate`),
  KEY `craft_entries_expiryDate_idx` (`expiryDate`),
  KEY `craft_entries_authorId_fk` (`authorId`),
  CONSTRAINT `craft_entries_authorId_fk` FOREIGN KEY (`authorId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entries_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entries_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entries_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `craft_entrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_entries` WRITE;
/*!40000 ALTER TABLE `craft_entries` DISABLE KEYS */;

INSERT INTO `craft_entries` (`id`, `sectionId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(2,1,1,NULL,'2017-07-05 21:34:42',NULL,'2017-07-04 21:45:04','2018-04-21 07:29:53','a32f5949-bfff-425c-86c9-f54c7897194a'),
	(4,3,3,NULL,'2017-07-05 21:33:46',NULL,'2017-07-04 22:00:57','2017-07-05 21:33:46','5dcf217a-74d9-4288-bdbf-dfc12a44beb5'),
	(11,4,4,1,'2017-07-16 14:05:54',NULL,'2017-07-16 14:05:54','2017-07-16 14:05:54','4258708d-2789-49ce-9703-f1f03090fb32');

/*!40000 ALTER TABLE `craft_entries` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_entrydrafts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_entrydrafts`;

CREATE TABLE `craft_entrydrafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` tinytext COLLATE utf8_unicode_ci,
  `data` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_entrydrafts_entryId_locale_idx` (`entryId`,`locale`),
  KEY `craft_entrydrafts_sectionId_fk` (`sectionId`),
  KEY `craft_entrydrafts_creatorId_fk` (`creatorId`),
  KEY `craft_entrydrafts_locale_fk` (`locale`),
  CONSTRAINT `craft_entrydrafts_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entrydrafts_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `craft_entries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entrydrafts_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_entrydrafts_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_entrytypes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_entrytypes`;

CREATE TABLE `craft_entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasTitleField` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `titleLabel` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'Title',
  `titleFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_entrytypes_name_sectionId_unq_idx` (`name`,`sectionId`),
  UNIQUE KEY `craft_entrytypes_handle_sectionId_unq_idx` (`handle`,`sectionId`),
  KEY `craft_entrytypes_sectionId_fk` (`sectionId`),
  KEY `craft_entrytypes_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_entrytypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_entrytypes_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_entrytypes` WRITE;
/*!40000 ALTER TABLE `craft_entrytypes` DISABLE KEYS */;

INSERT INTO `craft_entrytypes` (`id`, `sectionId`, `fieldLayoutId`, `name`, `handle`, `hasTitleField`, `titleLabel`, `titleFormat`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,74,'Homepage','homepage',1,'Title',NULL,1,'2017-07-04 21:45:04','2017-07-04 22:01:04','1a7005ae-e418-40ab-aa9e-322250cf8d9e'),
	(3,3,71,'404','error404',0,NULL,'{section.name|raw}',1,'2017-07-04 22:00:57','2017-07-04 22:01:04','a0f23f77-2806-46e9-a100-66aee2ffb017'),
	(4,4,72,'Blog Channel','blogChannel',1,'Title',NULL,1,'2017-07-04 22:00:57','2017-07-04 22:01:04','8ec15887-70a9-461e-a5f4-8cf8ac2fd2c4'),
	(5,5,73,'Blog Pages','blogPages',1,'Titel',NULL,1,'2017-07-04 22:00:57','2017-07-04 22:01:04','3fedf900-5788-4d98-ac62-8cbaff8b4086'),
	(6,6,94,'Pages','pages',1,'Titel',NULL,1,'2017-07-04 22:00:57','2017-07-05 21:42:35','8d24947b-db81-4306-b38a-ede668f8bc92');

/*!40000 ALTER TABLE `craft_entrytypes` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_entryversions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_entryversions`;

CREATE TABLE `craft_entryversions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `num` smallint(6) unsigned NOT NULL,
  `notes` tinytext COLLATE utf8_unicode_ci,
  `data` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_entryversions_entryId_locale_idx` (`entryId`,`locale`),
  KEY `craft_entryversions_sectionId_fk` (`sectionId`),
  KEY `craft_entryversions_creatorId_fk` (`creatorId`),
  KEY `craft_entryversions_locale_fk` (`locale`),
  CONSTRAINT `craft_entryversions_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_entryversions_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `craft_entries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entryversions_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_entryversions_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_entryversions` WRITE;
/*!40000 ALTER TABLE `craft_entryversions` DISABLE KEYS */;

INSERT INTO `craft_entryversions` (`id`, `entryId`, `sectionId`, `creatorId`, `locale`, `num`, `notes`, `data`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(4,4,3,1,'de',1,NULL,'{\"typeId\":\"3\",\"authorId\":null,\"title\":\"404\",\"slug\":\"404\",\"postDate\":1499205657,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":[]}','2017-07-04 22:00:57','2017-07-04 22:00:57','080283eb-ec61-454d-a304-325202f800b7'),
	(6,11,4,1,'de',1,'','{\"typeId\":null,\"authorId\":\"1\",\"title\":\"Hello World\",\"slug\":\"hello-world\",\"postDate\":1500213954,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"1\":\"<p>This is for SEO, OG and RSS Feed Content<\\/p>\",\"29\":\"\",\"30\":\"\",\"152\":\"\",\"42\":\"\",\"46\":{\"new1\":{\"type\":\"10\",\"fields\":{\"fullbleed\":\"\",\"ratio\":\"\"}}},\"124\":{\"seoMainEntityCategory\":\"CreativeWork\",\"seoMainEntityOfPage\":\"Article\",\"seoTitleSource\":\"field\",\"seoTitleSourceField\":\"title\",\"seoTitleUnparsed\":\"\",\"seoDescriptionSource\":\"field\",\"seoDescriptionSourceField\":\"body\",\"seoDescriptionUnparsed\":\"\",\"seoKeywordsSource\":\"custom\",\"seoKeywordsSourceField\":\"title\",\"seoKeywordsUnparsed\":\"\",\"seoImageIdSource\":\"field\",\"seoImageIdSourceField\":\"featuredImage\",\"seoImageId\":\"\",\"seoImageTransform\":\"\",\"twitterCardType\":\"summary_large_image\",\"seoTwitterImageIdSource\":\"field\",\"seoTwitterImageIdSourceField\":\"featuredImage\",\"seoTwitterImageId\":\"\",\"seoTwitterImageTransform\":\"\",\"openGraphType\":\"article\",\"seoFacebookImageIdSource\":\"field\",\"seoFacebookImageIdSourceField\":\"featuredImage\",\"seoFacebookImageId\":\"\",\"seoFacebookImageTransform\":\"\",\"robots\":\"all\"}}}','2017-07-16 14:05:54','2017-07-16 14:05:54','1aba8b7e-3eb9-437b-afa4-64d5062e18e7'),
	(21,2,1,1,'de',2,'','{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Home\",\"slug\":\"homepage\",\"postDate\":1499290482,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"152\":{\"59\":{\"modified\":\"1\",\"type\":\"objHeadline\",\"enabled\":\"1\",\"collapsed\":\"0\",\"level\":\"0\",\"fields\":{\"objHeadline\":\"Hello World\",\"setHeadline\":{\"60\":{\"type\":\"44\",\"fields\":{\"styleClasses\":\"\",\"addClasses\":\"\",\"semantic\":\"h2\",\"override\":\"default\"}}}}}},\"62\":{\"10\":{\"type\":\"14\",\"fields\":{\"photo\":\"\",\"headline\":\"\",\"linkit\":{\"type\":\"\",\"custom\":\"\",\"entry\":\"\",\"category\":\"\",\"customText\":\"\",\"target\":\"\"}}}},\"124\":{\"seoMainEntityCategory\":\"CreativeWork\",\"seoMainEntityOfPage\":\"Article\",\"seoTitleSource\":\"field\",\"seoTitleSourceField\":\"title\",\"seoTitleUnparsed\":\"Home\",\"seoDescriptionSource\":\"field\",\"seoDescriptionSourceField\":\"title\",\"seoDescriptionUnparsed\":\"Home\",\"seoKeywordsSource\":\"custom\",\"seoKeywordsSourceField\":\"title\",\"seoKeywordsUnparsed\":\"\",\"seoImageIdSource\":\"field\",\"seoImageId\":\"\",\"seoImageTransform\":\"\",\"canonicalUrlOverride\":\"\",\"twitterCardType\":\"summary_large_image\",\"seoTwitterImageIdSource\":\"field\",\"seoTwitterImageId\":\"\",\"seoTwitterImageTransform\":\"\",\"openGraphType\":\"article\",\"seoFacebookImageIdSource\":\"field\",\"seoFacebookImageId\":\"\",\"seoFacebookImageTransform\":\"\",\"robots\":\"all\"}}}','2018-04-21 07:29:53','2018-04-21 07:29:53','99fba083-bbdb-4fef-8a6e-be148c773046');

/*!40000 ALTER TABLE `craft_entryversions` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_fieldgroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_fieldgroups`;

CREATE TABLE `craft_fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_fieldgroups_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_fieldgroups` WRITE;
/*!40000 ALTER TABLE `craft_fieldgroups` DISABLE KEYS */;

INSERT INTO `craft_fieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'Default','2017-07-04 21:45:04','2017-07-04 21:45:04','532e92f3-02b5-4956-b9dd-dc16911e4657'),
	(2,'Objects','2017-07-04 22:00:57','2017-07-04 22:00:57','a0453dfc-cf44-4520-9585-0f733378bd5a'),
	(3,'ObjectsOptions','2017-07-04 22:00:57','2017-07-04 22:00:57','d5bb4820-5a69-4d6f-a8a6-155b363f5e90'),
	(4,'Meta','2017-07-04 22:00:57','2017-07-04 22:00:57','c41b9854-ec13-4a44-920c-070e286c3b96'),
	(5,'Builder','2017-07-04 22:00:57','2017-07-04 22:00:57','5d770c42-f4f4-4348-a3d1-c27d96f3341f'),
	(6,'Globals','2017-07-04 22:00:57','2017-07-04 22:00:57','834a367a-cfe0-4c3c-801a-a25e8dd2fa38');

/*!40000 ALTER TABLE `craft_fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_fieldlayoutfields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_fieldlayoutfields`;

CREATE TABLE `craft_fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_fieldlayoutfields_layoutId_fieldId_unq_idx` (`layoutId`,`fieldId`),
  KEY `craft_fieldlayoutfields_sortOrder_idx` (`sortOrder`),
  KEY `craft_fieldlayoutfields_tabId_fk` (`tabId`),
  KEY `craft_fieldlayoutfields_fieldId_fk` (`fieldId`),
  CONSTRAINT `craft_fieldlayoutfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fieldlayoutfields_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fieldlayoutfields_tabId_fk` FOREIGN KEY (`tabId`) REFERENCES `craft_fieldlayouttabs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `craft_fieldlayoutfields` DISABLE KEYS */;

INSERT INTO `craft_fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(29,22,12,47,0,1,'2017-07-04 22:00:59','2017-07-04 22:00:59','b49c1376-cf82-46f3-bb2b-e9de5ff1242b'),
	(30,22,12,48,0,2,'2017-07-04 22:00:59','2017-07-04 22:00:59','df91d248-40f5-4aba-9d6a-ae087aedb97d'),
	(140,70,77,49,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','81178906-1dd3-4dfe-8de4-2b72dbd1ba3e'),
	(141,71,78,152,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','56dfe7e8-5d2e-4317-a383-b3aa9f2f6a51'),
	(142,71,79,42,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','30c6c4c3-6b33-41a7-9785-feeda0e15e37'),
	(143,71,79,46,0,2,'2017-07-04 22:01:04','2017-07-04 22:01:04','a5606d9b-2f38-4706-8c0f-8af8480e585e'),
	(144,71,79,43,0,3,'2017-07-04 22:01:04','2017-07-04 22:01:04','128f9f04-107d-4dfc-9949-158b1d2d101a'),
	(145,72,80,1,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','a6795423-1509-4a68-80b7-d5e4c21d3891'),
	(146,72,80,152,0,2,'2017-07-04 22:01:04','2017-07-04 22:01:04','1702185e-b6b7-44b7-bc07-9a85aaaa527c'),
	(147,72,81,42,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','372e3ef9-72f2-410d-90d7-4abee81a38fa'),
	(148,72,81,46,0,2,'2017-07-04 22:01:04','2017-07-04 22:01:04','bbb415e0-5f2e-4bdc-86b1-c93132190fda'),
	(149,72,82,29,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','8860da9e-54b7-4d6c-a42b-e79af100f906'),
	(150,72,82,30,0,2,'2017-07-04 22:01:04','2017-07-04 22:01:04','2322e3ea-4358-4d46-898c-1e012adbd149'),
	(151,72,83,124,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','07ccf1c1-6fed-4db3-8b57-5d9315249399'),
	(152,73,84,152,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','422022b0-188b-48ff-a0ed-e7104da62a82'),
	(153,73,85,42,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','bdf6bff1-d658-4c0b-a37c-72d73547aaef'),
	(154,73,85,46,0,2,'2017-07-04 22:01:04','2017-07-04 22:01:04','b265b745-050e-4d25-8a69-b11126fcfb4d'),
	(155,73,85,43,0,3,'2017-07-04 22:01:04','2017-07-04 22:01:04','3b1afbfe-849d-4908-aa77-7eb5046fcc5f'),
	(156,73,86,124,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','4775b60e-ab7e-4730-b9e5-cffb77154846'),
	(157,74,87,152,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','e6ed3bef-4465-4ec5-95b5-7247fac9c007'),
	(158,74,88,62,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','7fda91c2-0f4d-43fb-8237-4a4621c2a66f'),
	(159,74,89,124,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','a604e085-a279-42af-af6a-082a46c32672'),
	(165,76,93,31,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','5402cfb9-4598-40f9-8a7f-dddb5e8a3bbe'),
	(168,78,95,1,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','548fa82f-f87b-42a9-9660-896680bef8f1'),
	(169,78,95,152,0,2,'2017-07-04 22:01:04','2017-07-04 22:01:04','9aae5bea-7909-4296-b9c6-a0872709d2f0'),
	(170,78,96,42,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','78d585dc-5979-4e36-911e-0fbef241d348'),
	(171,78,96,46,0,2,'2017-07-04 22:01:04','2017-07-04 22:01:04','ab77de9d-0460-43db-80c5-45b6ec80cbf7'),
	(172,78,96,43,0,3,'2017-07-04 22:01:04','2017-07-04 22:01:04','4824f480-6463-4920-bfb3-32bf8ccca35e'),
	(173,78,97,124,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','52b2f271-01a0-4901-bfa0-0700cf899fd3'),
	(176,80,99,145,0,1,'2017-07-04 22:15:15','2017-07-04 22:15:15','a3d32833-a034-428e-8387-a10cb9a89c61'),
	(177,80,99,146,0,2,'2017-07-04 22:15:15','2017-07-04 22:15:15','41e7ea62-d467-428f-9fe0-3819f73b6f7f'),
	(178,80,99,147,0,3,'2017-07-04 22:15:15','2017-07-04 22:15:15','b3dad32e-fb34-426e-af9d-72b10de19bcf'),
	(179,81,100,44,0,1,'2017-07-04 22:15:50','2017-07-04 22:15:50','e0d6f6e2-b5f3-46a9-b8a9-b271b790a6b5'),
	(180,81,100,45,0,2,'2017-07-04 22:15:50','2017-07-04 22:15:50','7ebc3c24-4af4-453a-ba1a-38edf44f51fc'),
	(181,82,101,63,0,1,'2017-07-04 22:16:21','2017-07-04 22:16:21','8b07db6a-ea02-4968-8ef7-84baedc7ce77'),
	(182,82,101,64,0,2,'2017-07-04 22:16:21','2017-07-04 22:16:21','90459f4b-98c8-404e-9500-a77d68829a1c'),
	(183,82,101,65,0,3,'2017-07-04 22:16:21','2017-07-04 22:16:21','36376703-e735-4a39-94d7-69426a315e18'),
	(184,83,102,16,0,1,'2017-07-05 19:45:58','2017-07-05 19:45:58','7a8cf315-ccaa-4203-86b3-a05cd5f3c940'),
	(185,83,102,17,0,2,'2017-07-05 19:45:58','2017-07-05 19:45:58','e57f268b-34ed-4511-89b8-a0c584c14fb7'),
	(186,83,102,18,0,3,'2017-07-05 19:45:58','2017-07-05 19:45:58','777fe323-23f8-40c3-94b2-48c3170901bb'),
	(187,83,102,19,0,4,'2017-07-05 19:45:58','2017-07-05 19:45:58','79fe19ea-27d9-40f0-a052-9083fdb2560d'),
	(188,83,102,20,0,5,'2017-07-05 19:45:58','2017-07-05 19:45:58','5c9843f1-b011-4c3b-947d-554ce1ddace5'),
	(189,83,102,21,0,6,'2017-07-05 19:45:58','2017-07-05 19:45:58','499587de-ae10-48c3-a089-bb2ed21d7185'),
	(193,85,104,51,1,1,'2017-07-05 19:47:03','2017-07-05 19:47:03','9293128d-1f7c-4a9a-a08d-523befb0abd6'),
	(194,85,104,52,0,2,'2017-07-05 19:47:03','2017-07-05 19:47:03','7f7c0b29-9e24-405a-bd01-2af270d7bd63'),
	(195,86,105,73,0,1,'2017-07-05 19:48:20','2017-07-05 19:48:20','12c9a754-a7f4-4e53-a677-b703322bfe24'),
	(196,86,105,74,0,2,'2017-07-05 19:48:20','2017-07-05 19:48:20','30100ebc-7538-4b6e-935d-0c6511d241a7'),
	(197,87,106,87,0,1,'2017-07-05 19:49:41','2017-07-05 19:49:41','de8defb5-341f-4082-a004-f1c3ad125cfa'),
	(198,87,106,88,0,2,'2017-07-05 19:49:41','2017-07-05 19:49:41','1ba00fa5-2880-482b-b876-a98e273216ac'),
	(199,88,107,94,0,1,'2017-07-05 19:50:10','2017-07-05 19:50:10','e76e52cf-10bb-41a9-9698-f2d413b4fe20'),
	(200,88,107,95,0,2,'2017-07-05 19:50:10','2017-07-05 19:50:10','70618ba2-7f29-4eae-92fc-f790ea51a08c'),
	(201,89,108,126,0,1,'2017-07-05 19:51:16','2017-07-05 19:51:16','89526e9c-c0a1-4d77-ad1d-adc047df7cf7'),
	(202,89,108,127,0,2,'2017-07-05 19:51:16','2017-07-05 19:51:16','259ded10-e0ef-4e64-920c-ec63ad2c97d8'),
	(215,94,113,152,0,1,'2017-07-05 21:42:35','2017-07-05 21:42:35','e1463f60-88ff-48df-a4d3-05364f07b574'),
	(216,94,114,42,0,1,'2017-07-05 21:42:35','2017-07-05 21:42:35','964e0575-25af-4e48-b82d-e47d6ad64315'),
	(217,94,114,46,0,2,'2017-07-05 21:42:35','2017-07-05 21:42:35','e1ce04db-e095-40a9-b116-8a812b5e6ec7'),
	(218,94,114,43,0,3,'2017-07-05 21:42:35','2017-07-05 21:42:35','1ddf4b04-43f3-49b9-8d0b-d218efa97183'),
	(219,94,115,124,0,1,'2017-07-05 21:42:35','2017-07-05 21:42:35','54d7a372-8749-41a0-a7db-2fd9f6026d84'),
	(220,97,116,154,0,1,'2018-03-07 10:06:03','2018-03-07 10:06:03','c4c27b0c-4cdf-43fa-8e1d-2fb881e9d739'),
	(231,102,121,170,0,1,'2018-03-07 10:06:04','2018-03-07 10:06:04','2b7187c5-a95f-4b3f-994d-f3855da2622e'),
	(232,102,121,171,0,2,'2018-03-07 10:06:04','2018-03-07 10:06:04','a991ad17-774c-4b20-99c9-5f998d014c44'),
	(233,102,121,172,0,3,'2018-03-07 10:06:04','2018-03-07 10:06:04','9124b1da-34bc-4a55-a4ef-749f40c52de6'),
	(266,114,133,219,0,1,'2018-03-07 10:06:06','2018-03-07 10:06:06','3f47f21c-e4bd-48ff-8432-53b528a9621d'),
	(267,115,134,221,0,1,'2018-03-07 10:06:06','2018-03-07 10:06:06','16df88f6-b039-4f23-9a44-11ec49e480a9'),
	(268,115,134,222,0,2,'2018-03-07 10:06:06','2018-03-07 10:06:06','20c63f9b-da40-4644-9c2d-99444226e347'),
	(269,115,134,223,0,3,'2018-03-07 10:06:06','2018-03-07 10:06:06','1a79970e-0053-41ed-8b8f-0ae432de269b'),
	(270,116,135,225,0,1,'2018-03-07 10:06:06','2018-03-07 10:06:06','b9c19579-22a7-49a1-93a2-c3e4156fbb12'),
	(271,116,135,226,0,2,'2018-03-07 10:06:06','2018-03-07 10:06:06','1cdda9cb-a59f-41e7-bc77-29d9b4ffdbbe'),
	(272,116,135,227,0,3,'2018-03-07 10:06:06','2018-03-07 10:06:06','7f4babcb-dca1-4386-bc5d-a4bfc2c32146'),
	(273,117,136,229,0,1,'2018-03-07 10:06:06','2018-03-07 10:06:06','3483911d-d02d-48d6-b412-61128af2bf13'),
	(274,118,137,231,0,1,'2018-03-07 10:06:06','2018-03-07 10:06:06','2311ed16-6d7c-49ca-a745-8e54c9829519'),
	(275,118,137,232,0,2,'2018-03-07 10:06:06','2018-03-07 10:06:06','0a307c10-1f07-4a14-9d1d-784198ea0907'),
	(276,118,137,233,0,3,'2018-03-07 10:06:06','2018-03-07 10:06:06','7155a776-0244-4927-a81e-19448d98d3ad'),
	(277,118,137,234,0,4,'2018-03-07 10:06:06','2018-03-07 10:06:06','c503def6-5141-47ff-9bd7-2b5da37c4555'),
	(278,118,137,235,0,5,'2018-03-07 10:06:06','2018-03-07 10:06:06','0a68041c-fbdb-4f64-a092-b1499eab7004'),
	(279,118,137,236,0,6,'2018-03-07 10:06:06','2018-03-07 10:06:06','5f171424-6ca4-4fd1-93fe-b6f614450278'),
	(280,119,138,238,0,1,'2018-03-07 10:06:06','2018-03-07 10:06:06','adcb7d47-bd31-454f-b53e-d2665f67e7dc'),
	(281,119,138,239,0,2,'2018-03-07 10:06:06','2018-03-07 10:06:06','4dff81e0-1b95-48d1-8502-605c19914950'),
	(282,119,138,240,0,3,'2018-03-07 10:06:06','2018-03-07 10:06:06','c2231e8a-d864-4ad4-b22b-70d0493b5264'),
	(283,119,138,241,0,4,'2018-03-07 10:06:06','2018-03-07 10:06:06','890b7287-e1a2-4929-b49d-0db10d8f23c0'),
	(284,119,138,242,0,5,'2018-03-07 10:06:06','2018-03-07 10:06:06','1c4ee698-14e6-4703-a797-93ffa64c8bb9'),
	(285,119,138,243,0,6,'2018-03-07 10:06:06','2018-03-07 10:06:06','13c83a49-3b88-450f-ac46-75d075081c77'),
	(286,120,139,245,0,1,'2018-03-07 10:06:07','2018-03-07 10:06:07','9a79718f-64c0-45ad-9935-bc68627ce00b'),
	(287,120,139,246,0,2,'2018-03-07 10:06:07','2018-03-07 10:06:07','c1573734-da39-4973-a6e9-2a22147029a1'),
	(343,151,189,184,0,1,'2018-03-07 10:25:49','2018-03-07 10:25:49','6dfdf38c-275c-4bc9-b476-dffe1fd7ea57'),
	(344,154,190,244,0,1,'2018-03-07 10:28:23','2018-03-07 10:28:23','198025fa-b4d0-462f-afa6-0719cf16bbc8'),
	(345,155,191,252,0,1,'2018-03-07 11:22:00','2018-03-07 11:22:00','56bec6dc-7505-453e-bd9f-90ac1ab73ce3'),
	(346,156,192,253,0,1,'2018-03-07 11:22:39','2018-03-07 11:22:39','2f0826c5-be30-4d6a-a430-35d6fa03ebba'),
	(347,157,193,237,0,1,'2018-03-07 12:28:35','2018-03-07 12:28:35','705293ea-90f3-4b3a-a1de-85f07761bbfa'),
	(348,157,193,230,0,2,'2018-03-07 12:28:35','2018-03-07 12:28:35','a377e373-d09e-4e45-9798-82e13bd9aca8'),
	(357,160,196,255,0,1,'2018-03-17 15:01:03','2018-03-17 15:01:03','58cfe730-84d4-4b30-93b4-490217fd8e09'),
	(358,160,196,256,0,2,'2018-03-17 15:01:03','2018-03-17 15:01:03','f521fc6e-2f65-4d30-8e1a-01e6a7a8ee30'),
	(463,216,292,262,0,1,'2018-03-19 17:17:13','2018-03-19 17:17:13','e710e269-5950-4f92-8d95-851d2e53b809'),
	(464,216,292,263,0,2,'2018-03-19 17:17:13','2018-03-19 17:17:13','7e3fbd20-a5aa-400a-8939-e87cda161577'),
	(539,250,347,34,0,1,'2018-03-19 18:25:46','2018-03-19 18:25:46','446e5a94-086e-4f0c-bf5b-29218870c92d'),
	(540,250,347,35,0,2,'2018-03-19 18:25:46','2018-03-19 18:25:46','da825781-ad2d-46b3-87b3-c5b7dd53e848'),
	(541,250,347,36,0,3,'2018-03-19 18:25:46','2018-03-19 18:25:46','cf0bd815-8d32-49ef-ba7f-631ab71f14bd'),
	(593,282,395,272,0,1,'2018-04-21 00:00:29','2018-04-21 00:00:29','bf25716b-6ea9-4187-8060-509c1b700a23'),
	(594,283,396,274,0,1,'2018-04-21 00:03:53','2018-04-21 00:03:53','5b3958a0-1d29-41bd-8aa1-2d04dbc85e17'),
	(595,283,396,275,0,2,'2018-04-21 00:03:53','2018-04-21 00:03:53','a34ad3f3-97da-450d-94f1-f2ba59399bbf'),
	(596,283,396,276,0,3,'2018-04-21 00:03:53','2018-04-21 00:03:53','4ab5af38-809f-4699-924c-20fe63151953'),
	(597,283,396,277,0,4,'2018-04-21 00:03:53','2018-04-21 00:03:53','459093d1-0c75-4eae-bb13-558f4f9974d8'),
	(598,283,396,278,0,5,'2018-04-21 00:03:53','2018-04-21 00:03:53','287ab6d6-4f05-4b49-93c5-5e2dd27a0ae9'),
	(599,284,397,57,0,1,'2018-04-21 00:04:43','2018-04-21 00:04:43','917cef48-7e2b-4a3e-84b1-6654215dba5f'),
	(600,284,398,192,0,1,'2018-04-21 00:04:43','2018-04-21 00:04:43','ec874c8c-efc2-4d93-bdc6-86ff86cae8b8'),
	(601,285,399,98,0,1,'2018-04-21 00:04:43','2018-04-21 00:04:43','f01e72ce-aeba-4503-9477-65ea941c8823'),
	(602,285,400,216,0,1,'2018-04-21 00:04:43','2018-04-21 00:04:43','676adfd7-e2f8-4ec4-9cc8-76f9c83c87c1'),
	(603,286,401,82,0,1,'2018-04-21 00:04:43','2018-04-21 00:04:43','8ff8c89d-2f75-47cb-b86e-da7886d4793b'),
	(604,286,402,207,0,1,'2018-04-21 00:04:43','2018-04-21 00:04:43','70739f13-15f1-4308-a054-e656ae3f3d7c'),
	(605,287,403,78,0,1,'2018-04-21 00:04:43','2018-04-21 00:04:43','93bc88f9-ed66-424d-a1f7-82f5cee02657'),
	(606,287,404,203,0,1,'2018-04-21 00:04:43','2018-04-21 00:04:43','a7eabdc5-c341-4804-9455-f05d9e260c4c'),
	(607,288,405,93,0,1,'2018-04-21 00:04:43','2018-04-21 00:04:43','61d9a199-64ab-4349-a205-099d84527cbf'),
	(608,288,406,214,0,1,'2018-04-21 00:04:43','2018-04-21 00:04:43','330103a6-d442-4805-8d8d-1131544e1102'),
	(609,289,407,86,0,1,'2018-04-21 00:04:43','2018-04-21 00:04:43','36ce7eb0-960d-43b9-b990-1c282aae7a86'),
	(610,289,408,210,0,1,'2018-04-21 00:04:43','2018-04-21 00:04:43','b4f68b21-de63-41c8-9616-8423909d0aa1'),
	(611,290,409,271,0,1,'2018-04-21 00:04:43','2018-04-21 00:04:43','58898c6d-1cf1-4c3b-acc0-11e3615680bd'),
	(612,290,410,273,0,1,'2018-04-21 00:04:43','2018-04-21 00:04:43','1689fc48-e525-4d8a-a609-6d3e2ef34980'),
	(613,291,411,33,0,1,'2018-04-21 00:04:43','2018-04-21 00:04:43','5ab0de81-8ede-4639-9aee-4f163bd35154'),
	(614,291,412,165,0,1,'2018-04-21 00:04:43','2018-04-21 00:04:43','a658cafd-dfe2-4afa-bcf6-87d7eb818d47'),
	(615,292,413,254,0,1,'2018-04-21 00:04:43','2018-04-21 00:04:43','fe7f9d5c-de81-40fd-b7b2-5dfa96b5bafc'),
	(616,292,414,257,0,1,'2018-04-21 00:04:43','2018-04-21 00:04:43','084627f5-0b07-4c54-ac7a-aa5031ce7444'),
	(617,293,415,261,0,1,'2018-04-21 00:04:43','2018-04-21 00:04:43','87b4b533-50be-4b2c-9e0b-93668c75c5b8'),
	(618,293,416,264,0,1,'2018-04-21 00:04:43','2018-04-21 00:04:43','32b843ef-a4c8-4067-b13e-17e7a6f56910'),
	(619,294,417,15,0,1,'2018-04-21 00:04:43','2018-04-21 00:04:43','f42ccebc-dfad-4f7c-bbe8-634c44ae70ed'),
	(620,294,418,159,0,1,'2018-04-21 00:04:43','2018-04-21 00:04:43','f4c5fbe6-0579-419b-adb3-120bda879151'),
	(621,295,419,50,0,1,'2018-04-21 00:04:43','2018-04-21 00:04:43','b4e6f350-275e-4349-bc77-7d17fe7f879e'),
	(622,295,420,169,0,1,'2018-04-21 00:04:43','2018-04-21 00:04:43','099b73a3-676e-4b8c-818f-d713563128cc'),
	(623,296,421,67,0,1,'2018-04-21 00:04:43','2018-04-21 00:04:43','389f77fa-4098-45b5-93f3-a5257df8dbe3'),
	(624,296,422,196,0,1,'2018-04-21 00:04:43','2018-04-21 00:04:43','e42f604d-11a7-479f-b3b2-a2d02535b7d9'),
	(625,297,423,25,0,1,'2018-04-21 00:04:43','2018-04-21 00:04:43','1d8e6c9b-99b7-438e-9a94-43a39f625d2a'),
	(626,297,424,162,0,1,'2018-04-21 00:04:43','2018-04-21 00:04:43','cdea3d64-b125-470e-944d-98e77c8135b5'),
	(627,298,425,9,0,1,'2018-04-21 00:04:43','2018-04-21 00:04:43','20809717-57cd-4197-8ad2-d2e5914e4fe9'),
	(628,298,426,155,0,1,'2018-04-21 00:04:43','2018-04-21 00:04:43','58ba8e32-d97c-4027-a3c7-89500f9baafa'),
	(629,299,427,125,0,1,'2018-04-21 00:04:43','2018-04-21 00:04:43','687d201a-6b4d-4dd9-9edc-61fda42958c5'),
	(630,299,428,228,0,1,'2018-04-21 00:04:43','2018-04-21 00:04:43','ddbf54e1-1766-436c-bca4-da775bf4c457'),
	(631,300,429,72,0,1,'2018-04-21 00:04:43','2018-04-21 00:04:43','e12cad4f-5a26-46e5-87e0-a11014bc8419'),
	(632,300,430,200,0,1,'2018-04-21 00:04:43','2018-04-21 00:04:43','a0ba0532-4662-41e7-8b88-d951976aae4b'),
	(633,301,431,6,0,1,'2018-04-21 00:04:43','2018-04-21 00:04:43','53d37f4c-b617-4134-a065-d14a64b6650a'),
	(634,301,432,153,0,1,'2018-04-21 00:04:43','2018-04-21 00:04:43','d806bdb8-dd1f-4ddd-81ba-337e795b587b'),
	(635,302,433,66,0,1,'2018-04-21 00:04:43','2018-04-21 00:04:43','a1035a64-4732-4fa3-9d39-d2878e614301'),
	(636,303,434,148,0,1,'2018-04-21 00:04:43','2018-04-21 00:04:43','db859be8-a849-44cf-9f5e-484f5a973c9d'),
	(637,304,435,260,0,1,'2018-04-21 00:04:43','2018-04-21 00:04:43','1bdcf014-0b09-4b8c-8dd9-d1624972c552'),
	(638,305,436,191,0,1,'2018-04-21 00:04:43','2018-04-21 00:04:43','419df69d-440c-4cf6-82c3-030ccae70731'),
	(639,305,437,247,0,1,'2018-04-21 00:04:43','2018-04-21 00:04:43','a94ee775-9a13-47f3-8e16-9b0f82319988'),
	(640,305,437,173,0,2,'2018-04-21 00:04:43','2018-04-21 00:04:43','a4197d93-7ee8-47b7-ba68-859595f1f3f4'),
	(641,306,438,180,0,1,'2018-04-21 00:04:43','2018-04-21 00:04:43','a8177de1-f21e-4d2d-ba9c-792853de0663'),
	(642,306,439,181,0,1,'2018-04-21 00:04:43','2018-04-21 00:04:43','ceb326ff-d2fc-43c4-9969-5d22092a0b69'),
	(643,307,440,4,0,1,'2018-04-21 00:04:43','2018-04-21 00:04:43','4d7af1ba-40df-4b46-a479-89f166416799'),
	(644,308,441,3,0,1,'2018-04-21 00:04:43','2018-04-21 00:04:43','6053ce85-8c58-43e3-ab50-f8a4214d9233'),
	(645,309,442,150,0,1,'2018-04-21 00:04:43','2018-04-21 00:04:43','9c1a3172-c04e-4ce1-ab02-21ed9d358a48'),
	(646,310,443,149,0,1,'2018-04-21 00:04:43','2018-04-21 00:04:43','ea4bb9b8-8e6c-49d9-b049-b11a5e07bca5'),
	(647,311,444,156,0,1,'2018-04-21 00:05:42','2018-04-21 00:05:42','b4acddbf-bbcd-4982-b8d6-8ae76277d558'),
	(648,311,444,279,0,2,'2018-04-21 00:05:42','2018-04-21 00:05:42','2e15c5ea-2702-4b4f-936b-354913aad7fc'),
	(649,311,444,157,0,3,'2018-04-21 00:05:42','2018-04-21 00:05:42','da5c0c62-e382-44a5-bff1-580fe6225903'),
	(650,311,444,158,0,4,'2018-04-21 00:05:42','2018-04-21 00:05:42','157fe8a1-6ace-4f36-b423-c181dcccf328'),
	(651,312,445,160,0,1,'2018-04-21 00:06:02','2018-04-21 00:06:02','48eb4689-bf6d-4095-aea1-6defc8b20185'),
	(652,312,445,280,0,2,'2018-04-21 00:06:02','2018-04-21 00:06:02','719505db-aa60-44c7-bec0-87238a662ba0'),
	(653,312,445,161,0,3,'2018-04-21 00:06:02','2018-04-21 00:06:02','9222352e-cddb-4d6a-ba8b-4eb91dc014a7'),
	(654,313,446,163,0,1,'2018-04-21 00:06:22','2018-04-21 00:06:22','baeb1c3a-21ed-48f3-8790-d6dcf41f9e37'),
	(655,313,446,281,0,2,'2018-04-21 00:06:22','2018-04-21 00:06:22','68c654a3-2d10-4ff5-9b1f-d9ba18466bc1'),
	(656,313,446,164,0,3,'2018-04-21 00:06:22','2018-04-21 00:06:22','96fa2c9c-8a0d-4585-bfa4-d63761186bcc'),
	(657,314,447,166,0,1,'2018-04-21 00:07:16','2018-04-21 00:07:16','a455ec55-ab99-442a-9d45-1502acdb553e'),
	(658,314,447,282,0,2,'2018-04-21 00:07:16','2018-04-21 00:07:16','1237aec2-6adc-4cbc-9165-25b49811107d'),
	(659,314,447,167,0,3,'2018-04-21 00:07:16','2018-04-21 00:07:16','862b48c4-51d2-45f2-bfcc-1fd84081ff31'),
	(660,314,447,168,0,4,'2018-04-21 00:07:16','2018-04-21 00:07:16','956ef800-ca73-44c8-833f-5086a2d47c52'),
	(661,315,448,174,0,1,'2018-04-21 00:07:52','2018-04-21 00:07:52','9feaccad-36be-40d9-9891-422cc3617d67'),
	(662,315,448,175,0,2,'2018-04-21 00:07:52','2018-04-21 00:07:52','38225ccb-0711-491a-adba-0de199de47fa'),
	(663,315,448,176,0,3,'2018-04-21 00:07:52','2018-04-21 00:07:52','c7a6604a-8d80-4e69-8664-aba0837d07bc'),
	(664,315,448,177,0,4,'2018-04-21 00:07:52','2018-04-21 00:07:52','435d30d0-fd5d-4006-a1a0-c47b4a712178'),
	(665,315,448,178,0,5,'2018-04-21 00:07:52','2018-04-21 00:07:52','e429c6bf-5f12-4242-ab64-bcde43c4c36c'),
	(666,315,448,179,0,6,'2018-04-21 00:07:52','2018-04-21 00:07:52','50cc2539-dadc-4b03-a9a2-a74e82d67d9f'),
	(667,315,448,283,0,7,'2018-04-21 00:07:52','2018-04-21 00:07:52','afcdf98b-5093-4767-9f05-a81262882206'),
	(668,316,449,182,0,1,'2018-04-21 00:08:14','2018-04-21 00:08:14','1ab5428e-346a-462b-88be-bb647e2a5f63'),
	(669,316,449,183,0,2,'2018-04-21 00:08:14','2018-04-21 00:08:14','06c0409b-c886-41af-b600-17ead7db9d1e'),
	(670,316,449,284,0,3,'2018-04-21 00:08:14','2018-04-21 00:08:14','cff7fdec-2406-4f80-8ad0-f22c824f0b37'),
	(671,317,450,248,0,1,'2018-04-21 00:08:33','2018-04-21 00:08:33','28bb0ac0-4bf8-4fcc-863d-4049e52ffebb'),
	(672,317,450,249,0,2,'2018-04-21 00:08:33','2018-04-21 00:08:33','9c3a57eb-175c-4c45-bf03-96c154e020c5'),
	(673,317,450,285,0,3,'2018-04-21 00:08:33','2018-04-21 00:08:33','fd654516-6019-4597-b7e8-d34b872950c9'),
	(674,317,450,250,0,4,'2018-04-21 00:08:33','2018-04-21 00:08:33','cfa20684-db38-41cf-baf6-55bbabaff049'),
	(675,317,450,251,0,5,'2018-04-21 00:08:33','2018-04-21 00:08:33','98872669-a43c-4b7f-a85c-72cbd08f9094'),
	(683,319,452,193,0,1,'2018-04-21 00:13:15','2018-04-21 00:13:15','1c40cf8b-a6c1-4e74-be66-3efe5de960c0'),
	(684,319,452,287,0,2,'2018-04-21 00:13:15','2018-04-21 00:13:15','ff57ad83-1888-48af-981c-c48a37cb57dc'),
	(685,319,452,194,0,3,'2018-04-21 00:13:15','2018-04-21 00:13:15','9a74ec73-9ea3-4d1e-b62c-1341a4b5d515'),
	(686,319,452,195,0,4,'2018-04-21 00:13:15','2018-04-21 00:13:15','6e35deb1-9c4e-479b-9bf4-be9f4be7f581'),
	(687,320,453,197,0,1,'2018-04-21 00:13:33','2018-04-21 00:13:33','1d1297e3-6ff6-4f4e-8d23-833ab27e0c34'),
	(688,320,453,288,0,2,'2018-04-21 00:13:33','2018-04-21 00:13:33','f5fd275e-70ca-487c-8098-c15d2c5f4c86'),
	(689,320,453,198,0,3,'2018-04-21 00:13:33','2018-04-21 00:13:33','954a9b97-d932-4db5-bf75-a8663e1402c5'),
	(690,320,453,199,0,4,'2018-04-21 00:13:33','2018-04-21 00:13:33','1095bd5d-082f-4153-94c3-8b8e10af8f54'),
	(691,321,454,258,0,1,'2018-04-21 00:13:50','2018-04-21 00:13:50','54d8bd14-dd07-4da9-a31f-3fbf8eae4ec1'),
	(692,321,454,259,0,2,'2018-04-21 00:13:50','2018-04-21 00:13:50','9184072e-a508-4187-ada9-2bc49caad573'),
	(693,321,454,289,0,3,'2018-04-21 00:13:50','2018-04-21 00:13:50','280ed6ef-9007-46f4-b700-f5047be9e9a4'),
	(694,322,455,265,0,1,'2018-04-21 00:14:14','2018-04-21 00:14:14','5335862f-6dcd-4b53-ab21-51e4c015e9fe'),
	(695,322,455,290,0,2,'2018-04-21 00:14:14','2018-04-21 00:14:14','675e277d-10e9-4b95-8596-896524f7b175'),
	(696,322,455,266,0,3,'2018-04-21 00:14:14','2018-04-21 00:14:14','41f89857-7e22-416c-b0fe-edbefce8b4e7'),
	(697,322,455,267,0,4,'2018-04-21 00:14:14','2018-04-21 00:14:14','4f1e8641-1128-4961-96e0-05082697ff48'),
	(698,322,455,268,0,5,'2018-04-21 00:14:14','2018-04-21 00:14:14','f5139d91-156e-4926-be69-d633452491cf'),
	(699,322,455,269,0,6,'2018-04-21 00:14:14','2018-04-21 00:14:14','b37fc386-1b94-4e79-9344-3dcf32116754'),
	(700,323,456,201,0,1,'2018-04-21 00:14:33','2018-04-21 00:14:33','cbef3bb5-0dad-402c-9ee4-a8cf482e3867'),
	(701,323,456,291,0,2,'2018-04-21 00:14:33','2018-04-21 00:14:33','8c8c2757-547b-4fe3-a708-affb73114c63'),
	(702,323,456,202,0,3,'2018-04-21 00:14:33','2018-04-21 00:14:33','fc4e2eb3-580d-476a-8ea1-98751c59bcd5'),
	(703,324,457,204,0,1,'2018-04-21 00:14:52','2018-04-21 00:14:52','2e83ddc6-0389-4a38-9899-12799a1b2c63'),
	(704,324,457,292,0,2,'2018-04-21 00:14:52','2018-04-21 00:14:52','20c58363-3dd2-4ecd-ada3-3b8f668ec948'),
	(705,324,457,205,0,3,'2018-04-21 00:14:52','2018-04-21 00:14:52','15fc8d3d-4c4e-4549-b095-52cb38352dd2'),
	(706,324,457,206,0,4,'2018-04-21 00:14:52','2018-04-21 00:14:52','cd23f626-b3c5-40aa-81c9-4bc8fe894bc2'),
	(707,325,458,208,0,1,'2018-04-21 00:15:07','2018-04-21 00:15:07','6240ac50-2e24-4e3f-8319-99b04255ab53'),
	(708,325,458,293,0,2,'2018-04-21 00:15:07','2018-04-21 00:15:07','b2e546c7-9391-4bf0-ad47-556037bb90f7'),
	(709,325,458,209,0,3,'2018-04-21 00:15:07','2018-04-21 00:15:07','08228306-350c-4f8c-aab7-9764e929088e'),
	(710,326,459,211,0,1,'2018-04-21 00:15:40','2018-04-21 00:15:40','dffb2e8b-daba-40c0-8344-c387cd425975'),
	(711,326,459,294,0,2,'2018-04-21 00:15:40','2018-04-21 00:15:40','aa3819b6-2696-462d-8a06-46f5229e4611'),
	(712,326,459,212,0,3,'2018-04-21 00:15:40','2018-04-21 00:15:40','ffa3ac1d-536f-4de3-85a3-1d51451440dd'),
	(713,326,459,213,0,4,'2018-04-21 00:15:40','2018-04-21 00:15:40','d9ed62e6-97d8-446e-a5a3-7b70a8371fb9'),
	(714,326,459,270,0,5,'2018-04-21 00:15:40','2018-04-21 00:15:40','e6025172-2468-4485-bfa6-03c0a51322e0'),
	(715,327,460,215,0,1,'2018-04-21 00:15:55','2018-04-21 00:15:55','e2b60cc6-6c05-4afe-a48b-17fc36756e17'),
	(716,327,460,295,0,2,'2018-04-21 00:15:55','2018-04-21 00:15:55','31bf6f89-dec0-4ebe-af27-fdebb8b01052'),
	(717,328,461,217,0,1,'2018-04-21 00:16:07','2018-04-21 00:16:07','511f2b9f-5637-4d79-8898-2a1ba81c96e2'),
	(718,328,461,296,0,2,'2018-04-21 00:16:07','2018-04-21 00:16:07','416164e9-dda8-42e4-b374-a290ddbb9d17'),
	(719,329,462,144,0,1,'2018-04-21 00:32:38','2018-04-21 00:32:38','db2ebc05-e5c1-47c5-b917-a46e97604495'),
	(720,330,463,286,0,1,'2018-04-21 00:53:28','2018-04-21 00:53:28','54e142a4-dca3-47c7-a0c2-e2f0d441ab53'),
	(721,330,463,186,0,2,'2018-04-21 00:53:28','2018-04-21 00:53:28','7f8135a1-8746-4504-9b3c-98183531dc99'),
	(722,330,463,188,0,3,'2018-04-21 00:53:28','2018-04-21 00:53:28','a5bb3a2e-4560-4ba4-91ee-6269312b3251'),
	(723,330,463,187,0,4,'2018-04-21 00:53:28','2018-04-21 00:53:28','4d4e06a3-e410-4886-a53b-9d932ae20d9a'),
	(724,330,463,189,0,5,'2018-04-21 00:53:28','2018-04-21 00:53:28','d256ce72-d99e-4eda-a82d-4550ba580051'),
	(725,330,463,190,0,6,'2018-04-21 00:53:28','2018-04-21 00:53:28','9e20a483-22de-4d8b-bff8-89bf9faede11'),
	(726,330,463,185,0,7,'2018-04-21 00:53:28','2018-04-21 00:53:28','6b543397-0a6b-41c5-bdd1-1fe7bad289cc');

/*!40000 ALTER TABLE `craft_fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_fieldlayouts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_fieldlayouts`;

CREATE TABLE `craft_fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_fieldlayouts_type_idx` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_fieldlayouts` WRITE;
/*!40000 ALTER TABLE `craft_fieldlayouts` DISABLE KEYS */;

INSERT INTO `craft_fieldlayouts` (`id`, `type`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'Tag','2017-07-04 21:45:04','2017-07-04 21:45:04','9b2da96c-7ab7-4e86-80c0-8196a6afe6c1'),
	(22,'SuperTable_Block','2017-07-04 22:00:59','2017-07-04 22:00:59','e224a1ac-3f07-4868-86b5-98e893241a62'),
	(70,'Asset','2017-07-04 22:01:04','2017-07-04 22:01:04','0d775a4e-4adf-44bf-bfa3-45886ca4274e'),
	(71,'Entry','2017-07-04 22:01:04','2017-07-04 22:01:04','99e7ec71-bd5d-4680-aaec-b324025837cb'),
	(72,'Entry','2017-07-04 22:01:04','2017-07-04 22:01:04','274b2bac-9df5-4840-9b31-41811995e52c'),
	(73,'Entry','2017-07-04 22:01:04','2017-07-04 22:01:04','cd9eab50-de40-4812-b1fb-28880078d1bc'),
	(74,'Entry','2017-07-04 22:01:04','2017-07-04 22:01:04','be70f1b1-9f1a-408e-b407-3532828f4daa'),
	(76,'GlobalSet','2017-07-04 22:01:04','2017-07-04 22:01:04','852b2c7c-b9ad-4faa-867f-dae67ae11554'),
	(78,'Category','2017-07-04 22:01:04','2017-07-04 22:01:04','6a49b926-0b0e-4879-9dc4-39d03a2a1e23'),
	(80,'SuperTable_Block','2017-07-04 22:15:15','2017-07-04 22:15:15','42a99583-0baf-4109-8572-c42df62f067d'),
	(81,'SuperTable_Block','2017-07-04 22:15:50','2017-07-04 22:15:50','44d18cd4-9862-4e0b-8372-4f6b589f74e7'),
	(82,'SuperTable_Block','2017-07-04 22:16:21','2017-07-04 22:16:21','9e355cb0-7fb9-43d5-8265-a819a35b5652'),
	(83,'SuperTable_Block','2017-07-05 19:45:58','2017-07-05 19:45:58','809bf866-392f-4ee9-b190-23a0ef42f988'),
	(85,'SuperTable_Block','2017-07-05 19:47:03','2017-07-05 19:47:03','7376dd31-4e2d-4751-b50e-dd8afb1dfbd4'),
	(86,'SuperTable_Block','2017-07-05 19:48:20','2017-07-05 19:48:20','dc37a271-9904-4b81-a17a-813087a8907f'),
	(87,'SuperTable_Block','2017-07-05 19:49:41','2017-07-05 19:49:41','ea7ac693-2c30-4dbf-aa54-a1c6d4a6caeb'),
	(88,'SuperTable_Block','2017-07-05 19:50:10','2017-07-05 19:50:10','3f0d9dc8-f14b-46b9-a1c4-0877d235fe5a'),
	(89,'SuperTable_Block','2017-07-05 19:51:16','2017-07-05 19:51:16','b7271d76-638b-4dbc-91cb-6fb2c4e8f6c5'),
	(94,'Entry','2017-07-05 21:42:35','2017-07-05 21:42:35','eb636e4a-9866-46d5-9f71-1f8af1f56607'),
	(97,'SuperTable_Block','2018-03-07 10:06:03','2018-03-07 10:06:03','ba38e546-09a3-47d2-ace1-3bcc6a2ed157'),
	(102,'SuperTable_Block','2018-03-07 10:06:04','2018-03-07 10:06:04','63554b92-6648-4f78-833d-02c3c22517a5'),
	(114,'SuperTable_Block','2018-03-07 10:06:06','2018-03-07 10:06:06','39089800-2e96-4330-8271-3ce449a2d884'),
	(115,'SuperTable_Block','2018-03-07 10:06:06','2018-03-07 10:06:06','77653f2d-4848-438f-b715-be6721656a14'),
	(116,'SuperTable_Block','2018-03-07 10:06:06','2018-03-07 10:06:06','ea2d5b19-5f3c-48fa-85f3-50672e4a154d'),
	(117,'SuperTable_Block','2018-03-07 10:06:06','2018-03-07 10:06:06','e1f01c1b-bd0a-4912-9221-8e1a7df913fc'),
	(118,'SuperTable_Block','2018-03-07 10:06:06','2018-03-07 10:06:06','0933ba40-3c3d-42e3-ae09-2be57acbd9aa'),
	(119,'SuperTable_Block','2018-03-07 10:06:06','2018-03-07 10:06:06','783bcfd6-6d07-4379-95a0-ef2b984d8a04'),
	(120,'SuperTable_Block','2018-03-07 10:06:07','2018-03-07 10:06:07','00e0beea-5a7d-49f6-b9e5-e3bfb3832db6'),
	(151,'Category','2018-03-07 10:25:49','2018-03-07 10:25:49','9730c85d-4524-405a-bceb-a2be0de06d43'),
	(154,'Category','2018-03-07 10:28:23','2018-03-07 10:28:23','84240aa6-39ee-4232-a7f4-4b470a57c078'),
	(155,'SuperTable_Block','2018-03-07 11:22:00','2018-03-07 11:22:00','427726fb-02c8-4152-bbee-82bc814178c2'),
	(156,'SuperTable_Block','2018-03-07 11:22:39','2018-03-07 11:22:39','d70391e5-bbb6-4578-a566-970b59cc341e'),
	(157,'Category','2018-03-07 12:28:35','2018-03-07 12:28:35','7fd97240-cbff-4845-bd5c-5874025e8a5e'),
	(160,'SuperTable_Block','2018-03-17 15:01:03','2018-03-17 15:01:03','568d4e8b-b5ed-4329-b0f9-480edd4b4436'),
	(216,'SuperTable_Block','2018-03-19 17:17:13','2018-03-19 17:17:13','070a7c53-2870-400d-b6c0-d8a70c807f2f'),
	(250,'SuperTable_Block','2018-03-19 18:25:46','2018-03-19 18:25:46','06c2984f-fa53-4e67-b1c4-5a7ffe1893f4'),
	(280,'Asset','2018-04-20 23:56:17','2018-04-20 23:56:17','985f87d0-4e25-4956-ab23-2ff264077d7b'),
	(281,'Asset','2018-04-20 23:56:44','2018-04-20 23:56:44','3d964f32-3745-4556-acde-dd787c2256fa'),
	(282,'SuperTable_Block','2018-04-21 00:00:29','2018-04-21 00:00:29','18c98ba3-91fd-49fe-8f75-207bdb850edd'),
	(283,'SuperTable_Block','2018-04-21 00:03:53','2018-04-21 00:03:53','b9ecb8c7-9ad5-4f31-84d8-fe28c517a766'),
	(284,'Neo_Block','2018-04-21 00:04:43','2018-04-21 00:04:43','7d968d3f-f1a7-4468-a9c0-ba8ecf7fb77c'),
	(285,'Neo_Block','2018-04-21 00:04:43','2018-04-21 00:04:43','d87706ef-05db-4057-a85b-3f13e8f9eaca'),
	(286,'Neo_Block','2018-04-21 00:04:43','2018-04-21 00:04:43','a88c59d5-6dd1-474f-8b50-1bad0a4b953e'),
	(287,'Neo_Block','2018-04-21 00:04:43','2018-04-21 00:04:43','5614ab8d-4a72-48e2-9a8f-d4e30f39e2ee'),
	(288,'Neo_Block','2018-04-21 00:04:43','2018-04-21 00:04:43','fc86db0d-a115-4d2e-8b16-85d8ec02bbc3'),
	(289,'Neo_Block','2018-04-21 00:04:43','2018-04-21 00:04:43','527d428f-731d-436b-8b00-1d51d6395a76'),
	(290,'Neo_Block','2018-04-21 00:04:43','2018-04-21 00:04:43','aee621ea-8601-4794-943d-e576123e4398'),
	(291,'Neo_Block','2018-04-21 00:04:43','2018-04-21 00:04:43','79980a8b-c49a-4c21-8fec-2ddfb8def47a'),
	(292,'Neo_Block','2018-04-21 00:04:43','2018-04-21 00:04:43','aece9d5e-1b12-4635-bd04-468837a15ca3'),
	(293,'Neo_Block','2018-04-21 00:04:43','2018-04-21 00:04:43','78fd5b2a-6b53-4759-b428-ea286c8fd71e'),
	(294,'Neo_Block','2018-04-21 00:04:43','2018-04-21 00:04:43','c37f757a-cd32-402e-ad9a-0374d8b8869c'),
	(295,'Neo_Block','2018-04-21 00:04:43','2018-04-21 00:04:43','60f97ac8-7520-4436-82c3-5accf5518d5e'),
	(296,'Neo_Block','2018-04-21 00:04:43','2018-04-21 00:04:43','103b32d1-58aa-4ae8-be42-06d18b859314'),
	(297,'Neo_Block','2018-04-21 00:04:43','2018-04-21 00:04:43','61a59312-6a46-4e42-ac30-f16f90c129a4'),
	(298,'Neo_Block','2018-04-21 00:04:43','2018-04-21 00:04:43','4aa2c32b-f3b3-4fdb-b952-3c02357da621'),
	(299,'Neo_Block','2018-04-21 00:04:43','2018-04-21 00:04:43','43a7f0da-94e2-4523-962e-26d1241c5e2c'),
	(300,'Neo_Block','2018-04-21 00:04:43','2018-04-21 00:04:43','4d4727f1-15bd-4cfd-bca5-43ed0e183958'),
	(301,'Neo_Block','2018-04-21 00:04:43','2018-04-21 00:04:43','297032ac-709a-4760-9ef7-76b6371ce252'),
	(302,'Neo_Block','2018-04-21 00:04:43','2018-04-21 00:04:43','30a3720b-ee6b-4385-b115-e6e14b884e50'),
	(303,'Neo_Block','2018-04-21 00:04:43','2018-04-21 00:04:43','d6820595-9f44-4a97-b459-55996cca03a4'),
	(304,'Neo_Block','2018-04-21 00:04:43','2018-04-21 00:04:43','70f944a8-bf25-4d23-b051-01f0f32f4128'),
	(305,'Neo_Block','2018-04-21 00:04:43','2018-04-21 00:04:43','a46490bf-7104-47e6-a01c-f71c2ccd1e5e'),
	(306,'Neo_Block','2018-04-21 00:04:43','2018-04-21 00:04:43','9601e250-3389-493d-95a5-3edfe06d93be'),
	(307,'Neo_Block','2018-04-21 00:04:43','2018-04-21 00:04:43','6177f06d-7de0-4aa5-a71a-9f3eccaeb422'),
	(308,'Neo_Block','2018-04-21 00:04:43','2018-04-21 00:04:43','e1b9bf72-29d3-4552-b0e0-60aa9441f991'),
	(309,'Neo_Block','2018-04-21 00:04:43','2018-04-21 00:04:43','44d524e6-0a19-4a51-96a9-699fbb5f4f1f'),
	(310,'Neo_Block','2018-04-21 00:04:43','2018-04-21 00:04:43','0e671764-e5ea-457e-a2b0-13f73f9707d5'),
	(311,'SuperTable_Block','2018-04-21 00:05:42','2018-04-21 00:05:42','4b5c839b-f7da-488f-a713-5c1ea20db9af'),
	(312,'SuperTable_Block','2018-04-21 00:06:02','2018-04-21 00:06:02','9a8afc60-6acf-49a8-9039-449993288528'),
	(313,'SuperTable_Block','2018-04-21 00:06:22','2018-04-21 00:06:22','d82418ca-934f-45e3-942f-b455216e74ae'),
	(314,'SuperTable_Block','2018-04-21 00:07:16','2018-04-21 00:07:16','f16cb87e-f4f0-41ee-9669-cd69da52aa23'),
	(315,'SuperTable_Block','2018-04-21 00:07:52','2018-04-21 00:07:52','8a3bb373-e5b1-49dc-a457-608943ac264a'),
	(316,'SuperTable_Block','2018-04-21 00:08:14','2018-04-21 00:08:14','9104edb3-3fcc-40a1-8823-6bfd6c1887eb'),
	(317,'SuperTable_Block','2018-04-21 00:08:33','2018-04-21 00:08:33','0ff176c1-1eac-49c1-8cac-bfeeabbe383c'),
	(319,'SuperTable_Block','2018-04-21 00:13:15','2018-04-21 00:13:15','03bfc2e8-a744-499a-ae79-cdc2fcc77bc7'),
	(320,'SuperTable_Block','2018-04-21 00:13:33','2018-04-21 00:13:33','5093aa0f-00f3-43d5-89fa-58b10b1110cb'),
	(321,'SuperTable_Block','2018-04-21 00:13:50','2018-04-21 00:13:50','4aae3b08-507f-44bf-90d7-25fa92a28af5'),
	(322,'SuperTable_Block','2018-04-21 00:14:14','2018-04-21 00:14:14','86955828-5e73-47e4-9843-da110a46f370'),
	(323,'SuperTable_Block','2018-04-21 00:14:33','2018-04-21 00:14:33','30621a39-2ff4-4bca-b268-b51dc2dcca8f'),
	(324,'SuperTable_Block','2018-04-21 00:14:52','2018-04-21 00:14:52','bf1c048b-356f-41da-8a84-3a9e3cedd31d'),
	(325,'SuperTable_Block','2018-04-21 00:15:07','2018-04-21 00:15:07','637cc0de-7efd-4222-b5d8-4278dff601c6'),
	(326,'SuperTable_Block','2018-04-21 00:15:40','2018-04-21 00:15:40','f48f52c5-42b6-47fc-83c6-2183de4804d2'),
	(327,'SuperTable_Block','2018-04-21 00:15:55','2018-04-21 00:15:55','ebceb70a-1cfa-4693-959a-5c1c878e94ea'),
	(328,'SuperTable_Block','2018-04-21 00:16:07','2018-04-21 00:16:07','da0ad453-d0c4-4fb0-9458-f49e1f339abf'),
	(329,'GlobalSet','2018-04-21 00:32:38','2018-04-21 00:32:38','3dedd0e2-6e94-4fb3-84e7-02a12fe8bef4'),
	(330,'SuperTable_Block','2018-04-21 00:53:28','2018-04-21 00:53:28','68b68935-7b5c-49c9-8b53-506cd07fa401');

/*!40000 ALTER TABLE `craft_fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_fieldlayouttabs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_fieldlayouttabs`;

CREATE TABLE `craft_fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_fieldlayouttabs_sortOrder_idx` (`sortOrder`),
  KEY `craft_fieldlayouttabs_layoutId_fk` (`layoutId`),
  CONSTRAINT `craft_fieldlayouttabs_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `craft_fieldlayouttabs` DISABLE KEYS */;

INSERT INTO `craft_fieldlayouttabs` (`id`, `layoutId`, `name`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(12,22,'Content',1,'2017-07-04 22:00:59','2017-07-04 22:00:59','d9e99c94-b136-4a15-bb59-e46abf59472e'),
	(77,70,'Inhalt',1,'2017-07-04 22:01:04','2017-07-04 22:01:04','26c15784-3e35-4898-befa-65b8a29bd275'),
	(78,71,'Content',1,'2017-07-04 22:01:04','2017-07-04 22:01:04','90188988-19db-4d64-b458-b1e48dde84c4'),
	(79,71,'Featured Image',2,'2017-07-04 22:01:04','2017-07-04 22:01:04','46deb749-eaf1-4c27-b57b-8e48a1d5cff6'),
	(80,72,'Content',1,'2017-07-04 22:01:04','2017-07-04 22:01:04','9e4c70bb-7158-4801-bae1-9cca847a0b3e'),
	(81,72,'Featured Image',2,'2017-07-04 22:01:04','2017-07-04 22:01:04','d5ad65cd-d553-47a1-9573-6ef8d62f7184'),
	(82,72,'Meta',3,'2017-07-04 22:01:04','2017-07-04 22:01:04','5b98ac55-f6e1-4237-bd91-1f6f88607f7e'),
	(83,72,'Seo',4,'2017-07-04 22:01:04','2017-07-04 22:01:04','ec21a80e-b190-4773-bec7-21e0df5036a9'),
	(84,73,'Content',1,'2017-07-04 22:01:04','2017-07-04 22:01:04','415c815e-5b57-4d2c-a4f4-7e827069923d'),
	(85,73,'Featured Image',2,'2017-07-04 22:01:04','2017-07-04 22:01:04','6d9d3499-0483-45ad-8748-882003ecdcdf'),
	(86,73,'Seo',3,'2017-07-04 22:01:04','2017-07-04 22:01:04','7b3c6c03-9fd1-4650-8365-4d3f3104cd5e'),
	(87,74,'Content',1,'2017-07-04 22:01:04','2017-07-04 22:01:04','8662199f-482f-4a38-8238-b48fbe01c339'),
	(88,74,'Hero',2,'2017-07-04 22:01:04','2017-07-04 22:01:04','ae296b52-d29e-4677-8a2f-016c69c1d4be'),
	(89,74,'Seo',3,'2017-07-04 22:01:04','2017-07-04 22:01:04','cc214741-58e5-476f-95e2-4d6d4ec5f137'),
	(93,76,'Inhalt',1,'2017-07-04 22:01:04','2017-07-04 22:01:04','8cc5dd7b-a8a7-49fc-b4de-0c7e2285a05a'),
	(95,78,'Content',1,'2017-07-04 22:01:04','2017-07-04 22:01:04','2cde8675-1490-4d46-8240-f1de8bba5e02'),
	(96,78,'Featured Image',2,'2017-07-04 22:01:04','2017-07-04 22:01:04','5e0b03d0-cfe4-4bd1-9208-c391741fdec1'),
	(97,78,'Seo',3,'2017-07-04 22:01:04','2017-07-04 22:01:04','c988af3d-fbb9-445a-aa05-7ca3953edb05'),
	(99,80,'Content',1,'2017-07-04 22:15:15','2017-07-04 22:15:15','69490453-b3c5-419e-9ca2-89fc5b068bfe'),
	(100,81,'Content',1,'2017-07-04 22:15:50','2017-07-04 22:15:50','a85735ac-d8c0-452d-b85d-829b156fb366'),
	(101,82,'Content',1,'2017-07-04 22:16:21','2017-07-04 22:16:21','f236d76b-dd3a-49af-88ee-c2562ca551ca'),
	(102,83,'Content',1,'2017-07-05 19:45:58','2017-07-05 19:45:58','f99c4065-90a2-46f2-8aa9-9d63eedc3b51'),
	(104,85,'Content',1,'2017-07-05 19:47:03','2017-07-05 19:47:03','63e5b111-ada3-43bb-910b-e1a9ecf2344e'),
	(105,86,'Content',1,'2017-07-05 19:48:20','2017-07-05 19:48:20','a514e701-ee15-4641-9fd0-967c90c471be'),
	(106,87,'Content',1,'2017-07-05 19:49:41','2017-07-05 19:49:41','b1bf1a5b-2f3a-4e2f-a940-414ad9b07f90'),
	(107,88,'Content',1,'2017-07-05 19:50:10','2017-07-05 19:50:10','e488346b-d736-4ea3-88dd-99595c6cfecc'),
	(108,89,'Content',1,'2017-07-05 19:51:16','2017-07-05 19:51:16','7f09683d-1495-45c0-85c0-f1c67bf7a46b'),
	(113,94,'Content',1,'2017-07-05 21:42:35','2017-07-05 21:42:35','88220292-6744-4502-bb5e-29eebf040613'),
	(114,94,'Featured Image',2,'2017-07-05 21:42:35','2017-07-05 21:42:35','bba1317b-848b-477f-8f99-60bc89068519'),
	(115,94,'Seo',3,'2017-07-05 21:42:35','2017-07-05 21:42:35','081ca77b-3c0d-4caf-aa11-4e8d25afe7ba'),
	(116,97,'Content',1,'2018-03-07 10:06:03','2018-03-07 10:06:03','f553e186-95ff-435e-aebe-97d5f61bfcf9'),
	(121,102,'Content',1,'2018-03-07 10:06:04','2018-03-07 10:06:04','e0dda688-cfe9-4302-97a3-4789eb475756'),
	(133,114,'Content',1,'2018-03-07 10:06:06','2018-03-07 10:06:06','a8302353-807b-46cb-aa1d-5576dadbc711'),
	(134,115,'Content',1,'2018-03-07 10:06:06','2018-03-07 10:06:06','5e4f9678-2a60-41f6-9964-e0c33a029e88'),
	(135,116,'Content',1,'2018-03-07 10:06:06','2018-03-07 10:06:06','2814da14-e85c-493d-a4d1-734215c7b371'),
	(136,117,'Content',1,'2018-03-07 10:06:06','2018-03-07 10:06:06','779e6104-8d70-40e9-8c24-0d5c80bafb07'),
	(137,118,'Content',1,'2018-03-07 10:06:06','2018-03-07 10:06:06','13584f56-3cbc-4987-88a6-41a980ed4529'),
	(138,119,'Content',1,'2018-03-07 10:06:06','2018-03-07 10:06:06','5b08a88f-16e3-40e0-a981-1111fcca4fe8'),
	(139,120,'Content',1,'2018-03-07 10:06:07','2018-03-07 10:06:07','5a408e25-3236-4d42-aedb-f3a0682212ae'),
	(189,151,'Main',1,'2018-03-07 10:25:49','2018-03-07 10:25:49','917ada8f-b4ce-4330-9045-1b5353d16f0c'),
	(190,154,'Tab 1',1,'2018-03-07 10:28:23','2018-03-07 10:28:23','2e4481a0-2c5c-49eb-858b-6fe0c5b33db5'),
	(191,155,'Content',1,'2018-03-07 11:22:00','2018-03-07 11:22:00','6be3df71-2ae8-414d-ac82-149928645934'),
	(192,156,'Content',1,'2018-03-07 11:22:39','2018-03-07 11:22:39','8d60744b-bc63-486b-b9c8-c90ab8afe53f'),
	(193,157,'Setting',1,'2018-03-07 12:28:35','2018-03-07 12:28:35','8e5898d5-9e5e-458f-a167-1b37f9c05db2'),
	(196,160,'Content',1,'2018-03-17 15:01:03','2018-03-17 15:01:03','78cd633d-0376-44f1-901f-1f1751e7f1d3'),
	(292,216,'Content',1,'2018-03-19 17:17:13','2018-03-19 17:17:13','5cf7c631-db11-4c5d-beba-4b79ac67518a'),
	(347,250,'Content',1,'2018-03-19 18:25:46','2018-03-19 18:25:46','3261fd70-89d3-4788-b8ca-f6416b563653'),
	(395,282,'Content',1,'2018-04-21 00:00:29','2018-04-21 00:00:29','2a1f5c3e-9192-4d6e-a0c5-65e57cff4184'),
	(396,283,'Content',1,'2018-04-21 00:03:53','2018-04-21 00:03:53','d838923d-94d7-4ace-b82a-f491aaee003d'),
	(397,284,'Main',1,'2018-04-21 00:04:43','2018-04-21 00:04:43','e4d87534-7662-47ec-b87f-cad8ceea1771'),
	(398,284,'Options',2,'2018-04-21 00:04:43','2018-04-21 00:04:43','bffbee4c-9652-4c69-9bd2-a0394091fca0'),
	(399,285,'Main',1,'2018-04-21 00:04:43','2018-04-21 00:04:43','f102a329-fee0-4415-94a6-ad33e3b3a823'),
	(400,285,'Options',2,'2018-04-21 00:04:43','2018-04-21 00:04:43','7256ff94-effb-418c-b4dd-d34dd9cbdc61'),
	(401,286,'Main',1,'2018-04-21 00:04:43','2018-04-21 00:04:43','f2d0d99f-b609-46f8-966b-3aa96a738b8c'),
	(402,286,'Options',2,'2018-04-21 00:04:43','2018-04-21 00:04:43','1ef624df-2d9b-46f9-a3b2-0d8b41ae2360'),
	(403,287,'Main',1,'2018-04-21 00:04:43','2018-04-21 00:04:43','a71dad8d-1e2e-40f0-b6f1-f25bda45c199'),
	(404,287,'Options',2,'2018-04-21 00:04:43','2018-04-21 00:04:43','9d0fb891-3786-43ec-8b23-5e7097f31710'),
	(405,288,'Main',1,'2018-04-21 00:04:43','2018-04-21 00:04:43','91ed09d7-b0f0-4363-a128-083cbe9b7a5a'),
	(406,288,'Options',2,'2018-04-21 00:04:43','2018-04-21 00:04:43','c0ccc309-f64d-4a56-92cd-4bdbaf05bb0b'),
	(407,289,'Main',1,'2018-04-21 00:04:43','2018-04-21 00:04:43','fea4bf4d-1381-400a-9fa7-9a5a18a27db3'),
	(408,289,'Options',2,'2018-04-21 00:04:43','2018-04-21 00:04:43','2844d770-2bb6-4031-90ec-2e850ec41c6c'),
	(409,290,'Main',1,'2018-04-21 00:04:43','2018-04-21 00:04:43','65e39de8-3f2b-4a24-b6c7-eb79d0141e50'),
	(410,290,'Options',2,'2018-04-21 00:04:43','2018-04-21 00:04:43','c4d8c84f-578a-48ed-b5de-716c31575be8'),
	(411,291,'Main',1,'2018-04-21 00:04:43','2018-04-21 00:04:43','332d3abc-22ed-4b7f-a9d1-b660ea183752'),
	(412,291,'Options',2,'2018-04-21 00:04:43','2018-04-21 00:04:43','03851d35-ae2e-41fd-9e84-ffa63c1afee4'),
	(413,292,'Main',1,'2018-04-21 00:04:43','2018-04-21 00:04:43','e9ab761d-07ad-4f7e-8118-c4aa38cbbc62'),
	(414,292,'Options',2,'2018-04-21 00:04:43','2018-04-21 00:04:43','d4dda868-7f11-4d76-9f62-f0ca3a337db6'),
	(415,293,'Main',1,'2018-04-21 00:04:43','2018-04-21 00:04:43','7ab86fb1-8732-40be-af00-66bbfab6dad3'),
	(416,293,'Options',2,'2018-04-21 00:04:43','2018-04-21 00:04:43','476b8faf-9126-4da3-a1b4-917c83bc6199'),
	(417,294,'Main',1,'2018-04-21 00:04:43','2018-04-21 00:04:43','5ba59f3e-40ba-4272-8d80-032b7abf9548'),
	(418,294,'Options',2,'2018-04-21 00:04:43','2018-04-21 00:04:43','08169e55-6248-40b8-b7ed-2c2bd3edb442'),
	(419,295,'Main',1,'2018-04-21 00:04:43','2018-04-21 00:04:43','e3f99a25-6dc9-4d69-a5c0-e9c7cd92718c'),
	(420,295,'Options',2,'2018-04-21 00:04:43','2018-04-21 00:04:43','23bafb8b-8a56-4c70-88f8-e9312872831b'),
	(421,296,'Main',1,'2018-04-21 00:04:43','2018-04-21 00:04:43','76b31fd0-86d0-4000-9cf1-cd478fbd7b74'),
	(422,296,'Options',2,'2018-04-21 00:04:43','2018-04-21 00:04:43','f4c727a2-4b77-4479-9855-805add7390a0'),
	(423,297,'Main',1,'2018-04-21 00:04:43','2018-04-21 00:04:43','7f8199cd-b651-4759-b7f3-5fc6a044fec8'),
	(424,297,'Options',2,'2018-04-21 00:04:43','2018-04-21 00:04:43','5d21a5d7-52e7-4729-a2c3-e9c9babdea56'),
	(425,298,'Main',1,'2018-04-21 00:04:43','2018-04-21 00:04:43','93aa2a9b-f12b-4b98-aa16-272831540b98'),
	(426,298,'Options',2,'2018-04-21 00:04:43','2018-04-21 00:04:43','a4f848f6-791f-4944-94a6-97fa35912570'),
	(427,299,'Main',1,'2018-04-21 00:04:43','2018-04-21 00:04:43','dd5b9df2-4ed0-4ba2-b8c2-291b11cde02c'),
	(428,299,'Options',2,'2018-04-21 00:04:43','2018-04-21 00:04:43','e097929d-88ad-4853-b819-414ef3abbfd0'),
	(429,300,'Main',1,'2018-04-21 00:04:43','2018-04-21 00:04:43','86f3cd83-ae49-4313-82e3-6260102293ac'),
	(430,300,'Options',2,'2018-04-21 00:04:43','2018-04-21 00:04:43','c88641cb-21ce-472e-a60a-694950fb24a9'),
	(431,301,'Main',1,'2018-04-21 00:04:43','2018-04-21 00:04:43','dbec5e94-51a8-4c4d-ac10-ec8f90a3e849'),
	(432,301,'Options',2,'2018-04-21 00:04:43','2018-04-21 00:04:43','0c7b8f3e-7cba-4117-a4b7-194eb0d82bde'),
	(433,302,'Main',1,'2018-04-21 00:04:43','2018-04-21 00:04:43','126e2da0-2aeb-4002-89f2-a8e15891c851'),
	(434,303,'Main',1,'2018-04-21 00:04:43','2018-04-21 00:04:43','09fa2977-21ce-4b77-84a2-c91c20054d1b'),
	(435,304,'Main',1,'2018-04-21 00:04:43','2018-04-21 00:04:43','3ad76f44-0b19-497a-9302-06fc3227ebda'),
	(436,305,'Main',1,'2018-04-21 00:04:43','2018-04-21 00:04:43','cd61bee6-b8f9-4df3-8429-8c2ad8f94d3b'),
	(437,305,'Options',2,'2018-04-21 00:04:43','2018-04-21 00:04:43','0b44f83f-59db-468f-ae51-1c37db686fe2'),
	(438,306,'Main',1,'2018-04-21 00:04:43','2018-04-21 00:04:43','02364fc3-56a9-4688-baa9-049d7f5cdf2d'),
	(439,306,'Options',2,'2018-04-21 00:04:43','2018-04-21 00:04:43','363d2ac8-86a6-454a-a58a-8cb71edcd113'),
	(440,307,'Main',1,'2018-04-21 00:04:43','2018-04-21 00:04:43','1f297cd3-c652-41a7-bd2b-1f3baaa9cbdb'),
	(441,308,'Main',1,'2018-04-21 00:04:43','2018-04-21 00:04:43','2b66ce00-3c87-4e84-a595-5c6b3213c53a'),
	(442,309,'Main',1,'2018-04-21 00:04:43','2018-04-21 00:04:43','bba41e61-dac7-4bd9-9821-9b1120802c1f'),
	(443,310,'Main',1,'2018-04-21 00:04:43','2018-04-21 00:04:43','18e8faa5-5711-4deb-a06d-708eb5d05005'),
	(444,311,'Content',1,'2018-04-21 00:05:42','2018-04-21 00:05:42','776bbf8c-9ea3-49f0-9536-bc23e28b0b7b'),
	(445,312,'Content',1,'2018-04-21 00:06:02','2018-04-21 00:06:02','395618bf-59e2-4329-88c0-850048936977'),
	(446,313,'Content',1,'2018-04-21 00:06:22','2018-04-21 00:06:22','2cb34f94-8cb4-440e-b71a-608b93bd9f1f'),
	(447,314,'Content',1,'2018-04-21 00:07:16','2018-04-21 00:07:16','61c63722-f348-43d1-94a2-8b7fa85d558e'),
	(448,315,'Content',1,'2018-04-21 00:07:52','2018-04-21 00:07:52','d1822f70-87ae-4431-b1ff-c7f25b2c46eb'),
	(449,316,'Content',1,'2018-04-21 00:08:14','2018-04-21 00:08:14','832e8869-6e2d-4392-84a7-763818fe5733'),
	(450,317,'Content',1,'2018-04-21 00:08:33','2018-04-21 00:08:33','0962a7b6-f584-4e94-9e93-71c1fa6ca891'),
	(452,319,'Content',1,'2018-04-21 00:13:15','2018-04-21 00:13:15','da4599ee-effa-45f7-9027-615f41b98a51'),
	(453,320,'Content',1,'2018-04-21 00:13:33','2018-04-21 00:13:33','8453161e-b1c2-426d-8a5b-8c10724fe1b9'),
	(454,321,'Content',1,'2018-04-21 00:13:50','2018-04-21 00:13:50','05e664ac-3f0c-4ef3-89dd-999e08c3e17b'),
	(455,322,'Content',1,'2018-04-21 00:14:14','2018-04-21 00:14:14','888bca1e-9558-43a3-8771-0c6c73dde83f'),
	(456,323,'Content',1,'2018-04-21 00:14:33','2018-04-21 00:14:33','8589794c-adfb-4db8-8abe-0ffbb959af3d'),
	(457,324,'Content',1,'2018-04-21 00:14:52','2018-04-21 00:14:52','3f8b6a63-f5cc-41d4-a238-cbdb402b26b4'),
	(458,325,'Content',1,'2018-04-21 00:15:07','2018-04-21 00:15:07','c72aace5-25d5-4095-bb82-a59d88ddd102'),
	(459,326,'Content',1,'2018-04-21 00:15:40','2018-04-21 00:15:40','8e9c6133-87e3-4ce0-832e-7a0707162547'),
	(460,327,'Content',1,'2018-04-21 00:15:55','2018-04-21 00:15:55','7511d8f6-76ef-47d3-8afe-2877b17da144'),
	(461,328,'Content',1,'2018-04-21 00:16:07','2018-04-21 00:16:07','31eed823-6307-4b46-827a-35425f3b9ec8'),
	(462,329,'Inhalt',1,'2018-04-21 00:32:38','2018-04-21 00:32:38','71a0cb03-e69f-408c-929d-f3d7a23b9dd4'),
	(463,330,'Content',1,'2018-04-21 00:53:28','2018-04-21 00:53:28','5c483e06-f75e-4d74-9d7b-f41dd4a2ef23');

/*!40000 ALTER TABLE `craft_fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_fields`;

CREATE TABLE `craft_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(58) COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'global',
  `instructions` text COLLATE utf8_unicode_ci,
  `translatable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_fields_handle_context_unq_idx` (`handle`,`context`),
  KEY `craft_fields_context_idx` (`context`),
  KEY `craft_fields_groupId_fk` (`groupId`),
  CONSTRAINT `craft_fields_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_fields` WRITE;
/*!40000 ALTER TABLE `craft_fields` DISABLE KEYS */;

INSERT INTO `craft_fields` (`id`, `groupId`, `name`, `handle`, `context`, `instructions`, `translatable`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'Body','body','global',NULL,1,'RichText','{\"configFile\":\"Standard.json\",\"columnType\":\"text\"}','2017-07-04 21:45:04','2017-07-04 21:45:04','5df92e4c-59b9-4424-8173-5908b66ae8f6'),
	(2,1,'Tags','tags','global','',1,'Tags','{\"source\":\"taggroup:1\",\"targetLocale\":\"\",\"selectionLabel\":\"\"}','2017-07-04 21:45:04','2017-07-04 22:14:21','47146b43-2ca6-4809-99df-b0ab7892918b'),
	(3,2,'Accordion','objAccordion','global','Accordion Block - please specify a title',1,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2017-07-04 22:00:58','2017-07-04 22:18:04','bbb42e3c-caaa-4892-bec6-14db10746f17'),
	(4,2,'Accordion Wrapper','objAccordionWrapper','global','Wrapper of a group of Accordions.',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":\"1\",\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-07-04 22:00:58','2018-03-07 11:22:00','bb9c8859-a791-4ef1-8a39-11e52092a41c'),
	(6,2,'Anchor','objAnchor','global','Anchor name - no special characters and can not start with a number',1,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2017-07-04 22:00:58','2017-07-04 22:18:25','9cbfbff2-20e2-4d3c-9db4-88984f7e427a'),
	(9,2,'Button','objButton','global','Button for linking internal and external content',1,'FruitLinkIt','{\"types\":[\"email\",\"custom\",\"entry\",\"category\",\"asset\"],\"defaultText\":\"Link\",\"allowCustomText\":\"1\",\"allowTarget\":\"1\",\"entrySources\":\"*\",\"entrySelectionLabel\":\"Select an entry\",\"assetSources\":\"*\",\"assetSelectionLabel\":\"Select an asset\",\"categorySources\":\"*\",\"categorySelectionLabel\":\"Select a category\"}','2017-07-04 22:00:58','2017-07-05 19:44:06','615fdd7c-a1c7-435c-9b14-2c2776614b79'),
	(15,2,'Card','objCard','global','Text Box with Media Assets ',0,'SuperTable','{\"columns\":{\"16\":{\"width\":\"\"},\"17\":{\"width\":\"\"},\"18\":{\"width\":\"\"},\"19\":{\"width\":\"\"},\"20\":{\"width\":\"\"},\"21\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-07-04 22:00:58','2017-07-05 19:45:57','8c46621d-b157-427a-a045-ebdf5ed59d36'),
	(16,NULL,'Image','photo','superTableBlockType:4','A picture will be integrated in any case. If a video is used, the picture serves as a fallback.',0,'Assets','{\"useSingleFolder\":\"\",\"sources\":\"*\",\"defaultUploadLocationSource\":\"1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"1\",\"allowedKinds\":[\"image\"],\"targetLocale\":\"\",\"limit\":\"1\",\"viewMode\":\"list\",\"selectionLabel\":\"\"}','2017-07-04 22:00:58','2017-07-05 19:45:57','fe73df1f-b075-4a5f-83ff-63069b809619'),
	(17,NULL,'Headline','headline','superTableBlockType:4','',1,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2017-07-04 22:00:58','2017-07-05 19:45:57','78032f57-af13-411b-8485-ae8650e9289d'),
	(18,NULL,'Subline','subline','superTableBlockType:4','',1,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2017-07-04 22:00:58','2017-07-05 19:45:57','5a9c422f-79df-4265-a100-53f562ef3ad8'),
	(19,NULL,'Meta','meta','superTableBlockType:4','',1,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2017-07-04 22:00:58','2017-07-05 19:45:57','e8acf229-fa65-46e2-a78e-855f149d3a56'),
	(20,NULL,'Body','body','superTableBlockType:4','',1,'RichText','{\"configFile\":\"Reduced.json\",\"availableAssetSources\":\"*\",\"availableTransforms\":\"*\",\"cleanupHtml\":\"1\",\"purifyHtml\":\"1\",\"purifierConfig\":\"\",\"columnType\":\"text\"}','2017-07-04 22:00:58','2017-07-05 19:45:57','910044eb-9bcc-428c-907c-308bbfe41310'),
	(21,NULL,'Link','cardlink','superTableBlockType:4','Optional Card Link',1,'FruitLinkIt','{\"types\":[\"custom\",\"entry\",\"category\",\"asset\"],\"defaultText\":\"\",\"allowCustomText\":\"\",\"allowTarget\":\"\",\"entrySources\":\"*\",\"entrySelectionLabel\":\"Select an entry\",\"assetSources\":\"*\",\"assetSelectionLabel\":\"Select an asset\",\"categorySources\":\"*\",\"categorySelectionLabel\":\"Select a category\"}','2017-07-04 22:00:58','2017-07-05 19:45:57','8fbbff95-4266-4d89-8258-bc0c5319d2a6'),
	(25,2,'Card Slider','objCardSlider','global','A slider module for cards',1,'SuperTable_Label','{\"value\":\"\"}','2017-07-04 22:00:59','2017-07-05 19:46:07','cb6185e0-a7fa-4aa8-b345-9141476f102a'),
	(29,4,'Category Select: Blog','categorySelectBlog','global','',1,'Categories','{\"source\":\"group:1\",\"targetLocale\":\"\",\"limit\":\"1\",\"selectionLabel\":\"\"}','2017-07-04 22:00:59','2017-07-04 22:15:29','2e9a1a7c-e5ca-4541-8cb2-ef8415725299'),
	(30,4,'Comment Switch','commentSwitch','global','To disable comments',0,'Lightswitch','{\"default\":\"\"}','2017-07-04 22:00:59','2017-07-04 22:00:59','f9bccd15-4cd0-467b-9d2d-6ddbd3fd59b7'),
	(31,6,'Copyright','copyright','global','Copyright Message',1,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2017-07-04 22:00:59','2017-07-04 22:14:33','b9953ff9-8323-401d-a80d-284db8eaaa8b'),
	(32,6,'Disqus Name','disqusName','global','Name of your disqus account',1,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2017-07-04 22:00:59','2017-07-04 22:14:43','ba7704f1-1d73-4d4d-8e17-91547a024a24'),
	(33,2,'Embed Content','objEmbedContent','global','To include external content such as videos, code snippets, or maps',0,'SuperTable','{\"columns\":{\"34\":{\"width\":\"\"},\"35\":{\"width\":\"\"},\"36\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":\"1\",\"minRows\":null}','2017-07-04 22:00:59','2018-03-19 18:25:46','2269539e-8895-47f2-9d4c-c927fe3b8965'),
	(34,NULL,'Embed URL','embedUrl','superTableBlockType:7','If it is a video of Youtube, Vimeo or Facebook, you can copy the URL into the field',1,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2017-07-04 22:00:59','2018-03-19 18:25:46','4b4a85dd-6a8b-4510-9e0c-c1246568b9ba'),
	(35,NULL,'Embed Code','embed','superTableBlockType:7','Insert the corresponding IFrame code here. If the URL field is filled, the code is ignored.',1,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"1\"}','2017-07-04 22:00:59','2018-03-19 18:25:46','13f57dde-ca27-4e5d-aff1-d170c20265dd'),
	(36,NULL,'Caption','caption','superTableBlockType:7','Optional asset caption',1,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2017-07-04 22:00:59','2018-03-19 18:25:46','32c71120-eb68-46f3-af26-b8a1c920a345'),
	(42,4,'Featured Image','featuredImage','global','Image of the respective posts - is used for surveys, headers, SEO and OG tags',0,'Assets','{\"useSingleFolder\":\"\",\"sources\":\"*\",\"defaultUploadLocationSource\":\"1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":1,\"allowedKinds\":[\"image\"],\"limit\":1,\"viewMode\":\"large\",\"selectionLabel\":\"Featured Image hinzuf\\u00fcgen\"}','2017-07-04 22:00:59','2017-07-04 22:00:59','575ae61d-b48b-4d3d-902a-9c2cf2e54908'),
	(43,4,'Featured Image Labeling','featuredImageLabeling','global','',0,'SuperTable','{\"columns\":{\"44\":{\"width\":\"\"},\"45\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":\"1\",\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-07-04 22:00:59','2017-07-04 22:15:50','eee56e8e-a3b1-4b10-be7b-eb763e2ee2bd'),
	(44,NULL,'Headline','headline','superTableBlockType:9','',1,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2017-07-04 22:00:59','2017-07-04 22:15:50','36652989-5e2e-4d7e-9655-1e8efa0af7d0'),
	(45,NULL,'Link','linkit','superTableBlockType:9','',1,'FruitLinkIt','{\"types\":[\"tel\",\"custom\",\"entry\",\"category\",\"asset\"],\"defaultText\":\"Link\",\"allowCustomText\":\"1\",\"allowTarget\":\"1\",\"entrySources\":\"*\",\"entrySelectionLabel\":\"Select an entry\",\"assetSources\":\"*\",\"assetSelectionLabel\":\"Select an asset\",\"categorySources\":\"*\",\"categorySelectionLabel\":\"Select a category\"}','2017-07-04 22:00:59','2017-07-04 22:15:50','139e8fdb-f8d2-4359-b874-bf9278729b0d'),
	(46,4,'Featured Image Options','featuredImageOptions','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-07-04 22:00:59','2017-07-04 22:00:59','096940b8-592a-4491-8bc4-31ab4b4b7ca2'),
	(47,NULL,'Fullbleed','fullbleed','superTableBlockType:10','Should the image be spread over the entire browser width?',0,'Lightswitch','{\"default\":\"\"}','2017-07-04 22:00:59','2017-07-04 22:00:59','6ee98edb-3756-4291-a8f4-3fcaae501297'),
	(48,NULL,'Ratio','ratio','superTableBlockType:10','Image Ratio',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-07-04 22:00:59','2017-07-04 22:00:59','19685c7a-7c1a-4d4a-92c6-ec83a9f7f887'),
	(49,6,'Fokuspunkt','focalpoint','global','',0,'FocalPointField_FocalPoint','{\"defaultFocalPoint\":\"50% 50%\"}','2017-07-04 22:00:59','2017-07-04 22:00:59','c71224f8-be47-497a-80c2-9836fe710772'),
	(50,2,'Gallery','objGallery','global','Gallery module with Lightbox Support and two layout types',0,'SuperTable','{\"columns\":{\"51\":{\"width\":\"\"},\"52\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":null,\"selectionLabel\":\"Add a picture\",\"maxRows\":\"30\",\"minRows\":null}','2017-07-04 22:01:00','2017-07-05 19:47:03','2dbebb52-37d9-45ae-909f-8f53bd3e8c31'),
	(51,NULL,'Image','photo','superTableBlockType:11','',0,'Assets','{\"useSingleFolder\":\"\",\"sources\":\"*\",\"defaultUploadLocationSource\":\"1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"1\",\"allowedKinds\":[\"image\"],\"targetLocale\":\"\",\"limit\":\"1\",\"viewMode\":\"large\",\"selectionLabel\":\"\"}','2017-07-04 22:01:00','2017-07-05 19:47:03','7ec62500-cb7b-41bd-9694-8f370812f8b7'),
	(52,NULL,'Caption','caption','superTableBlockType:11','Optional caption is only visible in the lightbox.',1,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2017-07-04 22:01:00','2017-07-05 19:47:03','e0bef4ae-47b1-4c19-bf4f-ea03e2aff0b8'),
	(57,2,'Headline','objHeadline','global','',1,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2017-07-04 22:01:00','2017-07-05 19:47:15','d5715b37-88b1-406a-8c7f-25b9694b5d98'),
	(62,4,'Hero','hero','global','Hero Image for Homepages',0,'SuperTable','{\"columns\":{\"63\":{\"width\":\"\"},\"64\":{\"width\":\"\"},\"65\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-07-04 22:01:00','2017-07-04 22:16:21','df9bd73a-75a8-4658-9d2c-19bbd7a790fe'),
	(63,NULL,'Image','photo','superTableBlockType:14','',0,'Assets','{\"useSingleFolder\":\"\",\"sources\":\"*\",\"defaultUploadLocationSource\":\"1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"1\",\"allowedKinds\":[\"image\"],\"targetLocale\":\"\",\"limit\":\"1\",\"viewMode\":\"large\",\"selectionLabel\":\"\"}','2017-07-04 22:01:00','2017-07-04 22:16:21','8e323f9d-90ca-4ba3-888d-5108e27604d6'),
	(64,NULL,'Headline','headline','superTableBlockType:14','',1,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2017-07-04 22:01:00','2017-07-04 22:16:21','96327346-3e50-4b73-b865-3235d818eef5'),
	(65,NULL,'Linkit','linkit','superTableBlockType:14','',1,'FruitLinkIt','{\"types\":[\"custom\",\"entry\",\"category\"],\"defaultText\":\"Link\",\"allowCustomText\":\"1\",\"allowTarget\":\"1\",\"entrySources\":\"*\",\"entrySelectionLabel\":\"Select an entry\",\"assetSources\":\"*\",\"assetSelectionLabel\":\"Select an asset\",\"categorySources\":\"*\",\"categorySelectionLabel\":\"Select a category\"}','2017-07-04 22:01:00','2017-07-04 22:16:21','fb366d13-d8b6-4673-b7fd-cd45b2169281'),
	(66,2,'Horizontal Ruler','objHorizontalRuler','global','',0,'Categories','{\"source\":\"group:4\",\"targetLocale\":\"\",\"limit\":\"\",\"selectionLabel\":\"Use Style\"}','2017-07-04 22:01:00','2018-03-07 11:36:31','25eab62e-9168-4fd0-9a8b-40574b0af85d'),
	(67,2,'Image Slider','objImageSlider','global','Slider Modul',1,'Assets','{\"useSingleFolder\":\"\",\"sources\":\"*\",\"defaultUploadLocationSource\":\"1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"1\",\"allowedKinds\":[\"image\"],\"targetLocale\":\"\",\"limit\":\"10\",\"viewMode\":\"large\",\"selectionLabel\":\"\"}','2017-07-04 22:01:00','2017-07-05 19:48:00','f8ef43fd-e5b7-4359-9e23-d13e8f107839'),
	(72,2,'Jumpnavigation','objJumpNavigation','global','Buttons for jump navigations',0,'SuperTable','{\"columns\":{\"73\":{\"width\":\"\"},\"74\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":null,\"selectionLabel\":\"Add a link\",\"maxRows\":null,\"minRows\":null}','2017-07-04 22:01:00','2017-07-05 19:48:20','955b4998-e5bc-4d79-828f-c34482693966'),
	(73,NULL,'Linkname','linkname','superTableBlockType:16','Name of the link',1,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2017-07-04 22:01:00','2017-07-05 19:48:20','4d70e179-d6d0-47e6-b733-6e37ee20d282'),
	(74,NULL,'Anchor','anchor','superTableBlockType:16','Name of the anchor without # (and no other no special character)',1,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2017-07-04 22:01:00','2017-07-05 19:48:20','10004309-9657-41f3-8b96-e08d5652bbae'),
	(78,2,'List','objList','global','',1,'Table','{\"columns\":{\"col1\":{\"heading\":\"Eintrag\",\"handle\":\"entry\",\"width\":\"\",\"type\":\"singleline\"}},\"defaults\":[]}','2017-07-04 22:01:01','2017-07-05 19:48:32','5d0f8be1-3f54-4438-bd5f-2f19bf47b676'),
	(82,2,'Markdown','objMarkdown','global','For contents in the Markdown format (http://markdown.de/)',1,'Doxter','{\"enableSoftTabs\":\"1\",\"tabSize\":\"2\",\"rows\":\"4\",\"toolbarPlacement\":\"bottom\"}','2017-07-04 22:01:01','2017-07-05 19:48:54','9f6f13d9-3526-4b6c-b147-e00028d5ff2d'),
	(86,2,'Media Image','objMediaImage','global','This image takes the full content width and can be provided with a caption.',0,'SuperTable','{\"columns\":{\"87\":{\"width\":\"\"},\"88\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":\"1\",\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-07-04 22:01:01','2017-07-05 19:49:41','fe422a80-97a5-4c23-be7c-4d234b831353'),
	(87,NULL,'Image','photo','superTableBlockType:20','',0,'Assets','{\"useSingleFolder\":\"\",\"sources\":\"*\",\"defaultUploadLocationSource\":\"1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"1\",\"allowedKinds\":[\"image\"],\"targetLocale\":\"\",\"limit\":\"1\",\"viewMode\":\"large\",\"selectionLabel\":\"\"}','2017-07-04 22:01:01','2017-07-05 19:49:41','e1642a29-bb20-4e08-a062-db3596cc59cb'),
	(88,NULL,'Caption','caption','superTableBlockType:20','',1,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2017-07-04 22:01:01','2017-07-05 19:49:41','5a255c5f-02de-465b-b12c-b9b1496cba14'),
	(93,2,'Quote','objQuote','global','For quote blocks with Author',0,'SuperTable','{\"columns\":{\"94\":{\"width\":\"\"},\"95\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":\"1\",\"minRows\":null}','2017-07-04 22:01:01','2017-07-05 19:50:10','1e12e003-4cc9-4465-83af-43731f04fa1b'),
	(94,NULL,'Quote','copy','superTableBlockType:22','',1,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"1\",\"initialRows\":\"2\"}','2017-07-04 22:01:01','2017-07-05 19:50:10','dbc2e0df-6b95-4d75-a6e4-3063a778998d'),
	(95,NULL,'Source','source','superTableBlockType:22','',1,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2017-07-04 22:01:01','2017-07-05 19:50:10','766e9a15-5f02-4b47-87ec-81c44c4d8242'),
	(98,2,'Richtext','objRichtext','global','',1,'RichText','{\"configFile\":\"Standard.json\",\"availableAssetSources\":\"*\",\"availableTransforms\":\"*\",\"cleanupHtml\":\"1\",\"purifyHtml\":\"1\",\"purifierConfig\":\"\",\"columnType\":\"text\"}','2017-07-04 22:01:02','2017-07-05 19:50:23','9de9ab1e-82cf-475b-b827-d379cce24cc8'),
	(109,2,'Section Column','objSectionColumn','global','Column in a section',0,'SuperTable_Label','{\"value\":\"\"}','2017-07-04 22:01:02','2017-07-04 22:01:02','754df9af-4f8c-4625-9a1d-cbbc38c7080b'),
	(123,2,'Section Wrapper','objSection','global','Subsegment of a content module, when the page wrapper is removed the section can run over the full browser width.',0,'SuperTable_Label','{\"value\":\"\"}','2017-07-04 22:01:02','2017-07-04 22:01:02','70d3f103-37ba-484a-8595-769c9cef30a4'),
	(124,4,'SEO','seo','global','',1,'Seomatic_Meta','{\"assetSources\":\"*\",\"seoMainEntityCategory\":\"CreativeWork\",\"seoMainEntityOfPage\":\"Article\",\"seoTitleSource\":\"field\",\"seoTitleSourceField\":\"title\",\"seoTitle\":\"\",\"seoTitleSourceChangeable\":\"1\",\"seoDescriptionSource\":\"field\",\"seoDescriptionSourceField\":\"body\",\"seoDescription\":\"\",\"seoDescriptionSourceChangeable\":\"1\",\"seoKeywordsSource\":\"custom\",\"seoKeywordsSourceField\":\"title\",\"seoKeywords\":\"\",\"seoKeywordsSourceChangeable\":\"1\",\"seoImageIdSource\":\"field\",\"seoImageIdSourceField\":\"featuredImage\",\"seoImageIdSourceChangeable\":\"1\",\"seoImageTransform\":\"\",\"twitterCardType\":\"summary_large_image\",\"twitterCardTypeChangeable\":\"1\",\"seoTwitterImageIdSource\":\"field\",\"seoTwitterImageIdSourceField\":\"featuredImage\",\"seoTwitterImageIdSourceChangeable\":\"1\",\"seoTwitterImageTransform\":\"\",\"openGraphType\":\"article\",\"openGraphTypeChangeable\":\"1\",\"seoFacebookImageIdSource\":\"field\",\"seoFacebookImageIdSourceField\":\"featuredImage\",\"seoFacebookImageIdSourceChangeable\":\"1\",\"seoFacebookImageTransform\":\"\",\"robots\":\"all\",\"robotsChangeable\":\"1\"}','2017-07-04 22:01:03','2017-07-04 22:16:37','8140b5df-b85c-4e96-ae65-9b501356b848'),
	(125,2,'Slideout Box','objSlideOutBox','global','A content box that expands by click - intended to hide the user rather irrelevant content.',0,'SuperTable','{\"columns\":{\"126\":{\"width\":\"\"},\"127\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-07-04 22:01:03','2017-07-05 19:51:16','07b6b53f-6fce-4127-9ffb-98bf81fabc9c'),
	(126,NULL,'Trigger','trigger','superTableBlockType:29','Activation link to open the box',1,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2017-07-04 22:01:03','2017-07-05 19:51:16','ad154e39-da3a-4f5d-a4dd-931f3373b907'),
	(127,NULL,'Body','body','superTableBlockType:29','',1,'RichText','{\"configFile\":\"\",\"availableAssetSources\":\"*\",\"availableTransforms\":\"*\",\"cleanupHtml\":\"\",\"purifyHtml\":\"1\",\"purifierConfig\":\"\",\"columnType\":\"text\"}','2017-07-04 22:01:03','2017-07-05 19:51:16','e789c340-4efc-418f-8187-99559e44019c'),
	(144,6,'Social Networks','socialNetworks','global','Links to the social networks',0,'SuperTable','{\"columns\":{\"145\":{\"width\":\"\"},\"146\":{\"width\":\"\"},\"147\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":null,\"selectionLabel\":\"Add Network\",\"maxRows\":null,\"minRows\":null}','2017-07-04 22:01:03','2017-07-04 22:15:14','14aef1f3-0b25-45ac-8c5d-a31d87e291de'),
	(145,NULL,'Icon','icon','superTableBlockType:33','Networktype',0,'Dropdown','{\"options\":[{\"label\":\"Facebook\",\"value\":\"facebook\",\"default\":\"\"},{\"label\":\"Twitter\",\"value\":\"twitter\",\"default\":\"\"},{\"label\":\"Googleplus\",\"value\":\"googleplus\",\"default\":\"\"},{\"label\":\"Pinterest\",\"value\":\"pinterest\",\"default\":\"\"},{\"label\":\"Instagram\",\"value\":\"instagram\",\"default\":\"\"},{\"label\":\"Vimeo\",\"value\":\"vimeo\",\"default\":\"\"},{\"label\":\"Youtube\",\"value\":\"youtube\",\"default\":\"\"}]}','2017-07-04 22:01:03','2017-07-04 22:15:15','7b06c10a-a312-4783-98e9-d0b5ee8eb473'),
	(146,NULL,'Link','linkit','superTableBlockType:33','',1,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2017-07-04 22:01:03','2017-07-04 22:15:15','e2501c7a-2c39-4361-a9d7-2ebd19c782a8'),
	(147,NULL,'Caption','caption','superTableBlockType:33','Caption of the popover',1,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2017-07-04 22:01:03','2017-07-04 22:15:15','9c1b3d35-2ae6-42fc-9137-6f3db749190f'),
	(148,2,'Spacer','objSpacer','global','Element to expand the distance. A spacer is 20px',0,'Dropdown','{\"options\":[{\"label\":\"0.25 Spacer\",\"value\":\"--025\",\"default\":\"\"},{\"label\":\"0.50 Spacer\",\"value\":\"--050\",\"default\":1},{\"label\":\"0.75 Spacer\",\"value\":\"--075\",\"default\":\"\"},{\"label\":\"1 Spacer\",\"value\":\"--1\",\"default\":\"\"},{\"label\":\"2 Spacer\",\"value\":\"--2\",\"default\":\"\"},{\"label\":\"3 Spacer\",\"value\":\"--3\",\"default\":\"\"},{\"label\":\"4 Spacer\",\"value\":\"--4\",\"default\":\"\"},{\"label\":\"5 Spacer\",\"value\":\"--5\",\"default\":\"\"},{\"label\":\"6 Spacer\",\"value\":\"--6\",\"default\":\"\"},{\"label\":\"7 Spacer\",\"value\":\"--7\",\"default\":\"\"},{\"label\":\"8 Spacer\",\"value\":\"--8\",\"default\":\"\"},{\"label\":\"9 Spacer\",\"value\":\"--9\",\"default\":\"\"},{\"label\":\"10 Spacer\",\"value\":\"--10\",\"default\":\"\"}]}','2017-07-04 22:01:04','2017-07-04 22:01:04','ae6bca75-ac1a-43bc-a940-7f11b80ebaae'),
	(149,2,'Tab','objTab','global','The individual tab, please enter the title of the tab',1,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2017-07-04 22:01:04','2017-07-05 19:51:34','441a062b-7717-419a-9665-d9cc3c180b91'),
	(150,2,'Tab Wrapper','objTabWrapper','global','Wrapper of the Tab group',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":\"1\",\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-07-04 22:01:04','2018-03-07 11:22:39','dbb35d0d-a08f-4da8-988d-c8623152a650'),
	(152,5,'Content Builder','contentBuilder','global','',0,'Neo','{\"maxBlocks\":null}','2017-07-04 22:01:04','2018-04-21 00:04:43','376e2ccb-c620-4eb6-bed2-bfd8726dd46d'),
	(153,3,'Anchor Options','setAnchor','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2018-03-07 10:06:03','2018-03-07 10:06:03','c98071c5-0046-4d37-9f3e-b4be09c3c29e'),
	(154,NULL,'Positionsfix','positionfix','superTableBlockType:35','If the anchor is too high or too low, the position value can be adjusted (higher or lower).',0,'PlainText','{\"placeholder\":\"-10px\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2018-03-07 10:06:03','2018-03-07 10:06:03','065ab94a-a2d4-4aca-a6d0-1a141af90e5f'),
	(155,3,'Button Options','setButton','global','',0,'SuperTable','{\"columns\":{\"156\":{\"width\":\"\"},\"new1\":{\"width\":\"\"},\"157\":{\"width\":\"\"},\"158\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2018-03-07 10:06:03','2018-04-21 00:05:42','5370d9f0-abbd-43af-a228-a9bd5035fc0f'),
	(156,NULL,'Styling','styleClasses','superTableBlockType:36','',0,'Categories','{\"source\":\"group:4\",\"targetLocale\":\"\",\"limit\":\"\",\"selectionLabel\":\"Use Style\"}','2018-03-07 10:06:03','2018-04-21 00:05:42','19368c54-6fd2-4722-8099-5842e02c03ce'),
	(157,NULL,'Full Width','fullwidth','superTableBlockType:36','If the button centered has been created, you can also give it the full width.',0,'Lightswitch','{\"default\":\"\"}','2018-03-07 10:06:03','2018-04-21 00:05:42','ebe1c412-09f6-4cc8-8d94-2b78363a96d6'),
	(158,NULL,'Position','position','superTableBlockType:36','The buttons are arranged left-aligned, can be overwritten.',0,'Dropdown','{\"options\":[{\"label\":\"Left\",\"value\":\"left\",\"default\":\"1\"},{\"label\":\"Center\",\"value\":\"center\",\"default\":\"\"},{\"label\":\"Right\",\"value\":\"right\",\"default\":\"\"}]}','2018-03-07 10:06:03','2018-04-21 00:05:42','4f24b989-6f14-4011-97df-4ab3155a913b'),
	(159,3,'Card Options','setCard','global','',0,'SuperTable','{\"columns\":{\"160\":{\"width\":\"\"},\"new1\":{\"width\":\"\"},\"161\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2018-03-07 10:06:04','2018-04-21 00:06:02','1379f939-9448-4d8d-ae4a-8b44cc4cbcbe'),
	(160,NULL,'Styling','styleClasses','superTableBlockType:37','',0,'Categories','{\"source\":\"group:4\",\"targetLocale\":\"\",\"limit\":\"\",\"selectionLabel\":\"Use Style\"}','2018-03-07 10:06:04','2018-04-21 00:06:02','3a0b5858-079a-48a0-92e4-55f1f4537534'),
	(161,NULL,'Media Ratio','mediaRatio','superTableBlockType:37','Aspect ratio of the image',0,'PlainText','{\"placeholder\":\"16:9\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2018-03-07 10:06:04','2018-04-21 00:06:02','993068d6-b277-495a-99bc-f4d3c7a01686'),
	(162,3,'Card Slider Options','setCardSlider','global','',0,'SuperTable','{\"columns\":{\"163\":{\"width\":\"\"},\"new1\":{\"width\":\"\"},\"164\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2018-03-07 10:06:04','2018-04-21 00:06:22','e54e57f7-1604-4596-8ad2-77c7caaf1cb5'),
	(163,NULL,'Styling','styleClasses','superTableBlockType:38','',0,'Categories','{\"source\":\"group:4\",\"targetLocale\":\"\",\"limit\":\"\",\"selectionLabel\":\"Use Style \"}','2018-03-07 10:06:04','2018-04-21 00:06:22','312fba95-774a-436e-a9f2-8b3a6affb8d5'),
	(164,NULL,'Setup','setup','superTableBlockType:38','Select one of the existing setups or define a new one under `Categories> Settings: Image Slider`',0,'Categories','{\"source\":\"group:2\",\"targetLocale\":\"\",\"limit\":\"1\",\"selectionLabel\":\"Setup ausw\\u00e4hlen\"}','2018-03-07 10:06:04','2018-04-21 00:06:22','425b7de6-e34e-4ab0-886d-262304e31f2e'),
	(165,3,'Embed Content Options','setEmbedContent','global','',0,'SuperTable','{\"columns\":{\"166\":{\"width\":\"\"},\"new1\":{\"width\":\"\"},\"167\":{\"width\":\"\"},\"168\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2018-03-07 10:06:04','2018-04-21 00:07:16','ce20d161-fd4c-42f1-a6e4-72ec303f2557'),
	(166,NULL,'Styling','styleClasses','superTableBlockType:39','',0,'Categories','{\"source\":\"group:4\",\"targetLocale\":\"\",\"limit\":\"\",\"selectionLabel\":\"Use Style\"}','2018-03-07 10:06:04','2018-04-21 00:07:16','8d535ff7-2359-40e3-a08d-b46f6eaece93'),
	(167,NULL,'Responsive','responsive','superTableBlockType:39','Do you want to display the content responsive?',0,'Lightswitch','{\"default\":\"\"}','2018-03-07 10:06:04','2018-04-21 00:07:16','8075ff6c-481b-4bcc-ae5d-674afe019159'),
	(168,NULL,'Ratio','ratio','superTableBlockType:39','Ratio of the iFrame',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2018-03-07 10:06:04','2018-04-21 00:07:16','76a8563e-9695-4121-81bf-2fcaba77c9a2'),
	(169,3,'Gallery Options','setGallery','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2018-03-07 10:06:04','2018-03-07 10:06:04','6c56a591-03cf-4901-bdb4-c10559c35a1e'),
	(170,NULL,'Layout Typ','layoutType','superTableBlockType:40','Smart for a thumbnail layout in Tumbler Styles (Photogrid), Simple for simple thumbnail matching',0,'Dropdown','{\"options\":[{\"label\":\"Simple\",\"value\":\"simple\",\"default\":\"\"},{\"label\":\"Smart\",\"value\":\"smart\",\"default\":\"\"}]}','2018-03-07 10:06:04','2018-03-07 10:06:04','b5e113ee-4229-4300-b9d5-1afe7e3aa0fe'),
	(171,NULL,'Ratio','ratio','superTableBlockType:40','Image ratio of the thumbnails for the `simple layout` mode. Format \'1:1\'',0,'PlainText','{\"placeholder\":\"1:1\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2018-03-07 10:06:04','2018-03-07 10:06:04','3053a95c-5a75-4add-be4e-7991ab8d16ec'),
	(172,NULL,'Width','width','superTableBlockType:40','Thumbnail width for the Simple Layout. Regularly, the width of thumbnails depends on the number of images per row. If this is too big or too small, you can set the width yourself.',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2018-03-07 10:06:04','2018-03-07 10:06:04','2bef6540-6432-40df-83a8-abc949912ae0'),
	(173,3,'Grid Background','setGridSectionBackground','global','',0,'SuperTable','{\"columns\":{\"174\":{\"width\":\"\"},\"175\":{\"width\":\"\"},\"176\":{\"width\":\"\"},\"177\":{\"width\":\"\"},\"178\":{\"width\":\"\"},\"179\":{\"width\":\"\"},\"new1\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2018-03-07 10:06:04','2018-04-21 00:07:52','f26f5c9b-5ccd-4ed6-905b-a43460bb6ad8'),
	(174,NULL,'Image','backgroundImage','superTableBlockType:41','',0,'Assets','{\"useSingleFolder\":\"\",\"sources\":\"*\",\"defaultUploadLocationSource\":\"1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"1\",\"allowedKinds\":[\"image\"],\"targetLocale\":\"\",\"limit\":\"1\",\"viewMode\":\"list\",\"selectionLabel\":\"\"}','2018-03-07 10:06:04','2018-04-21 00:07:52','574fd589-9b6c-41f8-be89-2a263e327046'),
	(175,NULL,'Ratio','ratio','superTableBlockType:41','Ratio of the background image',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2018-03-07 10:06:04','2018-04-21 00:07:52','f41da143-9a0e-4464-81b2-c6da5411de02'),
	(176,NULL,'Position','position','superTableBlockType:41','Background Position of the image (css syntax)',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2018-03-07 10:06:04','2018-04-21 00:07:52','a91a1c67-6865-4a30-928c-0192786b97fb'),
	(177,NULL,'Adapt Container','adaptContainer','superTableBlockType:41','Do you want the background container to be as broad as the content container?',0,'Lightswitch','{\"default\":\"\"}','2018-03-07 10:06:04','2018-04-21 00:07:52','76302ff9-7056-4913-945f-b0f1ad0c2dfa'),
	(178,NULL,'Width','width','superTableBlockType:41','Width of the background image - default always full width',0,'Dropdown','{\"options\":[{\"label\":\"Full\",\"value\":\"default\",\"default\":\"1\"},{\"label\":\"Half left\",\"value\":\"halfLeft\",\"default\":\"\"},{\"label\":\"Half right\",\"value\":\"halfRight\",\"default\":\"\"}]}','2018-03-07 10:06:04','2018-04-21 00:07:52','36d5464e-d1ca-4672-9cec-231bf4d872f0'),
	(179,NULL,'Style Classes','styleClasses','superTableBlockType:41','',0,'Categories','{\"source\":\"group:4\",\"targetLocale\":\"\",\"limit\":\"\",\"selectionLabel\":\"Use Style\"}','2018-03-07 10:06:04','2018-04-21 00:07:52','4a605884-3248-4eb6-82e8-51667ef2e1f2'),
	(180,2,'Grid Box','objGridBox','global','',0,'SuperTable_Label','{\"value\":\"\"}','2018-03-07 10:06:04','2018-03-07 10:06:04','85866c08-a207-4365-ad17-b9ba5062be69'),
	(181,3,'Grid Box Options','setGridBoxOptions','global','',0,'SuperTable','{\"columns\":{\"182\":{\"width\":\"200px\"},\"183\":{\"width\":\"\"},\"new1\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":\"1\",\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2018-03-07 10:06:04','2018-04-21 00:08:14','7c36aae4-8e79-4168-8c88-df826a8a24f9'),
	(182,NULL,'Box Name','boxName','superTableBlockType:42','Add the box name, either the area name or the class\'s child name.',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2018-03-07 10:06:04','2018-04-21 00:08:14','4ef23c79-b822-4dbe-9cd1-6ad6596be53a'),
	(183,NULL,'Styling','styleClasses','superTableBlockType:42','Here you can write down several CSS classes for separate styling',0,'Categories','{\"source\":\"group:4\",\"targetLocale\":\"\",\"limit\":\"\",\"selectionLabel\":\"Use Style\"}','2018-03-07 10:06:04','2018-04-21 00:08:14','4ba2fd20-958e-401b-83a4-4ba98eb3551e'),
	(184,3,'Grid Setup','setGridSetup','global','CSS styling of the grid',0,'SuperTable','{\"columns\":{\"286\":{\"width\":\"\"},\"186\":{\"width\":\"\"},\"188\":{\"width\":\"\"},\"187\":{\"width\":\"\"},\"189\":{\"width\":\"\"},\"190\":{\"width\":\"\"},\"185\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2018-03-07 10:06:04','2018-04-21 00:53:28','339cd867-c5d5-4b74-a3a0-f9b61cc5def1'),
	(185,NULL,'Schema','schema','superTableBlockType:43','',0,'AceFreely_AceFreely','{\"mode\":\"markdown\",\"theme\":\"monokai\",\"minLines\":\"6\",\"maxLines\":\"1\",\"useTabs\":\"1\",\"tabSize\":\"2\"}','2018-03-07 10:06:04','2018-04-21 00:53:28','6fc890ad-4373-4e2e-9e4a-4c94c98331b6'),
	(186,NULL,'Grid Class Name','gridClassName','superTableBlockType:43','Class name of the grid used as prefix for the child elements. ',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2018-03-07 10:06:04','2018-04-21 00:53:28','10cd91ba-3a0a-4707-bdae-28bb8980927a'),
	(187,NULL,'Area Names','areaNames','superTableBlockType:43','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2018-03-07 10:06:04','2018-04-21 00:53:28','60b543da-84e7-4261-bcf3-90dd206d56cd'),
	(188,NULL,'Spec 1 compatible','oldSpec','superTableBlockType:43','IE10 to Edge 15 can only handle the first revision of the CSS grid layout, if you need to support these browsers you have to enable this option. The name in the boxes then becomes the class name.',0,'Lightswitch','{\"default\":\"1\"}','2018-03-07 10:06:04','2018-04-21 00:53:28','d925ccb5-2b97-445b-8ad0-d99aca6f0406'),
	(189,NULL,'Inlined Style','inlinedStyle','superTableBlockType:43','Activate the option if you want to use inline styles',0,'Lightswitch','{\"default\":\"\"}','2018-03-07 10:06:04','2018-04-21 00:53:28','18415e95-dec0-40f6-9e49-1616ed63a450'),
	(190,NULL,'Style','style','superTableBlockType:43','Inline style of the grid, can be described with mediaqueries and the inner child elements.',0,'AceFreely_AceFreely','{\"mode\":\"css\",\"theme\":\"monokai\",\"minLines\":\"10\",\"maxLines\":\"1\",\"useTabs\":\"1\",\"tabSize\":\"2\"}','2018-03-07 10:06:04','2018-04-21 00:53:28','98585461-3de2-4c5b-9ad1-1784741437b9'),
	(191,2,'Grid Wrapper','objGrid','global','Sections variant, is able to carry multiple boxes and position them using CSS grid layout.',0,'SuperTable_Label','{\"value\":\"\"}','2018-03-07 10:06:05','2018-03-07 10:06:05','de0c1bf2-7e0e-4148-9d15-f02e9550ee6f'),
	(192,3,'Headline Option','setHeadline','global','Size of the headline, the regular headline has a semantic size of a H2. The override controller can be used to readjust the size independent of its semantics.',0,'SuperTable','{\"columns\":{\"193\":{\"width\":\"\"},\"new1\":{\"width\":\"\"},\"194\":{\"width\":\"\"},\"195\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":\"1\",\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":\"1\",\"minRows\":null}','2018-03-07 10:06:05','2018-04-21 00:13:15','e57b46a3-1e07-4e6b-8892-9018756f69dd'),
	(193,NULL,'Styling','styleClasses','superTableBlockType:44','',0,'Categories','{\"source\":\"group:4\",\"targetLocale\":\"\",\"limit\":\"\",\"selectionLabel\":\"Use Style\"}','2018-03-07 10:06:05','2018-04-21 00:13:15','6e85fd1c-7888-478f-91a9-86cf60e8d142'),
	(194,NULL,'Semantic Size','semantic','superTableBlockType:44','',0,'Dropdown','{\"options\":[{\"label\":\"H1\",\"value\":\"h1\",\"default\":\"\"},{\"label\":\"H2\",\"value\":\"h2\",\"default\":\"1\"},{\"label\":\"H3\",\"value\":\"h3\",\"default\":\"\"},{\"label\":\"H4\",\"value\":\"h4\",\"default\":\"\"},{\"label\":\"H5\",\"value\":\"h5\",\"default\":\"\"},{\"label\":\"H6\",\"value\":\"h6\",\"default\":\"\"}]}','2018-03-07 10:06:05','2018-04-21 00:13:15','38c30d8a-2aca-47c0-af18-08408d523fcf'),
	(195,NULL,'Override','override','superTableBlockType:44','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":\"1\"},{\"label\":\"H1\",\"value\":\"h1\",\"default\":\"\"},{\"label\":\"H2\",\"value\":\"h2\",\"default\":\"\"},{\"label\":\"H3\",\"value\":\"h3\",\"default\":\"\"},{\"label\":\"H4\",\"value\":\"h4\",\"default\":\"\"},{\"label\":\"H5\",\"value\":\"h5\",\"default\":\"\"},{\"label\":\"H6\",\"value\":\"h6\",\"default\":\"\"}]}','2018-03-07 10:06:05','2018-04-21 00:13:15','8cb65200-4a94-426c-a672-d82e0a375d6b'),
	(196,3,'Image Slider Options','setImageSlider','global','The ratio applies to all images, Craft will crops the pictures so they fit into the format (Default is 16:10). The Caption is optional and applies to the entire slider.',0,'SuperTable','{\"columns\":{\"197\":{\"width\":\"\"},\"new1\":{\"width\":\"\"},\"198\":{\"width\":\"\"},\"199\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":\"1\",\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2018-03-07 10:06:05','2018-04-21 00:13:33','ddf51996-00f2-447b-a28e-5388f87cf1bf'),
	(197,NULL,'Styling','styleClasses','superTableBlockType:45','',0,'Categories','{\"source\":\"group:4\",\"targetLocale\":\"\",\"limit\":\"\",\"selectionLabel\":\"Use Style\"}','2018-03-07 10:06:05','2018-04-21 00:13:33','6240a804-db14-4bfd-a6b2-488a8eff9ae7'),
	(198,NULL,'Setup','setup','superTableBlockType:45','Select one of the existing setups or define a new one under `Categories> Settings: Image Slider`',0,'Categories','{\"source\":\"group:2\",\"targetLocale\":\"\",\"limit\":\"1\",\"selectionLabel\":\"Setup ausw\\u00e4hlen\"}','2018-03-07 10:06:05','2018-04-21 00:13:33','1d67a805-02f8-4174-850c-7e211657c7b6'),
	(199,NULL,'Ratio','ratio','superTableBlockType:45','Image ratio for all slides',0,'PlainText','{\"placeholder\":\"16:10\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2018-03-07 10:06:05','2018-04-21 00:13:33','f4e55cd3-186c-40bd-93d5-2820acc2479a'),
	(200,3,'Jumpnavigation Options','setJumpNavigation','global','',0,'SuperTable','{\"columns\":{\"201\":{\"width\":\"\"},\"new1\":{\"width\":\"\"},\"202\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":\"1\",\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2018-03-07 10:06:05','2018-04-21 00:14:32','9a2f1c1d-a89d-4d61-a92e-6f8b0546c7c7'),
	(201,NULL,'Styling','styleClasses','superTableBlockType:46','',0,'Categories','{\"source\":\"group:4\",\"targetLocale\":\"\",\"limit\":\"\",\"selectionLabel\":\"Use Style\"}','2018-03-07 10:06:05','2018-04-21 00:14:32','e602951c-a8fb-4491-84a2-06095ebad398'),
	(202,NULL,'Layout','layout','superTableBlockType:46','The default layout is a simple left-aligned string of the links, with the full width, the buttons are arranged in the full width (break at too small size but around which the buttons are interrelated). The buttons are arranged like a list.',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":\"1\"},{\"label\":\"Full Width\",\"value\":\"fullwidth\",\"default\":\"\"},{\"label\":\"List\",\"value\":\"list\",\"default\":\"\"}]}','2018-03-07 10:06:05','2018-04-21 00:14:33','d2d8ac60-fef8-42b1-b1db-15162b39eaf7'),
	(203,3,'List Options','setList','global','',0,'SuperTable','{\"columns\":{\"204\":{\"width\":\"\"},\"new1\":{\"width\":\"\"},\"205\":{\"width\":\"\"},\"206\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":\"1\",\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2018-03-07 10:06:05','2018-04-21 00:14:52','5d6b5172-d2b4-4c67-919f-0cbcd0875ec2'),
	(204,NULL,'Styling','styleClasses','superTableBlockType:47','',0,'Categories','{\"source\":\"group:4\",\"targetLocale\":\"\",\"limit\":\"\",\"selectionLabel\":\"Use Style\"}','2018-03-07 10:06:05','2018-04-21 00:14:52','898b2233-906d-44d9-ae88-d251ea55e0fa'),
	(205,NULL,'Typ','listtype','superTableBlockType:47','Listtype',0,'Dropdown','{\"options\":[{\"label\":\"Unsorted UL\",\"value\":\"ul\",\"default\":\"1\"},{\"label\":\"Sorted OL\",\"value\":\"ol\",\"default\":\"\"}]}','2018-03-07 10:06:05','2018-04-21 00:14:52','beb63736-e808-4e40-968b-fdbc24c9b30b'),
	(206,NULL,'Bullet','bullet','superTableBlockType:47','Style of Bullets on unsorted lists',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":\"1\"},{\"label\":\"Circle\",\"value\":\"circle\",\"default\":\"\"},{\"label\":\"Square\",\"value\":\"square\",\"default\":\"\"},{\"label\":\"Custom\",\"value\":\"custom\",\"default\":\"\"}]}','2018-03-07 10:06:05','2018-04-21 00:14:52','72b10d55-adf9-4b8c-9834-32d1c44be23e'),
	(207,3,'Markdown Options','setMarkdown','global','Markdown Optionen',0,'SuperTable','{\"columns\":{\"208\":{\"width\":\"\"},\"new1\":{\"width\":\"\"},\"209\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":\"1\",\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2018-03-07 10:06:05','2018-04-21 00:15:07','e4ebd227-2f3a-42c0-8d22-d4dbe1c77c10'),
	(208,NULL,'Styling','styleClasses','superTableBlockType:48','',0,'Categories','{\"source\":\"group:4\",\"targetLocale\":\"\",\"limit\":\"\",\"selectionLabel\":\"Use Style\"}','2018-03-07 10:06:05','2018-04-21 00:15:07','1a0da661-1262-4984-b91b-10f180b74340'),
	(209,NULL,'Add Anchor','addAnchor','superTableBlockType:48','Should the headings h1 - h3 be equipped with an anchor?',0,'Lightswitch','{\"default\":\"\"}','2018-03-07 10:06:05','2018-04-21 00:15:07','d17456af-bb2d-4d54-9890-d66bd0f63932'),
	(210,3,'Media Image Options','setMediaImage','global','',0,'SuperTable','{\"columns\":{\"211\":{\"width\":\"\"},\"new1\":{\"width\":\"\"},\"212\":{\"width\":\"\"},\"213\":{\"width\":\"\"},\"270\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2018-03-07 10:06:05','2018-04-21 00:15:40','7847f3f8-06ba-49e8-bbf6-1a7f4b095c78'),
	(211,NULL,'Styling','styleClasses','superTableBlockType:49','',0,'Categories','{\"source\":\"group:4\",\"targetLocale\":\"\",\"limit\":\"\",\"selectionLabel\":\"Use Style\"}','2018-03-07 10:06:05','2018-04-21 00:15:40','c2ee22ed-f916-40d4-be23-9d6f1a9782ac'),
	(212,NULL,'Ratio','ratio','superTableBlockType:49','Size ratio of the image',0,'PlainText','{\"placeholder\":\"16:9\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2018-03-07 10:06:05','2018-04-21 00:15:40','84edaf35-5da6-43eb-9d72-cab057763a79'),
	(213,NULL,'Hight Restriction','heightrestriction','superTableBlockType:49','If it is a picture in the portrait format, it can be that it is longer than the viewport is high. The height limit limits the height to maximum viewport height - you no longer have to scroll around the entire image.',0,'Lightswitch','{\"default\":\"\"}','2018-03-07 10:06:05','2018-04-21 00:15:40','c6d0b918-3bf4-4b13-bff6-1bbee4be5764'),
	(214,3,'Quote Options','setQuote','global','',0,'SuperTable','{\"columns\":{\"215\":{\"width\":\"\"},\"new1\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":\"1\",\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2018-03-07 10:06:05','2018-04-21 00:15:55','30b38f3a-b5d4-4a5c-847c-d60d19487c55'),
	(215,NULL,'Styling','styleClasses','superTableBlockType:50','',0,'Categories','{\"source\":\"group:4\",\"targetLocale\":\"\",\"limit\":\"\",\"selectionLabel\":\"Use Style \"}','2018-03-07 10:06:05','2018-04-21 00:15:55','afe03f60-3c37-4611-86a6-f475b1e196a5'),
	(216,3,'Richtext Options','setRichtext','global','',0,'SuperTable','{\"columns\":{\"217\":{\"width\":\"\"},\"new1\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":\"1\",\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2018-03-07 10:06:05','2018-04-21 00:16:07','5fe2501b-67ca-49f2-9a40-aaf51b05a9e6'),
	(217,NULL,'Styling','styleClasses','superTableBlockType:51','',0,'Categories','{\"source\":\"group:4\",\"targetLocale\":\"\",\"limit\":\"\",\"selectionLabel\":\"Use Style\"}','2018-03-07 10:06:05','2018-04-21 00:16:07','a5f6d596-f0a2-4f93-9224-8075c9c3641f'),
	(218,3,'Section Column Options','setSectionColumn','global','Spalte in einer Sektion',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2018-03-07 10:06:05','2018-03-07 10:06:05','82f04b31-452e-44ac-94db-6c70a2b554d3'),
	(219,NULL,'Styling','styleClasses','superTableBlockType:52','Here you can select additional styling classes.',0,'Categories','{\"source\":\"group:4\",\"targetLocale\":\"\",\"limit\":\"\",\"selectionLabel\":\"Use Styles\"}','2018-03-07 10:06:06','2018-03-07 10:06:06','6bce9465-47fe-4084-9dbe-1789ffc0053e'),
	(220,3,'Section Layout','setSectionLayout','global','Weighting of individual columns.',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2018-03-07 10:06:06','2018-03-07 10:06:06','ccbe1b27-5ff4-48b0-8c9b-a0bcf5c1512e'),
	(221,NULL,'Two columns','twoColumns','superTableBlockType:53','Width ratio for two columns',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"1-1\",\"default\":\"\"},{\"label\":\"2-1\",\"value\":\"2-1\",\"default\":\"\"},{\"label\":\"1-2\",\"value\":\"1-2\",\"default\":\"\"},{\"label\":\"3-1\",\"value\":\"3-1\",\"default\":\"\"},{\"label\":\"1-3\",\"value\":\"1-3\",\"default\":\"\"}]}','2018-03-07 10:06:06','2018-03-07 10:06:06','013e33ca-8ba5-4e85-aee3-f5db9783b258'),
	(222,NULL,'Three Columns','threeColumns','superTableBlockType:53','Width ratio for three columns',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"1-1-1\",\"default\":\"\"},{\"label\":\"2-6-2\",\"value\":\"2-6-2\",\"default\":\"\"},{\"label\":\"3-5-2\",\"value\":\"3-5-2\",\"default\":\"\"},{\"label\":\"2-5-3\",\"value\":\"2-5-3\",\"default\":\"\"}]}','2018-03-07 10:06:06','2018-03-07 10:06:06','df695f7f-7c3a-4e13-aa51-b845f7cd2d4f'),
	(223,NULL,'Four Columns','fourColumns','superTableBlockType:53','Width ratio for four columns',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"1-1-1-1\",\"default\":\"\"},{\"label\":\"2-3-3-2\",\"value\":\"2-3-3-2\",\"default\":\"\"},{\"label\":\"2-3-4-1\",\"value\":\"2-3-4-1\",\"default\":\"\"}]}','2018-03-07 10:06:06','2018-03-07 10:06:06','09310702-12ce-4996-947a-01b42d63493d'),
	(224,3,'Section Options','setSection','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2018-03-07 10:06:06','2018-03-07 10:06:06','83e003a3-b2e2-40f8-8d15-0310391a53a2'),
	(225,NULL,'Anchor','anchor','superTableBlockType:54','Optional anchor for jump navigation without # (and without special characters)',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2018-03-07 10:06:06','2018-03-07 10:06:06','5640b7cb-7bda-4ad5-b308-e8d703925605'),
	(226,NULL,'Styling','styleClasses','superTableBlockType:54','',0,'Categories','{\"source\":\"group:4\",\"targetLocale\":\"\",\"limit\":\"\",\"selectionLabel\":\"Use Style\"}','2018-03-07 10:06:06','2018-03-07 10:06:06','fc3e8f31-2ed1-40f7-ad16-173960104818'),
	(227,NULL,'Inner Container','innerContainer','superTableBlockType:54','Layout of the inner container',0,'Dropdown','{\"options\":[{\"label\":\"Default Page Width\",\"value\":\"default\",\"default\":1},{\"label\":\"Full Viewport\",\"value\":\"full\",\"default\":\"\"},{\"label\":\"Bigger 25%\",\"value\":\"bigger-25\",\"default\":\"\"},{\"label\":\"Bigger 45%\",\"value\":\"bigger-45\",\"default\":\"\"},{\"label\":\"Smaller 25%\",\"value\":\"smaller-25\",\"default\":\"\"},{\"label\":\"Smaller 50%\",\"value\":\"smaller-50\",\"default\":\"\"}]}','2018-03-07 10:06:06','2018-03-07 10:06:06','2df6a91c-b164-455d-8714-9be8beedce75'),
	(228,3,'Slideout Box Options','setSlideOutBox','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2018-03-07 10:06:06','2018-03-07 10:06:06','9b2afa51-9505-4ad3-98a1-1c6b43164627'),
	(229,NULL,'Styling','styleClasses','superTableBlockType:55','',0,'Categories','{\"source\":\"group:4\",\"targetLocale\":\"\",\"limit\":\"\",\"selectionLabel\":\"Use Style\"}','2018-03-07 10:06:06','2018-03-07 10:06:06','086e1718-c316-4667-ba3e-2ee0027b1d4a'),
	(230,3,'Slider Setup','setSliderSetup','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"},\"new4\":{\"width\":\"\"},\"new5\":{\"width\":\"\"},\"new6\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2018-03-07 10:06:06','2018-03-07 10:06:06','e910ad22-cd6e-413f-956e-120110ea15c3'),
	(231,NULL,'Autoplay','autoplay','superTableBlockType:56','Speed of Autoplay mode',0,'Dropdown','{\"options\":[{\"label\":\"Deaktiviert\",\"value\":\"default\",\"default\":1},{\"label\":\"Slow\",\"value\":\"slow\",\"default\":\"\"},{\"label\":\"Medium\",\"value\":\"medium\",\"default\":\"\"},{\"label\":\"Fast\",\"value\":\"fast\",\"default\":\"\"}]}','2018-03-07 10:06:06','2018-03-07 10:06:06','aa65c7ba-2105-4822-8536-b9b90b2094db'),
	(232,NULL,'Animation Speed','speed','superTableBlockType:56','Setting the animation speed',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":\"\"},{\"label\":\"Slow\",\"value\":\"slow\",\"default\":\"\"},{\"label\":\"Medium\",\"value\":\"medium\",\"default\":\"\"},{\"label\":\"Fast\",\"value\":\"fast\",\"default\":\"\"}]}','2018-03-07 10:06:06','2018-03-07 10:06:06','2bd4d920-0057-4a49-9512-292440af0be7'),
	(233,NULL,'Loop','loop','superTableBlockType:56','Should the slider run endlessly?',0,'Lightswitch','{\"default\":\"\"}','2018-03-07 10:06:06','2018-03-07 10:06:06','43546ee0-6358-4c4d-92fa-b8f057747b36'),
	(234,NULL,'Hide Navigation','navigation','superTableBlockType:56','Should a navigation be hidden?',0,'Lightswitch','{\"default\":\"\"}','2018-03-07 10:06:06','2018-03-07 10:06:06','16c550b7-29c2-4e4e-8aad-80c2b89d85b6'),
	(235,NULL,'Hide Pagination','pagination','superTableBlockType:56','Should a pagination be hidden?',0,'Lightswitch','{\"default\":\"\"}','2018-03-07 10:06:06','2018-03-07 10:06:06','f00f8b11-bd9b-4158-ab6d-594c6a2c27d5'),
	(236,NULL,'Autoheight','autoHeight','superTableBlockType:56','With Autoheight, the height of each Slides is Dynamic',0,'Lightswitch','{\"default\":\"\"}','2018-03-07 10:06:06','2018-03-07 10:06:06','53253e87-3984-40ee-8cb7-5d4c1aeb4dda'),
	(237,3,'Slider Setup General','setSliderSetupGeneral','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"},\"new4\":{\"width\":\"\"},\"new5\":{\"width\":\"\"},\"new6\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2018-03-07 10:06:06','2018-03-07 10:06:06','53275b58-79c3-4f33-bc1f-eeb14c7ec9b7'),
	(238,NULL,'Slide Position','position','superTableBlockType:57','Position of the slides',0,'Dropdown','{\"options\":[{\"label\":\"Center\",\"value\":\"center\",\"default\":1},{\"label\":\"Left\",\"value\":\"left\",\"default\":\"\"},{\"label\":\"Right\",\"value\":\"right\",\"default\":\"\"}]}','2018-03-07 10:06:06','2018-03-07 10:06:06','008014e6-2ddf-4e47-b19c-fe04e9adddc2'),
	(239,NULL,'Slides per View','slidesPerView','superTableBlockType:57','Number of visible slides',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1},{\"label\":\"Auto\",\"value\":\"auto\",\"default\":\"\"},{\"label\":2,\"value\":\"two\",\"default\":\"\"},{\"label\":3,\"value\":\"three\",\"default\":\"\"},{\"label\":4,\"value\":\"four\",\"default\":\"\"},{\"label\":5,\"value\":\"five\",\"default\":\"\"}]}','2018-03-07 10:06:06','2018-03-07 10:06:06','da21755a-2560-4077-ae5d-11039cc01f54'),
	(240,NULL,'Space Between','spaceBetween','superTableBlockType:57','Distances between the slides',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2018-03-07 10:06:06','2018-03-07 10:06:06','d5ca446f-9d4b-4130-aebd-cc3ce5b760b0'),
	(241,NULL,'Group Cell','groupCell','superTableBlockType:57','Slides can be grouped.',0,'Dropdown','{\"options\":[{\"label\":\"Nicht gruppiert\",\"value\":\"default\",\"default\":1},{\"label\":2,\"value\":\"\\\"2\\\"\",\"default\":\"\"},{\"label\":3,\"value\":\"\\\"3\\\"\",\"default\":\"\"},{\"label\":4,\"value\":\"\\\"4\\\"\",\"default\":\"\"},{\"label\":5,\"value\":\"\\\"5\\\"\",\"default\":\"\"},{\"label\":6,\"value\":\"\\\"6\\\"\",\"default\":\"\"}]}','2018-03-07 10:06:06','2018-03-07 10:06:06','b5f4c682-eff7-4d3b-80bf-1cf02f1bba8d'),
	(242,NULL,'Freescroll','freescroll','superTableBlockType:57','With Freescroll, the slider can be moved freely',0,'Lightswitch','{\"default\":\"\"}','2018-03-07 10:06:06','2018-03-07 10:06:06','186afd8e-16a9-46ca-b803-dfde0ed95061'),
	(243,NULL,'Responsive','responsive','superTableBlockType:57','If multiple slides are displayed at the same time, you can reduce the number of columns by using Responsive with smaller viewport.',0,'Lightswitch','{\"default\":\"\"}','2018-03-07 10:06:06','2018-03-07 10:06:06','406768c1-7acd-4857-82ba-bff507c92bb3'),
	(244,4,'Style Classes','styleClasses','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2018-03-07 10:06:06','2018-03-07 10:06:06','e3d58961-3ba1-4bd2-8e5f-7c9ab1f11667'),
	(245,NULL,'Classname','classname','superTableBlockType:58','Without a Dot',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2018-03-07 10:06:07','2018-03-07 10:06:07','200237a4-5fd3-408f-aa7d-234cc014057a'),
	(246,NULL,'Description','description','superTableBlockType:58','',0,'Doxter','{\"enableSoftTabs\":1,\"tabSize\":2,\"rows\":3,\"toolbarPlacement\":\"bottom\"}','2018-03-07 10:06:07','2018-03-07 10:06:07','6e5c4cd7-7834-4e6a-a6f9-019da89f35d3'),
	(247,3,'Grid Options','setGridOptions','global','',0,'SuperTable','{\"columns\":{\"248\":{\"width\":\"\"},\"249\":{\"width\":\"\"},\"new1\":{\"width\":\"\"},\"250\":{\"width\":\"\"},\"251\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2018-03-07 10:14:44','2018-04-21 00:08:32','b9eaf0d6-75ae-4f50-8472-7c75c02e017d'),
	(248,NULL,'Anchor','anchor','superTableBlockType:59','Name of the optional jump anchor',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2018-03-07 10:14:44','2018-04-21 00:08:33','50663571-900a-4315-b3e3-b62786addaee'),
	(249,NULL,'Styling','styleClasses','superTableBlockType:59','Here you can select additional styling classes.',0,'Categories','{\"source\":\"group:4\",\"targetLocale\":\"\",\"limit\":\"\",\"selectionLabel\":\"Use Style\"}','2018-03-07 10:14:44','2018-04-21 00:08:33','527e40ac-39e6-4996-8120-74f3842496cd'),
	(250,NULL,'Setup Choice ','setupChoice','superTableBlockType:59','Select one of the existing grid setups',0,'Categories','{\"source\":\"group:3\",\"targetLocale\":\"\",\"limit\":\"1\",\"selectionLabel\":\"Select Setup\"}','2018-03-07 10:14:44','2018-04-21 00:08:33','e22a7238-145f-4f4b-b8ee-dd402af5793a'),
	(251,NULL,'Inner Container','innerContainer','superTableBlockType:59','Inside the wrapper another container will be inserted which will contain the grid. You can determine how wide this container will be.',0,'Lj_DynamicFields_Dropdown','{\"json\":\"{ \\\"value\\\":\\\"default\\\" , \\\"label\\\":\\\"Page width\\\", \\\"default\\\":true },\\r\\n{ \\\"value\\\":\\\"full\\\" , \\\"label\\\":\\\"Full wrapper width\\\" },\\r\\n{ \\\"value\\\":\\\"bigger-25\\\" , \\\"label\\\":\\\"25% over page width\\\" },\\r\\n{ \\\"value\\\":\\\"bigger-45\\\" , \\\"label\\\":\\\"45% over page width\\\" },\\r\\n{ \\\"value\\\":\\\"smaller-25\\\" , \\\"label\\\":\\\"25% less than side width\\\" },\\r\\n{ \\\"value\\\":\\\"smaller-50\\\" , \\\"label\\\":\\\"50% less than side width\\\" }\"}','2018-03-07 10:14:44','2018-04-21 00:08:33','cbd2fbb4-dc70-458e-a38f-11dada18bf67'),
	(252,NULL,'Styling','styleClasses','superTableBlockType:1','',0,'Categories','{\"source\":\"group:4\",\"targetLocale\":\"\",\"limit\":\"\",\"selectionLabel\":\"Use Style\"}','2018-03-07 11:22:00','2018-03-07 11:22:00','99465789-57ca-49c6-b165-0c5d6a31cb3f'),
	(253,NULL,'Styling','styleClasses','superTableBlockType:34','',0,'Categories','{\"source\":\"group:4\",\"targetLocale\":\"\",\"limit\":\"\",\"selectionLabel\":\"Use Style\"}','2018-03-07 11:22:39','2018-03-07 11:22:39','25f795eb-4b39-410f-ba46-9252ec7b4bed'),
	(254,2,'Inline SVG','objInlineSvg','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2018-03-17 15:01:03','2018-03-17 15:01:03','e34c6a19-3773-4e6b-b1e1-6827981d4e4a'),
	(255,NULL,'SVG','svg','superTableBlockType:60','',0,'Assets','{\"useSingleFolder\":\"\",\"sources\":\"*\",\"defaultUploadLocationSource\":\"1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":1,\"allowedKinds\":[\"image\"],\"targetLocale\":\"\",\"limit\":1,\"viewMode\":\"large\",\"selectionLabel\":\"\"}','2018-03-17 15:01:03','2018-03-17 15:01:03','39af8b89-fe5e-4a02-bf71-de061b48c409'),
	(256,NULL,'Caption','caption','superTableBlockType:60','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2018-03-17 15:01:03','2018-03-17 15:01:03','0bb71309-8294-4b3d-abbc-a20abef949d2'),
	(257,3,'Inline SVG Options','setInlineSvgOptions','global','',0,'SuperTable','{\"columns\":{\"258\":{\"width\":\"\"},\"259\":{\"width\":\"\"},\"new1\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2018-03-17 15:01:03','2018-04-21 00:13:50','66862852-508c-4620-9668-20001c349037'),
	(258,NULL,'CSS Code','cssCode','superTableBlockType:61','',0,'AceFreely_AceFreely','{\"mode\":\"css\",\"theme\":\"solarized_dark\",\"minLines\":\"10\",\"maxLines\":\"\",\"useTabs\":\"1\",\"tabSize\":\"2\"}','2018-03-17 15:01:03','2018-04-21 00:13:50','52d472a0-403e-45c7-8c44-d272593e7dfa'),
	(259,NULL,'Styling','styleClasses','superTableBlockType:61','',0,'Categories','{\"source\":\"group:4\",\"targetLocale\":\"\",\"limit\":\"\",\"selectionLabel\":\"\"}','2018-03-17 15:01:03','2018-04-21 00:13:50','45140e19-3d27-4745-a774-f276c57f77dd'),
	(260,2,'Generic','objGeneric','global','With the content field you can embed generic content, such as a news archive, into the content.',0,'Dropdown','{\"options\":[{\"label\":\"\",\"value\":\"\",\"default\":\"\"}]}','2018-03-17 15:05:24','2018-03-17 15:08:33','e9af4996-7afa-4b8f-bfbf-a432000f1fe3'),
	(261,2,'Instagram','objInstagram','global','Integrate Instagram Images',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new4\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2018-03-19 17:17:12','2018-03-19 17:17:12','8bbd9d77-7353-4ab4-b2e0-25c6036d261f'),
	(262,NULL,'Post URL','postUrl','superTableBlockType:62','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2018-03-19 17:17:13','2018-03-19 17:17:13','06593fa7-27ab-4e4a-bf68-66ee58f14ef4'),
	(263,NULL,'Caption','caption','superTableBlockType:62','',1,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2018-03-19 17:17:13','2018-03-19 17:17:13','4ae5365a-2002-45d3-a607-77c9decb4b1a'),
	(264,3,'Instagram Options','setInstagramOptions','global','',0,'SuperTable','{\"columns\":{\"265\":{\"width\":\"\"},\"new1\":{\"width\":\"\"},\"266\":{\"width\":\"\"},\"267\":{\"width\":\"\"},\"268\":{\"width\":\"\"},\"269\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2018-03-19 17:20:15','2018-04-21 00:14:14','98825ff2-bd7d-4784-91a4-be2495b7f868'),
	(265,NULL,'Styling','styleClasses','superTableBlockType:63','',0,'Categories','{\"source\":\"group:4\",\"targetLocale\":\"\",\"limit\":\"\",\"selectionLabel\":\"Use Styles\"}','2018-03-19 17:20:15','2018-04-21 00:14:14','3f920946-b8ad-4c11-8174-4d369163b9f6'),
	(266,NULL,'Size','size','superTableBlockType:63','Retrieval size of the image',0,'Dropdown','{\"options\":[{\"label\":\"Large\",\"value\":\"l\",\"default\":\"1\"},{\"label\":\"Medium\",\"value\":\"m\",\"default\":\"\"},{\"label\":\"Thumbnail\",\"value\":\"t\",\"default\":\"\"}]}','2018-03-19 17:20:15','2018-04-21 00:14:14','85fece87-49fc-4b3b-a668-c2e714487e34'),
	(267,NULL,'Linkable','linkable','superTableBlockType:63','Should the image be linked to the original post?',0,'Lightswitch','{\"default\":\"\"}','2018-03-19 17:20:15','2018-04-21 00:14:14','906b60ba-bd06-4426-a8ed-9a0539e3d79f'),
	(268,NULL,'Ratio','ratio','superTableBlockType:63','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2018-03-19 17:20:15','2018-04-21 00:14:14','b626d1b5-1b3c-4d2a-aee8-5efe9f1d0db5'),
	(269,NULL,'Position','position','superTableBlockType:63','CSS background position of the image, is only relevant if you have used a ratio',0,'PlainText','{\"placeholder\":\"10% 50%\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2018-03-19 18:06:03','2018-04-21 00:14:14','af35dd73-735f-4831-b6c8-7b5f30a801c1'),
	(270,NULL,'Imgix Parameter','imgixParam','superTableBlockType:49','Addtional Imgix Params in JSON Format (https://docs.imgix.com/apis/url)',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2018-04-07 10:44:38','2018-04-21 00:15:40','951a273a-9db3-4d99-b29e-9df29edfc6f1'),
	(271,2,'Video','objVideo','global','',0,'SuperTable','{\"columns\":{\"272\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":\"1\",\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2018-04-20 23:55:23','2018-04-21 00:00:29','13efd4ce-5cf3-4998-bba9-7980d3ce8fe4'),
	(272,NULL,'Video','video','superTableBlockType:64','',1,'Assets','{\"useSingleFolder\":\"\",\"sources\":[\"folder:2\"],\"defaultUploadLocationSource\":\"2\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"1\",\"allowedKinds\":[\"video\"],\"targetLocale\":\"\",\"limit\":\"3\",\"viewMode\":\"list\",\"selectionLabel\":\"\"}','2018-04-20 23:55:23','2018-04-21 00:00:29','3782f1d8-1d68-4e32-9b00-4dea02a70bd4'),
	(273,3,'Video Options','setVideo','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"},\"new4\":{\"width\":\"\"},\"new5\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2018-04-21 00:03:53','2018-04-21 00:03:53','79d7e87a-882c-4127-8b0d-6eca65ef6415'),
	(274,NULL,'Styling','styleClasses','superTableBlockType:65','',0,'Categories','{\"source\":\"group:4\",\"targetLocale\":\"\",\"limit\":\"\",\"selectionLabel\":\"\"}','2018-04-21 00:03:53','2018-04-21 00:03:53','71b6db87-af52-47af-9916-90e765b9edf4'),
	(275,NULL,'Add Classes','addClasses','superTableBlockType:65','You can also adding classes in this field, without Dotnotation',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2018-04-21 00:03:53','2018-04-21 00:03:53','f9d4fc3a-615c-4a18-8bca-b5599c816633'),
	(276,NULL,'Poster Image','posterImage','superTableBlockType:65','Should the video be previewed? If yes, controls are automatically implemented',0,'Assets','{\"useSingleFolder\":\"\",\"sources\":\"*\",\"defaultUploadLocationSource\":\"1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"1\",\"allowedKinds\":[\"image\"],\"targetLocale\":\"\",\"limit\":\"1\",\"viewMode\":\"large\",\"selectionLabel\":\"\"}','2018-04-21 00:03:53','2018-04-21 00:03:53','b8f0d591-e58b-4d5f-a508-d8dd6e842b22'),
	(277,NULL,'Poster Image at End','imageAtEnd','superTableBlockType:65','Should the preview image be displayed after the end of the video?',0,'Lightswitch','{\"default\":\"\"}','2018-04-21 00:03:53','2018-04-21 00:03:53','39f0c28d-ed33-4aa6-b434-85746ff76381'),
	(278,NULL,'Player Parameter','params','superTableBlockType:65','https://developer.mozilla.org/de/docs/Web/HTML/Element/video',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2018-04-21 00:03:53','2018-04-21 00:03:53','df8a0bb2-26c7-46dd-86a4-e4df0109230d'),
	(279,NULL,'Add Classes','addClasses','superTableBlockType:36','You can also adding classes in this field, without Dotnotation',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2018-04-21 00:05:42','2018-04-21 00:05:42','9f443a19-f13b-4b2f-a780-f7925a8dde60'),
	(280,NULL,'Add Classes','addClasses','superTableBlockType:37','You can also adding classes in this field, without Dotnotation',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2018-04-21 00:06:02','2018-04-21 00:06:02','58759fe6-5bc9-42e8-b904-4886252e4da8'),
	(281,NULL,'Add Classes','addClasses','superTableBlockType:38','You can also adding classes in this field, without Dotnotation',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2018-04-21 00:06:22','2018-04-21 00:06:22','4b78abab-baca-4c30-a3a5-3fa15267866f'),
	(282,NULL,'Add Classes','addClasses','superTableBlockType:39','You can also adding classes in this field, without Dotnotation',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2018-04-21 00:07:16','2018-04-21 00:07:16','ee439bb8-f21e-46dc-ada1-0cff5b73a8d6'),
	(283,NULL,'Add Classes','addClasses','superTableBlockType:41','You can also adding classes in this field, without Dotnotation',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2018-04-21 00:07:52','2018-04-21 00:07:52','8447e7f1-1815-4190-87ff-7970a9e8c24c'),
	(284,NULL,'Add Classes','addClasses','superTableBlockType:42','You can also adding classes in this field, without Dotnotation',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2018-04-21 00:08:14','2018-04-21 00:08:14','0e7bafe1-611b-433f-aaf5-6db0780bfaee'),
	(285,NULL,'Add Classes','addClasses','superTableBlockType:59','You can also adding classes in this field, without Dotnotation',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2018-04-21 00:08:33','2018-04-21 00:08:33','e0a10787-0a89-47fb-8741-8ec50ee645de'),
	(286,NULL,'Grid Type','gridType','superTableBlockType:43','',0,'Lj_DynamicFields_RadioButtons','{\"json\":\"{ \\\"value\\\":\\\"cssgrid\\\" , \\\"label\\\":\\\"CSS Grid\\\" , \\\"default\\\":true },\\r\\n{ \\\"value\\\":\\\"flexbox\\\" , \\\"label\\\":\\\"Flexbox\\\" }\"}','2018-04-21 00:12:50','2018-04-21 00:53:28','53d9db76-5008-4ced-b2d5-5b43a2a0ec63'),
	(287,NULL,'Add Classes','addClasses','superTableBlockType:44','You can also adding classes in this field, without Dotnotation',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2018-04-21 00:13:15','2018-04-21 00:13:15','9f602846-d9bc-4649-9aa8-6c9125d8796e'),
	(288,NULL,'Add Classes','addClasses','superTableBlockType:45','You can also adding classes in this field, without Dotnotation',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2018-04-21 00:13:33','2018-04-21 00:13:33','64326631-0088-41f7-b0a7-a89a432d06eb'),
	(289,NULL,'Add Classes','addClasses','superTableBlockType:61','You can also adding classes in this field, without Dotnotation',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2018-04-21 00:13:50','2018-04-21 00:13:50','f8114bc1-96d1-420a-9fbc-f7d690969fc4'),
	(290,NULL,'Add Classes','addClasses','superTableBlockType:63','You can also adding classes in this field, without Dotnotation',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2018-04-21 00:14:14','2018-04-21 00:14:14','fd24598a-381e-4524-b5d5-d9e1ea5fed1a'),
	(291,NULL,'Add Classes','addClasses','superTableBlockType:46','You can also adding classes in this field, without Dotnotation',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2018-04-21 00:14:33','2018-04-21 00:14:33','9a572e11-390c-4739-b3df-603f3fb0b251'),
	(292,NULL,'Add Classes','addClasses','superTableBlockType:47','You can also adding classes in this field, without Dotnotation',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2018-04-21 00:14:52','2018-04-21 00:14:52','5403c7f3-0ce8-4e39-ad21-04757bb94f30'),
	(293,NULL,'Add Classes','addClasses','superTableBlockType:48','You can also adding classes in this field, without Dotnotation',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2018-04-21 00:15:07','2018-04-21 00:15:07','c4328b60-4d68-4e2a-a902-db8703f6694f'),
	(294,NULL,'Add Classes','addClasses','superTableBlockType:49','You can also adding classes in this field, without Dotnotation',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2018-04-21 00:15:40','2018-04-21 00:15:40','ea2a088f-23d6-4332-bf36-890df50b73ae'),
	(295,NULL,'Add Classes','addClasses','superTableBlockType:50','You can also adding classes in this field, without Dotnotation',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2018-04-21 00:15:55','2018-04-21 00:15:55','48f41994-f03a-4179-9079-d1c3c8b4b78d'),
	(296,NULL,'Add Classes','addClasses','superTableBlockType:51','You can also adding classes in this field, without Dotnotation',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2018-04-21 00:16:07','2018-04-21 00:16:07','a35d9fff-d086-4492-b5a1-3136d307734e');

/*!40000 ALTER TABLE `craft_fields` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_globalsets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_globalsets`;

CREATE TABLE `craft_globalsets` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_globalsets_name_unq_idx` (`name`),
  UNIQUE KEY `craft_globalsets_handle_unq_idx` (`handle`),
  KEY `craft_globalsets_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_globalsets_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_globalsets_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_globalsets` WRITE;
/*!40000 ALTER TABLE `craft_globalsets` DISABLE KEYS */;

INSERT INTO `craft_globalsets` (`id`, `name`, `handle`, `fieldLayoutId`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(5,'Footer','footer',76,'2017-07-04 22:01:04','2017-07-04 22:01:04','33869bf0-4b69-494e-86d9-e8fda131c6f7'),
	(6,'Main','main',329,'2017-07-04 22:01:04','2018-04-21 00:32:38','d3b07ddd-8e1b-465a-bcd0-65971b014ebf');

/*!40000 ALTER TABLE `craft_globalsets` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_info
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_info`;

CREATE TABLE `craft_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `edition` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siteName` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `siteUrl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `timezone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `on` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `maintenance` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_info` WRITE;
/*!40000 ALTER TABLE `craft_info` DISABLE KEYS */;

INSERT INTO `craft_info` (`id`, `version`, `schemaVersion`, `edition`, `siteName`, `siteUrl`, `timezone`, `on`, `maintenance`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'2.6.3015','2.6.14',2,'kittn','http://ktest10.local','UTC',1,0,'2017-07-04 21:44:58','2018-04-21 07:33:17','93fc1702-dfe7-473a-a405-2d9d312ddd7d');

/*!40000 ALTER TABLE `craft_info` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_locales
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_locales`;

CREATE TABLE `craft_locales` (
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`locale`),
  KEY `craft_locales_sortOrder_idx` (`sortOrder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_locales` WRITE;
/*!40000 ALTER TABLE `craft_locales` DISABLE KEYS */;

INSERT INTO `craft_locales` (`locale`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	('de',1,'2017-07-04 21:44:58','2017-07-04 21:44:58','3e21bf5b-11eb-4122-a0e5-92f81108417e'),
	('en',2,'2017-07-04 22:03:19','2017-07-04 22:03:19','52290675-308d-41c1-a0ae-06d4e87b5cc5');

/*!40000 ALTER TABLE `craft_locales` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_matrixblocks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_matrixblocks`;

CREATE TABLE `craft_matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `ownerLocale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_matrixblocks_ownerId_idx` (`ownerId`),
  KEY `craft_matrixblocks_fieldId_idx` (`fieldId`),
  KEY `craft_matrixblocks_typeId_idx` (`typeId`),
  KEY `craft_matrixblocks_sortOrder_idx` (`sortOrder`),
  KEY `craft_matrixblocks_ownerLocale_fk` (`ownerLocale`),
  CONSTRAINT `craft_matrixblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixblocks_ownerLocale_fk` FOREIGN KEY (`ownerLocale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_matrixblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `craft_matrixblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_matrixblocktypes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_matrixblocktypes`;

CREATE TABLE `craft_matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_matrixblocktypes_name_fieldId_unq_idx` (`name`,`fieldId`),
  UNIQUE KEY `craft_matrixblocktypes_handle_fieldId_unq_idx` (`handle`,`fieldId`),
  KEY `craft_matrixblocktypes_fieldId_fk` (`fieldId`),
  KEY `craft_matrixblocktypes_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_matrixblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_migrations`;

CREATE TABLE `craft_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pluginId` int(11) DEFAULT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_migrations_version_unq_idx` (`version`),
  KEY `craft_migrations_pluginId_fk` (`pluginId`),
  CONSTRAINT `craft_migrations_pluginId_fk` FOREIGN KEY (`pluginId`) REFERENCES `craft_plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_migrations` WRITE;
/*!40000 ALTER TABLE `craft_migrations` DISABLE KEYS */;

INSERT INTO `craft_migrations` (`id`, `pluginId`, `version`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,NULL,'m000000_000000_base','2017-07-04 21:44:58','2017-07-04 21:44:58','2017-07-04 21:44:58','b8340055-792f-414a-b90c-01f1758677ab'),
	(2,NULL,'m140730_000001_add_filename_and_format_to_transformindex','2017-07-04 21:44:58','2017-07-04 21:44:58','2017-07-04 21:44:58','cedf91c0-1c50-4559-8174-15b2b0691415'),
	(3,NULL,'m140815_000001_add_format_to_transforms','2017-07-04 21:44:58','2017-07-04 21:44:58','2017-07-04 21:44:58','f8b50e7f-7676-4b0f-9769-b3681deafaad'),
	(4,NULL,'m140822_000001_allow_more_than_128_items_per_field','2017-07-04 21:44:58','2017-07-04 21:44:58','2017-07-04 21:44:58','d2ee5fac-cec7-404d-88cc-699a429c4a4f'),
	(5,NULL,'m140829_000001_single_title_formats','2017-07-04 21:44:58','2017-07-04 21:44:58','2017-07-04 21:44:58','8c7eb847-161e-4976-9cb5-030d5582fc96'),
	(6,NULL,'m140831_000001_extended_cache_keys','2017-07-04 21:44:58','2017-07-04 21:44:58','2017-07-04 21:44:58','a618faed-d39e-4152-b9ac-4b2daf3749ab'),
	(7,NULL,'m140922_000001_delete_orphaned_matrix_blocks','2017-07-04 21:44:58','2017-07-04 21:44:58','2017-07-04 21:44:58','e6ac79c0-1d8e-43d3-9f4d-3dd2999562aa'),
	(8,NULL,'m141008_000001_elements_index_tune','2017-07-04 21:44:58','2017-07-04 21:44:58','2017-07-04 21:44:58','a79b368b-e495-41e5-a85f-de794ef0ce49'),
	(9,NULL,'m141009_000001_assets_source_handle','2017-07-04 21:44:58','2017-07-04 21:44:58','2017-07-04 21:44:58','02494c0d-c3de-40db-8667-0b0224875730'),
	(10,NULL,'m141024_000001_field_layout_tabs','2017-07-04 21:44:58','2017-07-04 21:44:58','2017-07-04 21:44:58','03893599-29d3-4e5f-9ff1-a1c22c21ed5b'),
	(11,NULL,'m141030_000000_plugin_schema_versions','2017-07-04 21:44:58','2017-07-04 21:44:58','2017-07-04 21:44:58','f31716c7-0dae-4fef-ad39-361a7550f0aa'),
	(12,NULL,'m141030_000001_drop_structure_move_permission','2017-07-04 21:44:58','2017-07-04 21:44:58','2017-07-04 21:44:58','4b5b8ce3-3333-4d83-ac57-01d93b387eee'),
	(13,NULL,'m141103_000001_tag_titles','2017-07-04 21:44:58','2017-07-04 21:44:58','2017-07-04 21:44:58','9a254aea-5b1e-4e0c-8e91-2130b98f2dcc'),
	(14,NULL,'m141109_000001_user_status_shuffle','2017-07-04 21:44:58','2017-07-04 21:44:58','2017-07-04 21:44:58','1b25b357-8665-4dbf-93bf-8fdca84a8959'),
	(15,NULL,'m141126_000001_user_week_start_day','2017-07-04 21:44:58','2017-07-04 21:44:58','2017-07-04 21:44:58','0b2cab6f-bba4-4bf7-a9a0-83f30566275b'),
	(16,NULL,'m150210_000001_adjust_user_photo_size','2017-07-04 21:44:58','2017-07-04 21:44:58','2017-07-04 21:44:58','0fac2af0-6f19-4b41-8b82-769f70a0c47d'),
	(17,NULL,'m150724_000001_adjust_quality_settings','2017-07-04 21:44:58','2017-07-04 21:44:58','2017-07-04 21:44:58','d75ac48d-3e1d-4817-be60-7e820ee1521e'),
	(18,NULL,'m150827_000000_element_index_settings','2017-07-04 21:44:58','2017-07-04 21:44:58','2017-07-04 21:44:58','41360dcd-ee61-49f9-b5af-ede1756750a4'),
	(19,NULL,'m150918_000001_add_colspan_to_widgets','2017-07-04 21:44:58','2017-07-04 21:44:58','2017-07-04 21:44:58','28bb403b-d1f2-498e-88dc-95e88ad4f496'),
	(20,NULL,'m151007_000000_clear_asset_caches','2017-07-04 21:44:58','2017-07-04 21:44:58','2017-07-04 21:44:58','82769e18-e8b5-4155-ba54-8ab6d6638e22'),
	(21,NULL,'m151109_000000_text_url_formats','2017-07-04 21:44:58','2017-07-04 21:44:58','2017-07-04 21:44:58','1c8c9b53-d2dc-419e-8bcd-25f85949a8f6'),
	(22,NULL,'m151110_000000_move_logo','2017-07-04 21:44:58','2017-07-04 21:44:58','2017-07-04 21:44:58','fcd34ff4-f676-4a22-ac53-b94fb89dffe2'),
	(23,NULL,'m151117_000000_adjust_image_widthheight','2017-07-04 21:44:58','2017-07-04 21:44:58','2017-07-04 21:44:58','fb917586-0e66-4302-af06-75ffd95fa713'),
	(24,NULL,'m151127_000000_clear_license_key_status','2017-07-04 21:44:58','2017-07-04 21:44:58','2017-07-04 21:44:58','bb19f5f7-924b-484b-bdc9-afe3403ec539'),
	(25,NULL,'m151127_000000_plugin_license_keys','2017-07-04 21:44:58','2017-07-04 21:44:58','2017-07-04 21:44:58','a3a68499-5400-44e7-9dad-1096d50f94b1'),
	(26,NULL,'m151130_000000_update_pt_widget_feeds','2017-07-04 21:44:58','2017-07-04 21:44:58','2017-07-04 21:44:58','e6c6bdf6-f97b-4d4d-bb80-27cf6b7e2dcc'),
	(27,NULL,'m160114_000000_asset_sources_public_url_default_true','2017-07-04 21:44:58','2017-07-04 21:44:58','2017-07-04 21:44:58','67ae50dc-0852-4c47-ae6b-a410b054e310'),
	(28,NULL,'m160223_000000_sortorder_to_smallint','2017-07-04 21:44:58','2017-07-04 21:44:58','2017-07-04 21:44:58','7c42bc99-fb53-4d2d-bc11-7c3e48095dd9'),
	(29,NULL,'m160229_000000_set_default_entry_statuses','2017-07-04 21:44:58','2017-07-04 21:44:58','2017-07-04 21:44:58','95e8f27e-7189-4337-aa35-f731b2dbf244'),
	(30,NULL,'m160304_000000_client_permissions','2017-07-04 21:44:58','2017-07-04 21:44:58','2017-07-04 21:44:58','c1671c20-26a6-40cf-a466-6892db56b985'),
	(31,NULL,'m160322_000000_asset_filesize','2017-07-04 21:44:58','2017-07-04 21:44:58','2017-07-04 21:44:58','a701431e-4383-4e4b-b5b2-ad8bc5926b2a'),
	(32,NULL,'m160503_000000_orphaned_fieldlayouts','2017-07-04 21:44:58','2017-07-04 21:44:58','2017-07-04 21:44:58','4367be4c-2a0d-4847-a2ac-a932529ce6f3'),
	(33,NULL,'m160510_000000_tasksettings','2017-07-04 21:44:58','2017-07-04 21:44:58','2017-07-04 21:44:58','954a5cbd-2365-4cd1-8296-60d8ad29244f'),
	(34,NULL,'m160829_000000_pending_user_content_cleanup','2017-07-04 21:44:58','2017-07-04 21:44:58','2017-07-04 21:44:58','4f60b364-1513-4b8f-8c87-41ed95246a06'),
	(35,NULL,'m160830_000000_asset_index_uri_increase','2017-07-04 21:44:58','2017-07-04 21:44:58','2017-07-04 21:44:58','a24fd37e-d7b2-4fc5-aaa7-9489650cbfe1'),
	(36,NULL,'m160919_000000_usergroup_handle_title_unique','2017-07-04 21:44:58','2017-07-04 21:44:58','2017-07-04 21:44:58','a3d767f6-47ec-4544-ac84-788f3308f3b5'),
	(37,NULL,'m161108_000000_new_version_format','2017-07-04 21:44:58','2017-07-04 21:44:58','2017-07-04 21:44:58','89a3bdfa-104b-489f-aeba-919063603bd7'),
	(38,NULL,'m161109_000000_index_shuffle','2017-07-04 21:44:58','2017-07-04 21:44:58','2017-07-04 21:44:58','8c40673a-d076-41f2-916a-f6bc11d0a55e'),
	(39,NULL,'m170612_000000_route_index_shuffle','2017-07-04 21:44:58','2017-07-04 21:44:58','2017-07-04 21:44:58','aa77ef66-6ab6-429c-9bed-264f9eebc1a2'),
	(40,3,'m150901_144609_superTable_fixForContentTables','2017-07-04 21:59:47','2017-07-04 21:59:47','2017-07-04 21:59:47','d2c9ff38-d335-4354-81a9-82c4d8c62b9f'),
	(41,4,'m151225_000000_seomatic_addHumansField','2017-07-04 21:59:51','2017-07-04 21:59:51','2017-07-04 21:59:51','e27eb793-2e26-4056-812e-2abd90e775e7'),
	(42,4,'m151226_000000_seomatic_addTwitterFacebookFields','2017-07-04 21:59:51','2017-07-04 21:59:51','2017-07-04 21:59:51','d8122bbd-0b50-43cf-b160-cdcc8642be9a'),
	(43,4,'m160101_000000_seomatic_addRobotsFields','2017-07-04 21:59:51','2017-07-04 21:59:51','2017-07-04 21:59:51','7dc9938e-cc44-4967-8a6c-0d9c0d9bb2cc'),
	(44,4,'m160111_000000_seomatic_addTitleFields','2017-07-04 21:59:51','2017-07-04 21:59:51','2017-07-04 21:59:51','b3328adb-f637-47de-a693-ee8e83dff2a8'),
	(45,4,'m160122_000000_seomatic_addTypeFields','2017-07-04 21:59:51','2017-07-04 21:59:51','2017-07-04 21:59:51','32ed799f-226d-41df-9867-20d7b0831240'),
	(46,4,'m160123_000000_seomatic_addOpeningHours','2017-07-04 21:59:51','2017-07-04 21:59:51','2017-07-04 21:59:51','3bc8664e-16a8-4f36-b668-358446baabac'),
	(47,4,'m160202_000000_seomatic_addSocialHandles','2017-07-04 21:59:51','2017-07-04 21:59:51','2017-07-04 21:59:51','4f6c22f3-3fce-4a7b-a925-de254fbeba7d'),
	(48,4,'m160204_000000_seomatic_addGoogleAnalytics','2017-07-04 21:59:51','2017-07-04 21:59:51','2017-07-04 21:59:51','e4897218-d213-44d9-9a69-da23de4962d8'),
	(49,4,'m160205_000000_seomatic_addResturantMenu','2017-07-04 21:59:51','2017-07-04 21:59:51','2017-07-04 21:59:51','9509ca8c-ae83-4fe4-a46d-0ee7bcbe5962'),
	(50,4,'m160206_000000_seomatic_addGoogleAnalyticsPlugins','2017-07-04 21:59:51','2017-07-04 21:59:51','2017-07-04 21:59:51','feebebc6-659d-4fbf-9a88-017ca0776f7e'),
	(51,4,'m160206_000000_seomatic_addGoogleAnalyticsSendPageView','2017-07-04 21:59:51','2017-07-04 21:59:51','2017-07-04 21:59:51','f156459d-801d-4f14-b17e-73387cc67d43'),
	(52,4,'m160209_000000_seomatic_alterDescriptionsColumns','2017-07-04 21:59:51','2017-07-04 21:59:51','2017-07-04 21:59:51','9deac345-c605-4cfb-bb42-a63ca3360276'),
	(53,4,'m160209_000001_seomatic_addRobotsTxt','2017-07-04 21:59:51','2017-07-04 21:59:51','2017-07-04 21:59:51','f8eeda8e-3a08-4308-8feb-65c78e1e8d0e'),
	(54,4,'m160227_000000_seomatic_addFacebookAppId','2017-07-04 21:59:51','2017-07-04 21:59:51','2017-07-04 21:59:51','7ca79c74-ac95-4bd9-a1a5-3b59ac6117e1'),
	(55,4,'m160416_000000_seomatic_addContactPoints','2017-07-04 21:59:51','2017-07-04 21:59:51','2017-07-04 21:59:51','f530d3ea-a863-446f-a97f-d45cc71914e7'),
	(56,4,'m160509_000000_seomatic_addSiteLinksBing','2017-07-04 21:59:51','2017-07-04 21:59:51','2017-07-04 21:59:51','fa634ce4-c863-4428-8e0f-28d6b71d1db5'),
	(57,4,'m160707_000000_seomatic_addGoogleTagManager','2017-07-04 21:59:51','2017-07-04 21:59:51','2017-07-04 21:59:51','516c5426-8a06-4d32-b4c2-0af1c69fdc92'),
	(58,4,'m160715_000000_seomatic_addSeoImageTransforms','2017-07-04 21:59:51','2017-07-04 21:59:51','2017-07-04 21:59:51','54621984-ca1f-48ef-980a-3748b7862ce6'),
	(59,4,'m160723_000000_seomatic_addSeoMainEntityOfPage','2017-07-04 21:59:51','2017-07-04 21:59:51','2017-07-04 21:59:51','0425965a-fff9-4263-a694-2217464f002f'),
	(60,4,'m160724_000000_seomatic_addSeoMainEntityCategory','2017-07-04 21:59:51','2017-07-04 21:59:51','2017-07-04 21:59:51','568b460e-e1ec-439a-bb60-60459cc0ba74'),
	(61,4,'m160811_000000_seomatic_addVimeo','2017-07-04 21:59:51','2017-07-04 21:59:51','2017-07-04 21:59:51','9f8bf326-8076-48c7-ad8f-333863723208'),
	(62,4,'m160904_000000_seomatic_addTwitterFacebookImages','2017-07-04 21:59:51','2017-07-04 21:59:51','2017-07-04 21:59:51','5216f0dd-7359-46c3-82aa-27f8ca8235eb'),
	(63,4,'m161220_000000_seomatic_addPriceRange','2017-07-04 21:59:51','2017-07-04 21:59:51','2017-07-04 21:59:51','be25fda9-eda9-4c60-8272-812ff6715929'),
	(64,4,'m170212_000000_seomatic_addGoogleAnalyticsAnonymizeIp','2017-07-04 21:59:51','2017-07-04 21:59:51','2017-07-04 21:59:51','4c8cde8a-89b3-4477-8004-0ecb0ba66231'),
	(65,4,'m170212_000000_seomatic_addWikipedia','2017-07-04 21:59:51','2017-07-04 21:59:51','2017-07-04 21:59:51','55b1ed8f-346d-4462-86c8-253f94ed5290'),
	(66,5,'m160428_202308_Neo_UpdateBlockLevels','2017-07-04 22:00:00','2017-07-04 22:00:00','2017-07-04 22:00:00','86a43535-6659-450e-be59-2ffd99047d94'),
	(67,5,'m160515_005002_Neo_UpdateBlockStructure','2017-07-04 22:00:00','2017-07-04 22:00:00','2017-07-04 22:00:00','236b5cf4-f881-4f17-bcaa-fb28084f0b2b'),
	(68,5,'m160605_191540_Neo_UpdateBlockStructureLocales','2017-07-04 22:00:00','2017-07-04 22:00:00','2017-07-04 22:00:00','47e4f6ef-1462-4932-bda8-6e06df13bf40'),
	(69,5,'m161029_230849_Neo_AddMaxChildBlocksSetting','2017-07-04 22:00:00','2017-07-04 22:00:00','2017-07-04 22:00:00','732bb4d6-bb78-46c5-b5bb-06eff6679887'),
	(70,6,'m160208_010101_FruitLinkIt_UpdateExistingLinkItFields','2017-07-04 22:00:03','2017-07-04 22:00:03','2017-07-04 22:00:03','926c9b73-4bde-405a-bf76-c476ad5fe3c7'),
	(71,13,'m170614_141800_amCommand_defaultElementTypeSettings','2017-07-04 22:00:14','2017-07-04 22:00:14','2017-07-04 22:00:14','a8805fea-13e1-4f0f-aa0e-e7fc7eb5f905'),
	(72,14,'m150212_145000_AmNav_renamePagesToNodes','2017-07-04 22:00:16','2017-07-04 22:00:16','2017-07-04 22:00:16','4cd5b38f-ce87-4827-9990-3ac9ee6f3014'),
	(73,14,'m150217_112800_AmNav_expandPageData','2017-07-04 22:00:16','2017-07-04 22:00:16','2017-07-04 22:00:16','3e4e49a3-9d96-4219-a381-519c154c7d9d'),
	(74,14,'m150403_093000_AmNav_nodesWithElements','2017-07-04 22:00:16','2017-07-04 22:00:16','2017-07-04 22:00:16','01f202f3-8d84-4c71-967f-eed42a68b318'),
	(75,14,'m150512_105600_AmNav_addOptionalClass','2017-07-04 22:00:16','2017-07-04 22:00:16','2017-07-04 22:00:16','9ea4a7ca-63ef-41c0-8933-a9ca47f59734'),
	(76,NULL,'m171107_000000_assign_group_permissions','2018-03-07 09:33:05','2018-03-07 09:33:05','2018-03-07 09:33:05','a09af626-bd01-445c-8fb3-fd88084b926f'),
	(77,NULL,'m171117_000001_templatecache_index_tune','2018-03-07 09:33:05','2018-03-07 09:33:05','2018-03-07 09:33:05','a935d6a9-a30c-46c0-8953-31e1ef123db0'),
	(78,NULL,'m171204_000001_templatecache_index_tune_deux','2018-03-07 09:33:05','2018-03-07 09:33:05','2018-03-07 09:33:05','bf3b22bf-2660-42da-95b1-7af324e9da14'),
	(79,NULL,'m180406_000000_pro_upgrade','2018-04-11 23:04:35','2018-04-11 23:04:35','2018-04-11 23:04:35','3c2b2add-5a2e-4a98-8786-39da1c038109');

/*!40000 ALTER TABLE `craft_migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_neoblocks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_neoblocks`;

CREATE TABLE `craft_neoblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) DEFAULT NULL,
  `collapsed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ownerLocale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_neoblocks_ownerId_idx` (`ownerId`),
  KEY `craft_neoblocks_fieldId_idx` (`fieldId`),
  KEY `craft_neoblocks_typeId_idx` (`typeId`),
  KEY `craft_neoblocks_collapsed_idx` (`collapsed`),
  KEY `craft_neoblocks_ownerLocale_fk` (`ownerLocale`),
  CONSTRAINT `craft_neoblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_neoblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_neoblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_neoblocks_ownerLocale_fk` FOREIGN KEY (`ownerLocale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_neoblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `craft_neoblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_neoblocks` WRITE;
/*!40000 ALTER TABLE `craft_neoblocks` DISABLE KEYS */;

INSERT INTO `craft_neoblocks` (`id`, `ownerId`, `fieldId`, `typeId`, `collapsed`, `ownerLocale`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(59,2,152,1,0,NULL,'2018-03-07 12:25:19','2018-04-21 07:29:52','f8d54909-5167-492f-af0f-79af63fe4a03');

/*!40000 ALTER TABLE `craft_neoblocks` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_neoblockstructures
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_neoblockstructures`;

CREATE TABLE `craft_neoblockstructures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `ownerLocale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_neoblockstructures_structureId_idx` (`structureId`),
  KEY `craft_neoblockstructures_ownerId_idx` (`ownerId`),
  KEY `craft_neoblockstructures_fieldId_idx` (`fieldId`),
  KEY `craft_neoblockstructures_ownerLocale_fk` (`ownerLocale`),
  CONSTRAINT `craft_neoblockstructures_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_neoblockstructures_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_neoblockstructures_ownerLocale_fk` FOREIGN KEY (`ownerLocale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_neoblockstructures_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_neoblockstructures` WRITE;
/*!40000 ALTER TABLE `craft_neoblockstructures` DISABLE KEYS */;

INSERT INTO `craft_neoblockstructures` (`id`, `structureId`, `ownerId`, `fieldId`, `ownerLocale`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(2,6,11,152,NULL,'2017-07-16 14:05:54','2017-07-16 14:05:54','bbaf9aa4-4c2d-4bb9-97e2-bb037c4da963'),
	(17,32,2,152,NULL,'2018-04-21 07:29:52','2018-04-21 07:29:52','c7eaf049-0e28-4699-9e05-4a29eb4c2dfe');

/*!40000 ALTER TABLE `craft_neoblockstructures` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_neoblocktypes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_neoblocktypes`;

CREATE TABLE `craft_neoblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `maxBlocks` int(10) DEFAULT '0',
  `maxChildBlocks` int(10) DEFAULT '0',
  `childBlocks` text COLLATE utf8_unicode_ci,
  `topLevel` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_neoblocktypes_name_fieldId_unq_idx` (`name`,`fieldId`),
  UNIQUE KEY `craft_neoblocktypes_handle_fieldId_unq_idx` (`handle`,`fieldId`),
  KEY `craft_neoblocktypes_fieldId_fk` (`fieldId`),
  KEY `craft_neoblocktypes_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_neoblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_neoblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_neoblocktypes` WRITE;
/*!40000 ALTER TABLE `craft_neoblocktypes` DISABLE KEYS */;

INSERT INTO `craft_neoblocktypes` (`id`, `fieldId`, `fieldLayoutId`, `name`, `handle`, `maxBlocks`, `maxChildBlocks`, `childBlocks`, `topLevel`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,152,284,'Headline','objHeadline',NULL,NULL,'',1,2,'2017-07-04 22:01:04','2018-04-21 00:04:43','f055bfc6-7e76-45b1-bde8-455d25b450ac'),
	(2,152,285,'Richtext','objRichtext',NULL,NULL,'',1,3,'2017-07-04 22:01:04','2018-04-21 00:04:43','864e6620-9da7-43de-8bbb-a6a52590de1b'),
	(3,152,286,'Markdown','objMarkdown',NULL,NULL,'',1,4,'2017-07-04 22:01:04','2018-04-21 00:04:43','b90d13dd-249d-40a6-ae80-41fb5cf10c4c'),
	(4,152,287,'Liste','objList',NULL,NULL,'',1,5,'2017-07-04 22:01:04','2018-04-21 00:04:43','624a6762-32cd-46ff-8d6e-5c3f70336598'),
	(5,152,288,'Zitat','objQuote',NULL,NULL,'',1,6,'2017-07-04 22:01:04','2018-04-21 00:04:43','9f474bf6-d89c-40aa-826f-c3d9062cee86'),
	(6,152,289,'Media Image','objMediaImage',NULL,NULL,'',1,8,'2017-07-04 22:01:04','2018-04-21 00:04:43','649e5448-3894-4d87-8879-2514de51db39'),
	(7,152,291,'Embed Content','objEmbedContent',NULL,NULL,'',1,10,'2017-07-04 22:01:04','2018-04-21 00:04:43','8fa6355a-5091-4a6f-bd58-36428f8f8acf'),
	(8,152,294,'Card','objCard',NULL,NULL,'',1,13,'2017-07-04 22:01:04','2018-04-21 00:04:43','ba30a8cd-ee6d-449a-9cdc-f42a48a6f8f6'),
	(9,152,295,'Galerie','objGallery',NULL,NULL,'',1,14,'2017-07-04 22:01:04','2018-04-21 00:04:43','c1247b4d-e62f-4137-abe8-67b4db67ba30'),
	(10,152,296,'Image Slider','objImageSlider',NULL,NULL,'',1,15,'2017-07-04 22:01:04','2018-04-21 00:04:43','5c002005-57dd-477b-80c8-2b2ccb13787c'),
	(11,152,297,'Card Slider','objCardSlider',NULL,NULL,'[\"objCard\"]',1,16,'2017-07-04 22:01:04','2018-04-21 00:04:43','2d3d3e22-d66f-4299-be00-38d169fa637b'),
	(12,152,298,'Button','objButton',NULL,NULL,'',1,18,'2017-07-04 22:01:04','2018-04-21 00:04:43','eba3c8b7-e364-49c6-bdc3-876561d406e6'),
	(13,152,299,'Slide Out Box','objSlideOutBox',NULL,NULL,'',1,19,'2017-07-04 22:01:04','2018-04-21 00:04:43','68d1330a-0deb-4364-9089-ec7e5c255216'),
	(14,152,300,'Jumpnavigation','objJumpNavigation',NULL,NULL,'',1,20,'2017-07-04 22:01:04','2018-04-21 00:04:43','2649b185-9815-4617-8333-c922647fcf14'),
	(15,152,301,'Anker','objAnchor',NULL,NULL,'',1,22,'2017-07-04 22:01:04','2018-04-21 00:04:43','95028e2c-fa1e-4ed6-9a6a-20c6c56d9c57'),
	(16,152,302,'Trennlinie','objHorizontalRuler',NULL,NULL,'',1,23,'2017-07-04 22:01:04','2018-04-21 00:04:43','e5b8aaf1-9d2d-469b-a9d9-b7fa9d30d39d'),
	(17,152,303,'Spacer','objSpacer',NULL,NULL,'',1,24,'2017-07-04 22:01:04','2018-04-21 00:04:43','dfd63527-b120-4624-aebb-2bf0410882b8'),
	(20,152,307,'Accordion Wrapper','objAccordionWrapper',NULL,NULL,'[\"objAccordion\"]',1,29,'2017-07-04 22:01:04','2018-04-21 00:04:43','c4677ae2-9e9a-43f8-86c6-292c6b17b0d9'),
	(21,152,308,'Accordion','objAccordion',NULL,NULL,'[\"objHeadline\",\"objRichtext\",\"objMarkdown\",\"objList\",\"objQuote\",\"objMediaImage\",\"objVideo\",\"objEmbedContent\",\"objInlineSvg\",\"objInstagram\",\"objCard\",\"objGallery\",\"objImageSlider\",\"objCardSlider\",\"objButton\",\"objSlideOutBox\",\"objJumpNavigation\",\"objAnchor\",\"objHorizontalRuler\",\"objSpacer\",\"objGeneric\"]',0,30,'2017-07-04 22:01:04','2018-04-21 00:04:43','e4de33bc-8df9-4525-8bf9-b5e0a093b403'),
	(22,152,309,'Tab Wrapper','objTabWrapper',NULL,NULL,'[\"objTab\"]',1,31,'2017-07-04 22:01:04','2018-04-21 00:04:43','7206c647-813b-427a-823f-dec23a58f927'),
	(23,152,310,'Tab','objTab',NULL,NULL,'[\"objHeadline\",\"objRichtext\",\"objMarkdown\",\"objList\",\"objQuote\",\"objMediaImage\",\"objVideo\",\"objEmbedContent\",\"objInlineSvg\",\"objInstagram\",\"objCard\",\"objGallery\",\"objImageSlider\",\"objCardSlider\",\"objButton\",\"objSlideOutBox\",\"objJumpNavigation\",\"objAnchor\",\"objHorizontalRuler\",\"objSpacer\",\"objGeneric\"]',0,32,'2017-07-04 22:01:04','2018-04-21 00:04:43','09d2f11f-de17-4648-932c-83417b833cd7'),
	(24,152,305,'Grid Wrapper','objGrid',NULL,NULL,'[\"objGridBox\"]',1,27,'2018-03-07 10:24:37','2018-04-21 00:04:43','83c7c770-daae-4c13-b9b7-93abc7ae91d5'),
	(25,152,306,'Grid Box','objGridBox',NULL,NULL,'[\"objHeadline\",\"objRichtext\",\"objMarkdown\",\"objList\",\"objQuote\",\"objMediaImage\",\"objVideo\",\"objEmbedContent\",\"objInlineSvg\",\"objInstagram\",\"objCard\",\"objGallery\",\"objImageSlider\",\"objCardSlider\",\"objButton\",\"objSlideOutBox\",\"objJumpNavigation\",\"objAnchor\",\"objHorizontalRuler\",\"objSpacer\",\"objGeneric\",\"objAccordionWrapper\",\"objTabWrapper\"]',0,28,'2018-03-07 10:24:37','2018-04-21 00:04:43','a117efce-01d8-4e85-af91-569d820cd8fd'),
	(26,152,292,'Inline SVG','objInlineSvg',NULL,NULL,'',1,11,'2018-03-17 15:02:10','2018-04-21 00:04:43','c04c3673-d1f2-480d-aa35-b2731057bf4a'),
	(27,152,304,'Generic','objGeneric',NULL,NULL,'',1,25,'2018-03-17 15:10:28','2018-04-21 00:04:43','cf723ddd-7f96-4e74-8d55-d0be31238a78'),
	(28,152,293,'Instagram','objInstagram',NULL,NULL,'',1,12,'2018-03-19 17:21:29','2018-04-21 00:04:43','498e9614-b366-4071-8b71-fcb4c8fb6019'),
	(29,152,290,'Video','objVideo',NULL,NULL,'',1,9,'2018-04-20 23:53:26','2018-04-21 00:04:43','cb226178-0980-464e-8f35-1c8f7696b65b');

/*!40000 ALTER TABLE `craft_neoblocktypes` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_neogroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_neogroups`;

CREATE TABLE `craft_neogroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_neogroups_fieldId_fk` (`fieldId`),
  CONSTRAINT `craft_neogroups_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_neogroups` WRITE;
/*!40000 ALTER TABLE `craft_neogroups` DISABLE KEYS */;

INSERT INTO `craft_neogroups` (`id`, `fieldId`, `name`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(31,152,'Textmodule',1,'2018-04-21 00:04:43','2018-04-21 00:04:43','49897b47-650e-4479-af86-a6b6d15a1b40'),
	(32,152,'Mediamodule',7,'2018-04-21 00:04:43','2018-04-21 00:04:43','b319ce55-c7bf-4348-85da-d4d037c60324'),
	(33,152,'Interaktiv',17,'2018-04-21 00:04:43','2018-04-21 00:04:43','a414ccba-0e91-4ef2-94d7-40527b5f311a'),
	(34,152,'Layout',21,'2018-04-21 00:04:43','2018-04-21 00:04:43','4672b2cb-13ef-4cae-89ae-a4568179dc51'),
	(35,152,'Wrapper',26,'2018-04-21 00:04:43','2018-04-21 00:04:43','5155772c-bdb8-49aa-ae3c-ade5daf4b51f');

/*!40000 ALTER TABLE `craft_neogroups` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_plugins
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_plugins`;

CREATE TABLE `craft_plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `licenseKey` char(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `licenseKeyStatus` enum('valid','invalid','mismatched','unknown') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `settings` text COLLATE utf8_unicode_ci,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_plugins` WRITE;
/*!40000 ALTER TABLE `craft_plugins` DISABLE KEYS */;

INSERT INTO `craft_plugins` (`id`, `class`, `version`, `schemaVersion`, `licenseKey`, `licenseKeyStatus`, `enabled`, `settings`, `installDate`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'VideoEmbedUtility','1.0.0',NULL,NULL,'unknown',1,NULL,'2017-07-04 21:59:41','2017-07-04 21:59:41','2018-04-21 07:33:21','31aff914-5d66-498e-8624-8db638cb587f'),
	(3,'SuperTable','1.0.6','1.0.0',NULL,'unknown',1,NULL,'2017-07-04 21:59:47','2017-07-04 21:59:47','2018-04-21 07:33:21','e6518585-e7b6-4b4c-9aec-d8e6828f015e'),
	(4,'Seomatic','1.1.56','1.1.25',NULL,'unknown',1,NULL,'2017-07-04 21:59:51','2017-07-04 21:59:51','2018-04-21 07:33:21','c4962d5a-4ee2-47be-8081-563112f7196a'),
	(5,'Neo','1.4.1','1.4.1',NULL,'unknown',1,NULL,'2017-07-04 21:59:59','2017-07-04 21:59:59','2018-04-21 07:33:21','8c41f74e-116e-458f-a3ed-9cc0d6f5ca36'),
	(6,'FruitLinkIt','2.3.1','2.3.0',NULL,'unknown',1,NULL,'2017-07-04 22:00:03','2017-07-04 22:00:03','2018-04-21 07:33:21','504294b1-8dd4-4248-8074-d11406edf511'),
	(7,'Kint','1.1.0','1.0.0',NULL,'unknown',1,NULL,'2017-07-04 22:00:05','2017-07-04 22:00:05','2018-04-21 07:33:21','f2f131a6-6f87-4af9-af71-9c2379379854'),
	(8,'Imager','1.6.4','1.0.0',NULL,'unknown',1,NULL,'2017-07-04 22:00:07','2017-07-04 22:00:07','2018-04-21 07:33:21','5e3e3de6-61e4-403d-88a6-b43453cd9c0d'),
	(10,'FocalPointField','1.0.2',NULL,NULL,'unknown',1,NULL,'2017-07-04 22:00:10','2017-07-04 22:00:10','2018-04-21 07:33:21','ec35c904-1c8a-4949-8b8e-558f3fe71d26'),
	(11,'CpSortCols','1.1.2','1.0',NULL,'unknown',1,NULL,'2017-07-04 22:00:11','2017-07-04 22:00:11','2018-04-21 07:33:21','2cd4639c-0835-499e-8bad-2cba17990a53'),
	(12,'CpFieldLinks','1.2.2','1.0',NULL,'unknown',1,NULL,'2017-07-04 22:00:13','2017-07-04 22:00:13','2018-04-21 07:33:21','c3d42938-cfa6-4fda-9015-7ee0e1ef6028'),
	(13,'AmCommand','2.2.0','2.0.1',NULL,'unknown',1,NULL,'2017-07-04 22:00:14','2017-07-04 22:00:14','2018-04-21 07:33:21','3f58dc7b-4598-485d-90d0-06d1f8858913'),
	(14,'AmNav','1.8.0','1.7.4',NULL,'unknown',1,NULL,'2017-07-04 22:00:16','2017-07-04 22:00:16','2018-04-21 07:33:21','97e2ac50-e4f9-4ba4-830c-528e327cbcb3'),
	(15,'Doxter','1.3.0','1.0.0',NULL,'unknown',1,NULL,'2017-07-04 22:00:18','2017-07-04 22:00:18','2018-04-21 07:33:21','ae688b87-4326-4d79-a318-70e2c2341473'),
	(16,'CacheBuster','1.2.2',NULL,NULL,'unknown',1,NULL,'2017-07-16 10:44:47','2017-07-16 10:44:47','2018-04-21 07:33:21','4a1d2384-a561-4ba4-a3cb-e723bd5463ce'),
	(17,'Cookies','1.0.4','1.0.0',NULL,'unknown',1,NULL,'2017-07-16 10:44:50','2017-07-16 10:44:50','2018-04-21 07:33:21','16d937e0-3a99-49ad-86c7-5eec44be75a8'),
	(18,'Lj_DynamicFields','0.6',NULL,NULL,'unknown',1,NULL,'2018-03-07 10:14:12','2018-03-07 10:14:12','2018-04-21 07:33:21','06dd6872-c2fc-4324-8e79-cfaa675f4186'),
	(20,'MigrationManager','1.0.9.0','1.0.0',NULL,'unknown',1,NULL,'2018-03-07 13:27:31','2018-03-07 13:27:31','2018-04-21 07:33:21','9909151b-63f6-4d8c-bb4f-6ec464252056'),
	(21,'AceFreely','1.0',NULL,NULL,'unknown',1,NULL,'2018-03-17 14:53:27','2018-03-17 14:53:27','2018-04-21 07:33:21','186624f0-4cce-4170-bc1c-68a0dd1e130f'),
	(22,'Inlin','1.1',NULL,NULL,'unknown',1,NULL,'2018-03-17 14:53:31','2018-03-17 14:53:31','2018-04-21 07:33:21','54647329-19bf-47a3-a445-cf4a953a564a'),
	(24,'MnTwigPerversion','1.3.0','1.0.0',NULL,'unknown',1,NULL,'2018-04-06 15:24:44','2018-04-06 15:24:44','2018-04-21 07:33:21','5d68166b-1984-4e48-9694-fa3593c1d798');

/*!40000 ALTER TABLE `craft_plugins` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_rackspaceaccess
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_rackspaceaccess`;

CREATE TABLE `craft_rackspaceaccess` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `connectionKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `storageUrl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cdnUrl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_rackspaceaccess_connectionKey_unq_idx` (`connectionKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_relations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_relations`;

CREATE TABLE `craft_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceLocale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_relations_fieldId_sourceId_sourceLocale_targetId_unq_idx` (`fieldId`,`sourceId`,`sourceLocale`,`targetId`),
  KEY `craft_relations_sourceId_fk` (`sourceId`),
  KEY `craft_relations_sourceLocale_fk` (`sourceLocale`),
  KEY `craft_relations_targetId_fk` (`targetId`),
  CONSTRAINT `craft_relations_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_relations_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_relations_sourceLocale_fk` FOREIGN KEY (`sourceLocale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_relations_targetId_fk` FOREIGN KEY (`targetId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_relations` WRITE;
/*!40000 ALTER TABLE `craft_relations` DISABLE KEYS */;

INSERT INTO `craft_relations` (`id`, `fieldId`, `sourceId`, `sourceLocale`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(17,250,135,NULL,148,1,'2018-04-21 10:47:51','2018-04-21 10:47:51','4edc6d79-05fd-4ee8-8da6-ed9a9dc61ed5');

/*!40000 ALTER TABLE `craft_relations` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_routes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_routes`;

CREATE TABLE `craft_routes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `urlParts` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `urlPattern` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_routes_locale_idx` (`locale`),
  KEY `craft_routes_urlPattern_idx` (`urlPattern`),
  CONSTRAINT `craft_routes_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_routes` WRITE;
/*!40000 ALTER TABLE `craft_routes` DISABLE KEYS */;

INSERT INTO `craft_routes` (`id`, `locale`, `urlParts`, `urlPattern`, `template`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,NULL,'[\"rss\"]','rss','rss/blog.rss',1,'2017-07-04 22:01:04','2017-07-04 22:01:04','5a35020f-5e89-427f-adcc-44c2fd96fb27'),
	(2,NULL,'[\"feed\"]','feed','rss/blog.rss',2,'2017-07-04 22:01:04','2017-07-04 22:01:04','48daf66b-33c0-494d-aa62-bb45b08d8f66'),
	(3,NULL,'[\"rss\\/blog.rss\"]','rss\\/blog\\.rss','rss/blog.rss',3,'2017-07-04 22:01:04','2017-07-04 22:01:04','d24cf92c-17d0-4f17-91cd-4ef6e25f5e03');

/*!40000 ALTER TABLE `craft_routes` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_searchindex
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_searchindex`;

CREATE TABLE `craft_searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fieldId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `keywords` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`locale`),
  FULLTEXT KEY `craft_searchindex_keywords_idx` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_searchindex` WRITE;
/*!40000 ALTER TABLE `craft_searchindex` DISABLE KEYS */;

INSERT INTO `craft_searchindex` (`elementId`, `attribute`, `fieldId`, `locale`, `keywords`)
VALUES
	(1,'username',0,'de',' kittn '),
	(1,'firstname',0,'de',''),
	(1,'lastname',0,'de',''),
	(1,'fullname',0,'de',''),
	(1,'email',0,'de',' hello kittn xyz '),
	(1,'slug',0,'de',''),
	(2,'slug',0,'de',' homepage '),
	(2,'title',0,'de',' home '),
	(2,'field',1,'de',' it s true this site doesn t have a whole lot of content yet but don t worry our web developers have just installed the cms and they re setting things up for the content editors this very moment soon ktest10 local will be an oasis of fresh perspectives sharp analyses and astute opinions that will keep you coming back again and again '),
	(7,'slug',0,'de',' carousel '),
	(7,'title',0,'de',' carousel '),
	(7,'field',137,'en',' 0 default 0 center three '),
	(7,'field',130,'en',' default 0 default 0 0 1 '),
	(7,'slug',0,'en',' carousel '),
	(7,'title',0,'en',' carousel '),
	(7,'field',130,'de',' default 0 default 0 0 1 '),
	(7,'field',137,'de',' 0 default 0 center three '),
	(4,'slug',0,'de',' 404 '),
	(4,'title',0,'de',' 404 '),
	(5,'field',31,'de',''),
	(5,'slug',0,'de',''),
	(6,'field',144,'de',''),
	(6,'field',32,'de',''),
	(6,'slug',0,'de',''),
	(2,'field',152,'de',''),
	(2,'field',62,'de',''),
	(2,'field',124,'de',' 1 de 1 0 template creativework article home home summary_large_image article all home home field title field title custom title field field field '),
	(4,'field',152,'de',''),
	(4,'field',42,'de',''),
	(4,'field',46,'de',''),
	(4,'field',43,'de',''),
	(5,'field',31,'en',''),
	(6,'field',144,'en',''),
	(6,'field',32,'en',''),
	(136,'field',176,'de',''),
	(136,'field',177,'de',' 0 '),
	(136,'field',174,'de',''),
	(136,'field',175,'de',''),
	(135,'field',250,'en',' 2 colum grid grid '),
	(132,'field',185,'en',' box1 box2 box1 box2 '),
	(132,'field',189,'en',' 0 '),
	(132,'field',190,'en',''),
	(132,'field',187,'en',' box 1 box 2 '),
	(10,'field',63,'de',''),
	(10,'field',64,'de',''),
	(10,'field',65,'de',''),
	(10,'slug',0,'de',''),
	(4,'field',152,'en',''),
	(4,'field',42,'en',''),
	(4,'field',46,'en',''),
	(4,'field',43,'en',''),
	(2,'field',152,'en',''),
	(2,'field',62,'en',''),
	(2,'field',124,'en',' 1 0 de 1 0 template creativework article home home summary_large_image article all home home field title field title custom title field field field '),
	(11,'field',1,'de',' this is for seo og and rss feed content '),
	(11,'field',152,'de',''),
	(11,'field',42,'de',''),
	(11,'field',46,'de',' 0 '),
	(11,'field',29,'de',''),
	(11,'field',30,'de',' 0 '),
	(11,'field',124,'de',' 1 de 1 0 template creativework article hello world this is for seo og and rss feed content summary_large_image article all field title field body custom title field featuredimage field featuredimage field featuredimage '),
	(11,'slug',0,'de',' hello world '),
	(11,'title',0,'de',' hello world '),
	(11,'field',1,'en',' this is for seo og and rss feed content '),
	(11,'field',152,'en',''),
	(11,'field',42,'en',''),
	(11,'field',46,'en',' 0 '),
	(11,'field',29,'en',''),
	(11,'field',30,'en',' 0 '),
	(11,'field',124,'en',' 1 de 1 0 template creativework article hello world this is for seo og and rss feed content summary_large_image article all field title field body custom title field featuredimage field featuredimage field featuredimage '),
	(11,'slug',0,'en',' hello world '),
	(11,'title',0,'en',' hello world '),
	(12,'field',47,'de',' 0 '),
	(12,'field',48,'de',''),
	(12,'slug',0,'de',''),
	(12,'field',47,'en',' 0 '),
	(12,'field',48,'en',''),
	(12,'slug',0,'en',''),
	(132,'field',188,'en',' 1 '),
	(131,'field',184,'de',' box 1 box 2 o 2colgrid cssgrid 0 box1 box2 box1 box2 1 '),
	(131,'slug',0,'de',' 2 column grid grid '),
	(131,'title',0,'de',' 2 column grid grid 2 boxes '),
	(131,'field',184,'en',' box 1 box 2 o 2colgrid cssgrid 0 box1 box2 box1 box2 1 '),
	(131,'slug',0,'en',' 2 column grid grid '),
	(131,'title',0,'en',' 2 column grid grid 2 boxes '),
	(132,'field',286,'de',' cssgrid '),
	(132,'field',186,'de',' o 2colgrid '),
	(132,'field',188,'de',' 1 '),
	(132,'field',187,'de',' box 1 box 2 '),
	(132,'field',189,'de',' 0 '),
	(132,'field',190,'de',''),
	(132,'field',185,'de',' box1 box2 box1 box2 '),
	(132,'slug',0,'de',''),
	(132,'field',286,'en',' cssgrid '),
	(132,'field',186,'en',' o 2colgrid '),
	(15,'field',244,'de',' e ta left position texts or other elements inline block on the left side position texts or other elements inline block on the left side '),
	(15,'slug',0,'de',' align left '),
	(15,'title',0,'de',' align horizontal left '),
	(15,'field',244,'en',' e ta left position texts or other elements inline block on the left side position texts or other elements inline block on the left side '),
	(15,'slug',0,'en',' align left '),
	(15,'title',0,'en',' align horizontal left '),
	(16,'field',245,'de',' e ta left '),
	(16,'field',246,'de',' position texts or other elements inline block on the left side position texts or other elements inline block on the left side '),
	(16,'slug',0,'de',''),
	(16,'field',245,'en',' e ta left '),
	(16,'field',246,'en',' position texts or other elements inline block on the left side position texts or other elements inline block on the left side '),
	(16,'slug',0,'en',''),
	(17,'field',244,'de',' e ta right position texts or other elements inline block on the right side position texts or other elements inline block on the right side '),
	(17,'slug',0,'de',' align right '),
	(17,'title',0,'de',' align horizontal right '),
	(17,'field',244,'en',' e ta right position texts or other elements inline block on the right side position texts or other elements inline block on the right side '),
	(17,'slug',0,'en',' align right '),
	(17,'title',0,'en',' align horizontal right '),
	(18,'field',245,'de',' e ta right '),
	(18,'field',246,'de',' position texts or other elements inline block on the right side position texts or other elements inline block on the right side '),
	(18,'slug',0,'de',''),
	(18,'field',245,'en',' e ta right '),
	(18,'field',246,'en',' position texts or other elements inline block on the right side position texts or other elements inline block on the right side '),
	(18,'slug',0,'en',''),
	(19,'field',244,'de',' e ta center centers texts or other elements inline block centers texts or other elements inline block '),
	(19,'slug',0,'de',' align center '),
	(19,'title',0,'de',' align horizontal center '),
	(19,'field',244,'en',' e ta center centers texts or other elements inline block centers texts or other elements inline block '),
	(19,'slug',0,'en',' align center '),
	(19,'title',0,'en',' align horizontal center '),
	(20,'field',245,'de',' e ta center '),
	(20,'field',246,'de',' centers texts or other elements inline block centers texts or other elements inline block '),
	(20,'slug',0,'de',''),
	(20,'field',245,'en',' e ta center '),
	(20,'field',246,'en',' centers texts or other elements inline block centers texts or other elements inline block '),
	(20,'slug',0,'en',''),
	(21,'field',244,'de',' e va top position elements in the upper part of the container only possible for grid or section child elements position elements in the upper part of the container only possible for grid or section child elements '),
	(21,'slug',0,'de',' valign top '),
	(21,'title',0,'de',' align vertical top '),
	(21,'field',244,'en',' e va top position elements in the upper part of the container only possible for grid or section child elements position elements in the upper part of the container only possible for grid or section child elements '),
	(21,'slug',0,'en',' valign top '),
	(21,'title',0,'en',' align vertical top '),
	(22,'field',245,'de',' e va top '),
	(22,'field',246,'de',' position elements in the upper part of the container only possible for grid or section child elements position elements in the upper part of the container only possible for grid or section child elements '),
	(22,'slug',0,'de',''),
	(22,'field',245,'en',' e va top '),
	(22,'field',246,'en',' position elements in the upper part of the container only possible for grid or section child elements position elements in the upper part of the container only possible for grid or section child elements '),
	(22,'slug',0,'en',''),
	(23,'field',244,'de',' e va bottom position elements in the lower part of the container grid or section child elements only position elements in the lower part of the container grid or section child elements only '),
	(23,'slug',0,'de',' valign bottom '),
	(23,'title',0,'de',' align vertical bottom '),
	(23,'field',244,'en',' e va bottom position elements in the lower part of the container grid or section child elements only position elements in the lower part of the container grid or section child elements only '),
	(23,'slug',0,'en',' valign bottom '),
	(23,'title',0,'en',' align vertical bottom '),
	(24,'field',245,'de',' e va bottom '),
	(24,'field',246,'de',' position elements in the lower part of the container grid or section child elements only position elements in the lower part of the container grid or section child elements only '),
	(24,'slug',0,'de',''),
	(24,'field',245,'en',' e va bottom '),
	(24,'field',246,'en',' position elements in the lower part of the container grid or section child elements only position elements in the lower part of the container grid or section child elements only '),
	(24,'slug',0,'en',''),
	(25,'field',244,'de',' e va center position elements in the middle part of the container grid or section child elements only position elements in the middle part of the container grid or section child elements only '),
	(25,'slug',0,'de',' valign center '),
	(25,'title',0,'de',' align vertical center '),
	(25,'field',244,'en',' e va center position elements in the middle part of the container grid or section child elements only position elements in the middle part of the container grid or section child elements only '),
	(25,'slug',0,'en',' valign center '),
	(25,'title',0,'en',' align vertical center '),
	(26,'field',245,'de',' e va center '),
	(26,'field',246,'de',' position elements in the middle part of the container grid or section child elements only position elements in the middle part of the container grid or section child elements only '),
	(26,'slug',0,'de',''),
	(26,'field',245,'en',' e va center '),
	(26,'field',246,'en',' position elements in the middle part of the container grid or section child elements only position elements in the middle part of the container grid or section child elements only '),
	(26,'slug',0,'en',''),
	(27,'field',244,'de',' e w fullheight gives the wrapper element the 100% height of the browser viewport gives the wrapper element the 100% height of the browser viewport '),
	(27,'slug',0,'de',' container fullheight '),
	(27,'title',0,'de',' wrapper fullheight '),
	(27,'field',244,'en',' e w fullheight gives the wrapper element the 100% height of the browser viewport gives the wrapper element the 100% height of the browser viewport '),
	(27,'slug',0,'en',' container fullheight '),
	(27,'title',0,'en',' wrapper fullheight '),
	(28,'field',245,'de',' e w fullheight '),
	(28,'field',246,'de',' gives the wrapper element the 100% height of the browser viewport gives the wrapper element the 100% height of the browser viewport '),
	(28,'slug',0,'de',''),
	(28,'field',245,'en',' e w fullheight '),
	(28,'field',246,'en',' gives the wrapper element the 100% height of the browser viewport gives the wrapper element the 100% height of the browser viewport '),
	(28,'slug',0,'en',''),
	(29,'field',244,'de',' c button big bigger button size bigger button size '),
	(29,'slug',0,'de',' button size big '),
	(29,'title',0,'de',' button size big '),
	(29,'field',244,'en',' c button big bigger button size bigger button size '),
	(29,'slug',0,'en',' button size big '),
	(29,'title',0,'en',' button size big '),
	(30,'field',245,'de',' c button big '),
	(30,'field',246,'de',' bigger button size bigger button size '),
	(30,'slug',0,'de',''),
	(30,'field',245,'en',' c button big '),
	(30,'field',246,'en',' bigger button size bigger button size '),
	(30,'slug',0,'en',''),
	(31,'field',244,'de',' c button small smaller button size smaller button size '),
	(31,'slug',0,'de',' button size small '),
	(31,'title',0,'de',' button size small '),
	(31,'field',244,'en',' c button small smaller button size smaller button size '),
	(31,'slug',0,'en',' button size small '),
	(31,'title',0,'en',' button size small '),
	(32,'field',245,'de',' c button small '),
	(32,'field',246,'de',' smaller button size smaller button size '),
	(32,'slug',0,'de',''),
	(32,'field',245,'en',' c button small '),
	(32,'field',246,'en',' smaller button size smaller button size '),
	(32,'slug',0,'en',''),
	(33,'field',244,'de',' c button s default base button style base button style '),
	(33,'slug',0,'de',' button style default '),
	(33,'title',0,'de',' button style default '),
	(33,'field',244,'en',' c button s default base button style base button style '),
	(33,'slug',0,'en',' button style default '),
	(33,'title',0,'en',' button style default '),
	(34,'field',245,'de',' c button s default '),
	(34,'field',246,'de',' base button style base button style '),
	(34,'slug',0,'de',''),
	(34,'field',245,'en',' c button s default '),
	(34,'field',246,'en',' base button style base button style '),
	(34,'slug',0,'en',''),
	(35,'field',244,'de',' c jumpnavigation s button simple button styled navigation simple button styled navigation '),
	(35,'slug',0,'de',' jumpnavigation style button '),
	(35,'title',0,'de',' jumpnavigation style button '),
	(35,'field',244,'en',' c jumpnavigation s button simple button styled navigation simple button styled navigation '),
	(35,'slug',0,'en',' jumpnavigation style button '),
	(35,'title',0,'en',' jumpnavigation style button '),
	(36,'field',245,'de',' c jumpnavigation s button '),
	(36,'field',246,'de',' simple button styled navigation simple button styled navigation '),
	(36,'slug',0,'de',''),
	(36,'field',245,'en',' c jumpnavigation s button '),
	(36,'field',246,'en',' simple button styled navigation simple button styled navigation '),
	(36,'slug',0,'en',''),
	(37,'field',244,'de',' e c__text primary '),
	(37,'slug',0,'de',' color text primary '),
	(37,'title',0,'de',' color text primary '),
	(37,'field',244,'en',' u ct primary '),
	(37,'slug',0,'en',' color text primary '),
	(37,'title',0,'en',' color text primary '),
	(38,'field',245,'de',' e c__text primary '),
	(38,'field',246,'de',''),
	(38,'slug',0,'de',''),
	(38,'field',245,'en',' e c__text primary '),
	(38,'field',246,'en',''),
	(38,'slug',0,'en',''),
	(39,'field',244,'de',' c quote s lined a quote with a big line d a quote with a big line d '),
	(39,'slug',0,'de',' quote style lined '),
	(39,'title',0,'de',' quote style lined '),
	(39,'field',244,'en',' c quote s lined a quote with a big line d a quote with a big line d '),
	(39,'slug',0,'en',' quote style lined '),
	(39,'title',0,'en',' quote style lined '),
	(40,'field',245,'de',' c quote s lined '),
	(40,'field',246,'de',' a quote with a big line d a quote with a big line d '),
	(40,'slug',0,'de',''),
	(40,'field',245,'en',' c quote s lined '),
	(40,'field',246,'en',' a quote with a big line d a quote with a big line d '),
	(40,'slug',0,'en',''),
	(41,'field',244,'de',' e ts lead scales text by 120% scales text by 120% '),
	(41,'slug',0,'de',' typo scale lead '),
	(41,'title',0,'de',' typo scale lead '),
	(41,'field',244,'en',' u ts lead scales text by 120% scales text by 120% '),
	(41,'slug',0,'en',' typo scale lead '),
	(41,'title',0,'en',' typo scale lead '),
	(42,'field',245,'de',' e ts lead '),
	(42,'field',246,'de',' scales text by 120% scales text by 120% '),
	(42,'slug',0,'de',''),
	(42,'field',245,'en',' e ts lead '),
	(42,'field',246,'en',' scales text by 120% scales text by 120% '),
	(42,'slug',0,'en',''),
	(43,'field',244,'de',' e ts small scales text by 20% smaller scales text by 20% smaller '),
	(43,'slug',0,'de',' typo scale small '),
	(43,'title',0,'de',' typo scale small '),
	(43,'field',244,'en',' u ts small scales text by 20% smaller scales text by 20% smaller '),
	(43,'slug',0,'en',' typo scale small '),
	(43,'title',0,'en',' typo scale small '),
	(44,'field',245,'de',' e ts small '),
	(44,'field',246,'de',' scales text by 20% smaller scales text by 20% smaller '),
	(44,'slug',0,'de',''),
	(44,'field',245,'en',' e ts small '),
	(44,'field',246,'en',' scales text by 20% smaller scales text by 20% smaller '),
	(44,'slug',0,'en',''),
	(115,'slug',0,'en',''),
	(116,'field',262,'de',' https www instagram com p bgd8bvrjarn hl=de '),
	(115,'field',264,'en',' 1 16 9 l '),
	(115,'field',264,'de',' 1 0 30% 16 9 l '),
	(115,'slug',0,'de',''),
	(115,'field',261,'en',' ein flieger https www instagram com p bgere01hk7c hl=de '),
	(115,'field',261,'de',' ein flieger https www instagram com p bgd8bvrjarn hl=de '),
	(116,'slug',0,'de',''),
	(116,'field',263,'de',' ein flieger '),
	(59,'field',192,'en',' default h2 '),
	(10,'field',63,'en',''),
	(10,'field',64,'en',''),
	(10,'field',65,'en',''),
	(59,'slug',0,'de',''),
	(59,'field',57,'en',' hello world '),
	(59,'slug',0,'en',''),
	(60,'field',193,'de',''),
	(60,'field',194,'de',' h2 '),
	(60,'field',195,'de',' default '),
	(60,'slug',0,'de',''),
	(60,'field',193,'en',''),
	(60,'field',194,'en',' h2 '),
	(60,'field',195,'en',' default '),
	(60,'slug',0,'en',''),
	(59,'field',57,'de',' hello world '),
	(59,'field',192,'de',' default h2 '),
	(75,'title',0,'en',' reset padding bottom '),
	(76,'field',245,'de',' e r__padding bottom '),
	(75,'slug',0,'en',' reset padding bottom '),
	(75,'field',244,'en',' e r__padding bottom '),
	(75,'title',0,'de',' reset padding bottom '),
	(75,'slug',0,'de',' reset padding bottom '),
	(78,'field',246,'en',''),
	(78,'field',245,'en',' e r__padding side '),
	(78,'field',246,'de',''),
	(78,'slug',0,'en',''),
	(78,'slug',0,'de',''),
	(75,'field',244,'de',' e r__padding bottom '),
	(74,'slug',0,'en',''),
	(74,'field',246,'en',''),
	(74,'field',245,'en',' e r__padding top '),
	(78,'field',245,'de',' e r__padding side '),
	(77,'title',0,'en',' reset padding side '),
	(74,'slug',0,'de',''),
	(74,'field',246,'de',''),
	(74,'field',245,'de',' e r__padding top '),
	(77,'title',0,'de',' reset padding side '),
	(77,'slug',0,'en',' reset padding side '),
	(77,'field',244,'en',' e r__padding side '),
	(73,'title',0,'en',' reset padding top '),
	(73,'slug',0,'en',' reset padding top '),
	(73,'field',244,'en',' e r__padding top '),
	(73,'title',0,'de',' reset padding top '),
	(77,'field',244,'de',' e r__padding side '),
	(77,'slug',0,'de',' reset padding side '),
	(76,'slug',0,'en',''),
	(73,'slug',0,'de',' reset padding top '),
	(73,'field',244,'de',' e r__padding top '),
	(72,'slug',0,'en',''),
	(72,'field',246,'en',''),
	(76,'field',246,'en',''),
	(76,'field',245,'en',' e r__padding bottom '),
	(76,'slug',0,'de',''),
	(76,'field',246,'de',''),
	(72,'field',245,'en',' e r__margin last '),
	(135,'field',251,'en',' default '),
	(135,'slug',0,'en',''),
	(63,'field',244,'de',' e r__margin top '),
	(63,'slug',0,'de',' reset margin top '),
	(63,'title',0,'de',' reset margin top '),
	(63,'field',244,'en',' e r__margin top '),
	(63,'slug',0,'en',' reset margin top '),
	(63,'title',0,'en',' reset margin top '),
	(64,'field',245,'de',' e r__margin top '),
	(64,'field',246,'de',''),
	(64,'slug',0,'de',''),
	(64,'field',245,'en',' e r__margin top '),
	(64,'field',246,'en',''),
	(64,'slug',0,'en',''),
	(65,'field',244,'de',' e r__margin bottom '),
	(65,'slug',0,'de',' reset margin bottom '),
	(65,'title',0,'de',' reset margin bottom '),
	(65,'field',244,'en',' e r__margin bottom '),
	(65,'slug',0,'en',' reset margin bottom '),
	(65,'title',0,'en',' reset margin bottom '),
	(66,'field',245,'de',' e r__margin bottom '),
	(66,'field',246,'de',''),
	(66,'slug',0,'de',''),
	(66,'field',245,'en',' e r__margin bottom '),
	(66,'field',246,'en',''),
	(66,'slug',0,'en',''),
	(67,'field',244,'de',' e r__margin side '),
	(67,'slug',0,'de',' reset margin side '),
	(67,'title',0,'de',' reset margin side '),
	(67,'field',244,'en',' e r__margin side '),
	(67,'slug',0,'en',' reset margin side '),
	(67,'title',0,'en',' reset margin side '),
	(68,'field',245,'de',' e r__margin side '),
	(68,'field',246,'de',''),
	(68,'slug',0,'de',''),
	(68,'field',245,'en',' e r__margin side '),
	(68,'field',246,'en',''),
	(68,'slug',0,'en',''),
	(71,'title',0,'en',' reset margin bottom last child '),
	(71,'title',0,'de',' reset last margin bottom '),
	(71,'field',244,'en',' e r__margin last '),
	(71,'slug',0,'en',' reset margin bottom last child '),
	(71,'field',244,'de',' e r__margin last '),
	(71,'slug',0,'de',' reset margin bottom last child '),
	(72,'field',246,'de',''),
	(72,'slug',0,'de',''),
	(72,'field',245,'de',' e r__margin last '),
	(103,'field',98,'de',' die neue age protection range von logona ist das einzige komplette pflegesystem natrue zertifizierter naturkosmetik ein relaunch von hoher bedeutung denn gesichtspflege produkte fuer die zielgruppe der lohas best ager gehoeren zu den wichtigsten wachstumstreibern im naturkosmetik bereich '),
	(103,'field',216,'de',''),
	(103,'slug',0,'de',''),
	(103,'field',98,'en',' die neue age protection range von logona ist das einzige komplette pflegesystem natrue zertifizierter naturkosmetik ein relaunch von hoher bedeutung denn gesichtspflege produkte fuer die zielgruppe der lohas best ager gehoeren zu den wichtigsten wachstumstreibern im naturkosmetik bereich '),
	(80,'field',191,'de',''),
	(80,'field',247,'de',' bigger 25 '),
	(80,'field',173,'de',' 0 default '),
	(80,'slug',0,'de',''),
	(80,'field',191,'en',''),
	(80,'field',247,'en',' bigger 25 '),
	(80,'field',173,'en',' 0 default '),
	(80,'slug',0,'en',''),
	(81,'field',248,'de',''),
	(81,'field',249,'de',''),
	(81,'field',250,'de',''),
	(81,'field',251,'de',' bigger 25 '),
	(81,'slug',0,'de',''),
	(81,'field',248,'en',''),
	(81,'field',249,'en',''),
	(81,'field',250,'en',''),
	(81,'field',251,'en',' bigger 25 '),
	(81,'slug',0,'en',''),
	(82,'field',174,'de',''),
	(82,'field',175,'de',''),
	(82,'field',176,'de',''),
	(82,'field',177,'de',' 0 '),
	(82,'field',178,'de',' default '),
	(82,'field',179,'de',''),
	(82,'slug',0,'de',''),
	(82,'field',174,'en',''),
	(82,'field',175,'en',''),
	(82,'field',176,'en',''),
	(82,'field',177,'en',' 0 '),
	(82,'field',178,'en',' default '),
	(82,'field',179,'en',''),
	(82,'slug',0,'en',''),
	(83,'field',180,'de',''),
	(83,'field',181,'de',''),
	(83,'slug',0,'de',''),
	(83,'field',180,'en',''),
	(83,'field',181,'en',''),
	(83,'slug',0,'en',''),
	(84,'field',182,'de',''),
	(84,'field',183,'de',''),
	(84,'slug',0,'de',''),
	(84,'field',182,'en',''),
	(84,'field',183,'en',''),
	(84,'slug',0,'en',''),
	(85,'field',57,'de',' blubb '),
	(85,'field',192,'de',' default h2 '),
	(85,'slug',0,'de',''),
	(85,'field',57,'en',' blubb '),
	(85,'field',192,'en',' default h2 '),
	(85,'slug',0,'en',''),
	(86,'field',193,'de',''),
	(86,'field',194,'de',' h2 '),
	(86,'field',195,'de',' default '),
	(86,'slug',0,'de',''),
	(86,'field',193,'en',''),
	(86,'field',194,'en',' h2 '),
	(86,'field',195,'en',' default '),
	(86,'slug',0,'en',''),
	(89,'field',244,'de',' e w fullwidth '),
	(89,'slug',0,'de',' wrapper fullwidth '),
	(89,'title',0,'de',' wrapper fullwidth '),
	(89,'field',244,'en',' e w fullwidth '),
	(89,'slug',0,'en',' wrapper fullwidth '),
	(89,'title',0,'en',' wrapper fullwidth '),
	(90,'field',245,'de',' e w fullwidth '),
	(90,'field',246,'de',''),
	(90,'slug',0,'de',''),
	(90,'field',245,'en',' e w fullwidth '),
	(90,'field',246,'en',''),
	(90,'slug',0,'en',''),
	(91,'field',244,'de',' fullbleed '),
	(91,'slug',0,'de',' wrapper fullbleed '),
	(91,'title',0,'de',' wrapper fullbleed '),
	(91,'field',244,'en',' e w fullbleed '),
	(91,'slug',0,'en',' wrapper fullbleed '),
	(91,'title',0,'en',' wrapper fullbleed '),
	(92,'field',245,'de',' fullbleed '),
	(92,'field',246,'de',''),
	(92,'slug',0,'de',''),
	(92,'field',245,'en',' fullbleed '),
	(92,'field',246,'en',''),
	(92,'slug',0,'en',''),
	(93,'field',244,'de',' e w__vspacer 1 '),
	(93,'slug',0,'de',' wrapper spacer vertical 20px '),
	(93,'title',0,'de',' wrapper spacer vertical 20px '),
	(93,'field',244,'en',' e w__vspacer 1 '),
	(93,'slug',0,'en',' wrapper spacer vertical 20px '),
	(93,'title',0,'en',' wrapper spacer vertical 20px '),
	(94,'field',245,'de',' e w__vspacer 1 '),
	(94,'field',246,'de',''),
	(94,'slug',0,'de',''),
	(94,'field',245,'en',' e w__vspacer 1 '),
	(94,'field',246,'en',''),
	(94,'slug',0,'en',''),
	(95,'field',244,'de',' e w__hspacer 1 '),
	(95,'slug',0,'de',' wrapper spacer horizontal 20px '),
	(95,'title',0,'de',' wrapper spacer horizontal 20px '),
	(95,'field',244,'en',' e w__hspacer 1 '),
	(95,'slug',0,'en',' wrapper spacer horizontal 20px '),
	(95,'title',0,'en',' wrapper spacer horizontal 20px '),
	(96,'field',245,'de',' e w__hspacer 1 '),
	(96,'field',246,'de',''),
	(96,'slug',0,'de',''),
	(96,'field',245,'en',' e w__hspacer 1 '),
	(96,'field',246,'en',''),
	(96,'slug',0,'en',''),
	(97,'field',244,'de',' e w__vspacer flex 1to3 '),
	(97,'slug',0,'de',' wrapper flexspacer vertical 1to3 '),
	(97,'title',0,'de',' wrapper flexspacer vertical 1to3 '),
	(97,'field',244,'en',' e w__vspacer flex 1to3 '),
	(97,'slug',0,'en',' wrapper flexspacer vertical 1to3 '),
	(97,'title',0,'en',' wrapper flexspacer vertical 1to3 '),
	(98,'field',245,'de',' e w__vspacer flex 1to3 '),
	(98,'field',246,'de',''),
	(98,'slug',0,'de',''),
	(98,'field',245,'en',' e w__vspacer flex 1to3 '),
	(98,'field',246,'en',''),
	(98,'slug',0,'en',''),
	(99,'field',244,'de',' e w__hspacer flex 1to3 '),
	(99,'slug',0,'de',' wrapper flexspacer horizontal 1to3 '),
	(99,'title',0,'de',' wrapper flexspacer horizontal 1to3 '),
	(99,'field',244,'en',' e w__hspacer flex 1to3 '),
	(99,'slug',0,'en',' wrapper flexspacer horizontal 1to3 '),
	(99,'title',0,'en',' wrapper flexspacer horizontal 1to3 '),
	(100,'field',245,'de',' e w__hspacer flex 1to3 '),
	(100,'field',246,'de',''),
	(100,'slug',0,'de',''),
	(100,'field',245,'en',' e w__hspacer flex 1to3 '),
	(100,'field',246,'en',''),
	(100,'slug',0,'en',''),
	(101,'field',244,'de',' e ts__flex 50to80 '),
	(101,'slug',0,'de',' typo flexscale 50px to 80px '),
	(101,'title',0,'de',' typo scale flex 50px to 80px '),
	(101,'field',244,'en',' e ts flex 50to80 '),
	(101,'slug',0,'en',' typo flexscale 50px to 80px '),
	(101,'title',0,'en',' typo flexscale 50px to 80px '),
	(102,'field',245,'de',' e ts__flex 50to80 '),
	(102,'field',246,'de',''),
	(102,'slug',0,'de',''),
	(102,'field',245,'en',' e ts__flex 50to80 '),
	(102,'field',246,'en',''),
	(102,'slug',0,'en',''),
	(103,'field',216,'en',''),
	(103,'slug',0,'en',''),
	(104,'field',217,'de',''),
	(104,'slug',0,'de',''),
	(104,'field',217,'en',''),
	(104,'slug',0,'en',''),
	(105,'field',244,'de',' e tl__maxchars 50 '),
	(105,'slug',0,'de',' typo layout max chars 50 '),
	(105,'title',0,'de',' typo layout max chars 50 '),
	(105,'field',244,'en',' e tl__maxchars 50 '),
	(105,'slug',0,'en',' typo layout max chars 50 '),
	(105,'title',0,'en',' typo layout max chars 50 '),
	(106,'field',245,'de',' e tl__maxchars 50 '),
	(106,'field',246,'de',''),
	(106,'slug',0,'de',''),
	(106,'field',245,'en',' e tl__maxchars 50 '),
	(106,'field',246,'en',''),
	(106,'slug',0,'en',''),
	(107,'field',244,'de',' e tl__maxchars 75 '),
	(107,'slug',0,'de',' typo layout max chars 75 '),
	(107,'title',0,'de',' typo layout max chars 75 '),
	(107,'field',244,'en',' e tl__maxchars 75 '),
	(107,'slug',0,'en',' typo layout max chars 75 '),
	(107,'title',0,'en',' typo layout max chars 75 '),
	(108,'field',245,'de',' e tl__maxchars 75 '),
	(108,'field',246,'de',''),
	(108,'slug',0,'de',''),
	(108,'field',245,'en',' e tl__maxchars 75 '),
	(108,'field',246,'en',''),
	(108,'slug',0,'en',''),
	(109,'field',244,'de',' e tl__multicolumn 2 '),
	(109,'slug',0,'de',' typo layout 2 css columns '),
	(109,'title',0,'de',' typo layout 2 css columns '),
	(109,'field',244,'en',' e tl__multicolumn 2 '),
	(109,'slug',0,'en',' typo layout 2 css columns '),
	(109,'title',0,'en',' typo layout 2 css columns '),
	(110,'field',245,'de',' e tl__multicolumn 2 '),
	(110,'field',246,'de',''),
	(110,'slug',0,'de',''),
	(110,'field',245,'en',' e tl__multicolumn 2 '),
	(110,'field',246,'en',''),
	(110,'slug',0,'en',''),
	(111,'field',244,'de',' e tl__multicolumn r3 '),
	(111,'slug',0,'de',' typo layout responsive 3 columns '),
	(111,'title',0,'de',' typo layout responsive 3 columns '),
	(111,'field',244,'en',' e tl__multicolumn r3 '),
	(111,'slug',0,'en',' typo layout responsive 3 columns '),
	(111,'title',0,'en',' typo layout responsive 3 columns '),
	(112,'field',245,'de',' e tl__multicolumn r3 '),
	(112,'field',246,'de',''),
	(112,'slug',0,'de',''),
	(112,'field',245,'en',' e tl__multicolumn r3 '),
	(112,'field',246,'en',''),
	(112,'slug',0,'en',''),
	(113,'field',244,'de',' c slideoutbox s simple '),
	(113,'slug',0,'de',' slideoutbox style simple specific '),
	(113,'title',0,'de',' slideoutbox style simple specific '),
	(113,'field',244,'en',' c slideoutbox s simple '),
	(113,'slug',0,'en',' slideoutbox style simple specific '),
	(113,'title',0,'en',' slideoutbox style simple specific '),
	(114,'field',245,'de',' c slideoutbox s simple '),
	(114,'field',246,'de',''),
	(114,'slug',0,'de',''),
	(114,'field',245,'en',' c slideoutbox s simple '),
	(114,'field',246,'en',''),
	(114,'slug',0,'en',''),
	(116,'field',262,'en',' https www instagram com p bgd8bvrjarn hl=de '),
	(116,'field',263,'en',' ein flieger '),
	(116,'slug',0,'en',''),
	(117,'field',265,'de',''),
	(117,'field',266,'de',' l '),
	(117,'field',267,'de',' 1 '),
	(117,'field',268,'de',' 16 9 '),
	(117,'slug',0,'de',''),
	(117,'field',265,'en',''),
	(117,'field',266,'en',' l '),
	(117,'field',267,'en',' 1 '),
	(117,'field',268,'en',' 16 9 '),
	(117,'slug',0,'en',''),
	(117,'field',269,'de',' 0 30% '),
	(117,'field',269,'en',' 0 30% '),
	(132,'slug',0,'en',''),
	(60,'field',287,'de',''),
	(60,'field',287,'en',''),
	(126,'field',188,'de',' 1 '),
	(126,'field',187,'de',' box '),
	(126,'field',189,'de',' 0 '),
	(126,'field',190,'de',''),
	(126,'field',185,'de',' box box box box box box '),
	(126,'slug',0,'de',''),
	(126,'field',286,'en',' flexbox '),
	(126,'field',186,'en',' o 2to4grid '),
	(126,'field',188,'en',' 1 '),
	(125,'field',184,'de',' box o 2to4grid flexbox 0 box box box box box box 1 '),
	(125,'slug',0,'de',' 2to4 grid '),
	(125,'title',0,'de',' 2to4 grid grid with flexbox fallback infinite boxes '),
	(125,'field',184,'en',' box o 2to4grid flexbox 0 box box box box box box 1 '),
	(125,'slug',0,'en',' 2to4 grid '),
	(125,'title',0,'en',' 2to4 grid grid with flexbox fallback infinite boxes '),
	(126,'field',286,'de',' flexbox '),
	(126,'field',186,'de',' o 2to4grid '),
	(126,'field',187,'en',' box '),
	(126,'field',189,'en',' 0 '),
	(126,'field',190,'en',''),
	(126,'field',185,'en',' box box box box box box '),
	(126,'slug',0,'en',''),
	(134,'field',191,'de',''),
	(134,'field',247,'de',' default 4 column grid grid '),
	(134,'field',173,'de',' 0 default '),
	(134,'slug',0,'de',''),
	(134,'field',191,'en',''),
	(134,'field',247,'en',' default 2 colum grid grid '),
	(134,'field',173,'en',' 0 default '),
	(134,'slug',0,'en',''),
	(135,'field',248,'de',''),
	(135,'field',249,'de',''),
	(135,'field',285,'de',''),
	(135,'field',250,'de',' 4 column grid grid '),
	(135,'field',251,'de',' default '),
	(135,'slug',0,'de',''),
	(135,'field',248,'en',''),
	(135,'field',249,'en',''),
	(135,'field',285,'en',''),
	(136,'field',178,'de',' default '),
	(136,'field',179,'de',''),
	(136,'field',283,'de',''),
	(136,'slug',0,'de',''),
	(136,'field',174,'en',''),
	(136,'field',175,'en',''),
	(136,'field',176,'en',''),
	(136,'field',177,'en',' 0 '),
	(136,'field',178,'en',' default '),
	(136,'field',179,'en',''),
	(136,'field',283,'en',''),
	(136,'slug',0,'en',''),
	(137,'field',180,'de',''),
	(137,'field',181,'de',''),
	(137,'slug',0,'de',''),
	(137,'field',180,'en',''),
	(137,'field',181,'en',''),
	(137,'slug',0,'en',''),
	(138,'field',182,'de',''),
	(138,'field',183,'de',''),
	(138,'field',284,'de',''),
	(138,'slug',0,'de',''),
	(138,'field',182,'en',''),
	(138,'field',183,'en',''),
	(138,'field',284,'en',''),
	(138,'slug',0,'en',''),
	(139,'field',57,'de',' test1 '),
	(139,'field',192,'de',' default h2 '),
	(139,'slug',0,'de',''),
	(139,'field',57,'en',' test1 '),
	(139,'field',192,'en',' default h2 '),
	(139,'slug',0,'en',''),
	(140,'field',193,'de',''),
	(140,'field',287,'de',''),
	(140,'field',194,'de',' h2 '),
	(140,'field',195,'de',' default '),
	(140,'slug',0,'de',''),
	(140,'field',193,'en',''),
	(140,'field',287,'en',''),
	(140,'field',194,'en',' h2 '),
	(140,'field',195,'en',' default '),
	(140,'slug',0,'en',''),
	(141,'field',180,'de',''),
	(141,'field',181,'de',''),
	(141,'slug',0,'de',''),
	(141,'field',180,'en',''),
	(141,'field',181,'en',''),
	(141,'slug',0,'en',''),
	(142,'field',182,'de',''),
	(142,'field',183,'de',''),
	(142,'field',284,'de',''),
	(142,'slug',0,'de',''),
	(142,'field',182,'en',''),
	(142,'field',183,'en',''),
	(142,'field',284,'en',''),
	(142,'slug',0,'en',''),
	(143,'field',57,'de',' test2 '),
	(143,'field',192,'de',' default h2 '),
	(143,'slug',0,'de',''),
	(143,'field',57,'en',' test2 '),
	(143,'field',192,'en',' default h2 '),
	(143,'slug',0,'en',''),
	(144,'field',193,'de',''),
	(144,'field',287,'de',''),
	(144,'field',194,'de',' h2 '),
	(144,'field',195,'de',' default '),
	(144,'slug',0,'de',''),
	(144,'field',193,'en',''),
	(144,'field',287,'en',''),
	(144,'field',194,'en',' h2 '),
	(144,'field',195,'en',' default '),
	(144,'slug',0,'en',''),
	(146,'field',184,'de',' box 0 box 1 box 2 o 3colgrid cssgrid 0 box0 box1 box2 box0 box0 box1 box2 box0 box1 box2 1 '),
	(146,'slug',0,'de',' 3 column grid grid '),
	(146,'title',0,'de',' 3 column grid grid 3 boxes '),
	(146,'field',184,'en',' box 0 box 1 box 2 o 3colgrid cssgrid 0 box0 box1 box2 box0 box0 box1 box2 box0 box1 box2 1 '),
	(146,'slug',0,'en',' 3 column grid grid '),
	(146,'title',0,'en',' 3 column grid grid 3 boxes '),
	(147,'field',286,'de',' cssgrid '),
	(147,'field',186,'de',' o 3colgrid '),
	(147,'field',188,'de',' 1 '),
	(147,'field',187,'de',' box 0 box 1 box 2 '),
	(147,'field',189,'de',' 0 '),
	(147,'field',190,'de',''),
	(147,'field',185,'de',' box0 box1 box2 box0 box0 box1 box2 box0 box1 box2 '),
	(147,'slug',0,'de',''),
	(147,'field',286,'en',' cssgrid '),
	(147,'field',186,'en',' o 3colgrid '),
	(147,'field',188,'en',' 1 '),
	(147,'field',187,'en',' box 0 box 1 box 2 '),
	(147,'field',189,'en',' 0 '),
	(147,'field',190,'en',''),
	(147,'field',185,'en',' box0 box1 box2 box0 box0 box1 box2 box0 box1 box2 '),
	(147,'slug',0,'en',''),
	(148,'field',184,'de',' box 0 box 1 box 2 box 3 o 4colgrid cssgrid 0 box0 box1 box2 box3 box0 box1 box2 box3 box0 box1 box2 box3 1 '),
	(148,'slug',0,'de',' 4 column grid grid '),
	(148,'title',0,'de',' 4 column grid grid 4 boxes '),
	(148,'field',184,'en',' box 0 box 1 box 2 box 3 o 4colgrid cssgrid 0 box0 box1 box2 box3 box0 box1 box2 box3 box0 box1 box2 box3 1 '),
	(148,'slug',0,'en',' 4 column grid grid '),
	(148,'title',0,'en',' 4 column grid grid 4 boxes '),
	(149,'field',286,'de',' cssgrid '),
	(149,'field',186,'de',' o 4colgrid '),
	(149,'field',188,'de',' 1 '),
	(149,'field',187,'de',' box 0 box 1 box 2 box 3 '),
	(149,'field',189,'de',' 0 '),
	(149,'field',190,'de',''),
	(149,'field',185,'de',' box0 box1 box2 box3 box0 box1 box2 box3 box0 box1 box2 box3 '),
	(149,'slug',0,'de',''),
	(149,'field',286,'en',' cssgrid '),
	(149,'field',186,'en',' o 4colgrid '),
	(149,'field',188,'en',' 1 '),
	(149,'field',187,'en',' box 0 box 1 box 2 box 3 '),
	(149,'field',189,'en',' 0 '),
	(149,'field',190,'en',''),
	(149,'field',185,'en',' box0 box1 box2 box3 box0 box1 box2 box3 box0 box1 box2 box3 '),
	(149,'slug',0,'en',''),
	(153,'field',195,'en',' default '),
	(153,'field',194,'en',' h2 '),
	(150,'field',180,'de',''),
	(150,'field',181,'de',''),
	(150,'slug',0,'de',''),
	(150,'field',180,'en',''),
	(150,'field',181,'en',''),
	(150,'slug',0,'en',''),
	(151,'field',182,'de',''),
	(151,'field',183,'de',''),
	(151,'field',284,'de',''),
	(151,'slug',0,'de',''),
	(151,'field',182,'en',''),
	(151,'field',183,'en',''),
	(151,'field',284,'en',''),
	(151,'slug',0,'en',''),
	(152,'field',57,'de',' test3 '),
	(152,'field',192,'de',' default h2 '),
	(152,'slug',0,'de',''),
	(152,'field',57,'en',' test3 '),
	(152,'field',192,'en',' default h2 '),
	(152,'slug',0,'en',''),
	(153,'field',193,'de',''),
	(153,'field',287,'de',''),
	(153,'field',194,'de',' h2 '),
	(153,'field',195,'de',' default '),
	(153,'slug',0,'de',''),
	(153,'field',193,'en',''),
	(153,'field',287,'en',''),
	(153,'slug',0,'en',''),
	(154,'field',180,'de',''),
	(154,'field',181,'de',''),
	(154,'slug',0,'de',''),
	(154,'field',180,'en',''),
	(154,'field',181,'en',''),
	(154,'slug',0,'en',''),
	(155,'field',182,'de',''),
	(155,'field',183,'de',''),
	(155,'field',284,'de',''),
	(155,'slug',0,'de',''),
	(155,'field',182,'en',''),
	(155,'field',183,'en',''),
	(155,'field',284,'en',''),
	(155,'slug',0,'en',''),
	(156,'field',57,'de',' test4 '),
	(156,'field',192,'de',' default h2 '),
	(156,'slug',0,'de',''),
	(156,'field',57,'en',' test4 '),
	(156,'field',192,'en',' default h2 '),
	(156,'slug',0,'en',''),
	(157,'field',193,'de',''),
	(157,'field',287,'de',''),
	(157,'field',194,'de',' h2 '),
	(157,'field',195,'de',' default '),
	(157,'slug',0,'de',''),
	(157,'field',193,'en',''),
	(157,'field',287,'en',''),
	(157,'field',194,'en',' h2 '),
	(157,'field',195,'en',' default '),
	(157,'slug',0,'en','');

/*!40000 ALTER TABLE `craft_searchindex` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_sections
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_sections`;

CREATE TABLE `craft_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('single','channel','structure') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'channel',
  `hasUrls` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enableVersioning` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_sections_name_unq_idx` (`name`),
  UNIQUE KEY `craft_sections_handle_unq_idx` (`handle`),
  KEY `craft_sections_structureId_fk` (`structureId`),
  CONSTRAINT `craft_sections_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_sections` WRITE;
/*!40000 ALTER TABLE `craft_sections` DISABLE KEYS */;

INSERT INTO `craft_sections` (`id`, `structureId`, `name`, `handle`, `type`, `hasUrls`, `template`, `enableVersioning`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,NULL,'Homepage','homepage','single',1,'index',1,'2017-07-04 21:45:04','2017-07-05 21:34:42','39a063bd-43b9-4a3b-9df4-4df0eee46bda'),
	(3,NULL,'404','error404','single',1,'404',1,'2017-07-04 22:00:57','2017-07-05 21:33:46','8e3e4de4-eaac-4c0f-ac0c-17e99279feca'),
	(4,NULL,'Blog Channel','blogChannel','channel',1,'general/entry',1,'2017-07-04 22:00:57','2017-07-05 21:34:21','64bf6e27-f060-48bd-b397-a9e57e8ddde4'),
	(5,1,'Blog Pages','blogPages','structure',1,'general/pages',1,'2017-07-04 22:00:57','2017-07-05 21:34:34','4cfccd56-9386-4528-b7fe-ef8ee6177bed'),
	(6,2,'Pages','pages','structure',1,'general/pages',1,'2017-07-04 22:00:57','2017-07-05 21:35:00','e4067360-a2d3-44b2-83e3-cf62c26a3ff3');

/*!40000 ALTER TABLE `craft_sections` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_sections_i18n
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_sections_i18n`;

CREATE TABLE `craft_sections_i18n` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `enabledByDefault` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `urlFormat` text COLLATE utf8_unicode_ci,
  `nestedUrlFormat` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_sections_i18n_sectionId_locale_unq_idx` (`sectionId`,`locale`),
  KEY `craft_sections_i18n_locale_fk` (`locale`),
  CONSTRAINT `craft_sections_i18n_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_sections_i18n_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_sections_i18n` WRITE;
/*!40000 ALTER TABLE `craft_sections_i18n` DISABLE KEYS */;

INSERT INTO `craft_sections_i18n` (`id`, `sectionId`, `locale`, `enabledByDefault`, `urlFormat`, `nestedUrlFormat`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'de',1,'__home__',NULL,'2017-07-04 21:45:04','2017-07-04 21:45:04','a432d965-ddad-4349-9a31-a84846da1625'),
	(3,3,'de',1,'404',NULL,'2017-07-04 22:00:57','2017-07-04 22:00:57','27f1e3e0-a2dd-4635-9f38-710f7c0a485b'),
	(4,4,'de',1,'blog/e/{slug}',NULL,'2017-07-04 22:00:57','2017-07-04 22:00:57','a9155ccf-a083-4c87-8fcf-3f172d2d76e6'),
	(5,5,'de',1,'blog/{slug}','{parent.uri}/{slug}','2017-07-04 22:00:57','2017-07-04 22:00:57','b8461619-54ce-4dcb-a35f-d85ea1443bdc'),
	(6,6,'de',1,'{slug}','{parent.uri}/{slug}','2017-07-04 22:00:57','2017-07-04 22:00:57','af506f6a-5db5-4a0d-9493-9f86f9bd268e'),
	(7,3,'en',1,'404',NULL,'2017-07-05 21:33:46','2017-07-05 21:33:46','700ff25c-e595-42c0-84f8-131ef61854a4'),
	(8,4,'en',1,'blog/e/{slug}',NULL,'2017-07-05 21:34:21','2017-07-05 21:34:21','2c019492-37da-493b-af6e-c694397108d8'),
	(9,5,'en',1,'blog/{slug}','{parent.uri}/{slug}','2017-07-05 21:34:34','2017-07-05 21:34:34','b4710192-5508-4aa2-a084-e6d2a6aafacf'),
	(10,1,'en',1,'__home__',NULL,'2017-07-05 21:34:42','2017-07-05 21:34:42','cae8ccf9-9c34-46fe-a730-e088f56bd19c'),
	(11,6,'en',1,'{slug}','{parent.uri}/{slug}','2017-07-05 21:35:00','2017-07-05 21:35:00','76715fb5-b835-475f-a8f1-7b32e5272c5f');

/*!40000 ALTER TABLE `craft_sections_i18n` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_seomatic_meta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_seomatic_meta`;

CREATE TABLE `craft_seomatic_meta` (
  `id` int(11) NOT NULL,
  `seoImageId` int(11) DEFAULT NULL,
  `seoTwitterImageId` int(11) DEFAULT NULL,
  `seoFacebookImageId` int(11) DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'de',
  `elementId` int(10) DEFAULT '0',
  `metaType` enum('default','template') COLLATE utf8_unicode_ci DEFAULT 'template',
  `metaPath` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `seoMainEntityCategory` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `seoMainEntityOfPage` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `seoTitle` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `seoDescription` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `seoKeywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `seoImageTransform` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `seoFacebookImageTransform` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `seoTwitterImageTransform` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `twitterCardType` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'summary',
  `openGraphType` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'website',
  `robots` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_seomatic_meta_seoImageId_fk` (`seoImageId`),
  KEY `craft_seomatic_meta_seoTwitterImageId_fk` (`seoTwitterImageId`),
  KEY `craft_seomatic_meta_seoFacebookImageId_fk` (`seoFacebookImageId`),
  CONSTRAINT `craft_seomatic_meta_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_seomatic_meta_seoFacebookImageId_fk` FOREIGN KEY (`seoFacebookImageId`) REFERENCES `craft_assetfiles` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_seomatic_meta_seoImageId_fk` FOREIGN KEY (`seoImageId`) REFERENCES `craft_assetfiles` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_seomatic_meta_seoTwitterImageId_fk` FOREIGN KEY (`seoTwitterImageId`) REFERENCES `craft_assetfiles` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_seomatic_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_seomatic_settings`;

CREATE TABLE `craft_seomatic_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteSeoImageId` int(11) DEFAULT NULL,
  `siteSeoTwitterImageId` int(11) DEFAULT NULL,
  `siteSeoFacebookImageId` int(11) DEFAULT NULL,
  `genericOwnerImageId` int(11) DEFAULT NULL,
  `genericCreatorImageId` int(11) DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `siteSeoName` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `siteSeoTitle` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `siteSeoTitleSeparator` varchar(10) COLLATE utf8_unicode_ci DEFAULT '|',
  `siteSeoTitlePlacement` enum('before','after','none') COLLATE utf8_unicode_ci DEFAULT 'after',
  `siteSeoDescription` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `siteSeoKeywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `siteSeoImageTransform` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `siteSeoFacebookImageTransform` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `siteSeoTwitterImageTransform` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `siteTwitterCardType` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `siteOpenGraphType` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `siteRobots` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `siteRobotsTxt` text COLLATE utf8_unicode_ci,
  `siteLinksSearchTargets` text COLLATE utf8_unicode_ci,
  `siteLinksQueryInput` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `googleSiteVerification` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `bingSiteVerification` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `googleAnalyticsUID` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `googleTagManagerID` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `googleAnalyticsSendPageview` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `googleAnalyticsAdvertising` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `googleAnalyticsEcommerce` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `googleAnalyticsEEcommerce` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `googleAnalyticsLinkAttribution` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `googleAnalyticsLinker` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `googleAnalyticsAnonymizeIp` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siteOwnerType` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `siteOwnerSubType` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `siteOwnerSpecificType` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `genericOwnerName` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericOwnerAlternateName` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericOwnerDescription` varchar(1024) COLLATE utf8_unicode_ci DEFAULT '',
  `genericOwnerUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericOwnerTelephone` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericOwnerEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericOwnerStreetAddress` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericOwnerAddressLocality` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericOwnerAddressRegion` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericOwnerPostalCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericOwnerAddressCountry` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericOwnerGeoLatitude` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericOwnerGeoLongitude` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `organizationOwnerDuns` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `organizationOwnerFounder` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `organizationOwnerFoundingDate` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `organizationOwnerFoundingLocation` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `organizationOwnerContactPoints` text COLLATE utf8_unicode_ci,
  `localBusinessPriceRange` varchar(10) COLLATE utf8_unicode_ci DEFAULT '$$$',
  `localBusinessOwnerOpeningHours` text COLLATE utf8_unicode_ci,
  `corporationOwnerTickerSymbol` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `restaurantOwnerServesCuisine` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `restaurantOwnerMenuUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `restaurantOwnerReservationsUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `personOwnerGender` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `personOwnerBirthPlace` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `twitterHandle` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `facebookHandle` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `facebookProfileId` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `facebookAppId` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `linkedInHandle` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `googlePlusHandle` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `youtubeHandle` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `youtubeChannelHandle` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `instagramHandle` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `pinterestHandle` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `githubHandle` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `vimeoHandle` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `wikipediaUrl` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `siteCreatorType` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `siteCreatorSubType` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `siteCreatorSpecificType` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericCreatorName` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericCreatorAlternateName` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericCreatorDescription` varchar(1024) COLLATE utf8_unicode_ci DEFAULT '',
  `genericCreatorUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericCreatorTelephone` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericCreatorEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericCreatorStreetAddress` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericCreatorAddressLocality` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericCreatorAddressRegion` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericCreatorPostalCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericCreatorAddressCountry` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericCreatorGeoLatitude` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericCreatorGeoLongitude` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `organizationCreatorDuns` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `organizationCreatorFounder` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `organizationCreatorFoundingDate` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `organizationCreatorFoundingLocation` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `organizationCreatorContactPoints` text COLLATE utf8_unicode_ci,
  `localBusinessCreatorOpeningHours` text COLLATE utf8_unicode_ci,
  `corporationCreatorTickerSymbol` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `restaurantCreatorServesCuisine` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `restaurantCreatorMenuUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `restaurantCreatorReservationsUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `personCreatorGender` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `personCreatorBirthPlace` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericCreatorHumansTxt` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_seomatic_settings_siteSeoImageId_fk` (`siteSeoImageId`),
  KEY `craft_seomatic_settings_siteSeoTwitterImageId_fk` (`siteSeoTwitterImageId`),
  KEY `craft_seomatic_settings_siteSeoFacebookImageId_fk` (`siteSeoFacebookImageId`),
  KEY `craft_seomatic_settings_genericOwnerImageId_fk` (`genericOwnerImageId`),
  KEY `craft_seomatic_settings_genericCreatorImageId_fk` (`genericCreatorImageId`),
  CONSTRAINT `craft_seomatic_settings_genericCreatorImageId_fk` FOREIGN KEY (`genericCreatorImageId`) REFERENCES `craft_assetfiles` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_seomatic_settings_genericOwnerImageId_fk` FOREIGN KEY (`genericOwnerImageId`) REFERENCES `craft_assetfiles` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_seomatic_settings_siteSeoFacebookImageId_fk` FOREIGN KEY (`siteSeoFacebookImageId`) REFERENCES `craft_assetfiles` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_seomatic_settings_siteSeoImageId_fk` FOREIGN KEY (`siteSeoImageId`) REFERENCES `craft_assetfiles` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_seomatic_settings_siteSeoTwitterImageId_fk` FOREIGN KEY (`siteSeoTwitterImageId`) REFERENCES `craft_assetfiles` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_seomatic_settings` WRITE;
/*!40000 ALTER TABLE `craft_seomatic_settings` DISABLE KEYS */;

INSERT INTO `craft_seomatic_settings` (`id`, `siteSeoImageId`, `siteSeoTwitterImageId`, `siteSeoFacebookImageId`, `genericOwnerImageId`, `genericCreatorImageId`, `locale`, `siteSeoName`, `siteSeoTitle`, `siteSeoTitleSeparator`, `siteSeoTitlePlacement`, `siteSeoDescription`, `siteSeoKeywords`, `siteSeoImageTransform`, `siteSeoFacebookImageTransform`, `siteSeoTwitterImageTransform`, `siteTwitterCardType`, `siteOpenGraphType`, `siteRobots`, `siteRobotsTxt`, `siteLinksSearchTargets`, `siteLinksQueryInput`, `googleSiteVerification`, `bingSiteVerification`, `googleAnalyticsUID`, `googleTagManagerID`, `googleAnalyticsSendPageview`, `googleAnalyticsAdvertising`, `googleAnalyticsEcommerce`, `googleAnalyticsEEcommerce`, `googleAnalyticsLinkAttribution`, `googleAnalyticsLinker`, `googleAnalyticsAnonymizeIp`, `siteOwnerType`, `siteOwnerSubType`, `siteOwnerSpecificType`, `genericOwnerName`, `genericOwnerAlternateName`, `genericOwnerDescription`, `genericOwnerUrl`, `genericOwnerTelephone`, `genericOwnerEmail`, `genericOwnerStreetAddress`, `genericOwnerAddressLocality`, `genericOwnerAddressRegion`, `genericOwnerPostalCode`, `genericOwnerAddressCountry`, `genericOwnerGeoLatitude`, `genericOwnerGeoLongitude`, `organizationOwnerDuns`, `organizationOwnerFounder`, `organizationOwnerFoundingDate`, `organizationOwnerFoundingLocation`, `organizationOwnerContactPoints`, `localBusinessPriceRange`, `localBusinessOwnerOpeningHours`, `corporationOwnerTickerSymbol`, `restaurantOwnerServesCuisine`, `restaurantOwnerMenuUrl`, `restaurantOwnerReservationsUrl`, `personOwnerGender`, `personOwnerBirthPlace`, `twitterHandle`, `facebookHandle`, `facebookProfileId`, `facebookAppId`, `linkedInHandle`, `googlePlusHandle`, `youtubeHandle`, `youtubeChannelHandle`, `instagramHandle`, `pinterestHandle`, `githubHandle`, `vimeoHandle`, `wikipediaUrl`, `siteCreatorType`, `siteCreatorSubType`, `siteCreatorSpecificType`, `genericCreatorName`, `genericCreatorAlternateName`, `genericCreatorDescription`, `genericCreatorUrl`, `genericCreatorTelephone`, `genericCreatorEmail`, `genericCreatorStreetAddress`, `genericCreatorAddressLocality`, `genericCreatorAddressRegion`, `genericCreatorPostalCode`, `genericCreatorAddressCountry`, `genericCreatorGeoLatitude`, `genericCreatorGeoLongitude`, `organizationCreatorDuns`, `organizationCreatorFounder`, `organizationCreatorFoundingDate`, `organizationCreatorFoundingLocation`, `organizationCreatorContactPoints`, `localBusinessCreatorOpeningHours`, `corporationCreatorTickerSymbol`, `restaurantCreatorServesCuisine`, `restaurantCreatorMenuUrl`, `restaurantCreatorReservationsUrl`, `personCreatorGender`, `personCreatorBirthPlace`, `genericCreatorHumansTxt`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,NULL,NULL,NULL,NULL,NULL,'de','kittn','This is the default global title of the site pages.','|','after','This is the default global natural language description of the content on the site pages.','default,global,comma-separated,keywords','','','','summary','website','','# robots.txt for {{ siteUrl }}\n\nSitemap: {{ siteUrl |trim(\'/\') }}/sitemap.xml\n\n# Don\'t allow web crawlers to index Craft\n\nUser-agent: *\nDisallow: /craft/\n','','','','','','',1,0,0,0,0,0,0,'Organization','Corporation','','kittn','','','http://ktest10.local/','','','','','','','','','','','','','','','$$$','','','','','','','','','','','','','','','','','','','','','Organization','Corporation','','','','','','','','','','','','','','','','','','','','','','','','','','','/* TEAM */\n\n{% if seomaticCreator.name is defined and seomaticCreator.name %}\nCreator: {{ seomaticCreator.name }}\n{% endif %}\n{% if seomaticCreator.url is defined and seomaticCreator.url %}\nURL: {{ seomaticCreator.url }}\n{% endif %}\n{% if seomaticCreator.description is defined and seomaticCreator.description %}\nDescription: {{ seomaticCreator.description }}\n{% endif %}\n\n/* THANKS */\n\nPixel & Tonic - https://pixelandtonic.com\n\n/* SITE */\n\nStandards: HTML5, CSS3\nComponents: Craft CMS, Yii, PHP, Javascript, SEOmatic','2017-07-04 22:02:15','2017-07-04 22:02:15','7a983667-bc4a-48c6-8344-d80ce65282a1'),
	(2,NULL,NULL,NULL,NULL,NULL,'en','kittn (en)','This is the default global title of the site pages. (en)','|','after','This is the default global natural language description of the content on the site pages. (en)','default,global,comma-separated,keywords (en)','','','','summary','website','','# robots.txt for {{ siteUrl }}\n# For a multi-environment setup, see: https://nystudio107.com/blog/prevent-google-from-indexing-staging-sites\n\nSitemap: {{ siteUrl |trim(\'/\') }}/sitemap.xml\n\n{% if craft.config.devMode %}\n# devMode - disallow all\n\nUser-agent: *\nDisallow: /\n{% else %}\n# Live - Don\'t allow web crawlers to index Craft\n\nUser-agent: *\nDisallow: /craft/\n{% endif %}','','','','','','',1,0,0,0,0,0,0,'Organization','Corporation','','kittn','','','http://kittncb.local/','','','','','','','','','','','','','','','$$$','','','','','','','','','','','','','','','','','','','','','Organization','Corporation','','','','','','','','','','','','','','','','','','','','','','','','','','','/* TEAM */\n\n{% if seomaticCreator.name is defined and seomaticCreator.name %}\nCreator: {{ seomaticCreator.name }}\n{% endif %}\n{% if seomaticCreator.url is defined and seomaticCreator.url %}\nURL: {{ seomaticCreator.url }}\n{% endif %}\n{% if seomaticCreator.description is defined and seomaticCreator.description %}\nDescription: {{ seomaticCreator.description }}\n{% endif %}\n\n/* THANKS */\n\nPixel & Tonic - https://pixelandtonic.com\n\n/* SITE */\n\nStandards: HTML5, CSS3\nComponents: Craft CMS, Yii, PHP, Javascript, SEOmatic','2018-03-19 16:41:15','2018-03-19 16:41:15','d238569e-e61c-485a-92f2-c561f75fdedd');

/*!40000 ALTER TABLE `craft_seomatic_settings` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_sessions`;

CREATE TABLE `craft_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_sessions_uid_idx` (`uid`),
  KEY `craft_sessions_token_idx` (`token`),
  KEY `craft_sessions_dateUpdated_idx` (`dateUpdated`),
  KEY `craft_sessions_userId_fk` (`userId`),
  CONSTRAINT `craft_sessions_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_sessions` WRITE;
/*!40000 ALTER TABLE `craft_sessions` DISABLE KEYS */;

INSERT INTO `craft_sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(8,1,'d10c5c5c01cbe4219ad914b739d059b7d20c5b05czozMjoicjBzRFpnMmxfeWdRMVdBWE16RDBURDZZc29wbTN0cTYiOw==','2018-03-17 14:19:03','2018-03-17 14:52:37','68c74351-e4fb-4b3e-a2d7-3d5b4b84f921'),
	(9,1,'7e09d4d20149957e2aae6432b83d0badf9941a67czozMjoiMlhRVmlwTmtndTMyNHZ0WjM2SEtlNG90RTNfQjdNWU0iOw==','2018-03-18 20:44:09','2018-03-18 20:44:09','3ba9f9b7-b305-4907-ba0e-d72b124e6ef1'),
	(10,1,'292fb616efe2b1cc4b6dd4bcbd9dadeb8ab8b166czozMjoiYTRzM3d3RnVBRnljeWFJT05LV3Y0RWt+TWVZQzVjbjYiOw==','2018-03-19 09:39:25','2018-03-19 09:39:25','44e923b7-47be-4a3f-a6ba-05b74f334a6c'),
	(11,1,'01386edc664d0b2f0d1a7a2b935473a0191db71eczozMjoia3hKMUY5NVNfSTZVR1BYVThFSVJYWDVTZ3lRRFlXMGEiOw==','2018-03-19 14:35:30','2018-03-19 14:35:30','5887a402-986d-41f7-a167-b073ed8ea221'),
	(12,1,'c8149a66560b9e3fb2d46262063de19be36cadd7czozMjoidF9OeG9YNTZNbUlydU9PN0owNWFuRnozMHhFeUlJQXciOw==','2018-03-19 16:09:49','2018-03-19 16:09:49','30e42c22-a58d-4e44-9217-ad00bb858038'),
	(13,1,'3e821e6a6dd187678df0ce4697fcb0e825facd6dczozMjoiZ1VJTko5ZzhRSG0zZ2hrUWNhQ1ZId1VkMExjdzVIakUiOw==','2018-04-06 15:22:19','2018-04-06 15:22:19','f48a7993-5ccb-466e-8b97-14dd71f3f4d7'),
	(14,1,'4e196249f165a572d92f97d984abad68208f0862czozMjoiMmxWV3VJQVNIRUxTbjlDVVhWejVYbkxtUW9UODhOc1EiOw==','2018-04-07 10:42:21','2018-04-07 10:42:21','2eeb034e-be7d-4434-ab8d-8fc8dbd662e7'),
	(15,1,'0103932382a94f7896ff2a122385dc3d629aaffaczozMjoiVlFUTWF0NjNXejl6TUEyeFV4dVZpaGVmYWVubGVVQUMiOw==','2018-04-20 23:33:57','2018-04-20 23:33:57','c6ef9175-2698-40f2-9d83-fac753d59a2d'),
	(16,1,'1c910f22db93c5b02d3869739f39cb128cea50b8czozMjoiczZLRWM2WDhIeHQxUER5NkwzWU9uZnhUS2JaUU1TUkMiOw==','2018-04-21 07:29:24','2018-04-21 07:29:24','c1212a24-e561-4c29-8aed-accbce780317'),
	(17,1,'314d33459f83e9c55f9c731739f3ec6f7c3e2fdbczozMjoicjFzWDlrd2s4TnFqM1V6YjlIdjF1SzhuRFBjNTZlbjUiOw==','2018-04-21 10:12:34','2018-04-21 10:12:34','b960c5c7-ed9f-4773-a6c0-057db3dd16d2');

/*!40000 ALTER TABLE `craft_sessions` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_shunnedmessages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_shunnedmessages`;

CREATE TABLE `craft_shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_shunnedmessages_userId_message_unq_idx` (`userId`,`message`),
  CONSTRAINT `craft_shunnedmessages_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_structureelements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_structureelements`;

CREATE TABLE `craft_structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_structureelements_structureId_elementId_unq_idx` (`structureId`,`elementId`),
  KEY `craft_structureelements_root_idx` (`root`),
  KEY `craft_structureelements_lft_idx` (`lft`),
  KEY `craft_structureelements_rgt_idx` (`rgt`),
  KEY `craft_structureelements_level_idx` (`level`),
  KEY `craft_structureelements_elementId_fk` (`elementId`),
  CONSTRAINT `craft_structureelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_structureelements_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_structureelements` WRITE;
/*!40000 ALTER TABLE `craft_structureelements` DISABLE KEYS */;

INSERT INTO `craft_structureelements` (`id`, `structureId`, `elementId`, `root`, `lft`, `rgt`, `level`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,4,NULL,1,1,4,0,'2017-07-05 20:08:13','2017-07-05 20:08:13','be40d97b-dcc2-4e1c-9dc0-eff8ff1952c4'),
	(2,4,7,1,2,3,1,'2017-07-05 20:08:13','2017-07-05 20:08:13','bbc7071a-770a-4985-96cf-91bb9d82d745'),
	(3,7,NULL,3,1,10,0,'2018-03-07 10:32:45','2018-03-07 10:32:45','be2b4d6f-cb81-40d2-82a3-8dcac621eef0'),
	(5,8,NULL,5,1,70,0,'2018-03-07 10:37:36','2018-03-07 10:37:36','162ab534-7088-438b-83f6-96900c32fcda'),
	(6,8,15,5,2,3,1,'2018-03-07 10:37:36','2018-03-07 10:37:36','3ce5a80c-0ef6-4af1-8c25-6dd0057d5598'),
	(7,8,17,5,4,5,1,'2018-03-07 10:38:05','2018-03-07 10:38:05','9617ac0b-8f54-4110-a68e-9d55f365a735'),
	(8,8,19,5,6,7,1,'2018-03-07 10:38:42','2018-03-07 10:38:42','7d78cf43-c3c4-4c2a-bc45-1dfad75df78e'),
	(9,8,21,5,8,9,1,'2018-03-07 10:39:57','2018-03-07 10:39:57','c82f4877-4357-4d52-95c3-e0f9277f74c4'),
	(10,8,23,5,10,11,1,'2018-03-07 10:40:24','2018-03-07 10:40:24','5fd67253-5c58-4231-ad2c-702073b662d6'),
	(11,8,25,5,12,13,1,'2018-03-07 10:41:02','2018-03-07 10:41:02','4b2b6b72-96bd-438a-8105-d6965d090e1b'),
	(12,8,27,5,14,15,1,'2018-03-07 10:42:06','2018-03-07 10:42:06','e644377b-e4a8-44ca-8b76-595d5b205f26'),
	(13,8,29,5,16,17,1,'2018-03-07 10:42:47','2018-03-07 10:42:47','4151b4b4-da9c-41f3-8ac4-30db97371f3b'),
	(14,8,31,5,18,19,1,'2018-03-07 10:43:20','2018-03-07 10:43:20','04bac8f9-c9b7-4957-97be-2fdc9db2e28c'),
	(15,8,33,5,20,21,1,'2018-03-07 10:44:01','2018-03-07 10:44:01','6d581101-fe41-4ca5-9a83-4cacc912f463'),
	(16,8,35,5,22,23,1,'2018-03-07 10:45:27','2018-03-07 10:45:27','d3bfc84a-2cb4-4a7a-a4c8-84ac4e25c905'),
	(17,8,37,5,24,25,1,'2018-03-07 10:46:50','2018-03-07 10:46:50','66de3e7a-8228-4392-b15b-5a2ff161a968'),
	(18,8,39,5,26,27,1,'2018-03-07 10:48:12','2018-03-07 10:48:12','e27d97ea-8925-414c-b5b3-06131db5d9eb'),
	(19,8,41,5,28,29,1,'2018-03-07 10:49:04','2018-03-07 10:49:04','c8c2e6b4-2f28-448f-8c1d-91307ff39a94'),
	(20,8,43,5,30,31,1,'2018-03-07 10:49:58','2018-03-07 10:49:58','9f38c19e-8ce4-4f49-a0ee-bdf97f656669'),
	(63,8,63,5,32,33,1,'2018-03-18 21:45:20','2018-03-18 21:45:20','9bc2ba68-3706-4103-8b06-9bcfdc7b7dba'),
	(64,8,65,5,34,35,1,'2018-03-18 21:45:44','2018-03-18 21:45:44','99fbed91-1413-4e63-a9f1-36fce05cf8b1'),
	(65,8,67,5,36,37,1,'2018-03-18 21:46:06','2018-03-18 21:46:06','5f2da2e8-7e2d-4049-bf73-c5edb69ad34a'),
	(67,8,71,5,38,39,1,'2018-03-18 21:47:21','2018-03-18 21:47:21','5cc53de9-54c4-44f6-8e48-ab74418bb7a8'),
	(68,8,73,5,40,41,1,'2018-03-18 21:47:51','2018-03-18 21:47:51','027230ad-c886-4360-9abb-4f7f780d5079'),
	(69,8,75,5,42,43,1,'2018-03-18 21:48:09','2018-03-18 21:48:09','dd2bf6d0-edd4-4d12-9c3c-f5d09a30aed4'),
	(70,8,77,5,44,45,1,'2018-03-18 21:48:26','2018-03-18 21:48:26','8cd76985-30da-4d06-b010-cb01b218c329'),
	(75,2,NULL,75,1,2,0,'2018-03-19 10:02:06','2018-03-19 10:02:06','85a23d45-5838-4045-b0cd-0bd60cc6f079'),
	(77,8,89,5,46,47,1,'2018-03-19 10:45:23','2018-03-19 10:45:23','90c62dd0-283c-41a0-af75-dbb16cb40f54'),
	(78,8,91,5,48,49,1,'2018-03-19 10:45:38','2018-03-19 10:45:38','f48574af-2025-4dda-874b-aa935412df28'),
	(79,8,93,5,50,51,1,'2018-03-19 11:14:40','2018-03-19 11:14:40','ac1fd8da-1c02-49c5-8b43-91fadcf4b547'),
	(80,8,95,5,52,53,1,'2018-03-19 11:15:06','2018-03-19 11:15:06','6c4081c2-e2a3-4ef2-bf6f-1f4f30a754ab'),
	(81,8,97,5,54,55,1,'2018-03-19 11:16:04','2018-03-19 11:16:04','7a0e2bfc-b32b-4d03-b08f-286e23eaca1c'),
	(82,8,99,5,56,57,1,'2018-03-19 11:16:33','2018-03-19 11:16:33','33b252b1-8822-4592-87ca-14dbed5245b3'),
	(83,8,101,5,58,59,1,'2018-03-19 16:23:37','2018-03-19 16:23:37','93dbbf96-26a1-402c-8196-cac3f4e76b99'),
	(89,8,105,5,60,61,1,'2018-03-19 16:48:46','2018-03-19 16:48:46','36021934-783a-45c0-844d-b97f51074c8a'),
	(90,8,107,5,62,63,1,'2018-03-19 16:49:24','2018-03-19 16:49:24','1493089f-f80a-4b2e-9317-f922415a8a8e'),
	(91,8,109,5,64,65,1,'2018-03-19 16:50:51','2018-03-19 16:50:51','c4e36ba2-cf31-461b-ae53-d6b40a99ae4e'),
	(92,8,111,5,66,67,1,'2018-03-19 16:51:17','2018-03-19 16:51:17','3ffe16de-5fc6-4a0c-a3cd-e35c1b3af4ed'),
	(93,8,113,5,68,69,1,'2018-03-19 16:56:11','2018-03-19 16:56:11','e9a05b44-141f-4a31-a962-d6cafd4dfee2'),
	(130,26,NULL,130,1,12,0,'2018-03-19 18:20:17','2018-03-19 18:20:17','68284f10-3e3c-4ed1-be8b-3fdd942c22f9'),
	(131,26,80,130,2,9,1,'2018-03-19 18:20:17','2018-03-19 18:20:17','0495d9ff-b52e-4341-9cb6-6d06316e928c'),
	(132,26,83,130,3,8,2,'2018-03-19 18:20:17','2018-03-19 18:20:17','62303129-3bed-467f-821d-10f3ee492777'),
	(133,26,85,130,4,5,3,'2018-03-19 18:20:17','2018-03-19 18:20:17','05e9b0a8-c5a1-491e-8380-7b9804756114'),
	(134,26,103,130,6,7,3,'2018-03-19 18:20:17','2018-03-19 18:20:17','99197c58-39ba-4827-8e38-b6cbd4cb3899'),
	(135,26,115,130,10,11,1,'2018-03-19 18:20:17','2018-03-19 18:20:17','6a7dc5f3-8601-487f-bcb3-a48c6aef9fda'),
	(149,7,125,3,2,3,1,'2018-04-21 00:53:00','2018-04-21 00:53:00','59d8986d-e930-475c-9638-a264df0f1923'),
	(162,32,NULL,162,1,4,0,'2018-04-21 07:29:52','2018-04-21 07:29:52','720d1a1e-3dbc-4379-9700-dc5fdab6399c'),
	(163,32,59,162,2,3,1,'2018-04-21 07:29:52','2018-04-21 07:29:52','a97d4e1d-18c0-4950-bc3f-e99052d340f1'),
	(164,7,131,3,4,5,1,'2018-04-21 10:14:11','2018-04-21 10:14:11','7610426a-cb74-4946-bda5-75c166f746cc'),
	(171,7,146,3,6,7,1,'2018-04-21 10:36:13','2018-04-21 10:36:13','5a2cb9f1-405d-4ae2-bbbb-93073116b766'),
	(172,7,148,3,8,9,1,'2018-04-21 10:38:08','2018-04-21 10:38:08','36f212d1-0de9-422e-8d9b-e5a745a5512f'),
	(193,37,NULL,193,1,20,0,'2018-04-21 10:47:51','2018-04-21 10:47:51','d951a23b-d489-42fa-9074-1046c48cbcc0'),
	(194,37,134,193,2,19,1,'2018-04-21 10:47:51','2018-04-21 10:47:51','1f1ce9af-ba5f-441d-a6ab-baba961f890c'),
	(195,37,137,193,3,6,2,'2018-04-21 10:47:51','2018-04-21 10:47:51','a954490e-c04a-46ba-aa24-92dbe4073ec0'),
	(196,37,139,193,4,5,3,'2018-04-21 10:47:51','2018-04-21 10:47:51','9fb68ddf-4a8b-4001-80b0-aae328781807'),
	(197,37,141,193,7,10,2,'2018-04-21 10:47:51','2018-04-21 10:47:51','f9fa8e1b-503e-41f0-95f9-88a47035b774'),
	(198,37,143,193,8,9,3,'2018-04-21 10:47:51','2018-04-21 10:47:51','5eb668b6-db91-4797-99f0-191c2eb9c3f6'),
	(199,37,150,193,11,14,2,'2018-04-21 10:47:51','2018-04-21 10:47:51','855698eb-75a8-4ade-ad34-71191f430aca'),
	(200,37,152,193,12,13,3,'2018-04-21 10:47:52','2018-04-21 10:47:52','5f2e0efe-3c1d-42b3-8657-b939ed0d269d'),
	(201,37,154,193,15,18,2,'2018-04-21 10:47:52','2018-04-21 10:47:52','4c2a1129-605c-4e1b-a4e4-2a439597aa80'),
	(202,37,156,193,16,17,3,'2018-04-21 10:47:52','2018-04-21 10:47:52','5627308e-726c-4787-810d-c4f1a013dc7a');

/*!40000 ALTER TABLE `craft_structureelements` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_structures
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_structures`;

CREATE TABLE `craft_structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_structures` WRITE;
/*!40000 ALTER TABLE `craft_structures` DISABLE KEYS */;

INSERT INTO `craft_structures` (`id`, `maxLevels`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,2,'2017-07-04 22:00:57','2017-07-05 21:34:34','01b2e0b4-a63b-46fe-b031-6cbf145b7612'),
	(2,2,'2017-07-04 22:00:57','2017-07-05 21:35:00','99021280-ab9d-48a1-ab19-66b2e4b4a849'),
	(3,1,'2017-07-04 22:00:58','2017-07-04 22:01:04','5888e673-481b-4448-b789-dfb4998de289'),
	(4,1,'2017-07-04 22:00:58','2018-03-07 12:28:35','981a5add-ed47-44a8-9dd4-a69c0b2b8901'),
	(6,NULL,'2017-07-16 14:05:54','2017-07-16 14:05:54','e4aecf6d-f90b-411f-a161-fdb38b9bc08d'),
	(7,1,'2018-03-07 10:06:03','2018-03-07 10:25:49','56620dcc-1c83-4967-9284-c383f8ee373d'),
	(8,1,'2018-03-07 10:06:03','2018-03-07 10:28:23','6bbe846c-b64c-4051-bee7-0bc7996926d8'),
	(26,NULL,'2018-03-19 18:20:17','2018-03-19 18:20:17','5dbb11f0-3c62-43e6-bf16-f15b49797ce3'),
	(32,NULL,'2018-04-21 07:29:52','2018-04-21 07:29:52','83c89a72-76f2-48bb-b924-71704f378640'),
	(37,NULL,'2018-04-21 10:47:51','2018-04-21 10:47:51','3fabfd1f-7959-4f96-a92c-f86724a7c482');

/*!40000 ALTER TABLE `craft_structures` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertableblocks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertableblocks`;

CREATE TABLE `craft_supertableblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `ownerLocale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_supertableblocks_ownerId_idx` (`ownerId`),
  KEY `craft_supertableblocks_fieldId_idx` (`fieldId`),
  KEY `craft_supertableblocks_typeId_idx` (`typeId`),
  KEY `craft_supertableblocks_sortOrder_idx` (`sortOrder`),
  KEY `craft_supertableblocks_ownerLocale_fk` (`ownerLocale`),
  CONSTRAINT `craft_supertableblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertableblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertableblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertableblocks_ownerLocale_fk` FOREIGN KEY (`ownerLocale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_supertableblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `craft_supertableblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertableblocks` WRITE;
/*!40000 ALTER TABLE `craft_supertableblocks` DISABLE KEYS */;

INSERT INTO `craft_supertableblocks` (`id`, `ownerId`, `fieldId`, `typeId`, `sortOrder`, `ownerLocale`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(10,2,62,14,1,NULL,'2017-07-05 21:33:19','2018-04-21 07:29:53','32cbc86d-b0cd-472a-9c06-b3f085a3c5a0'),
	(12,11,46,10,1,NULL,'2017-07-16 14:05:54','2017-07-16 14:05:54','31311697-2f49-4387-8d1f-2646250a1341'),
	(16,15,244,58,1,NULL,'2018-03-07 10:37:36','2018-03-19 14:39:20','0d49c5e8-7268-4c02-8481-d41ee405ff61'),
	(18,17,244,58,1,NULL,'2018-03-07 10:38:05','2018-03-19 14:39:30','9442aede-0ed3-432e-8172-a58f20d1ae68'),
	(20,19,244,58,1,NULL,'2018-03-07 10:38:42','2018-03-19 14:39:10','1ce4125f-f2c6-49cd-885f-958d498056f4'),
	(22,21,244,58,1,NULL,'2018-03-07 10:39:57','2018-03-19 14:40:07','c9195601-39dd-4bbf-a128-dd32cbe7e844'),
	(24,23,244,58,1,NULL,'2018-03-07 10:40:24','2018-03-19 14:39:42','e279c6de-d297-4701-8f65-fa6dd3fdeb11'),
	(26,25,244,58,1,NULL,'2018-03-07 10:41:02','2018-03-19 14:39:54','769aa277-b1d1-4f88-b332-dde786e56c1b'),
	(28,27,244,58,1,NULL,'2018-03-07 10:42:05','2018-03-19 16:25:02','af554966-32ba-4f46-993d-a3130ac97d92'),
	(30,29,244,58,1,NULL,'2018-03-07 10:42:47','2018-03-19 16:54:53','3aaf2c20-a149-44c2-9745-95921f9194b2'),
	(32,31,244,58,1,NULL,'2018-03-07 10:43:20','2018-03-19 16:54:45','7fca37fc-1838-4f9d-a70f-282ae4963eb9'),
	(34,33,244,58,1,NULL,'2018-03-07 10:44:01','2018-03-07 10:44:01','9f21cc64-0e33-448f-824d-6f4be279dcb1'),
	(36,35,244,58,1,NULL,'2018-03-07 10:45:27','2018-03-07 10:45:27','bcee1b62-c493-43f7-9f65-abfa5c115ad4'),
	(38,37,244,58,1,NULL,'2018-03-07 10:46:50','2018-03-07 12:13:09','9c7c4569-6e9c-4218-be4f-723af479832e'),
	(40,39,244,58,1,NULL,'2018-03-07 10:48:12','2018-03-07 10:48:12','7b630e86-596a-40c3-a588-de74066ff972'),
	(42,41,244,58,1,NULL,'2018-03-07 10:49:04','2018-03-07 11:47:08','2addb385-081e-44a4-88d4-26a15a08ed19'),
	(44,43,244,58,1,NULL,'2018-03-07 10:49:58','2018-03-07 11:47:15','09bbc90f-c48b-44fb-b1e2-a634fd23226d'),
	(60,59,192,44,1,NULL,'2018-03-07 12:25:19','2018-04-21 07:29:52','25d74d8a-c4e7-4dbc-974d-6c5021a62370'),
	(64,63,244,58,1,NULL,'2018-03-18 21:45:20','2018-03-18 21:45:20','4df0e676-f1d0-4b01-a436-e05c155b0b1c'),
	(66,65,244,58,1,NULL,'2018-03-18 21:45:44','2018-03-18 21:45:44','56f53500-4a72-43f2-a063-e17ef276909c'),
	(68,67,244,58,1,NULL,'2018-03-18 21:46:06','2018-03-18 21:46:06','d4a0040b-4ed9-4243-8b70-3ebe4077eded'),
	(72,71,244,58,1,NULL,'2018-03-18 21:47:21','2018-03-19 16:57:09','966fc2cb-5bcd-47bd-8ec8-3fb3c1b2612f'),
	(74,73,244,58,1,NULL,'2018-03-18 21:47:51','2018-03-18 21:47:51','491a6193-e7ae-4284-aeee-83be7b27adc9'),
	(76,75,244,58,1,NULL,'2018-03-18 21:48:09','2018-03-18 21:48:09','68a19a23-84ed-4dbc-8753-4f89de1e80d5'),
	(78,77,244,58,1,NULL,'2018-03-18 21:48:26','2018-03-18 21:48:26','04805167-7b6c-47d6-861e-4584e9f1d2a0'),
	(81,80,247,59,1,NULL,'2018-03-19 10:02:06','2018-03-19 18:20:17','5228caa2-a90a-4da9-8088-4d00b6426208'),
	(82,80,173,41,1,NULL,'2018-03-19 10:02:06','2018-03-19 18:20:17','698499aa-161e-4f9f-968e-4cc9e4278d0b'),
	(84,83,181,42,1,NULL,'2018-03-19 10:02:06','2018-03-19 18:20:17','27ab68eb-989f-46d8-9e30-72e0bd83fde4'),
	(86,85,192,44,1,NULL,'2018-03-19 10:02:06','2018-03-19 18:20:17','c3489191-59c4-4ae3-a1ff-337207e62dba'),
	(90,89,244,58,1,NULL,'2018-03-19 10:45:23','2018-03-19 10:45:23','6dafd472-54b2-4762-9370-6223ec8584d9'),
	(92,91,244,58,1,NULL,'2018-03-19 10:45:38','2018-04-21 00:34:18','68061407-fedd-4947-adab-3aff07b9472e'),
	(94,93,244,58,1,NULL,'2018-03-19 11:14:39','2018-03-19 11:14:49','db1c8f8e-74e8-44fb-8945-6e3692fa2a12'),
	(96,95,244,58,1,NULL,'2018-03-19 11:15:06','2018-03-19 11:15:06','ebb65a67-908f-4c7a-85b0-9b4a39bb214c'),
	(98,97,244,58,1,NULL,'2018-03-19 11:16:04','2018-03-19 11:16:14','5ea44121-13fc-4aa7-9fd6-7f7982652af6'),
	(100,99,244,58,1,NULL,'2018-03-19 11:16:33','2018-03-19 11:16:33','1f684b32-e651-4295-83c8-dfa1daa12c63'),
	(102,101,244,58,1,NULL,'2018-03-19 16:23:37','2018-03-19 16:52:45','e7e0b2e7-d9c6-4a9a-825f-576326703ab3'),
	(104,103,216,51,1,NULL,'2018-03-19 16:41:26','2018-03-19 18:20:17','9488b44f-eeaf-4160-8172-c33a7e3f9eaf'),
	(106,105,244,58,1,NULL,'2018-03-19 16:48:46','2018-03-19 16:48:46','8363e328-6eb2-4332-a724-3c14ad22b1b5'),
	(108,107,244,58,1,NULL,'2018-03-19 16:49:24','2018-03-19 16:49:24','e53f99ec-174b-4774-9dd1-082c906021c4'),
	(110,109,244,58,1,NULL,'2018-03-19 16:50:51','2018-03-19 16:50:51','644c0807-c54b-49ba-a099-bd676704acfa'),
	(112,111,244,58,1,NULL,'2018-03-19 16:51:17','2018-03-19 16:51:17','a549287c-8952-453d-bb9d-dc25793ba235'),
	(114,113,244,58,1,NULL,'2018-03-19 16:56:11','2018-03-19 16:56:11','0cc2a6a2-37bf-4b58-a5c9-21a0cfedb578'),
	(116,115,261,62,1,NULL,'2018-03-19 17:23:15','2018-03-19 18:20:17','24c616c2-f398-444a-83d4-72d39439cd1e'),
	(117,115,264,63,1,NULL,'2018-03-19 17:23:15','2018-03-19 18:20:17','b2d97366-669b-49c5-a326-60ce423e0f07'),
	(126,125,184,43,1,NULL,'2018-04-21 00:53:00','2018-04-21 10:50:32','d4de3b79-bbaa-4bbe-81a1-fed27133e72c'),
	(132,131,184,43,1,NULL,'2018-04-21 10:14:11','2018-04-21 10:51:03','80f7a9c7-d7e2-4ce5-979e-d396d4d9fab6'),
	(135,134,247,59,1,NULL,'2018-04-21 10:18:52','2018-04-21 10:47:51','05f08c22-650e-42bc-859a-2c9e2b12429f'),
	(136,134,173,41,1,NULL,'2018-04-21 10:18:52','2018-04-21 10:47:51','2b11b02c-b785-4c7a-a3a7-35dc619c8d68'),
	(138,137,181,42,1,NULL,'2018-04-21 10:18:52','2018-04-21 10:47:51','5f6890b5-a354-45a7-89d7-7477f81c7d4a'),
	(140,139,192,44,1,NULL,'2018-04-21 10:18:52','2018-04-21 10:47:51','4b113efd-7e99-4c26-afa5-6b4662239851'),
	(142,141,181,42,1,NULL,'2018-04-21 10:18:52','2018-04-21 10:47:51','0a8fcd24-1d2b-4b02-8042-b1e1ff919718'),
	(144,143,192,44,1,NULL,'2018-04-21 10:18:52','2018-04-21 10:47:51','d9f5e7ca-5df3-4bdc-ad03-f7db3121a42e'),
	(147,146,184,43,1,NULL,'2018-04-21 10:36:13','2018-04-21 10:51:28','3d02286c-e6a4-4b6e-b926-0bb82a0d4ba7'),
	(149,148,184,43,1,NULL,'2018-04-21 10:38:08','2018-04-21 10:51:51','8d451331-a913-47f2-88a0-1d25885915a9'),
	(151,150,181,42,1,NULL,'2018-04-21 10:44:28','2018-04-21 10:47:51','24690d83-60d4-4e15-ac90-9243872a3505'),
	(153,152,192,44,1,NULL,'2018-04-21 10:44:28','2018-04-21 10:47:52','8c3e3ea9-ec23-463c-ba04-d4d36d0c61cd'),
	(155,154,181,42,1,NULL,'2018-04-21 10:47:52','2018-04-21 10:47:52','a6527f4b-3ade-406f-a5ef-3749c098efc1'),
	(157,156,192,44,1,NULL,'2018-04-21 10:47:52','2018-04-21 10:47:52','3e4d3328-428f-42aa-9a45-9b28a86d1990');

/*!40000 ALTER TABLE `craft_supertableblocks` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertableblocktypes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertableblocktypes`;

CREATE TABLE `craft_supertableblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_supertableblocktypes_fieldId_fk` (`fieldId`),
  KEY `craft_supertableblocktypes_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_supertableblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertableblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertableblocktypes` WRITE;
/*!40000 ALTER TABLE `craft_supertableblocktypes` DISABLE KEYS */;

INSERT INTO `craft_supertableblocktypes` (`id`, `fieldId`, `fieldLayoutId`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,4,155,'2017-07-04 22:00:58','2018-03-07 11:22:00','87087b86-9e31-45de-a7d8-36047a21dfcc'),
	(4,15,83,'2017-07-04 22:00:58','2017-07-05 19:45:58','ad27d5ef-38e9-49da-a94c-878c0bde82f4'),
	(7,33,250,'2017-07-04 22:00:59','2018-03-19 18:25:46','f0dbfeea-051d-48f8-8b64-4c847f3d3c3a'),
	(9,43,81,'2017-07-04 22:00:59','2017-07-04 22:15:50','638d9577-386e-4f66-b583-5ea3ca47375e'),
	(10,46,22,'2017-07-04 22:00:59','2017-07-04 22:00:59','864efaa4-6f60-404c-90df-691f667539c9'),
	(11,50,85,'2017-07-04 22:01:00','2017-07-05 19:47:03','1bf6c16f-edc4-4e69-af38-a3fa3e7783d2'),
	(14,62,82,'2017-07-04 22:01:00','2017-07-04 22:16:21','1c871578-9766-4838-a980-999806c3a2f8'),
	(16,72,86,'2017-07-04 22:01:00','2017-07-05 19:48:20','94e2ee42-07c1-4fa7-b727-78f0f0374d15'),
	(20,86,87,'2017-07-04 22:01:01','2017-07-05 19:49:41','a4cbb8ea-0bdc-4a47-a330-6fd873422380'),
	(22,93,88,'2017-07-04 22:01:01','2017-07-05 19:50:10','41f1eb64-1393-42e6-a6fa-a76ea602a4d7'),
	(29,125,89,'2017-07-04 22:01:03','2017-07-05 19:51:16','5fc55232-4504-4b2a-a17b-2392ac4ccfaf'),
	(33,144,80,'2017-07-04 22:01:03','2017-07-04 22:15:15','b6a7ee09-5280-4f6e-a96d-f5d37385c2d9'),
	(34,150,156,'2017-07-04 22:01:04','2018-03-07 11:22:39','15e40c0d-d083-4a76-b06a-11a96dc1974f'),
	(35,153,97,'2018-03-07 10:06:03','2018-03-07 10:06:03','3c41036e-6e4b-42b4-90e3-4b7b68cc62fd'),
	(36,155,311,'2018-03-07 10:06:03','2018-04-21 00:05:42','0d28a844-c855-47a0-adf4-06b28405ae44'),
	(37,159,312,'2018-03-07 10:06:04','2018-04-21 00:06:02','60016e6d-dade-4f68-ab32-e9f3e9fb89b6'),
	(38,162,313,'2018-03-07 10:06:04','2018-04-21 00:06:22','43e25524-7e10-4592-871b-c552eaf40359'),
	(39,165,314,'2018-03-07 10:06:04','2018-04-21 00:07:16','abd14d16-ccc0-4045-aece-e09bde42f793'),
	(40,169,102,'2018-03-07 10:06:04','2018-03-07 10:06:04','9929c646-aaa6-4116-bc1d-78745f505a95'),
	(41,173,315,'2018-03-07 10:06:04','2018-04-21 00:07:52','a2a8996d-2b38-421f-bd89-010a663c8618'),
	(42,181,316,'2018-03-07 10:06:04','2018-04-21 00:08:14','b01493da-f32c-4673-b81b-c1ea061bb012'),
	(43,184,330,'2018-03-07 10:06:04','2018-04-21 00:53:28','fb260974-8f0e-4e56-8917-41be0ab3c941'),
	(44,192,319,'2018-03-07 10:06:05','2018-04-21 00:13:15','ff685d77-de29-4a96-8fbb-e8c7ebb776c7'),
	(45,196,320,'2018-03-07 10:06:05','2018-04-21 00:13:33','8a4ecb9a-e1e7-4090-8b7b-a05544c77f89'),
	(46,200,323,'2018-03-07 10:06:05','2018-04-21 00:14:33','1c947149-150b-4e33-b1c8-e0fe7898bcb1'),
	(47,203,324,'2018-03-07 10:06:05','2018-04-21 00:14:52','1915dd04-7ec3-41c6-8f02-cf4667b9c49b'),
	(48,207,325,'2018-03-07 10:06:05','2018-04-21 00:15:07','a476115e-cb11-4572-8c2b-d18f9ddc5c00'),
	(49,210,326,'2018-03-07 10:06:05','2018-04-21 00:15:40','36c9ee28-a0c8-4687-9da6-f4a9e38496fa'),
	(50,214,327,'2018-03-07 10:06:05','2018-04-21 00:15:55','80b66a35-4c14-4eb2-bb26-a0c84a441d68'),
	(51,216,328,'2018-03-07 10:06:05','2018-04-21 00:16:07','f892964e-985e-4679-bb7d-8044a295bf79'),
	(52,218,114,'2018-03-07 10:06:06','2018-03-07 10:06:06','26aee02d-713a-4b4c-be99-3eccba4d471b'),
	(53,220,115,'2018-03-07 10:06:06','2018-03-07 10:06:06','35615011-2ffe-423c-84ea-d34f26445697'),
	(54,224,116,'2018-03-07 10:06:06','2018-03-07 10:06:06','97a1a3d1-e429-460b-a3e9-c24ab8a9719a'),
	(55,228,117,'2018-03-07 10:06:06','2018-03-07 10:06:06','8847878c-11a2-40bb-b9e0-53cd4130aa69'),
	(56,230,118,'2018-03-07 10:06:06','2018-03-07 10:06:06','0bd973e7-67ce-4ee3-ab95-30ae2452d217'),
	(57,237,119,'2018-03-07 10:06:06','2018-03-07 10:06:06','8fbde9d1-7989-4bad-91c9-586e12b8f16d'),
	(58,244,120,'2018-03-07 10:06:07','2018-03-07 10:06:07','fe981486-53f8-432e-8e9b-a1d6beb92502'),
	(59,247,317,'2018-03-07 10:14:44','2018-04-21 00:08:33','73cc5dc4-0a12-40f4-a01a-19e2ca3a8bd2'),
	(60,254,160,'2018-03-17 15:01:03','2018-03-17 15:01:03','b06f13eb-1697-4aa6-b47b-e642ed198905'),
	(61,257,321,'2018-03-17 15:01:03','2018-04-21 00:13:50','52a2d9d1-c819-4287-a199-fc280817a97a'),
	(62,261,216,'2018-03-19 17:17:13','2018-03-19 17:17:13','9870f2b4-9229-4f72-b89f-8766abeadf37'),
	(63,264,322,'2018-03-19 17:20:15','2018-04-21 00:14:14','7c23dd6b-a8a8-4d02-b90b-9d3e465d2fc5'),
	(64,271,282,'2018-04-20 23:55:23','2018-04-21 00:00:29','c9a61033-3538-40e6-a6b0-db7e4da08dcf'),
	(65,273,283,'2018-04-21 00:03:53','2018-04-21 00:03:53','22244b2f-886d-4ab8-a91a-6aee26ce7d97');

/*!40000 ALTER TABLE `craft_supertableblocktypes` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertablecontent_featuredimagelabeling
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_featuredimagelabeling`;

CREATE TABLE `craft_supertablecontent_featuredimagelabeling` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_headline` text COLLATE utf8_unicode_ci,
  `field_linkit` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertableconte_featuredimagelabeli_elementI_local_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_featuredimagelabeling_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_featuredimagelabeling_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_featuredimagelabeling_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_featuredimageoptions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_featuredimageoptions`;

CREATE TABLE `craft_supertablecontent_featuredimageoptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_fullbleed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_ratio` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertableconten_featuredimageoptio_elementI_locale_unq_id` (`elementId`,`locale`),
  KEY `craft_supertablecontent_featuredimageoptions_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_featuredimageoptions_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_featuredimageoptions_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertablecontent_featuredimageoptions` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_featuredimageoptions` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_featuredimageoptions` (`id`, `elementId`, `locale`, `field_fullbleed`, `field_ratio`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,12,'de',0,'','2017-07-16 14:05:54','2017-07-16 14:05:54','65323793-f359-4880-8bf4-617a47fa11e5'),
	(2,12,'en',0,'','2017-07-16 14:05:54','2017-07-16 14:05:54','9b7d056a-7ba4-4f56-b3d0-1ef786c9e58d');

/*!40000 ALTER TABLE `craft_supertablecontent_featuredimageoptions` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertablecontent_hero
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_hero`;

CREATE TABLE `craft_supertablecontent_hero` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_headline` text COLLATE utf8_unicode_ci,
  `field_linkit` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_hero_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_hero_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_hero_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_hero_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertablecontent_hero` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_hero` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_hero` (`id`, `elementId`, `locale`, `field_headline`, `field_linkit`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,10,'de','','','2017-07-05 21:33:19','2018-04-21 07:29:52','bd458b46-f3ef-4779-860e-4766f5982daf'),
	(2,10,'en','','','2018-03-07 11:12:23','2018-03-07 11:12:23','59f5899b-6d35-4612-8939-7e7cd5383d92');

/*!40000 ALTER TABLE `craft_supertablecontent_hero` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertablecontent_objaccordionwrapper
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_objaccordionwrapper`;

CREATE TABLE `craft_supertablecontent_objaccordionwrapper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertableconten_objaccordionwrappe_elementI_locale_unq_id` (`elementId`,`locale`),
  KEY `craft_supertablecontent_objaccordionwrapper_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_objaccordionwrapper_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_objaccordionwrapper_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_objcard
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_objcard`;

CREATE TABLE `craft_supertablecontent_objcard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_headline` text COLLATE utf8_unicode_ci,
  `field_subline` text COLLATE utf8_unicode_ci,
  `field_meta` text COLLATE utf8_unicode_ci,
  `field_body` text COLLATE utf8_unicode_ci,
  `field_cardlink` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_objcard_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_objcard_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_objcard_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_objcard_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_objembedcontent
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_objembedcontent`;

CREATE TABLE `craft_supertablecontent_objembedcontent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_embedUrl` text COLLATE utf8_unicode_ci,
  `field_embed` text COLLATE utf8_unicode_ci,
  `field_caption` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_objembedcontent_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_objembedcontent_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_objembedcontent_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_objembedcontent_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_objgallery
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_objgallery`;

CREATE TABLE `craft_supertablecontent_objgallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_caption` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_objgallery_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_objgallery_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_objgallery_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_objgallery_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_objinlinesvg
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_objinlinesvg`;

CREATE TABLE `craft_supertablecontent_objinlinesvg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_caption` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_objinlinesvg_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_objinlinesvg_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_objinlinesvg_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_objinlinesvg_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_objinstagram
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_objinstagram`;

CREATE TABLE `craft_supertablecontent_objinstagram` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_postUrl` text COLLATE utf8_unicode_ci,
  `field_caption` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_objinstagram_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_objinstagram_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_objinstagram_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_objinstagram_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertablecontent_objinstagram` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_objinstagram` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_objinstagram` (`id`, `elementId`, `locale`, `field_postUrl`, `field_caption`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,116,'de','https://www.instagram.com/p/Bgd8BVRjArN/?hl=de','Ein Flieger','2018-03-19 17:23:15','2018-03-19 18:20:17','d76aec9f-f625-4b16-8d8c-26a2989ed82c'),
	(2,116,'en','https://www.instagram.com/p/Bgd8BVRjArN/?hl=de','Ein Flieger','2018-03-19 17:23:15','2018-03-19 18:20:17','34021ef8-6278-4b46-889d-237f7bc62e66');

/*!40000 ALTER TABLE `craft_supertablecontent_objinstagram` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertablecontent_objjumpnavigation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_objjumpnavigation`;

CREATE TABLE `craft_supertablecontent_objjumpnavigation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_linkname` text COLLATE utf8_unicode_ci,
  `field_anchor` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertableconten_objjumpnavigatio_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_objjumpnavigation_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_objjumpnavigation_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_objjumpnavigation_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_objmediaimage
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_objmediaimage`;

CREATE TABLE `craft_supertablecontent_objmediaimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_caption` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_objmediaimage_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_objmediaimage_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_objmediaimage_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_objmediaimage_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_objquote
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_objquote`;

CREATE TABLE `craft_supertablecontent_objquote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_copy` text COLLATE utf8_unicode_ci,
  `field_source` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_objquote_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_objquote_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_objquote_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_objquote_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_objslideoutbox
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_objslideoutbox`;

CREATE TABLE `craft_supertablecontent_objslideoutbox` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_trigger` text COLLATE utf8_unicode_ci,
  `field_body` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_objslideoutbox_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_objslideoutbox_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_objslideoutbox_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_objslideoutbox_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_objtabwrapper
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_objtabwrapper`;

CREATE TABLE `craft_supertablecontent_objtabwrapper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_objtabwrapper_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_objtabwrapper_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_objtabwrapper_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_objtabwrapper_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_objvideo
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_objvideo`;

CREATE TABLE `craft_supertablecontent_objvideo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_objvideo_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_objvideo_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_objvideo_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_objvideo_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_setanchor
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_setanchor`;

CREATE TABLE `craft_supertablecontent_setanchor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_positionfix` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_setanchor_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_setanchor_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_setanchor_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_setanchor_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_setbutton
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_setbutton`;

CREATE TABLE `craft_supertablecontent_setbutton` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_fullwidth` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_position` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'left',
  `field_addClasses` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_setbutton_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_setbutton_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_setbutton_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_setbutton_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_setcard
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_setcard`;

CREATE TABLE `craft_supertablecontent_setcard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_mediaRatio` text COLLATE utf8_unicode_ci,
  `field_addClasses` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_setcard_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_setcard_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_setcard_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_setcard_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_setcardslider
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_setcardslider`;

CREATE TABLE `craft_supertablecontent_setcardslider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_addClasses` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_setcardslider_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_setcardslider_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_setcardslider_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_setcardslider_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_setembedcontent
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_setembedcontent`;

CREATE TABLE `craft_supertablecontent_setembedcontent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_responsive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_ratio` text COLLATE utf8_unicode_ci,
  `field_addClasses` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_setembedcontent_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_setembedcontent_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_setembedcontent_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_setembedcontent_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_setgallery
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_setgallery`;

CREATE TABLE `craft_supertablecontent_setgallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_layoutType` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_ratio` text COLLATE utf8_unicode_ci,
  `field_width` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_setgallery_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_setgallery_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_setgallery_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_setgallery_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_setgridboxoptions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_setgridboxoptions`;

CREATE TABLE `craft_supertablecontent_setgridboxoptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_boxName` text COLLATE utf8_unicode_ci,
  `field_addClasses` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertableconten_setgridboxoption_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_setgridboxoptions_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_setgridboxoptions_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_setgridboxoptions_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertablecontent_setgridboxoptions` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_setgridboxoptions` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_setgridboxoptions` (`id`, `elementId`, `locale`, `field_boxName`, `field_addClasses`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,84,'de','',NULL,'2018-03-19 10:02:06','2018-03-19 18:20:17','e5adb9ab-2d2d-4892-8b5b-eef4c65ab553'),
	(2,84,'en','',NULL,'2018-03-19 10:02:06','2018-03-19 18:20:17','e5b2d320-2c34-4413-85cf-f7c2021866ec'),
	(7,138,'de','','','2018-04-21 10:18:52','2018-04-21 10:47:51','3d7c5a65-cd02-4409-8071-71084822ed40'),
	(8,138,'en','','','2018-04-21 10:18:52','2018-04-21 10:47:51','b610e0e7-756d-400c-971d-95577f1fdec0'),
	(9,142,'de','','','2018-04-21 10:18:52','2018-04-21 10:47:51','e0574109-2b20-47f7-8f5b-a37db6cb0337'),
	(10,142,'en','','','2018-04-21 10:18:52','2018-04-21 10:47:51','6f889b6e-4e17-4941-a2e8-adeb9f9a0b56'),
	(11,151,'de','','','2018-04-21 10:44:28','2018-04-21 10:47:51','d0e1e8d5-d9bf-492f-a601-bb6e02433937'),
	(12,151,'en','','','2018-04-21 10:44:28','2018-04-21 10:47:51','f8decbce-39c7-4639-bb32-3e989f1c9983'),
	(13,155,'de','','','2018-04-21 10:47:52','2018-04-21 10:47:52','144afd76-fd85-4c76-aabe-d6c8f34e000c'),
	(14,155,'en','','','2018-04-21 10:47:52','2018-04-21 10:47:52','18643df7-bc27-47c1-b5b1-7d73149babd2');

/*!40000 ALTER TABLE `craft_supertablecontent_setgridboxoptions` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertablecontent_setgridoptions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_setgridoptions`;

CREATE TABLE `craft_supertablecontent_setgridoptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_anchor` text COLLATE utf8_unicode_ci,
  `field_innerContainer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_addClasses` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_setgridoptions_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_setgridoptions_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_setgridoptions_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_setgridoptions_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertablecontent_setgridoptions` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_setgridoptions` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_setgridoptions` (`id`, `elementId`, `locale`, `field_anchor`, `field_innerContainer`, `field_addClasses`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,81,'de','','bigger-25',NULL,'2018-03-19 10:02:06','2018-03-19 18:20:17','09c8758d-51ab-4e00-8794-ae04eb9fc8be'),
	(2,81,'en','','bigger-25',NULL,'2018-03-19 10:02:06','2018-03-19 18:20:17','d923690b-fb3c-4b6d-91c6-dc3d96eb91fa'),
	(5,135,'de','','default','','2018-04-21 10:18:52','2018-04-21 10:47:51','2ba0c96c-2617-44ff-89d0-97877e9b6d12'),
	(6,135,'en','','default','','2018-04-21 10:18:52','2018-04-21 10:47:51','4e71c30b-a5af-4d3d-a12d-dee346aeb70e');

/*!40000 ALTER TABLE `craft_supertablecontent_setgridoptions` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertablecontent_setgridsectionbackground
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_setgridsectionbackground`;

CREATE TABLE `craft_supertablecontent_setgridsectionbackground` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_ratio` text COLLATE utf8_unicode_ci,
  `field_position` text COLLATE utf8_unicode_ci,
  `field_adaptContainer` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_width` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `field_addClasses` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craf_supertableconte_setgridsectionbackgro_elementI_local_unq_id` (`elementId`,`locale`),
  KEY `craft_supertablecontent_setgridsectionbackground_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_setgridsectionbackground_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_setgridsectionbackground_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertablecontent_setgridsectionbackground` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_setgridsectionbackground` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_setgridsectionbackground` (`id`, `elementId`, `locale`, `field_ratio`, `field_position`, `field_adaptContainer`, `field_width`, `field_addClasses`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,82,'de','','',0,'default',NULL,'2018-03-19 10:02:06','2018-03-19 18:20:17','5d4f2d58-4b26-43b5-a66a-650d6b6d15db'),
	(2,82,'en','','',0,'default',NULL,'2018-03-19 10:02:06','2018-03-19 18:20:17','f6e61809-8e3c-45c5-888d-02ad048160c2'),
	(5,136,'de','','',0,'default','','2018-04-21 10:18:52','2018-04-21 10:47:51','b1a69c6f-178c-4eed-a549-266c3e7edc99'),
	(6,136,'en','','',0,'default','','2018-04-21 10:18:52','2018-04-21 10:47:51','ab6529af-3be8-4294-a97e-597f3764fbb9');

/*!40000 ALTER TABLE `craft_supertablecontent_setgridsectionbackground` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertablecontent_setgridsetup
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_setgridsetup`;

CREATE TABLE `craft_supertablecontent_setgridsetup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_gridClassName` text COLLATE utf8_unicode_ci,
  `field_areaNames` text COLLATE utf8_unicode_ci,
  `field_oldSpec` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_inlinedStyle` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_style` text COLLATE utf8_unicode_ci,
  `field_gridType` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_schema` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_setgridsetup_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_setgridsetup_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_setgridsetup_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_setgridsetup_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertablecontent_setgridsetup` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_setgridsetup` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_setgridsetup` (`id`, `elementId`, `locale`, `field_gridClassName`, `field_areaNames`, `field_oldSpec`, `field_inlinedStyle`, `field_style`, `field_gridType`, `field_schema`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(5,126,'de','o-2to4Grid ','box',1,0,'','flexbox','    box box \r\n---------------\r\nbox box box box','2018-04-21 00:53:00','2018-04-21 10:50:32','b81637b6-736d-4bee-ba7c-2cdc48bb2c2a'),
	(6,126,'en','o-2to4Grid ','box',1,0,'','flexbox','    box box \r\n---------------\r\nbox box box box','2018-04-21 00:53:00','2018-04-21 10:50:32','75fecd03-6f00-49c6-ba96-8d6be756bb88'),
	(7,132,'de','o-2ColGrid','box-1, box-2',1,0,'','cssgrid','	box1\r\n	box2\r\n	----\r\nbox1 box2','2018-04-21 10:14:11','2018-04-21 10:51:03','fe092a2b-1ca4-44bc-94dd-07655c16fdf6'),
	(8,132,'en','o-2ColGrid','box-1, box-2',1,0,'','cssgrid','	box1\r\n	box2\r\n	----\r\nbox1 box2','2018-04-21 10:14:11','2018-04-21 10:51:03','fca03888-750a-4a95-8196-92335ae656f7'),
	(9,147,'de','o-3ColGrid','box-0, box-1, box-2',1,0,'','cssgrid','box0\r\nbox1\r\nbox2\r\n\r\nbox0 box0\r\nbox1 box2\r\n\r\nbox0 box1 box2','2018-04-21 10:36:13','2018-04-21 10:51:28','320b7963-deec-4dfb-809f-2b788dd6fbf9'),
	(10,147,'en','o-3ColGrid','box-0, box-1, box-2',1,0,'','cssgrid','box0\r\nbox1\r\nbox2\r\n\r\nbox0 box0\r\nbox1 box2\r\n\r\nbox0 box1 box2','2018-04-21 10:36:13','2018-04-21 10:51:28','316adc0f-9c07-4087-b24f-16a46d039076'),
	(11,149,'de','o-4ColGrid','box-0, box-1, box-2, box-3',1,0,'','cssgrid','box0\r\nbox1\r\nbox2\r\nbox3\r\n\r\nbox0 box1\r\nbox2 box3\r\n\r\nbox0 box1 box2 box3','2018-04-21 10:38:08','2018-04-21 10:51:51','6f026b07-02cf-4712-b838-a7659f97674c'),
	(12,149,'en','o-4ColGrid','box-0, box-1, box-2, box-3',1,0,'','cssgrid','box0\r\nbox1\r\nbox2\r\nbox3\r\n\r\nbox0 box1\r\nbox2 box3\r\n\r\nbox0 box1 box2 box3','2018-04-21 10:38:08','2018-04-21 10:51:51','7cc6abd8-3662-4880-868c-a52dc818d46e');

/*!40000 ALTER TABLE `craft_supertablecontent_setgridsetup` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertablecontent_setheadline
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_setheadline`;

CREATE TABLE `craft_supertablecontent_setheadline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_semantic` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'h2',
  `field_override` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `field_addClasses` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_setheadline_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_setheadline_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_setheadline_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_setheadline_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertablecontent_setheadline` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_setheadline` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_setheadline` (`id`, `elementId`, `locale`, `field_semantic`, `field_override`, `field_addClasses`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(3,60,'de','h2','default','','2018-03-07 12:25:19','2018-04-21 07:29:52','031c787b-16a8-4850-b707-19f5c2dc113e'),
	(4,60,'en','h2','default','','2018-03-07 12:25:19','2018-04-21 07:29:52','aaa6873e-78e4-438d-abf5-6fae4e8a9de9'),
	(5,86,'de','h2','default',NULL,'2018-03-19 10:02:06','2018-03-19 18:20:17','eed18d67-b681-4cd5-b621-4ca1f87e5c4f'),
	(6,86,'en','h2','default',NULL,'2018-03-19 10:02:06','2018-03-19 18:20:17','d81d9b62-3bee-4822-b000-b84d912a3576'),
	(11,140,'de','h2','default','','2018-04-21 10:18:52','2018-04-21 10:47:51','476db5f7-a233-43bf-b5ce-97424f68e9cc'),
	(12,140,'en','h2','default','','2018-04-21 10:18:52','2018-04-21 10:47:51','5f8f3c86-f5f7-467a-9127-50ec5e245346'),
	(13,144,'de','h2','default','','2018-04-21 10:18:52','2018-04-21 10:47:51','f1a0c720-498e-4d70-9f05-a276ae2fb5af'),
	(14,144,'en','h2','default','','2018-04-21 10:18:52','2018-04-21 10:47:51','8a33992f-d7b0-4182-bd6e-ba4fc94d9b47'),
	(15,153,'de','h2','default','','2018-04-21 10:44:28','2018-04-21 10:47:52','716ffd2c-fa31-4657-a871-de0614794421'),
	(16,153,'en','h2','default','','2018-04-21 10:44:28','2018-04-21 10:47:52','ebcbd687-2bb2-4fa7-8a9e-4928e5bddc90'),
	(17,157,'de','h2','default','','2018-04-21 10:47:52','2018-04-21 10:47:52','2c6fece4-f92e-4064-a519-6ba0179c2af1'),
	(18,157,'en','h2','default','','2018-04-21 10:47:52','2018-04-21 10:47:52','a0f50b3d-c1ed-4141-af84-fb8da2c0b8df');

/*!40000 ALTER TABLE `craft_supertablecontent_setheadline` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertablecontent_setimageslider
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_setimageslider`;

CREATE TABLE `craft_supertablecontent_setimageslider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_ratio` text COLLATE utf8_unicode_ci,
  `field_addClasses` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_setimageslider_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_setimageslider_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_setimageslider_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_setimageslider_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_setinlinesvgoptions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_setinlinesvgoptions`;

CREATE TABLE `craft_supertablecontent_setinlinesvgoptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_cssCode` text COLLATE utf8_unicode_ci,
  `field_addClasses` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertableconten_setinlinesvgoption_elementI_locale_unq_id` (`elementId`,`locale`),
  KEY `craft_supertablecontent_setinlinesvgoptions_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_setinlinesvgoptions_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_setinlinesvgoptions_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_setinstagramoptions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_setinstagramoptions`;

CREATE TABLE `craft_supertablecontent_setinstagramoptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_size` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'l',
  `field_linkable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_ratio` text COLLATE utf8_unicode_ci,
  `field_position` text COLLATE utf8_unicode_ci,
  `field_addClasses` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertableconten_setinstagramoption_elementI_locale_unq_id` (`elementId`,`locale`),
  KEY `craft_supertablecontent_setinstagramoptions_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_setinstagramoptions_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_setinstagramoptions_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertablecontent_setinstagramoptions` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_setinstagramoptions` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_setinstagramoptions` (`id`, `elementId`, `locale`, `field_size`, `field_linkable`, `field_ratio`, `field_position`, `field_addClasses`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,117,'de','l',1,'16:9','0 30%',NULL,'2018-03-19 17:23:15','2018-03-19 18:20:17','3553afcc-2595-4438-b2d5-68dcf779ac9f'),
	(2,117,'en','l',1,'16:9','0 30%',NULL,'2018-03-19 17:23:15','2018-03-19 18:20:17','53181e98-8bc3-475a-bbe0-74cfb41fad56');

/*!40000 ALTER TABLE `craft_supertablecontent_setinstagramoptions` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertablecontent_setjumpnavigation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_setjumpnavigation`;

CREATE TABLE `craft_supertablecontent_setjumpnavigation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_layout` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `field_addClasses` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertableconten_setjumpnavigatio_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_setjumpnavigation_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_setjumpnavigation_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_setjumpnavigation_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_setlist
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_setlist`;

CREATE TABLE `craft_supertablecontent_setlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_listtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'ul',
  `field_bullet` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `field_addClasses` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_setlist_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_setlist_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_setlist_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_setlist_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_setmarkdown
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_setmarkdown`;

CREATE TABLE `craft_supertablecontent_setmarkdown` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_addAnchor` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_addClasses` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_setmarkdown_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_setmarkdown_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_setmarkdown_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_setmarkdown_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_setmediaimage
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_setmediaimage`;

CREATE TABLE `craft_supertablecontent_setmediaimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_ratio` text COLLATE utf8_unicode_ci,
  `field_heightrestriction` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_imgixParam` text COLLATE utf8_unicode_ci,
  `field_addClasses` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_setmediaimage_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_setmediaimage_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_setmediaimage_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_setmediaimage_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_setquote
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_setquote`;

CREATE TABLE `craft_supertablecontent_setquote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_addClasses` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_setquote_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_setquote_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_setquote_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_setquote_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_setrichtext
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_setrichtext`;

CREATE TABLE `craft_supertablecontent_setrichtext` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_addClasses` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_setrichtext_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_setrichtext_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_setrichtext_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_setrichtext_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertablecontent_setrichtext` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_setrichtext` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_setrichtext` (`id`, `elementId`, `locale`, `field_addClasses`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,104,'de',NULL,'2018-03-19 16:41:26','2018-03-19 18:20:17','43ee1614-418d-4313-aec6-e45a808605f4'),
	(2,104,'en',NULL,'2018-03-19 16:41:26','2018-03-19 16:41:26','89fc1951-5693-4bfd-9d49-fab18e15fda7');

/*!40000 ALTER TABLE `craft_supertablecontent_setrichtext` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertablecontent_setsection
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_setsection`;

CREATE TABLE `craft_supertablecontent_setsection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_anchor` text COLLATE utf8_unicode_ci,
  `field_innerContainer` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_setsection_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_setsection_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_setsection_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_setsection_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_setsectioncolumn
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_setsectioncolumn`;

CREATE TABLE `craft_supertablecontent_setsectioncolumn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_setsectioncolumn_elementId_locale_unq_id` (`elementId`,`locale`),
  KEY `craft_supertablecontent_setsectioncolumn_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_setsectioncolumn_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_setsectioncolumn_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_setsectionlayout
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_setsectionlayout`;

CREATE TABLE `craft_supertablecontent_setsectionlayout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_twoColumns` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_threeColumns` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_fourColumns` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_setsectionlayout_elementId_locale_unq_id` (`elementId`,`locale`),
  KEY `craft_supertablecontent_setsectionlayout_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_setsectionlayout_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_setsectionlayout_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_setslideoutbox
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_setslideoutbox`;

CREATE TABLE `craft_supertablecontent_setslideoutbox` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_setslideoutbox_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_setslideoutbox_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_setslideoutbox_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_setslideoutbox_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_setslidersetup
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_setslidersetup`;

CREATE TABLE `craft_supertablecontent_setslidersetup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_autoplay` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `field_speed` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_loop` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_navigation` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_pagination` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_autoHeight` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_setslidersetup_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_setslidersetup_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_setslidersetup_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_setslidersetup_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_setslidersetupgeneral
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_setslidersetupgeneral`;

CREATE TABLE `craft_supertablecontent_setslidersetupgeneral` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_position` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'center',
  `field_slidesPerView` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `field_spaceBetween` text COLLATE utf8_unicode_ci,
  `field_groupCell` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `field_freescroll` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_responsive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertableconte_setslidersetupgener_elementI_local_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_setslidersetupgeneral_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_setslidersetupgeneral_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_setslidersetupgeneral_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_setvideo
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_setvideo`;

CREATE TABLE `craft_supertablecontent_setvideo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_addClasses` text COLLATE utf8_unicode_ci,
  `field_imageAtEnd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_params` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_setvideo_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_setvideo_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_setvideo_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_setvideo_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_socialnetworks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_socialnetworks`;

CREATE TABLE `craft_supertablecontent_socialnetworks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_linkit` text COLLATE utf8_unicode_ci,
  `field_caption` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_socialnetworks_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_socialnetworks_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_socialnetworks_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_socialnetworks_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_styleclasses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_styleclasses`;

CREATE TABLE `craft_supertablecontent_styleclasses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_classname` text COLLATE utf8_unicode_ci,
  `field_description` longtext COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_styleclasses_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_styleclasses_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_styleclasses_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_styleclasses_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertablecontent_styleclasses` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_styleclasses` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_styleclasses` (`id`, `elementId`, `locale`, `field_classname`, `field_description`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,16,'de','e-ta--left','Position texts or other elements (inline block) on the left side.','2018-03-07 10:37:36','2018-03-19 14:39:20','18156e17-4ad2-4658-b41e-488aa1c1dc18'),
	(2,16,'en','e-ta--left','Position texts or other elements (inline block) on the left side.','2018-03-07 10:37:36','2018-03-19 14:39:20','0a9168f2-77ad-403b-bdc6-ab29995210e6'),
	(3,18,'de','e-ta--right','Position texts or other elements (inline block) on the right side.','2018-03-07 10:38:05','2018-03-19 14:39:30','0d73f7f4-fb0a-4bbb-902e-c8cfe199ee57'),
	(4,18,'en','e-ta--right','Position texts or other elements (inline block) on the right side.','2018-03-07 10:38:05','2018-03-19 14:39:30','8a58851b-5126-4ac3-9873-7bb1609cb212'),
	(5,20,'de','e-ta--center','Centers texts or other elements (inline block)','2018-03-07 10:38:42','2018-03-19 14:39:10','25201433-dbd9-4e78-9746-378286646f4b'),
	(6,20,'en','e-ta--center','Centers texts or other elements (inline block)','2018-03-07 10:38:42','2018-03-19 14:39:10','0843d097-f615-4e6b-91df-ffb55c8c6c0e'),
	(7,22,'de','e-va--top','Position elements in the upper part of the container (only possible for grid or section child elements)','2018-03-07 10:39:57','2018-03-19 14:40:07','49b0f368-b41b-4fc8-85f1-d1b5e7cf7b84'),
	(8,22,'en','e-va--top','Position elements in the upper part of the container (only possible for grid or section child elements)','2018-03-07 10:39:57','2018-03-19 14:40:07','ff3df2bb-5d9d-476d-a6b8-8adc3a73cb1d'),
	(9,24,'de','e-va--bottom','Position elements in the lower part of the container (grid or section child elements only)','2018-03-07 10:40:24','2018-03-19 14:39:42','01272454-fdcd-44d9-a61b-1404f8604589'),
	(10,24,'en','e-va--bottom','Position elements in the lower part of the container (grid or section child elements only)','2018-03-07 10:40:24','2018-03-19 14:39:42','f4a9e3d6-26d5-4b59-9747-ca44aa4fe22e'),
	(11,26,'de','e-va--center','Position elements in the middle part of the container (grid or section child elements only)','2018-03-07 10:41:02','2018-03-19 14:39:54','53daaf1a-34da-472a-8d7c-c0d964f99034'),
	(12,26,'en','e-va--center','Position elements in the middle part of the container (grid or section child elements only)','2018-03-07 10:41:02','2018-03-19 14:39:54','318b0493-358f-415f-83a8-5b4d6f0719c7'),
	(13,28,'de','e-w--fullheight','Gives the wrapper element the 100% height of the browser viewport','2018-03-07 10:42:05','2018-03-19 16:25:02','6460ef00-6be4-4a1a-9bf9-3e6024f7da54'),
	(14,28,'en','e-w--fullheight','Gives the wrapper element the 100% height of the browser viewport','2018-03-07 10:42:05','2018-03-19 16:25:02','418b0415-c0f1-4272-a43c-5c10b1be6007'),
	(15,30,'de','c-button--big','Bigger button size','2018-03-07 10:42:47','2018-03-19 16:54:53','6120baed-c768-4223-bf33-f84252049222'),
	(16,30,'en','c-button--big','Bigger button size','2018-03-07 10:42:47','2018-03-19 16:54:53','5517d0f0-e97e-4aa0-99ce-3a4ba53a263b'),
	(17,32,'de','c-button--small','Smaller button size','2018-03-07 10:43:20','2018-03-19 16:54:45','27e324eb-5844-4444-a554-82cdd46d858c'),
	(18,32,'en','c-button--small','Smaller button size','2018-03-07 10:43:20','2018-03-19 16:54:45','cbb75008-1255-41b1-a346-eb3980f88906'),
	(19,34,'de','c-button--s-default','Base button style','2018-03-07 10:44:01','2018-03-07 10:44:01','9043e95e-056b-48c6-a29c-04fe95c39830'),
	(20,34,'en','c-button--s-default','Base button style','2018-03-07 10:44:01','2018-03-07 10:44:01','69970674-f4af-4ea8-a23e-6339c1177e01'),
	(21,36,'de','c-jumpnavigation--s-button','Simple button styled navigation','2018-03-07 10:45:27','2018-03-07 10:45:27','7c31f6bc-efc3-4292-b104-7d7d11d0aca4'),
	(22,36,'en','c-jumpnavigation--s-button','Simple button styled navigation','2018-03-07 10:45:27','2018-03-07 10:45:27','254c5519-4089-4070-9812-907bba9fed3a'),
	(23,38,'de','e-c__text--primary','','2018-03-07 10:46:50','2018-03-07 12:13:09','f0aef0a7-bcde-4991-81cf-ae33fb37b84c'),
	(24,38,'en','e-c__text--primary','','2018-03-07 10:46:50','2018-03-07 12:13:09','16be58c2-22fe-4d6b-baf6-6e813b3bf372'),
	(25,40,'de','c-quote--s-lined','A quote with a big line :D','2018-03-07 10:48:12','2018-03-07 10:48:12','7439630e-5f01-4f0e-876e-62983077b15b'),
	(26,40,'en','c-quote--s-lined','A quote with a big line :D','2018-03-07 10:48:12','2018-03-07 10:48:12','ffe20be1-6392-45c8-bd2e-77c780be01fa'),
	(27,42,'de','e-ts--lead','Scales text by 120%','2018-03-07 10:49:04','2018-03-07 11:47:08','e391665c-2a46-46ed-a057-795249853394'),
	(28,42,'en','e-ts--lead','Scales text by 120%','2018-03-07 10:49:04','2018-03-07 11:47:08','54616348-58c5-45a1-be7a-051e6fbb8567'),
	(29,44,'de','e-ts--small','Scales text by 20% smaller','2018-03-07 10:49:58','2018-03-07 11:47:15','d3ab3e34-2d81-41d2-865d-1b8e6a7419f1'),
	(30,44,'en','e-ts--small','Scales text by 20% smaller','2018-03-07 10:49:58','2018-03-07 11:47:15','cbf28b4a-1baa-4128-89c0-99162884a639'),
	(33,64,'de','e-r__margin--top','','2018-03-18 21:45:20','2018-03-18 21:45:20','5b361d60-f40f-4189-a8fb-c88231306be8'),
	(34,64,'en','e-r__margin--top','','2018-03-18 21:45:20','2018-03-18 21:45:20','b4aef98b-acd1-4324-9c42-590ba04b42ed'),
	(35,66,'de','e-r__margin--bottom','','2018-03-18 21:45:44','2018-03-18 21:45:44','3483d265-d43b-4d11-82f5-c9a94baaa7b9'),
	(36,66,'en','e-r__margin--bottom','','2018-03-18 21:45:44','2018-03-18 21:45:44','427f4269-ff88-425d-ae39-e6d443ff21bd'),
	(37,68,'de','e-r__margin--side','','2018-03-18 21:46:06','2018-03-18 21:46:06','f5907f4a-7a5e-4519-af1f-1d304e8949db'),
	(38,68,'en','e-r__margin--side','','2018-03-18 21:46:06','2018-03-18 21:46:06','0c4cd76b-f1c6-4efb-9ef2-ad5a7f95394c'),
	(41,72,'de','e-r__margin--last','','2018-03-18 21:47:21','2018-03-19 16:57:09','517bd267-5a1d-4d6a-9182-3335a4fd5c54'),
	(42,72,'en','e-r__margin--last','','2018-03-18 21:47:21','2018-03-19 16:57:09','2c070ef8-04ad-475a-ad4c-97707d6e4062'),
	(43,74,'de','e-r__padding--top','','2018-03-18 21:47:51','2018-03-18 21:47:51','936e327a-08cd-4457-8455-a3c619b3a664'),
	(44,74,'en','e-r__padding--top','','2018-03-18 21:47:51','2018-03-18 21:47:51','69dd0a9a-8d48-4f73-958c-5f11b2355308'),
	(45,76,'de','e-r__padding--bottom','','2018-03-18 21:48:09','2018-03-18 21:48:09','cce95312-1777-4ac1-a23d-3937fbfbc293'),
	(46,76,'en','e-r__padding--bottom','','2018-03-18 21:48:09','2018-03-18 21:48:09','53dd8215-2eac-4edc-bba2-8537355bad93'),
	(47,78,'de','e-r__padding--side','','2018-03-18 21:48:26','2018-03-18 21:48:26','ffcdf7df-53e5-41b7-aae6-4d05711b384a'),
	(48,78,'en','e-r__padding--side','','2018-03-18 21:48:26','2018-03-18 21:48:26','f99ffad1-9c47-4450-afa8-02bf2c4a254d'),
	(49,90,'de','e-w--fullwidth','','2018-03-19 10:45:23','2018-03-19 10:45:23','19c1e824-5475-47b7-a31d-8eda6294b6ca'),
	(50,90,'en','e-w--fullwidth','','2018-03-19 10:45:23','2018-03-19 10:45:23','b000276b-b086-44a4-ab44-f55227e53282'),
	(51,92,'de','fullbleed','','2018-03-19 10:45:38','2018-04-21 00:34:18','5f5c5a9b-4748-4144-bd5d-32cc12ba3295'),
	(52,92,'en','fullbleed','','2018-03-19 10:45:38','2018-04-21 00:34:18','f47764bc-ef12-4cff-bfea-87e22a6dad53'),
	(53,94,'de','e-w__vSpacer--1','','2018-03-19 11:14:39','2018-03-19 11:14:49','3892ecb6-0607-48c3-ab86-78bee76d878b'),
	(54,94,'en','e-w__vSpacer--1','','2018-03-19 11:14:39','2018-03-19 11:14:49','b61389b4-6804-40c3-a2f8-c2e235fd4cf2'),
	(55,96,'de','e-w__hSpacer--1','','2018-03-19 11:15:06','2018-03-19 11:15:06','9bbfa43a-cf5d-40ea-b867-6d2123d808e5'),
	(56,96,'en','e-w__hSpacer--1','','2018-03-19 11:15:06','2018-03-19 11:15:06','8081824e-497a-49f8-acf9-4fb25e8d416c'),
	(57,98,'de','e-w__vSpacer--flex-1to3','','2018-03-19 11:16:04','2018-03-19 11:16:14','9d5c507d-6f18-4c8c-8f02-23dd2315f202'),
	(58,98,'en','e-w__vSpacer--flex-1to3','','2018-03-19 11:16:04','2018-03-19 11:16:14','2a801308-be37-4097-b143-9f26eb7c75b9'),
	(59,100,'de','e-w__hSpacer--flex-1to3','','2018-03-19 11:16:33','2018-03-19 11:16:33','baef0f9d-7d67-4556-8091-098670f3053e'),
	(60,100,'en','e-w__hSpacer--flex-1to3','','2018-03-19 11:16:33','2018-03-19 11:16:33','36fe980a-2dda-4901-86d5-dd0577ad78f6'),
	(61,102,'de','e-ts__flex--50to80','','2018-03-19 16:23:37','2018-03-19 16:52:45','9da5e3d4-7759-4066-b92e-e32c0406257b'),
	(62,102,'en','e-ts__flex--50to80','','2018-03-19 16:23:37','2018-03-19 16:52:45','aefb42ea-9dea-48f6-8434-545de488c18f'),
	(63,106,'de','e-tl__maxChars-50','','2018-03-19 16:48:46','2018-03-19 16:48:46','b9869969-818c-4e1b-81d8-737c86a13c25'),
	(64,106,'en','e-tl__maxChars-50','','2018-03-19 16:48:46','2018-03-19 16:48:46','d4fb46a9-8c76-4f33-ba84-34b197fe93a6'),
	(65,108,'de','e-tl__maxChars--75','','2018-03-19 16:49:24','2018-03-19 16:49:24','7a9c3222-1f18-47b2-b6a2-16df2a5ea05c'),
	(66,108,'en','e-tl__maxChars--75','','2018-03-19 16:49:24','2018-03-19 16:49:24','5ccc2b29-4b28-4f52-83f9-ca0676ad3f61'),
	(67,110,'de','e-tl__multiColumn--2','','2018-03-19 16:50:51','2018-03-19 16:50:51','8d30cbe0-c2df-4e4d-8465-5962315147fd'),
	(68,110,'en','e-tl__multiColumn--2','','2018-03-19 16:50:51','2018-03-19 16:50:51','b574cbde-0b35-4a92-b805-8222385dea63'),
	(69,112,'de','e-tl__multiColumn--r3','','2018-03-19 16:51:17','2018-03-19 16:51:17','3bbb90f7-e52b-4a56-83ba-eea4124bfdb9'),
	(70,112,'en','e-tl__multiColumn--r3','','2018-03-19 16:51:17','2018-03-19 16:51:17','418e0319-e4c3-4bfc-8a8e-4f4b61d3d4e7'),
	(71,114,'de','c-slideoutbox--s-simple','','2018-03-19 16:56:11','2018-03-19 16:56:11','7ffa2cf8-e23a-432e-9a7f-7b087852fa8f'),
	(72,114,'en','c-slideoutbox--s-simple','','2018-03-19 16:56:11','2018-03-19 16:56:11','2f24466d-7f32-490e-b15e-8ba5c64c090f');

/*!40000 ALTER TABLE `craft_supertablecontent_styleclasses` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_systemsettings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_systemsettings`;

CREATE TABLE `craft_systemsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_systemsettings_category_unq_idx` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_systemsettings` WRITE;
/*!40000 ALTER TABLE `craft_systemsettings` DISABLE KEYS */;

INSERT INTO `craft_systemsettings` (`id`, `category`, `settings`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'email','{\"protocol\":\"php\",\"emailAddress\":\"hello@kittn.xyz\",\"senderName\":\"kittn\"}','2017-07-04 21:45:04','2017-07-04 21:45:04','a4f5fd88-62e7-4bf3-bc2f-e2b6af93ef47');

/*!40000 ALTER TABLE `craft_systemsettings` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_taggroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_taggroups`;

CREATE TABLE `craft_taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_taggroups_name_unq_idx` (`name`),
  UNIQUE KEY `craft_taggroups_handle_unq_idx` (`handle`),
  KEY `craft_taggroups_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_taggroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_taggroups` WRITE;
/*!40000 ALTER TABLE `craft_taggroups` DISABLE KEYS */;

INSERT INTO `craft_taggroups` (`id`, `name`, `handle`, `fieldLayoutId`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'Default','default',1,'2017-07-04 21:45:04','2017-07-04 21:45:04','3bc69dbd-55f8-43f9-a0ec-b466f616e4bc');

/*!40000 ALTER TABLE `craft_taggroups` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_tags`;

CREATE TABLE `craft_tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_tags_groupId_fk` (`groupId`),
  CONSTRAINT `craft_tags_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_tags_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_tasks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_tasks`;

CREATE TABLE `craft_tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `currentStep` int(11) unsigned DEFAULT NULL,
  `totalSteps` int(11) unsigned DEFAULT NULL,
  `status` enum('pending','error','running') COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `settings` mediumtext COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_tasks_root_idx` (`root`),
  KEY `craft_tasks_lft_idx` (`lft`),
  KEY `craft_tasks_rgt_idx` (`rgt`),
  KEY `craft_tasks_level_idx` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_templatecachecriteria
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_templatecachecriteria`;

CREATE TABLE `craft_templatecachecriteria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `criteria` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `craft_templatecachecriteria_cacheId_fk` (`cacheId`),
  KEY `craft_templatecachecriteria_type_idx` (`type`),
  CONSTRAINT `craft_templatecachecriteria_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `craft_templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_templatecacheelements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_templatecacheelements`;

CREATE TABLE `craft_templatecacheelements` (
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  KEY `craft_templatecacheelements_cacheId_fk` (`cacheId`),
  KEY `craft_templatecacheelements_elementId_fk` (`elementId`),
  CONSTRAINT `craft_templatecacheelements_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `craft_templatecaches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_templatecacheelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_templatecaches
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_templatecaches`;

CREATE TABLE `craft_templatecaches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `craft_templatecaches_locale_fk` (`locale`),
  KEY `craft_templatecaches_cacheKey_locale_expiryDate_idx` (`cacheKey`,`locale`,`expiryDate`),
  KEY `craft_templatecaches_cacheKey_locale_expiryDate_path_idx` (`cacheKey`,`locale`,`expiryDate`,`path`),
  CONSTRAINT `craft_templatecaches_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_tokens`;

CREATE TABLE `craft_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `route` text COLLATE utf8_unicode_ci,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_tokens_token_unq_idx` (`token`),
  KEY `craft_tokens_expiryDate_idx` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_usergroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_usergroups`;

CREATE TABLE `craft_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_usergroups_name_unq_idx` (`name`),
  UNIQUE KEY `craft_usergroups_handle_unq_idx` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_usergroups` WRITE;
/*!40000 ALTER TABLE `craft_usergroups` DISABLE KEYS */;

INSERT INTO `craft_usergroups` (`id`, `name`, `handle`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'Editor','editor','2017-07-04 22:10:26','2017-07-04 22:10:26','c3e4a84b-e6d6-4012-807b-689d16e2d41b'),
	(2,'Writer','writer','2017-07-04 22:11:54','2017-07-04 22:11:54','7b078e83-712f-4ff3-afe4-5157c2d8149d');

/*!40000 ALTER TABLE `craft_usergroups` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_usergroups_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_usergroups_users`;

CREATE TABLE `craft_usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_usergroups_users_groupId_userId_unq_idx` (`groupId`,`userId`),
  KEY `craft_usergroups_users_userId_fk` (`userId`),
  CONSTRAINT `craft_usergroups_users_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_usergroups_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_userpermissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_userpermissions`;

CREATE TABLE `craft_userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_userpermissions_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_userpermissions` WRITE;
/*!40000 ALTER TABLE `craft_userpermissions` DISABLE KEYS */;

INSERT INTO `craft_userpermissions` (`id`, `name`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'accesssitewhensystemisoff','2017-07-04 22:10:26','2017-07-04 22:10:26','162c2d0d-429e-4e90-9d04-d05ff4ac1106'),
	(2,'accesscpwhensystemisoff','2017-07-04 22:10:26','2017-07-04 22:10:26','53da65c8-bdf1-43b5-99e9-e549db13e20e'),
	(3,'accessplugin-amnav','2017-07-04 22:10:26','2017-07-04 22:10:26','00c16bd3-5bf9-4a46-85ec-8cd406cf20ae'),
	(4,'accesscp','2017-07-04 22:10:26','2017-07-04 22:10:26','805eeb44-5fb4-4939-971d-4a54f1fcaa96'),
	(5,'registerusers','2017-07-04 22:10:26','2017-07-04 22:10:26','0931440c-2864-4bf1-a362-15a748726fa2'),
	(6,'assignuserpermissions','2017-07-04 22:10:26','2017-07-04 22:10:26','8b80ccf0-53b3-4c2c-b4b6-ae1c8a8cd98b'),
	(7,'changeuseremails','2017-07-04 22:10:26','2017-07-04 22:10:26','e040ef07-96d5-438c-a305-98e040e46be8'),
	(8,'administrateusers','2017-07-04 22:10:26','2017-07-04 22:10:26','372f54fb-3e88-45dd-954c-4b6cb89dd9d3'),
	(9,'editusers','2017-07-04 22:10:26','2017-07-04 22:10:26','c6cfb403-f318-45ee-8f5c-dacf8a5ed6e2'),
	(10,'deleteusers','2017-07-04 22:10:26','2017-07-04 22:10:26','fd279dcb-63c6-4df2-9826-c72956f1484d'),
	(11,'publishentries:3','2017-07-04 22:10:26','2017-07-04 22:10:26','b28ca048-aaeb-44f3-81b9-20ab07fe8278'),
	(12,'publishpeerentrydrafts:3','2017-07-04 22:10:26','2017-07-04 22:10:26','b38bbf31-c736-4b32-9d15-10b541f86c1f'),
	(13,'deletepeerentrydrafts:3','2017-07-04 22:10:26','2017-07-04 22:10:26','71daf5d7-2a66-41c2-88d0-b9135a8ca704'),
	(14,'editpeerentrydrafts:3','2017-07-04 22:10:26','2017-07-04 22:10:26','a56707ea-194c-4c2a-9822-b80ae553addb'),
	(15,'editentries:3','2017-07-04 22:10:26','2017-07-04 22:10:26','972a3195-1bf4-4a4f-891c-36c33c8eb66c'),
	(16,'createentries:4','2017-07-04 22:10:26','2017-07-04 22:10:26','5514f16e-ca44-4275-9506-0315c5e18a23'),
	(17,'publishentries:4','2017-07-04 22:10:26','2017-07-04 22:10:26','866c9c8f-ffa8-4145-8b53-fa2f4b562d34'),
	(18,'deleteentries:4','2017-07-04 22:10:26','2017-07-04 22:10:26','41cd1e9b-a31f-494d-bc65-cfdf6344739e'),
	(19,'publishpeerentries:4','2017-07-04 22:10:26','2017-07-04 22:10:26','22d3e5fa-7218-4297-b4c5-3c661897e8eb'),
	(20,'deletepeerentries:4','2017-07-04 22:10:26','2017-07-04 22:10:26','f807765b-47ad-4f37-9c8a-b613319b0d39'),
	(21,'editpeerentries:4','2017-07-04 22:10:26','2017-07-04 22:10:26','56eaf0a1-e3e2-45fd-9216-dafb2362ffea'),
	(22,'publishpeerentrydrafts:4','2017-07-04 22:10:26','2017-07-04 22:10:26','9a826773-c890-47fa-ae54-3db827816bae'),
	(23,'deletepeerentrydrafts:4','2017-07-04 22:10:26','2017-07-04 22:10:26','d151bf99-4596-4794-92e7-38888c2eb32f'),
	(24,'editpeerentrydrafts:4','2017-07-04 22:10:26','2017-07-04 22:10:26','ce844832-e666-4426-a624-55601fc2a0f0'),
	(25,'editentries:4','2017-07-04 22:10:26','2017-07-04 22:10:26','473b5caf-c7df-491d-a2e4-c31ebad3af27'),
	(26,'createentries:5','2017-07-04 22:10:26','2017-07-04 22:10:26','041250dd-e7e9-4bf3-8ce3-dd24714f2f9d'),
	(27,'publishentries:5','2017-07-04 22:10:26','2017-07-04 22:10:26','5a4e6a42-1b5e-4281-984c-9c03e3ee4963'),
	(28,'deleteentries:5','2017-07-04 22:10:26','2017-07-04 22:10:26','24b39e5e-cc93-4069-aa9a-bf2ded5b1001'),
	(29,'publishpeerentries:5','2017-07-04 22:10:26','2017-07-04 22:10:26','36866616-f882-4791-a981-4eb3d100163d'),
	(30,'deletepeerentries:5','2017-07-04 22:10:26','2017-07-04 22:10:26','52111c7a-aba6-41e0-a29b-f77b82c0f868'),
	(31,'editpeerentries:5','2017-07-04 22:10:26','2017-07-04 22:10:26','d5754d79-7b05-448e-939a-d1157f90aac0'),
	(32,'publishpeerentrydrafts:5','2017-07-04 22:10:26','2017-07-04 22:10:26','86af7990-fdd0-4df4-b5f8-7d9d0dd358d2'),
	(33,'deletepeerentrydrafts:5','2017-07-04 22:10:26','2017-07-04 22:10:26','10fa308d-cfc9-4b36-b12b-ae0ee2d9829d'),
	(34,'editpeerentrydrafts:5','2017-07-04 22:10:26','2017-07-04 22:10:26','49933e6c-1b9f-4144-81c5-cfeb08936ef0'),
	(35,'editentries:5','2017-07-04 22:10:26','2017-07-04 22:10:26','4686f5b9-586f-4015-bb10-68ad9178e498'),
	(36,'publishentries:1','2017-07-04 22:10:26','2017-07-04 22:10:26','0cff0523-b167-4845-ae88-64bf84c1afad'),
	(37,'publishpeerentrydrafts:1','2017-07-04 22:10:26','2017-07-04 22:10:26','8f08f0ae-b20d-47a7-ba88-42ea797e8929'),
	(38,'deletepeerentrydrafts:1','2017-07-04 22:10:26','2017-07-04 22:10:26','b13ec52f-45a9-4389-abac-a890d12fa28a'),
	(39,'editpeerentrydrafts:1','2017-07-04 22:10:26','2017-07-04 22:10:26','ea4864d0-0698-4d6a-8a40-dbd3467416d8'),
	(40,'editentries:1','2017-07-04 22:10:26','2017-07-04 22:10:26','4972dfff-271c-4a46-baed-50dc6d7bd626'),
	(41,'createentries:6','2017-07-04 22:10:26','2017-07-04 22:10:26','d49c6395-ed64-47a4-8e63-ef04cd5d5fc1'),
	(42,'publishentries:6','2017-07-04 22:10:26','2017-07-04 22:10:26','323564d9-af47-4287-83ef-9717f774c92b'),
	(43,'deleteentries:6','2017-07-04 22:10:26','2017-07-04 22:10:26','a7d08405-5901-4859-86f2-b63fb9133030'),
	(44,'publishpeerentries:6','2017-07-04 22:10:26','2017-07-04 22:10:26','bd36721f-f2d4-4eab-90ea-c041f7066b73'),
	(45,'deletepeerentries:6','2017-07-04 22:10:26','2017-07-04 22:10:26','f91bcd75-9725-4d0a-967a-97cc667e5b20'),
	(46,'editpeerentries:6','2017-07-04 22:10:26','2017-07-04 22:10:26','2a543c07-ee55-4199-bbb8-3a975895ec4f'),
	(47,'publishpeerentrydrafts:6','2017-07-04 22:10:26','2017-07-04 22:10:26','ac4a7bc8-fa74-499f-babf-0b9e7dfb262f'),
	(48,'deletepeerentrydrafts:6','2017-07-04 22:10:26','2017-07-04 22:10:26','2828d141-d39d-42db-b2e9-43c8a4f14f07'),
	(49,'editpeerentrydrafts:6','2017-07-04 22:10:26','2017-07-04 22:10:26','1be83c93-6d08-4aaa-83dd-e82fbe8ad968'),
	(50,'editentries:6','2017-07-04 22:10:26','2017-07-04 22:10:26','8097eb2a-3940-4cac-9475-4a5d2a44c514'),
	(51,'editglobalset:5','2017-07-04 22:10:26','2017-07-04 22:10:26','63f54991-9b90-47f1-9a69-68e03863d01c'),
	(52,'editglobalset:6','2017-07-04 22:10:26','2017-07-04 22:10:26','4f0097cd-fab8-4185-bc00-1afdf88139da'),
	(53,'editcategories:1','2017-07-04 22:10:26','2017-07-04 22:10:26','362d3eec-7317-4f04-b526-41b4cb5c9555'),
	(54,'editcategories:2','2017-07-04 22:10:26','2017-07-04 22:10:26','13667166-e597-4fbc-8cbc-1d828c0c4aa2'),
	(55,'uploadtoassetsource:1','2017-07-04 22:10:26','2017-07-04 22:10:26','7cb5f8fe-d915-4b8b-84a5-361f0f9ea5de'),
	(56,'createsubfoldersinassetsource:1','2017-07-04 22:10:26','2017-07-04 22:10:26','1ee01344-4bc3-432d-8fe8-7f75318a0eba'),
	(57,'removefromassetsource:1','2017-07-04 22:10:26','2017-07-04 22:10:26','f76aa161-86e9-4db9-bac5-1ee521c1e2b6'),
	(58,'viewassetsource:1','2017-07-04 22:10:26','2017-07-04 22:10:26','892674a3-8123-464d-b35e-426e9c10988e'),
	(59,'editlocale:de','2017-07-04 22:11:54','2017-07-04 22:11:54','c7551611-9e76-4dbe-a413-e0c333409593'),
	(60,'editlocale:en','2017-07-04 22:11:54','2017-07-04 22:11:54','0fa8d845-b630-4773-8c1a-a1bbfe9111c7'),
	(61,'assignusergroups','2018-03-07 09:33:05','2018-03-07 09:33:05','e80d476e-35fc-4520-9d99-92351a5f5deb'),
	(62,'assignusergroup:1','2018-03-07 09:33:05','2018-03-07 09:33:05','08e5959b-6f43-4084-8065-7e72136022c1'),
	(63,'assignusergroup:2','2018-03-07 09:33:05','2018-03-07 09:33:05','a1ee8e8a-5087-478b-bb1f-98c92f1d6add');

/*!40000 ALTER TABLE `craft_userpermissions` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_userpermissions_usergroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_userpermissions_usergroups`;

CREATE TABLE `craft_userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_userpermissions_usergroups_permissionId_groupId_unq_idx` (`permissionId`,`groupId`),
  KEY `craft_userpermissions_usergroups_groupId_fk` (`groupId`),
  CONSTRAINT `craft_userpermissions_usergroups_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_userpermissions_usergroups_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `craft_userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `craft_userpermissions_usergroups` DISABLE KEYS */;

INSERT INTO `craft_userpermissions_usergroups` (`id`, `permissionId`, `groupId`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','e612cacb-c5fa-4e99-8c1d-19b651fb3318'),
	(2,2,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','48ec4616-ccf4-4fa7-81f2-a7536a6c3092'),
	(3,3,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','d43e0049-fa7b-4f91-9a1b-fcbdc887dbfe'),
	(4,4,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','2db296cc-ce30-4b57-9a69-0284b0293a84'),
	(5,5,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','83f5461d-12e4-4c4d-b758-c71020e8bf5c'),
	(6,6,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','fcf5d58f-9466-40e1-822c-eba6117c204d'),
	(7,7,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','dce6b174-16f8-4051-8668-3455738c7c00'),
	(8,8,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','f6c4b9e2-efd1-4ac2-a364-8c855159c0b5'),
	(9,9,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','5d77658c-c175-40ac-af46-e9b70764f48e'),
	(10,10,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','8d45fa49-18ad-44f6-ae8c-05b6ab73650b'),
	(11,11,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','61c77c30-be28-4c1e-afaa-714197447dd7'),
	(12,12,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','cc7d7b65-09a6-4399-8b7a-aba23df05e9a'),
	(13,13,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','2c7603a1-2785-4358-b5c1-a6637134691e'),
	(14,14,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','de295e45-fa6e-4ef7-8165-682cb86b879b'),
	(15,15,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','ee8875ed-0746-45b9-8e8a-ac71fca0c850'),
	(16,16,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','354358c4-16e3-4f45-9d71-8be14d97bc58'),
	(17,17,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','6692015b-5297-4c95-a7f5-4785f43d76e5'),
	(18,18,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','d442e950-dcca-4654-8688-7a32b080f996'),
	(19,19,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','f6996955-1e6b-4114-b586-c820ffcc7110'),
	(20,20,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','ce5f9083-d3d7-4405-9bcd-1816899ab8c0'),
	(21,21,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','fc594225-0098-41f0-90b8-2ada2963fa06'),
	(22,22,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','65642d7c-2f3a-4d79-b7c7-64f333b3389b'),
	(23,23,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','be1d58b1-c8b9-4792-a57f-6544fba8b978'),
	(24,24,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','9afab633-ab96-4faf-b3ab-7cd38d660019'),
	(25,25,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','ea9d6a9e-3817-4cc8-a4ce-6b4c993778e8'),
	(26,26,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','670a66ea-961f-4411-a6d6-928e9703e39d'),
	(27,27,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','f4c2404e-b493-412a-9254-c6cfa9bbabf9'),
	(28,28,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','c98f7be1-1f3e-466f-b67f-12b4ab691248'),
	(29,29,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','1a6c7175-8f5d-4887-8a9b-723d86d5f09c'),
	(30,30,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','169b6704-6c92-48ec-afbf-5b5467b1577b'),
	(31,31,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','0b7c77cb-fd57-4d8f-83bb-55b05d70ac9a'),
	(32,32,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','add19079-b9f3-4eed-9713-d1a61cdd925b'),
	(33,33,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','01f6a803-30b6-49ab-8787-2c9581d7cf45'),
	(34,34,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','d54baf26-3778-4a53-80ea-8a45a16074a1'),
	(35,35,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','61b1684b-d7c3-4dab-bf3a-5c82114507b2'),
	(36,36,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','43336345-c818-47a3-a6b9-c3ef49d96470'),
	(37,37,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','c2b56c32-2f42-4c0a-bcdb-8a5ae486ec49'),
	(38,38,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','1d800ebd-422e-4eaf-98cd-df9c3876467a'),
	(39,39,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','234f6a03-0a88-4e26-be4e-95b6e0299c50'),
	(40,40,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','f5a8b4ec-5589-4cb0-97ae-47d5cd5f9852'),
	(41,41,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','f71c017e-e3df-46f7-b3a6-88f9fc94f1d4'),
	(42,42,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','dc7b640d-c69f-4c9c-9c71-95342f997b83'),
	(43,43,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','ec077ad5-4e07-451d-b87e-03c37df104dd'),
	(44,44,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','6c742c92-1b63-48de-b885-dd2cbb459470'),
	(45,45,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','2d333c97-e897-44df-9413-6d72ad790009'),
	(46,46,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','3a13c818-774e-4fc0-98ad-87a1883a4708'),
	(47,47,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','4676cc29-92d7-40a2-9ebf-01e8a53476e2'),
	(48,48,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','667a163e-bfa0-4a32-a18f-83f241aa81f6'),
	(49,49,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','9ceed6bb-6887-4178-9bef-aecd290e5fbd'),
	(50,50,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','bc5ba851-8981-4976-af63-347b2b3dbe54'),
	(51,51,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','5e826179-492c-4f30-97c7-4836581f91ae'),
	(52,52,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','edaa2107-c3b5-4ffd-8b73-2a9cad11786a'),
	(53,53,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','08baf390-5e39-48f6-bc01-f3cac56ee043'),
	(54,54,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','3e4a92a1-fdba-4f4e-bbdb-404701eaa990'),
	(55,55,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','54922479-5e5b-4593-980b-54c8d1918105'),
	(56,56,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','3b1db554-a351-472c-92af-c83561365416'),
	(57,57,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','e7b719e7-225f-4422-95c2-8a2ed6302b3e'),
	(58,58,1,'2017-07-04 22:10:26','2017-07-04 22:10:26','f84e0b25-f8d7-4d7a-a0ec-9317bfa0f16f'),
	(59,1,2,'2017-07-04 22:11:54','2017-07-04 22:11:54','de64e9fd-ab36-4759-b316-f90628314902'),
	(60,4,2,'2017-07-04 22:11:54','2017-07-04 22:11:54','01946001-76fe-4b53-a25c-809ce7832526'),
	(61,59,2,'2017-07-04 22:11:54','2017-07-04 22:11:54','6f047cfa-ae96-4db5-97b9-b89cc4f1fec1'),
	(62,60,2,'2017-07-04 22:11:54','2017-07-04 22:11:54','01edaa55-1d3d-441d-8c8b-aa1a9d0e037a'),
	(63,16,2,'2017-07-04 22:11:54','2017-07-04 22:11:54','e035f05f-35a0-4394-97aa-48eb41904285'),
	(64,18,2,'2017-07-04 22:11:54','2017-07-04 22:11:54','d85cc31b-ce89-4bdc-940b-67c34b542467'),
	(65,25,2,'2017-07-04 22:11:54','2017-07-04 22:11:54','33022fd1-b02e-43a0-a6fe-9d5d962c5baf'),
	(66,55,2,'2017-07-04 22:11:54','2017-07-04 22:11:54','491ddabc-cf8d-4951-8ddc-400669f3a0d9'),
	(67,57,2,'2017-07-04 22:11:54','2017-07-04 22:11:54','c4f2719f-af87-4a5e-8be2-233478cf5ecc'),
	(68,58,2,'2017-07-04 22:11:54','2017-07-04 22:11:54','e0652c02-2e54-4d5f-97c5-532611901ae4'),
	(69,61,1,'2018-03-07 09:33:05','2018-03-07 09:33:05','1df6405e-cc09-44f3-a705-2ba6c1cf7fea'),
	(70,62,1,'2018-03-07 09:33:05','2018-03-07 09:33:05','61ac1aa8-e2de-4d7a-b46f-e3c9096a9984'),
	(71,63,1,'2018-03-07 09:33:05','2018-03-07 09:33:05','c7d1ecf1-67a4-4df9-b85f-f6458c124774');

/*!40000 ALTER TABLE `craft_userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_userpermissions_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_userpermissions_users`;

CREATE TABLE `craft_userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_userpermissions_users_permissionId_userId_unq_idx` (`permissionId`,`userId`),
  KEY `craft_userpermissions_users_userId_fk` (`userId`),
  CONSTRAINT `craft_userpermissions_users_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `craft_userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_userpermissions_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_users`;

CREATE TABLE `craft_users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `preferredLocale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weekStartDay` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `client` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `locked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `suspended` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pending` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `archived` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIPAddress` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(4) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `verificationCode` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passwordResetRequired` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_users_username_unq_idx` (`username`),
  UNIQUE KEY `craft_users_email_unq_idx` (`email`),
  KEY `craft_users_verificationCode_idx` (`verificationCode`),
  KEY `craft_users_uid_idx` (`uid`),
  KEY `craft_users_preferredLocale_fk` (`preferredLocale`),
  CONSTRAINT `craft_users_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_users_preferredLocale_fk` FOREIGN KEY (`preferredLocale`) REFERENCES `craft_locales` (`locale`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_users` WRITE;
/*!40000 ALTER TABLE `craft_users` DISABLE KEYS */;

INSERT INTO `craft_users` (`id`, `username`, `photo`, `firstName`, `lastName`, `email`, `password`, `preferredLocale`, `weekStartDay`, `admin`, `client`, `locked`, `suspended`, `pending`, `archived`, `lastLoginDate`, `lastLoginAttemptIPAddress`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'kittn',NULL,'','','hello@kittn.xyz','$2y$13$aEV9hEIztEmte9HtKEhP8OT0ZWQ3NCO7Y8AUVe8j7HWWMGChQF23G','de',1,1,0,0,0,0,0,'2018-04-21 10:12:34','::1',NULL,NULL,'2018-03-18 20:43:57',NULL,NULL,NULL,NULL,0,'2017-07-16 14:02:16','2017-07-04 21:45:00','2018-04-21 10:12:34','230071a9-e155-4c49-8381-8aca584cd137');

/*!40000 ALTER TABLE `craft_users` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_widgets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_widgets`;

CREATE TABLE `craft_widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(4) unsigned DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_widgets_userId_fk` (`userId`),
  CONSTRAINT `craft_widgets_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_widgets` WRITE;
/*!40000 ALTER TABLE `craft_widgets` DISABLE KEYS */;

INSERT INTO `craft_widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'RecentEntries',1,NULL,NULL,1,'2017-07-04 21:45:10','2017-07-04 21:45:10','130f7775-6125-4402-a643-ca2ea9dabb3b'),
	(2,1,'GetHelp',2,NULL,NULL,1,'2017-07-04 21:45:10','2017-07-04 21:45:10','a5250333-cef7-4241-8f6c-534ba3ca1b86'),
	(3,1,'Updates',3,NULL,NULL,1,'2017-07-04 21:45:10','2017-07-04 21:45:10','2713dc8d-a4e0-49b1-975d-4b326a174ade'),
	(4,1,'Feed',4,NULL,'{\"url\":\"https:\\/\\/craftcms.com\\/news.rss\",\"title\":\"Craft News\"}',1,'2017-07-04 21:45:10','2017-07-04 21:45:10','c294d2fa-4e6d-4445-84f6-2a74873af193');

/*!40000 ALTER TABLE `craft_widgets` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
