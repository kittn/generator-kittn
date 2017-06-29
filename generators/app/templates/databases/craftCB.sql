# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.6.34)
# Datenbank: ktest3
# Erstellt am: 2017-06-29 20:09:26 +0000
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

LOCK TABLES `craft_assetfiles` WRITE;
/*!40000 ALTER TABLE `craft_assetfiles` DISABLE KEYS */;

INSERT INTO `craft_assetfiles` (`id`, `sourceId`, `folderId`, `filename`, `kind`, `width`, `height`, `size`, `dateModified`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(7,1,1,'DSC_8059.jpg','image',1400,927,536027,'2017-06-27 01:12:08','2017-06-27 01:12:08','2017-06-27 01:12:08','8d28bd81-f22b-4997-b5f4-56fe13985618');

/*!40000 ALTER TABLE `craft_assetfiles` ENABLE KEYS */;
UNLOCK TABLES;


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
	(1,NULL,1,'Bilder','','2017-06-27 01:04:54','2017-06-27 01:04:54','08e0f80e-cbac-4a2c-ae89-adb169375c62');

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
	(1,'Bilder','images','Local','{\"path\":\"{basePath}uploads\\/images\\/\",\"publicURLs\":1,\"url\":\"{baseUrl}uploads\\/images\\/\"}',1,10,'2017-06-27 01:04:54','2017-06-27 01:04:54','bb6ce8eb-6d68-46d1-9b97-be94c2fb3077');

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
	(1,3,77,'Blog Categories','blogCategories',1,'general/category','2017-06-27 01:06:41','2017-06-27 01:06:47','ec135f65-4c87-42d3-930e-c78cf6ebc461'),
	(2,4,78,'Settings: Image Slider','settingsImageSlider',0,NULL,'2017-06-27 01:06:41','2017-06-27 01:06:47','a11b51db-8cdd-488e-b0b3-245d4495f0f5');

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
	(1,1,'de','blog/c/{slug}',NULL,'2017-06-27 01:06:41','2017-06-27 01:06:41','cb6d3e10-d66c-428c-b89c-d8ca04ea293d'),
	(2,2,'de',NULL,NULL,'2017-06-27 01:06:41','2017-06-27 01:06:41','04e4ac66-b0ca-4701-92fa-ffecffa00dda');

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
  `field_objHorizontalRuler` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `field_objList` text COLLATE utf8_unicode_ci,
  `field_objMarkdown` longtext COLLATE utf8_unicode_ci,
  `field_objRichtext` text COLLATE utf8_unicode_ci,
  `field_objSectionColumn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_objSection` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_seo` text COLLATE utf8_unicode_ci,
  `field_objSpacer` varchar(255) COLLATE utf8_unicode_ci DEFAULT '--050',
  `field_objTab` text COLLATE utf8_unicode_ci,
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

INSERT INTO `craft_content` (`id`, `elementId`, `locale`, `title`, `field_body`, `field_objAccordion`, `field_objAnchor`, `field_objButton`, `field_objCardSlider`, `field_commentSwitch`, `field_copyright`, `field_disqusName`, `field_focalpoint`, `field_objHeadline`, `field_objHorizontalRuler`, `field_objList`, `field_objMarkdown`, `field_objRichtext`, `field_objSectionColumn`, `field_objSection`, `field_seo`, `field_objSpacer`, `field_objTab`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'de',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,'2017-06-27 01:02:17','2017-06-27 01:02:17','3e5996d9-e6b6-46f4-b44f-a04d654a64a0'),
	(2,2,'de','Welcome to Ktest3.local!','<p>It’s true, this site doesn’t have a whole lot of content yet, but don’t worry. Our web developers have just installed the CMS, and they’re setting things up for the content editors this very moment. Soon Ktest3.local will be an oasis of fresh perspectives, sharp analyses, and astute opinions that will keep you coming back again and again.</p>',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,NULL,NULL,'{\"id\":null,\"enabled\":1,\"archived\":0,\"locale\":\"de\",\"localeEnabled\":1,\"slug\":null,\"uri\":null,\"dateCreated\":null,\"dateUpdated\":null,\"root\":null,\"lft\":null,\"rgt\":null,\"level\":null,\"searchScore\":null,\"elementId\":0,\"metaType\":\"template\",\"metaPath\":\"\",\"seoMainEntityCategory\":\"CreativeWork\",\"seoMainEntityOfPage\":\"Article\",\"seoTitle\":\"Welcome to Ktest3.local!\",\"seoDescription\":\"Welcome to Ktest3.local!\",\"seoKeywords\":\"\",\"seoImageTransform\":\"\",\"seoFacebookImageTransform\":\"\",\"seoTwitterImageTransform\":\"\",\"twitterCardType\":\"summary_large_image\",\"openGraphType\":\"article\",\"robots\":\"all\",\"seoImageId\":\"\",\"seoTwitterImageId\":\"\",\"seoFacebookImageId\":\"\",\"seoTitleUnparsed\":\"Welcome to Ktest3.local!\",\"seoDescriptionUnparsed\":\"Welcome to Ktest3.local!\",\"seoKeywordsUnparsed\":\"\",\"seoTitleSource\":\"field\",\"seoTitleSourceField\":\"title\",\"seoDescriptionSource\":\"field\",\"seoDescriptionSourceField\":\"title\",\"seoKeywordsSource\":\"custom\",\"seoKeywordsSourceField\":\"title\",\"seoImageIdSource\":\"field\",\"seoImageIdSourceField\":\"\",\"seoTwitterImageIdSource\":\"field\",\"seoTwitterImageIdSourceField\":\"\",\"seoFacebookImageIdSource\":\"field\",\"seoFacebookImageIdSourceField\":\"\",\"seoCommerceVariants\":null,\"__model__\":\"Craft\\\\Seomatic_MetaFieldModel\"}','--050',NULL,'2017-06-27 01:02:20','2017-06-27 01:12:21','1cf841c4-2b70-47d5-8fb4-154117a1e407'),
	(4,4,'de','404',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,'2017-06-27 01:04:54','2017-06-27 01:04:54','0de141d0-0d28-48be-87ed-755550ef4d78'),
	(5,5,'de',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,'2017-06-27 01:06:47','2017-06-27 01:06:47','d5b75488-5f66-4c07-9977-a27acc6ec750'),
	(6,6,'de',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'',NULL,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,'2017-06-27 01:06:47','2017-06-27 01:26:35','756ff3e5-f227-4c98-bf32-fd3fc7a92f08'),
	(7,7,'de','Dsc 8059',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,'2017-06-27 01:12:08','2017-06-27 01:12:08','0c34b831-95ae-42ff-8871-485735f2c1b9'),
	(8,9,'de','Just a test',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,NULL,NULL,'{\"id\":null,\"enabled\":1,\"archived\":0,\"locale\":\"de\",\"localeEnabled\":1,\"slug\":null,\"uri\":null,\"dateCreated\":null,\"dateUpdated\":null,\"root\":null,\"lft\":null,\"rgt\":null,\"level\":null,\"searchScore\":null,\"elementId\":0,\"metaType\":\"template\",\"metaPath\":\"\",\"seoMainEntityCategory\":\"CreativeWork\",\"seoMainEntityOfPage\":\"Article\",\"seoTitle\":\"Just a test\",\"seoDescription\":\"Just a test\",\"seoKeywords\":\"\",\"seoImageTransform\":\"\",\"seoFacebookImageTransform\":\"\",\"seoTwitterImageTransform\":\"\",\"twitterCardType\":\"summary_large_image\",\"openGraphType\":\"article\",\"robots\":\"all\",\"seoImageId\":\"7\",\"seoTwitterImageId\":\"7\",\"seoFacebookImageId\":\"7\",\"seoTitleUnparsed\":\"Just a test\",\"seoDescriptionUnparsed\":\"Just a test\",\"seoKeywordsUnparsed\":\"\",\"seoTitleSource\":\"field\",\"seoTitleSourceField\":\"title\",\"seoDescriptionSource\":\"field\",\"seoDescriptionSourceField\":\"title\",\"seoKeywordsSource\":\"custom\",\"seoKeywordsSourceField\":\"title\",\"seoImageIdSource\":\"field\",\"seoImageIdSourceField\":\"featuredImage\",\"seoTwitterImageIdSource\":\"field\",\"seoTwitterImageIdSourceField\":\"featuredImage\",\"seoFacebookImageIdSource\":\"field\",\"seoFacebookImageIdSourceField\":\"featuredImage\",\"seoCommerceVariants\":null,\"__model__\":\"Craft\\\\Seomatic_MetaFieldModel\"}','--050',NULL,'2017-06-27 01:16:06','2017-06-27 01:16:06','4fff40b1-183a-42ba-9457-4d552c2cc3bf');

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
	(1,'User',1,0,'2017-06-27 01:02:17','2017-06-27 01:02:17','641bcdc5-5c2a-49cc-80d4-285fc20de6f8'),
	(2,'Entry',1,0,'2017-06-27 01:02:20','2017-06-27 01:12:21','f4370f58-a103-44cc-bf54-6c1ebefc3e77'),
	(4,'Entry',1,0,'2017-06-27 01:04:54','2017-06-27 01:04:54','a8542da3-7093-428e-b52d-31e0b8ee2660'),
	(5,'GlobalSet',1,0,'2017-06-27 01:06:47','2017-06-27 01:06:47','a22da309-6f30-4459-829d-f4f0c4f81abf'),
	(6,'GlobalSet',1,0,'2017-06-27 01:06:47','2017-06-27 01:26:35','834dca9c-6b0b-44b5-8f38-02096881d22c'),
	(7,'Asset',1,0,'2017-06-27 01:12:08','2017-06-27 01:12:08','f46dcac8-8688-4d80-addf-e4cfdb445dea'),
	(8,'SuperTable_Block',1,0,'2017-06-27 01:12:21','2017-06-27 01:12:21','9970d8ac-f76c-412e-ab7d-9c5f5e889281'),
	(9,'Entry',1,0,'2017-06-27 01:16:06','2017-06-27 01:16:06','cd04a52a-654b-4d4c-9298-c6aa24120bfd'),
	(10,'SuperTable_Block',1,0,'2017-06-27 01:16:06','2017-06-27 01:16:06','cc2c9c01-ac00-450b-b470-9891dd5d0b98'),
	(11,'SuperTable_Block',1,0,'2017-06-27 01:16:06','2017-06-27 01:16:06','93548d06-885e-4d05-b878-ec533fcfff39'),
	(12,'SuperTable_Block',1,0,'2017-06-27 01:26:36','2017-06-27 01:26:36','dfd092ea-b05e-496c-a3f6-3527a741bc66');

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
	(1,1,'de','',NULL,1,'2017-06-27 01:02:17','2017-06-27 01:02:17','77baf54b-e0eb-4214-ba4a-fc5fd5d61763'),
	(2,2,'de','homepage','__home__',1,'2017-06-27 01:02:20','2017-06-27 01:12:21','ef26ea8a-15a2-4951-a576-94f839628b00'),
	(4,4,'de','404','404',1,'2017-06-27 01:04:54','2017-06-27 01:04:54','c0c42693-bfab-4652-a623-29fb7bcac048'),
	(5,5,'de','',NULL,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','192176a2-066a-420b-a030-01fee4aec3c1'),
	(6,6,'de','',NULL,1,'2017-06-27 01:06:47','2017-06-27 01:26:36','cc84cde1-505d-4a21-bb51-086034c1ac41'),
	(7,7,'de','dsc-8059',NULL,1,'2017-06-27 01:12:08','2017-06-27 01:12:08','2c761113-53bf-4c06-bb6c-6d20752e8753'),
	(8,8,'de','',NULL,1,'2017-06-27 01:12:21','2017-06-27 01:12:21','37ea0cd1-b7e0-4fd2-8e44-a3593db54b2c'),
	(9,9,'de','just-a-test','just-a-test',1,'2017-06-27 01:16:06','2017-06-27 01:16:08','e16eeb29-bc95-455d-af67-26cf8a153ad9'),
	(10,10,'de','',NULL,1,'2017-06-27 01:16:06','2017-06-27 01:16:06','6b2cbea0-7b0a-4e7d-a9ec-3ae56010cbd9'),
	(11,11,'de','',NULL,1,'2017-06-27 01:16:06','2017-06-27 01:16:06','c8bf9dd4-34d5-4b22-8040-0048cf1a9204'),
	(12,12,'de','',NULL,1,'2017-06-27 01:26:36','2017-06-27 01:26:36','b039634c-70eb-4a48-919f-569fd7caa158');

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
	(2,1,NULL,NULL,'2017-06-27 01:02:20',NULL,'2017-06-27 01:02:20','2017-06-27 01:12:21','ccdbdadd-cf93-40b1-8967-72db1b23005e'),
	(4,3,NULL,NULL,'2017-06-27 01:04:54',NULL,'2017-06-27 01:04:54','2017-06-27 01:04:54','eaaf4f93-747b-4cb7-ba6a-565d047cfcfc'),
	(9,6,6,1,'2017-06-27 01:16:06',NULL,'2017-06-27 01:16:06','2017-06-27 01:16:06','2b3a2e64-21f1-4329-83e9-1ea4ff3a8f77');

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
	(1,1,73,'Homepage','homepage',1,'Title',NULL,1,'2017-06-27 01:02:20','2017-06-27 01:06:47','1b99853a-69d7-4266-917e-a38c8246f2a8'),
	(3,3,70,'404','error404',0,NULL,'{section.name|raw}',1,'2017-06-27 01:04:54','2017-06-27 01:06:47','71117672-db58-48da-9fdb-f3b7953fe94a'),
	(4,4,71,'Blog Channel','blogChannel',1,'Title',NULL,1,'2017-06-27 01:04:54','2017-06-27 01:06:47','b8fa7dec-a0b6-4ea6-af90-ea6884d888bc'),
	(5,5,72,'Blog Pages','blogPages',1,'Titel',NULL,1,'2017-06-27 01:04:54','2017-06-27 01:06:47','ab73b148-0b55-45b3-9c91-e2b35dd12732'),
	(6,6,74,'Seiten','pages',1,'Titel',NULL,1,'2017-06-27 01:04:54','2017-06-27 01:06:47','29065c80-0b69-4496-8de3-719fc89f0c2c');

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
	(1,2,1,1,'de',1,NULL,'{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Homepage\",\"slug\":\"homepage\",\"postDate\":1498525340,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":[]}','2017-06-27 01:02:20','2017-06-27 01:02:20','c38d3f90-1800-405c-9d92-c481cecb7aa5'),
	(2,2,1,1,'de',2,NULL,'{\"typeId\":null,\"authorId\":null,\"title\":\"Welcome to Ktest3.local!\",\"slug\":\"homepage\",\"postDate\":1498525340,\"expiryDate\":null,\"enabled\":\"1\",\"parentId\":null,\"fields\":{\"1\":\"<p>It\\u2019s true, this site doesn\\u2019t have a whole lot of content yet, but don\\u2019t worry. Our web developers have just installed the CMS, and they\\u2019re setting things up for the content editors this very moment. Soon Ktest3.local will be an oasis of fresh perspectives, sharp analyses, and astute opinions that will keep you coming back again and again.<\\/p>\"}}','2017-06-27 01:02:20','2017-06-27 01:02:20','f95fccb8-afbe-4a5c-8be3-083a6b68e093'),
	(4,4,3,1,'de',1,NULL,'{\"typeId\":\"3\",\"authorId\":null,\"title\":\"404\",\"slug\":\"404\",\"postDate\":1498525494,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":[]}','2017-06-27 01:04:54','2017-06-27 01:04:54','4f94f622-d2e3-4ef4-8ff6-edb1ddf77f49'),
	(5,2,1,1,'de',3,'','{\"typeId\":null,\"authorId\":null,\"title\":\"Welcome to Ktest3.local!\",\"slug\":\"homepage\",\"postDate\":1498525340,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"152\":\"\",\"62\":{\"new1\":{\"type\":\"14\",\"fields\":{\"photo\":[\"7\"],\"headline\":\"Summer Holiday\",\"linkit\":{\"type\":\"\",\"custom\":\"\",\"entry\":\"\",\"category\":\"\",\"customText\":\"\",\"target\":\"\"}}}},\"124\":{\"seoMainEntityCategory\":\"CreativeWork\",\"seoMainEntityOfPage\":\"Article\",\"seoTitleSource\":\"field\",\"seoTitleSourceField\":\"title\",\"seoTitleUnparsed\":\"\",\"seoDescriptionSource\":\"field\",\"seoDescriptionSourceField\":\"title\",\"seoDescriptionUnparsed\":\"\",\"seoKeywordsSource\":\"custom\",\"seoKeywordsSourceField\":\"title\",\"seoKeywordsUnparsed\":\"\",\"seoImageIdSource\":\"field\",\"seoImageId\":\"\",\"seoImageTransform\":\"\",\"twitterCardType\":\"summary_large_image\",\"seoTwitterImageIdSource\":\"field\",\"seoTwitterImageId\":\"\",\"seoTwitterImageTransform\":\"\",\"openGraphType\":\"article\",\"seoFacebookImageIdSource\":\"field\",\"seoFacebookImageId\":\"\",\"seoFacebookImageTransform\":\"\",\"robots\":\"all\"}}}','2017-06-27 01:12:21','2017-06-27 01:12:21','2cb509e1-1819-4230-9d63-2949aff672df'),
	(6,9,6,1,'de',1,'','{\"typeId\":null,\"authorId\":\"1\",\"title\":\"Just a test\",\"slug\":\"just-a-test\",\"postDate\":1498526166,\"expiryDate\":null,\"enabled\":1,\"parentId\":\"\",\"fields\":{\"152\":\"\",\"42\":[\"7\"],\"43\":{\"new1\":{\"type\":\"9\",\"fields\":{\"headline\":\"\",\"linkit\":{\"type\":\"\",\"tel\":\"\",\"custom\":\"\",\"entry\":\"\",\"asset\":\"\",\"category\":\"\",\"customText\":\"\",\"target\":\"\"}}}},\"46\":{\"new1\":{\"type\":\"10\",\"fields\":{\"fullbleed\":\"\",\"ratio\":\"\"}}},\"124\":{\"seoMainEntityCategory\":\"CreativeWork\",\"seoMainEntityOfPage\":\"Article\",\"seoTitleSource\":\"field\",\"seoTitleSourceField\":\"title\",\"seoTitleUnparsed\":\"\",\"seoDescriptionSource\":\"field\",\"seoDescriptionSourceField\":\"title\",\"seoDescriptionUnparsed\":\"\",\"seoKeywordsSource\":\"custom\",\"seoKeywordsSourceField\":\"title\",\"seoKeywordsUnparsed\":\"\",\"seoImageIdSource\":\"field\",\"seoImageIdSourceField\":\"featuredImage\",\"seoImageId\":\"\",\"seoImageTransform\":\"\",\"twitterCardType\":\"summary_large_image\",\"seoTwitterImageIdSource\":\"field\",\"seoTwitterImageIdSourceField\":\"featuredImage\",\"seoTwitterImageId\":\"\",\"seoTwitterImageTransform\":\"\",\"openGraphType\":\"article\",\"seoFacebookImageIdSource\":\"field\",\"seoFacebookImageIdSourceField\":\"featuredImage\",\"seoFacebookImageId\":\"\",\"seoFacebookImageTransform\":\"\",\"robots\":\"all\"}}}','2017-06-27 01:16:06','2017-06-27 01:16:06','3102c4c7-858e-417b-97cd-a2a2c684a040');

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
	(1,'Default','2017-06-27 01:02:20','2017-06-27 01:02:20','2c0743f0-7fd9-4f9e-a7e8-4170bd739d30'),
	(2,'Objects','2017-06-27 01:04:54','2017-06-27 01:04:54','e75e067a-d3bd-4e42-b576-a16c0ba2f9b0'),
	(3,'ObjectsOptions','2017-06-27 01:04:54','2017-06-27 01:04:54','03eba6c1-fa01-4234-a4ac-7f39e850817d'),
	(4,'Meta','2017-06-27 01:04:54','2017-06-27 01:04:54','e4e122c5-11fc-40b8-be84-06763763e307'),
	(5,'Builder','2017-06-27 01:04:54','2017-06-27 01:04:54','cd6252dd-0fcc-40dd-acf4-23b270f96a9c'),
	(6,'Globals','2017-06-27 01:04:54','2017-06-27 01:04:54','3bf68e8b-7cfc-444e-9675-1e88d85885d7');

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
	(4,13,3,5,0,1,'2017-06-27 01:06:41','2017-06-27 01:06:41','90beb1e1-a6ec-4d39-a5d4-113bc50a53be'),
	(5,14,4,8,0,1,'2017-06-27 01:06:41','2017-06-27 01:06:41','69ce280f-73dc-49f8-9300-e1014b25d6cb'),
	(6,15,5,11,0,1,'2017-06-27 01:06:41','2017-06-27 01:06:41','a0b94470-c2ff-45c7-a8db-5da79ac27ea6'),
	(7,15,5,12,0,2,'2017-06-27 01:06:41','2017-06-27 01:06:41','e8c04b28-8457-423f-8fda-3bb3ae502232'),
	(8,15,5,13,0,3,'2017-06-27 01:06:41','2017-06-27 01:06:41','c48f1363-9196-4ca4-ad8a-54fc020d791b'),
	(9,15,5,14,0,4,'2017-06-27 01:06:41','2017-06-27 01:06:41','0ac700a0-ab63-4b48-b795-c198ae63e122'),
	(10,16,6,16,0,1,'2017-06-27 01:06:42','2017-06-27 01:06:42','5fc9b409-cbac-4ec4-ad98-aefbe4d1771b'),
	(11,16,6,17,0,2,'2017-06-27 01:06:42','2017-06-27 01:06:42','697b9efc-1598-4d53-a6b0-7d29d95ed4fb'),
	(12,16,6,18,0,3,'2017-06-27 01:06:42','2017-06-27 01:06:42','d22cfe25-fabd-4ce3-bd66-06d9bc5cc8b3'),
	(13,16,6,19,0,4,'2017-06-27 01:06:42','2017-06-27 01:06:42','b273ebd1-c8c4-4bc9-af4a-f644cb0877a2'),
	(14,16,6,20,0,5,'2017-06-27 01:06:42','2017-06-27 01:06:42','1071c630-dc44-4f77-9ba7-7929bab5dc1f'),
	(15,16,6,21,0,6,'2017-06-27 01:06:42','2017-06-27 01:06:42','021cb8eb-bdd2-44f7-acde-2ac4f05bf244'),
	(16,17,7,23,0,1,'2017-06-27 01:06:42','2017-06-27 01:06:42','63e1936f-f847-4553-a1e9-8456fa63163a'),
	(17,17,7,24,0,2,'2017-06-27 01:06:42','2017-06-27 01:06:42','aa0108c1-8a5a-47af-afad-61af0534c16b'),
	(18,18,8,27,0,1,'2017-06-27 01:06:42','2017-06-27 01:06:42','49c4bf0a-1ceb-4a6a-b62b-8ea9fb4c5e16'),
	(19,18,8,28,0,2,'2017-06-27 01:06:42','2017-06-27 01:06:42','89a2d9eb-d23f-4c52-883c-ae5090a7a81e'),
	(20,19,9,34,0,1,'2017-06-27 01:06:42','2017-06-27 01:06:42','f632c555-258c-4bca-b971-435106af76ef'),
	(21,19,9,35,0,2,'2017-06-27 01:06:42','2017-06-27 01:06:42','b0c9d19f-8e93-4ee0-a60b-e0221a2c2f01'),
	(22,19,9,36,0,3,'2017-06-27 01:06:42','2017-06-27 01:06:42','9c5621ec-c0a8-4331-bb61-a6757c065093'),
	(23,20,10,38,0,1,'2017-06-27 01:06:42','2017-06-27 01:06:42','3b69fae0-871a-498d-a985-4dd7c37a1ea7'),
	(24,20,10,39,0,2,'2017-06-27 01:06:42','2017-06-27 01:06:42','df528104-716c-42d9-bcc1-118deac51968'),
	(25,20,10,40,0,3,'2017-06-27 01:06:42','2017-06-27 01:06:42','3ca5ef35-1814-4143-80d7-4850200f9ad4'),
	(26,20,10,41,0,4,'2017-06-27 01:06:42','2017-06-27 01:06:42','e2f7e027-955a-4edf-9b24-776e9b99a3f9'),
	(27,21,11,44,0,1,'2017-06-27 01:06:42','2017-06-27 01:06:42','510f50e2-02a5-4f25-8b6f-0829172e1c90'),
	(28,21,11,45,0,2,'2017-06-27 01:06:42','2017-06-27 01:06:42','7c947b12-38fb-43b5-8a55-ba8630fa876a'),
	(29,22,12,47,0,1,'2017-06-27 01:06:43','2017-06-27 01:06:43','bfb6e042-7ce5-4e42-9eb4-60c7fdad3a82'),
	(30,22,12,48,0,2,'2017-06-27 01:06:43','2017-06-27 01:06:43','4171c499-f163-4772-bf76-f6f58fde64a0'),
	(31,23,13,51,1,1,'2017-06-27 01:06:43','2017-06-27 01:06:43','f9721e0d-20e1-4632-b57c-560a10f9c472'),
	(32,23,13,52,0,2,'2017-06-27 01:06:43','2017-06-27 01:06:43','55fd91fb-2d85-4a05-abd3-df73748df95f'),
	(33,24,14,54,0,1,'2017-06-27 01:06:43','2017-06-27 01:06:43','f2300e53-a166-4bf8-80c4-58927da88e55'),
	(34,24,14,55,0,2,'2017-06-27 01:06:43','2017-06-27 01:06:43','cd8ca4b4-bbcc-4721-bf3b-29e4c4516fba'),
	(35,24,14,56,0,3,'2017-06-27 01:06:43','2017-06-27 01:06:43','81f0361c-8b86-459b-859c-85224c63e040'),
	(36,25,15,59,0,1,'2017-06-27 01:06:43','2017-06-27 01:06:43','d6dcd71f-e1b8-4535-b1d2-08d515ff1a14'),
	(37,25,15,60,0,2,'2017-06-27 01:06:43','2017-06-27 01:06:43','b2dafeb2-32ed-4f60-a520-ad51e5ae77e5'),
	(38,25,15,61,0,3,'2017-06-27 01:06:43','2017-06-27 01:06:43','f87d6b29-ed14-42bf-8b0b-80bbaad6723e'),
	(39,26,16,63,0,1,'2017-06-27 01:06:43','2017-06-27 01:06:43','e526f9c4-e29a-4d47-b17c-ff2234b1c34e'),
	(40,26,16,64,0,2,'2017-06-27 01:06:43','2017-06-27 01:06:43','83442741-8dca-4e20-8bec-c81e073e44e1'),
	(41,26,16,65,0,3,'2017-06-27 01:06:43','2017-06-27 01:06:43','781e8df6-80a1-4f25-a9d9-54dbab05dd80'),
	(42,27,17,69,0,1,'2017-06-27 01:06:43','2017-06-27 01:06:43','45d4e140-7433-427d-81f0-226e7759a5c9'),
	(43,27,17,70,0,2,'2017-06-27 01:06:43','2017-06-27 01:06:43','17e27161-7a37-46e7-94b3-947a8de4b484'),
	(44,27,17,71,0,3,'2017-06-27 01:06:43','2017-06-27 01:06:43','b5576d74-1b16-4377-8f87-a412561475e8'),
	(45,28,18,73,0,1,'2017-06-27 01:06:44','2017-06-27 01:06:44','0a129a85-1205-42d2-9741-7f880f27696b'),
	(46,28,18,74,0,2,'2017-06-27 01:06:44','2017-06-27 01:06:44','712e6914-e1e3-4b38-93c0-7bc2ddda5384'),
	(47,29,19,76,0,1,'2017-06-27 01:06:44','2017-06-27 01:06:44','a59b9c49-9790-409e-b351-c85f47121389'),
	(48,29,19,77,0,2,'2017-06-27 01:06:44','2017-06-27 01:06:44','6870afe9-b3fa-4998-9fdd-a4151ca46d79'),
	(49,30,20,80,0,1,'2017-06-27 01:06:44','2017-06-27 01:06:44','f5af12bf-4feb-40f8-9040-e95d9ae7b25d'),
	(50,30,20,81,0,2,'2017-06-27 01:06:44','2017-06-27 01:06:44','246d6ce6-9266-4780-8ad7-bdb6dc4199af'),
	(51,31,21,84,0,1,'2017-06-27 01:06:44','2017-06-27 01:06:44','0917d00a-a1a3-48ab-9ab8-667aad8cb59e'),
	(52,31,21,85,0,2,'2017-06-27 01:06:44','2017-06-27 01:06:44','04e724f9-fe3d-46dc-a57c-06ed94ec7053'),
	(53,32,22,87,0,1,'2017-06-27 01:06:44','2017-06-27 01:06:44','416dcc5f-42ce-4281-8b31-7fc9d07911c6'),
	(54,32,22,88,0,2,'2017-06-27 01:06:44','2017-06-27 01:06:44','4fabd09b-1572-4386-a03e-2f86caf5ac90'),
	(55,33,23,90,0,1,'2017-06-27 01:06:44','2017-06-27 01:06:44','14183b9f-d156-49d5-88e5-782cbdef9d12'),
	(56,33,23,91,0,2,'2017-06-27 01:06:44','2017-06-27 01:06:44','251c1b96-838f-45cb-9704-03be86afe436'),
	(57,33,23,92,0,3,'2017-06-27 01:06:44','2017-06-27 01:06:44','7f25dab9-479f-4e73-a5b9-2e8e5a03c249'),
	(58,34,24,94,0,1,'2017-06-27 01:06:44','2017-06-27 01:06:44','0a158984-838e-4b16-88ed-7d7bed4b92d5'),
	(59,34,24,95,0,2,'2017-06-27 01:06:44','2017-06-27 01:06:44','9c4400ca-56f0-4b30-8f60-49fce324dd93'),
	(60,35,25,97,0,1,'2017-06-27 01:06:45','2017-06-27 01:06:45','ff8db5ca-8a5a-4abb-ac28-498986b686f0'),
	(61,36,26,100,0,1,'2017-06-27 01:06:45','2017-06-27 01:06:45','db15c101-f195-488c-9e15-1c4491e629a9'),
	(62,37,27,102,0,1,'2017-06-27 01:06:45','2017-06-27 01:06:45','19ac266d-d7e8-4747-a470-9215f505d95a'),
	(63,37,27,103,0,2,'2017-06-27 01:06:45','2017-06-27 01:06:45','f1e5a39d-faee-4142-98be-120e5d9b1706'),
	(64,37,27,104,0,3,'2017-06-27 01:06:45','2017-06-27 01:06:45','cdab6a21-a460-4938-950e-1c7482694a33'),
	(65,37,27,105,0,4,'2017-06-27 01:06:45','2017-06-27 01:06:45','29f8218e-195d-44ce-a751-ec73521c3e5f'),
	(66,37,27,106,0,5,'2017-06-27 01:06:45','2017-06-27 01:06:45','5365c34c-ea4a-44b7-844f-037754ee2ac6'),
	(67,37,27,107,0,6,'2017-06-27 01:06:45','2017-06-27 01:06:45','86d770f6-793d-4907-89f5-ed15d4a5b735'),
	(68,37,27,108,0,7,'2017-06-27 01:06:45','2017-06-27 01:06:45','74353547-0505-40b4-9cfd-6e53e68fc25c'),
	(69,38,28,111,0,1,'2017-06-27 01:06:45','2017-06-27 01:06:45','61661c76-3ffc-462d-aab2-fe8f55bf3cbd'),
	(70,38,28,112,0,2,'2017-06-27 01:06:45','2017-06-27 01:06:45','517e75b0-28f1-4d3c-8fd8-c3f710b282f3'),
	(71,38,28,113,0,3,'2017-06-27 01:06:45','2017-06-27 01:06:45','738fbc76-adef-4756-ad0a-4af4152388e9'),
	(72,39,29,115,0,1,'2017-06-27 01:06:45','2017-06-27 01:06:45','9d8417f3-5a11-4cc6-9fa5-058ff0c64bb8'),
	(73,39,29,116,0,2,'2017-06-27 01:06:45','2017-06-27 01:06:45','7ce959ab-9cb8-47cd-878d-37a0be29c385'),
	(74,39,29,117,0,3,'2017-06-27 01:06:45','2017-06-27 01:06:45','9033a826-ceff-473d-aeca-725275fea523'),
	(75,40,30,119,0,1,'2017-06-27 01:06:45','2017-06-27 01:06:45','4d41272d-85f6-40f3-b45e-637d44f6f6bb'),
	(76,40,30,120,0,2,'2017-06-27 01:06:45','2017-06-27 01:06:45','1fb766ce-5872-4778-8718-ccc991c82158'),
	(77,40,30,121,0,3,'2017-06-27 01:06:45','2017-06-27 01:06:45','2d49562f-b4ab-41e9-bb5a-dc4b3f40bef7'),
	(78,40,30,122,0,4,'2017-06-27 01:06:45','2017-06-27 01:06:45','1c050936-80d8-4b89-86b2-b9b9152f11dd'),
	(79,41,31,126,0,1,'2017-06-27 01:06:46','2017-06-27 01:06:46','fffb6737-36c7-48c7-bc27-3b2e166bb70e'),
	(80,41,31,127,0,2,'2017-06-27 01:06:46','2017-06-27 01:06:46','a7183231-22fb-42ad-bd00-4d932234307f'),
	(81,42,32,129,0,1,'2017-06-27 01:06:46','2017-06-27 01:06:46','50a712b9-a438-4ba1-8553-328dd86a47b2'),
	(82,43,33,131,0,1,'2017-06-27 01:06:46','2017-06-27 01:06:46','9bc3779d-2ad5-4490-a18e-0af61c6e18c6'),
	(83,43,33,132,0,2,'2017-06-27 01:06:46','2017-06-27 01:06:46','e31c5475-1c51-4dbe-9196-9cc92b02f109'),
	(84,43,33,133,0,3,'2017-06-27 01:06:46','2017-06-27 01:06:46','7531793a-6312-4d5b-9e6c-755ae5295060'),
	(85,43,33,134,0,4,'2017-06-27 01:06:46','2017-06-27 01:06:46','4eca4cac-d2a2-4e1f-bb34-c3d398164941'),
	(86,43,33,135,0,5,'2017-06-27 01:06:46','2017-06-27 01:06:46','29f59338-5dfd-473b-9f9d-791d557688fe'),
	(87,43,33,136,0,6,'2017-06-27 01:06:46','2017-06-27 01:06:46','6af94cfe-8a20-45e7-9f40-bad7ca5ed6c2'),
	(88,44,34,138,0,1,'2017-06-27 01:06:46','2017-06-27 01:06:46','dd3615b3-254b-4339-9c36-c51012dcea5b'),
	(89,44,34,139,0,2,'2017-06-27 01:06:46','2017-06-27 01:06:46','dd3b7d42-72d9-47d1-84ea-3a5a69bc05df'),
	(90,44,34,140,0,3,'2017-06-27 01:06:46','2017-06-27 01:06:46','46788bef-a1db-4a6d-b158-47e2b60701ec'),
	(91,44,34,141,0,4,'2017-06-27 01:06:46','2017-06-27 01:06:46','c33b7eff-e42b-47a3-8898-2bd2265b5cea'),
	(92,44,34,142,0,5,'2017-06-27 01:06:46','2017-06-27 01:06:46','24bc9942-4dee-44b8-b049-f275ce6fe40b'),
	(93,44,34,143,0,6,'2017-06-27 01:06:46','2017-06-27 01:06:46','8369a0d3-955d-4552-9b5a-5378c64fc744'),
	(94,45,35,145,0,1,'2017-06-27 01:06:46','2017-06-27 01:06:46','2a41effb-fd48-4ca6-9cea-e0ca847bd57b'),
	(95,45,35,146,0,2,'2017-06-27 01:06:46','2017-06-27 01:06:46','787ab031-6e07-4c0d-8acd-26f4fdc01e1e'),
	(96,45,35,147,0,3,'2017-06-27 01:06:46','2017-06-27 01:06:46','89e5cba9-ab0b-4722-b5ce-ff53c719b712'),
	(97,46,36,151,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','8c3f1831-9397-4d92-ace5-3bcc1b9cfbc9'),
	(98,47,37,57,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','65bb7da9-30f4-4603-afec-7bdff781736f'),
	(99,47,38,58,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','80f9dd0d-e947-41f4-b88a-1c29a16a4a76'),
	(100,48,39,98,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','82845fb3-b121-44a2-b720-7bb10d1a35a3'),
	(101,48,40,99,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','01122b4d-0e9b-417c-8f7e-014e7b7b615b'),
	(102,49,41,82,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','45adb78c-4f0b-4cb8-a8bc-524a5944c907'),
	(103,49,42,83,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','b4602377-b4a7-47fe-8b20-d88d8a8ec269'),
	(104,50,43,78,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','3998f436-ed98-417e-800a-8de51276b210'),
	(105,50,44,79,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','46bc5609-a92e-448c-b45c-299378ed54c0'),
	(106,51,45,93,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','5c1d7db3-0e26-4599-b6e3-c7ddac432660'),
	(107,51,46,96,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','90c5553f-5451-4248-a689-35864563a08e'),
	(108,52,47,86,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','5174590c-d868-45d0-bc71-9acbecf29c57'),
	(109,52,48,89,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','5120908f-b5d0-4d8c-a8b6-0d6ded8931ce'),
	(110,53,49,33,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','14238f68-7b74-48b5-abcb-7ba8b3b59eef'),
	(111,53,50,37,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','dd02e46c-5eef-44d1-9d98-d330ae7183ce'),
	(112,54,51,15,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','6cd00f7c-0e62-4094-a4e5-6bd917855335'),
	(113,54,52,22,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','9785de21-e948-4448-a5e1-27412575afa9'),
	(114,55,53,50,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','24d57396-15fd-4abe-ab8d-9a7ac2c45766'),
	(115,55,54,53,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','78c34b65-74c5-42ad-b76a-83dfea45b152'),
	(116,56,55,67,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','0133db1e-37a9-459b-8e4a-c4b3b73f75f9'),
	(117,56,56,68,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','cbb043d3-1252-4fc6-8461-8f9da122065a'),
	(118,57,57,25,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','8f06589c-ccf3-4d0e-aea1-e5e8857dacf6'),
	(119,57,58,26,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','57a86c15-37c1-4fd4-bb64-de70ff9ceee9'),
	(120,58,59,9,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','6e6302de-4562-400d-b909-0e2b1619ace2'),
	(121,58,60,10,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','b3b96394-b4e3-445c-be1b-34f59bc21fe2'),
	(122,59,61,125,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','ec7c9af1-436b-431a-938c-85bb86f56162'),
	(123,59,62,128,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','3a2710d3-69bc-405f-9b05-374fcbcf9e48'),
	(124,60,63,72,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','5d41ef59-c08f-4bb2-8e9c-27ea556c535a'),
	(125,60,64,75,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','c58e5ecc-1efa-472d-89fb-b40ff4e8998d'),
	(126,61,65,6,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','4e890afe-af0b-402d-b688-c497610cc15e'),
	(127,61,66,7,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','af02ff67-08db-4164-9b92-4663a37b58c5'),
	(128,62,67,66,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','7841c15d-08f7-451f-b6fc-d74afae62762'),
	(129,63,68,148,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','d61de2a0-8c5d-49d4-b097-d4331b523200'),
	(130,64,69,123,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','e71c3ff2-8ffe-45cf-a4a0-c875735ee2d5'),
	(131,64,70,118,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','4e367f64-f802-4b3c-9709-9ab8b1e01b33'),
	(132,64,70,114,0,2,'2017-06-27 01:06:47','2017-06-27 01:06:47','30100827-c6ea-4d11-84cc-065ac7ead75d'),
	(133,64,70,101,0,3,'2017-06-27 01:06:47','2017-06-27 01:06:47','4042575a-6135-4a27-9f25-b38aa2a52134'),
	(134,65,71,109,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','247d7e8b-c88d-43f3-a2ce-0018a56e987c'),
	(135,65,72,110,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','8b915f52-2164-419d-92fa-d4657f4371d4'),
	(136,66,73,4,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','67d6f2e6-6afc-4c3d-ab9f-68f4da5278f1'),
	(137,67,74,3,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','ab6e2519-1f92-4565-925e-126c96f3ec26'),
	(138,68,75,150,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','5a41dd26-9567-433f-8728-0607a977a3e7'),
	(139,69,76,149,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','2ed744f1-71b4-4b9e-b9cf-6219cc4b52d1'),
	(140,70,77,152,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','5bfa8f0c-9db2-405f-a4c1-f9b89b18740f'),
	(141,70,78,42,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','cf593971-c99c-4b08-b48e-7908f3427871'),
	(142,70,78,46,0,2,'2017-06-27 01:06:47','2017-06-27 01:06:47','a8a61f0b-c25a-405e-8d04-af90a1779737'),
	(143,70,78,43,0,3,'2017-06-27 01:06:47','2017-06-27 01:06:47','bf35abcc-d34e-44da-909d-05dd2e57421a'),
	(144,71,79,1,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','7def5aa9-217b-40b5-93d0-d6ceadb448fb'),
	(145,71,79,152,0,2,'2017-06-27 01:06:47','2017-06-27 01:06:47','73a504cb-ed28-4580-9343-e1ebb2f38318'),
	(146,71,80,42,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','f78ef492-891c-406e-b2c2-1d701ba7ef2c'),
	(147,71,80,46,0,2,'2017-06-27 01:06:47','2017-06-27 01:06:47','aadf227a-507f-4ea9-939c-139bcea7f792'),
	(148,71,81,29,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','1d90fd89-988a-4f19-97ef-19d23d3b7a06'),
	(149,71,81,30,0,2,'2017-06-27 01:06:47','2017-06-27 01:06:47','cac9324a-1f6f-40e4-88f7-a2fda427ebf0'),
	(150,71,82,124,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','295d703d-f947-4589-aa1d-cf62f1f16b09'),
	(151,72,83,152,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','a74ce961-cec5-48e7-b5a0-cbd26b4e939e'),
	(152,72,84,42,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','9f770780-55d2-41d0-b196-c0f4869e8643'),
	(153,72,84,46,0,2,'2017-06-27 01:06:47','2017-06-27 01:06:47','1b225e00-7948-45ca-92df-ba54283ee494'),
	(154,72,84,43,0,3,'2017-06-27 01:06:47','2017-06-27 01:06:47','544cba1e-1652-4263-8fbc-032c3f7e5173'),
	(155,72,85,124,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','18f52294-3745-457a-b391-add2661abb6d'),
	(156,73,86,152,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','2123a00f-f277-4672-b22a-ce11931acb29'),
	(157,73,87,62,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','a57acd8d-a149-446b-b578-56ad8ad351f9'),
	(158,73,88,124,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','769d05ea-f226-4685-8a08-4bb8afb10319'),
	(159,74,89,152,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','c0a84e4e-cadd-4362-81bf-2f24fbcad270'),
	(160,74,90,42,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','0d9bdcc0-5390-4d55-a80c-8c3ce0c9096a'),
	(161,74,90,46,0,2,'2017-06-27 01:06:47','2017-06-27 01:06:47','245b94c4-a71d-4405-b906-98787e200f5e'),
	(162,74,90,43,0,3,'2017-06-27 01:06:47','2017-06-27 01:06:47','b137fae6-9c69-40f9-8f6a-c1beeffcdaed'),
	(163,74,91,124,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','4694c354-a1a1-4abc-bcca-2723802c3b07'),
	(164,75,92,31,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','469ac943-d04a-41e0-a51f-955d997c819a'),
	(165,76,93,144,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','23423d91-9c80-48b6-a089-1fc16815afc0'),
	(166,76,93,32,0,2,'2017-06-27 01:06:47','2017-06-27 01:06:47','8c86e261-f92d-4151-ab31-314f1f9f01f3'),
	(167,77,94,1,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','11a738ee-4842-471e-a570-7305b2a74814'),
	(168,77,94,152,0,2,'2017-06-27 01:06:47','2017-06-27 01:06:47','d9ee913e-6169-4e8d-ad24-a9acedeadb02'),
	(169,77,95,42,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','b674d2db-650c-41ef-bc7e-c608fd883e4c'),
	(170,77,95,46,0,2,'2017-06-27 01:06:47','2017-06-27 01:06:47','4bd8e687-3097-4645-8517-0492c9ff6d2d'),
	(171,77,95,43,0,3,'2017-06-27 01:06:47','2017-06-27 01:06:47','75d3e37d-4dca-4564-b394-7b0a8a431f93'),
	(172,77,96,124,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','61651e5e-d738-43eb-8488-19173b5c4a97'),
	(173,78,97,137,0,1,'2017-06-27 01:06:47','2017-06-27 01:06:47','5b7dae2b-5faa-4f51-9bbe-720532a31806'),
	(174,78,97,130,0,2,'2017-06-27 01:06:47','2017-06-27 01:06:47','dc03a202-54ea-4c48-9a3f-3e0ebf554dcc');

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
	(1,'Tag','2017-06-27 01:02:20','2017-06-27 01:02:20','26afd537-fb6c-4b41-b386-c195cd824e72'),
	(10,'Asset','2017-06-27 01:04:54','2017-06-27 01:04:54','d4e9bb5e-9e44-4c98-9fba-971353a8998c'),
	(13,'SuperTable_Block','2017-06-27 01:06:41','2017-06-27 01:06:41','61153c0a-cd79-49c4-808f-5e99a7ac625a'),
	(14,'SuperTable_Block','2017-06-27 01:06:41','2017-06-27 01:06:41','bd827d00-6244-4d02-808a-883dcabf2b82'),
	(15,'SuperTable_Block','2017-06-27 01:06:41','2017-06-27 01:06:41','f16ee415-074c-4b70-bf45-a76b65cb9750'),
	(16,'SuperTable_Block','2017-06-27 01:06:42','2017-06-27 01:06:42','fbbcbd88-f697-42d1-a070-1cd0f56839ce'),
	(17,'SuperTable_Block','2017-06-27 01:06:42','2017-06-27 01:06:42','87fdbc13-61c0-447b-8138-867817a966b8'),
	(18,'SuperTable_Block','2017-06-27 01:06:42','2017-06-27 01:06:42','4226f213-f85b-49bb-836b-dc1bba12e17d'),
	(19,'SuperTable_Block','2017-06-27 01:06:42','2017-06-27 01:06:42','aa41b26d-5187-4885-8c9d-00321e888907'),
	(20,'SuperTable_Block','2017-06-27 01:06:42','2017-06-27 01:06:42','89c61e06-1951-4b80-8e21-73ebcd9c213f'),
	(21,'SuperTable_Block','2017-06-27 01:06:42','2017-06-27 01:06:42','9e75cdbc-78dd-47ee-a788-a9e1def6dcb4'),
	(22,'SuperTable_Block','2017-06-27 01:06:43','2017-06-27 01:06:43','7161d2c7-6eb5-470e-ba2f-c51b292e44c9'),
	(23,'SuperTable_Block','2017-06-27 01:06:43','2017-06-27 01:06:43','7370b18c-502f-4b22-a861-08fce2a147ad'),
	(24,'SuperTable_Block','2017-06-27 01:06:43','2017-06-27 01:06:43','e1b39386-d9dc-42a6-af37-f3d500f2bfe2'),
	(25,'SuperTable_Block','2017-06-27 01:06:43','2017-06-27 01:06:43','581a571f-d688-44cd-8fa6-c66b0bf628e4'),
	(26,'SuperTable_Block','2017-06-27 01:06:43','2017-06-27 01:06:43','557f3d6e-f5da-4091-9c59-3d23b536c439'),
	(27,'SuperTable_Block','2017-06-27 01:06:43','2017-06-27 01:06:43','58135efd-1804-4a95-bb83-ff39f73368ea'),
	(28,'SuperTable_Block','2017-06-27 01:06:44','2017-06-27 01:06:44','13fbfe99-8091-479e-861e-2b7bc11a386b'),
	(29,'SuperTable_Block','2017-06-27 01:06:44','2017-06-27 01:06:44','e5d37b01-9065-4bab-b808-fbba56d585c7'),
	(30,'SuperTable_Block','2017-06-27 01:06:44','2017-06-27 01:06:44','851f7b77-3871-49e3-8821-8477637624bb'),
	(31,'SuperTable_Block','2017-06-27 01:06:44','2017-06-27 01:06:44','b0fe39c2-a8fd-4689-92d6-2826bc66099f'),
	(32,'SuperTable_Block','2017-06-27 01:06:44','2017-06-27 01:06:44','894db629-09e6-42da-8bf2-e6c5e6e3ab1d'),
	(33,'SuperTable_Block','2017-06-27 01:06:44','2017-06-27 01:06:44','3b8a4ce4-2911-4451-bd77-caf9ba2947ab'),
	(34,'SuperTable_Block','2017-06-27 01:06:44','2017-06-27 01:06:44','cce2a29c-8071-4bbb-a59d-e2c5abe43e42'),
	(35,'SuperTable_Block','2017-06-27 01:06:45','2017-06-27 01:06:45','6f4609bf-a380-4a17-a993-e5f4dfe3efc8'),
	(36,'SuperTable_Block','2017-06-27 01:06:45','2017-06-27 01:06:45','94fcc914-e764-4d1c-84d5-5d9df41b9656'),
	(37,'SuperTable_Block','2017-06-27 01:06:45','2017-06-27 01:06:45','3c35b6ab-dded-471f-8e17-968316c61b68'),
	(38,'SuperTable_Block','2017-06-27 01:06:45','2017-06-27 01:06:45','a9f71ab1-375f-4949-b372-4ba0c07072ab'),
	(39,'SuperTable_Block','2017-06-27 01:06:45','2017-06-27 01:06:45','adc87a48-cf10-459c-ae23-c9fd5797fa52'),
	(40,'SuperTable_Block','2017-06-27 01:06:45','2017-06-27 01:06:45','7b5f92a1-5198-4404-8266-1ce525b72a12'),
	(41,'SuperTable_Block','2017-06-27 01:06:46','2017-06-27 01:06:46','159d29db-2fc6-4bce-b1e3-af44b1a46f05'),
	(42,'SuperTable_Block','2017-06-27 01:06:46','2017-06-27 01:06:46','32ba4134-7255-4413-8100-5b6fa749ca4b'),
	(43,'SuperTable_Block','2017-06-27 01:06:46','2017-06-27 01:06:46','b2276f84-4410-48d8-bd5d-3abb641a3b84'),
	(44,'SuperTable_Block','2017-06-27 01:06:46','2017-06-27 01:06:46','d7c4b43b-6b7d-4bd2-bbcc-b6f7e114153d'),
	(45,'SuperTable_Block','2017-06-27 01:06:46','2017-06-27 01:06:46','a300c440-48fd-489f-9cc9-32a4e45c6fd1'),
	(46,'SuperTable_Block','2017-06-27 01:06:47','2017-06-27 01:06:47','f89894f6-82d0-4565-8cea-40260d08bd03'),
	(47,'Neo_Block','2017-06-27 01:06:47','2017-06-27 01:06:47','ad4aa6a8-7b32-4f41-aada-ce377fec1da7'),
	(48,'Neo_Block','2017-06-27 01:06:47','2017-06-27 01:06:47','71292258-5512-4419-bd13-0f4bfdadf05b'),
	(49,'Neo_Block','2017-06-27 01:06:47','2017-06-27 01:06:47','5a4dcdbd-157e-4bc9-965c-4a5e808626c8'),
	(50,'Neo_Block','2017-06-27 01:06:47','2017-06-27 01:06:47','4a6d3152-af26-4ab7-b61b-c535d7bff9f8'),
	(51,'Neo_Block','2017-06-27 01:06:47','2017-06-27 01:06:47','25b27ab7-0174-41b0-9fa4-6462200416e9'),
	(52,'Neo_Block','2017-06-27 01:06:47','2017-06-27 01:06:47','38f1111e-f2ed-4d4b-8e94-84beaa66f035'),
	(53,'Neo_Block','2017-06-27 01:06:47','2017-06-27 01:06:47','406b3ad3-ffd5-4cd4-866b-33ec03d757b2'),
	(54,'Neo_Block','2017-06-27 01:06:47','2017-06-27 01:06:47','3271264d-02df-4f0e-a271-ce816654d941'),
	(55,'Neo_Block','2017-06-27 01:06:47','2017-06-27 01:06:47','5a48ead6-efa3-4365-8507-4f9784ee3c9d'),
	(56,'Neo_Block','2017-06-27 01:06:47','2017-06-27 01:06:47','3884e2e8-0be7-486c-a5bc-24bca82d2268'),
	(57,'Neo_Block','2017-06-27 01:06:47','2017-06-27 01:06:47','33506017-112c-4c66-9db0-631f0e1c5ec6'),
	(58,'Neo_Block','2017-06-27 01:06:47','2017-06-27 01:06:47','0c9545d4-b189-42b2-b082-80c0e381957b'),
	(59,'Neo_Block','2017-06-27 01:06:47','2017-06-27 01:06:47','0c944c2d-6d12-4fee-a6e3-fe709a620ce0'),
	(60,'Neo_Block','2017-06-27 01:06:47','2017-06-27 01:06:47','c133bee4-2e2d-4fb4-b339-a47b45d2df8f'),
	(61,'Neo_Block','2017-06-27 01:06:47','2017-06-27 01:06:47','7bc54454-691d-493a-8218-67654c070a2d'),
	(62,'Neo_Block','2017-06-27 01:06:47','2017-06-27 01:06:47','40143288-a656-412f-9278-8c9e9de1d191'),
	(63,'Neo_Block','2017-06-27 01:06:47','2017-06-27 01:06:47','ebd0ce5b-c4e0-4104-8730-5af7b4891a90'),
	(64,'Neo_Block','2017-06-27 01:06:47','2017-06-27 01:06:47','f6cf74e8-c97d-4130-80a0-ce04f807eeb1'),
	(65,'Neo_Block','2017-06-27 01:06:47','2017-06-27 01:06:47','8f79992f-23d2-4f76-b13d-ef300f804234'),
	(66,'Neo_Block','2017-06-27 01:06:47','2017-06-27 01:06:47','c189db0c-1586-401f-92fd-6291b7949bd5'),
	(67,'Neo_Block','2017-06-27 01:06:47','2017-06-27 01:06:47','a8943c92-7dca-4c4f-a894-799df92f8bdc'),
	(68,'Neo_Block','2017-06-27 01:06:47','2017-06-27 01:06:47','ed3e95fe-5c95-4e91-9ea8-b328ccdd7949'),
	(69,'Neo_Block','2017-06-27 01:06:47','2017-06-27 01:06:47','b581d88a-18cd-4914-877a-0f96cb6601c7'),
	(70,'Entry','2017-06-27 01:06:47','2017-06-27 01:06:47','f36b217f-4965-41eb-b9aa-aade29cd6466'),
	(71,'Entry','2017-06-27 01:06:47','2017-06-27 01:06:47','2aaa42a6-270b-471e-b64a-90beb468b165'),
	(72,'Entry','2017-06-27 01:06:47','2017-06-27 01:06:47','b4679f06-2dbb-4cf9-8b12-8955b62d4701'),
	(73,'Entry','2017-06-27 01:06:47','2017-06-27 01:06:47','022eeeab-ab9b-4c6b-b336-05dca53b2d7e'),
	(74,'Entry','2017-06-27 01:06:47','2017-06-27 01:06:47','74289ce9-db7a-4068-b3e3-f4506daeabf5'),
	(75,'GlobalSet','2017-06-27 01:06:47','2017-06-27 01:06:47','03f2bc5f-96d4-46db-b67f-f52d49d1e8ea'),
	(76,'GlobalSet','2017-06-27 01:06:47','2017-06-27 01:06:47','34134cac-6266-483b-93c7-3eb55b773909'),
	(77,'Category','2017-06-27 01:06:47','2017-06-27 01:06:47','d7bda9b8-33ec-42e5-8b0f-2466b7d21507'),
	(78,'Category','2017-06-27 01:06:47','2017-06-27 01:06:47','d53ff4f4-174e-4042-8168-4ec7f086173a');

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
	(3,13,'Content',1,'2017-06-27 01:06:41','2017-06-27 01:06:41','c3cbf50d-2ad1-4982-832e-9a51540762e5'),
	(4,14,'Content',1,'2017-06-27 01:06:41','2017-06-27 01:06:41','f5e890b3-e2fe-4d9e-ab48-511dcc72c5fc'),
	(5,15,'Content',1,'2017-06-27 01:06:41','2017-06-27 01:06:41','9b8c9413-c217-4479-bb00-559013e20d3c'),
	(6,16,'Content',1,'2017-06-27 01:06:42','2017-06-27 01:06:42','8fb532cd-2269-4c30-8019-62cb73558794'),
	(7,17,'Content',1,'2017-06-27 01:06:42','2017-06-27 01:06:42','8b449830-446f-4aad-ac46-947c9f74eeeb'),
	(8,18,'Content',1,'2017-06-27 01:06:42','2017-06-27 01:06:42','eef69b8b-783c-462c-b57b-a91bbf80b97d'),
	(9,19,'Content',1,'2017-06-27 01:06:42','2017-06-27 01:06:42','3ceac636-13e1-4956-83fb-74ab2b1073b5'),
	(10,20,'Content',1,'2017-06-27 01:06:42','2017-06-27 01:06:42','87e1410f-b0f7-4513-a83c-4d761460fe75'),
	(11,21,'Content',1,'2017-06-27 01:06:42','2017-06-27 01:06:42','21bdf930-d9d0-4118-871d-8ef5bb98d363'),
	(12,22,'Content',1,'2017-06-27 01:06:43','2017-06-27 01:06:43','34e4f4dd-648e-44f2-9117-a641f62eff3d'),
	(13,23,'Content',1,'2017-06-27 01:06:43','2017-06-27 01:06:43','27e92759-687f-4b17-a84c-c0ddca63dd8c'),
	(14,24,'Content',1,'2017-06-27 01:06:43','2017-06-27 01:06:43','f3ec626b-b787-486b-aa6b-09799e8b4ee5'),
	(15,25,'Content',1,'2017-06-27 01:06:43','2017-06-27 01:06:43','a007b860-fc55-48e1-bd11-6d49da12efb8'),
	(16,26,'Content',1,'2017-06-27 01:06:43','2017-06-27 01:06:43','e6dbd222-41fb-4cd6-82d4-e6f837dd358c'),
	(17,27,'Content',1,'2017-06-27 01:06:43','2017-06-27 01:06:43','4312f764-d142-478c-9709-ab718894f008'),
	(18,28,'Content',1,'2017-06-27 01:06:44','2017-06-27 01:06:44','bd987427-5a75-4a9c-bfe1-af100cd9c820'),
	(19,29,'Content',1,'2017-06-27 01:06:44','2017-06-27 01:06:44','6bdc1d4c-7c3b-42a4-a44c-03dcf8e89d11'),
	(20,30,'Content',1,'2017-06-27 01:06:44','2017-06-27 01:06:44','04e75f6f-46d1-41fd-b03e-447ade87f2c6'),
	(21,31,'Content',1,'2017-06-27 01:06:44','2017-06-27 01:06:44','f9d82009-0d40-47d4-97c6-68ba5ee68447'),
	(22,32,'Content',1,'2017-06-27 01:06:44','2017-06-27 01:06:44','0475d0f0-c2e0-40f5-9374-0be671dafaf1'),
	(23,33,'Content',1,'2017-06-27 01:06:44','2017-06-27 01:06:44','eb97f6df-238c-48ed-a218-53285a4caaed'),
	(24,34,'Content',1,'2017-06-27 01:06:44','2017-06-27 01:06:44','c60faeac-f287-4cda-bc17-ded2166e0c00'),
	(25,35,'Content',1,'2017-06-27 01:06:45','2017-06-27 01:06:45','ee1bbc68-c7a4-49ba-b8a9-54598e9cc75b'),
	(26,36,'Content',1,'2017-06-27 01:06:45','2017-06-27 01:06:45','263190f8-3cdd-4af8-bbcd-0079c0e0ef1a'),
	(27,37,'Content',1,'2017-06-27 01:06:45','2017-06-27 01:06:45','12726781-8a84-4291-af43-2fe12491cdf2'),
	(28,38,'Content',1,'2017-06-27 01:06:45','2017-06-27 01:06:45','32c7cb87-2a15-48ed-8e8f-1e7ca227c8de'),
	(29,39,'Content',1,'2017-06-27 01:06:45','2017-06-27 01:06:45','20769ab7-1c94-4ebc-83cc-6ed005170811'),
	(30,40,'Content',1,'2017-06-27 01:06:45','2017-06-27 01:06:45','5471347f-2c7c-4d3c-a886-61a99926513a'),
	(31,41,'Content',1,'2017-06-27 01:06:46','2017-06-27 01:06:46','abfec462-5fcf-4857-a3d0-aa45a6c6364e'),
	(32,42,'Content',1,'2017-06-27 01:06:46','2017-06-27 01:06:46','7e196da6-c48b-4e70-81c4-1b2be825b73f'),
	(33,43,'Content',1,'2017-06-27 01:06:46','2017-06-27 01:06:46','f77f1ff2-8746-433b-b6bb-f714f7249d2c'),
	(34,44,'Content',1,'2017-06-27 01:06:46','2017-06-27 01:06:46','07591e4b-dde7-4be4-9cb5-c53d510c12ef'),
	(35,45,'Content',1,'2017-06-27 01:06:46','2017-06-27 01:06:46','cc14ec5b-3807-482a-abd0-6740b7e118b6'),
	(36,46,'Content',1,'2017-06-27 01:06:47','2017-06-27 01:06:47','218d317c-9fb6-4a47-a1b2-62e907f1f6da'),
	(37,47,'Main',1,'2017-06-27 01:06:47','2017-06-27 01:06:47','21eae822-1482-4211-80f5-5e42dbb9911f'),
	(38,47,'Options',2,'2017-06-27 01:06:47','2017-06-27 01:06:47','4faa8062-1ba2-4cc6-95ea-98a30d4734eb'),
	(39,48,'Main',1,'2017-06-27 01:06:47','2017-06-27 01:06:47','902ec4b3-4047-4abb-9e34-ddd80dfe6bc5'),
	(40,48,'Options',2,'2017-06-27 01:06:47','2017-06-27 01:06:47','13659dcc-8533-4729-84a5-fd9adce231f9'),
	(41,49,'Main',1,'2017-06-27 01:06:47','2017-06-27 01:06:47','c54650eb-a245-4c5d-9c03-2fdb59a86680'),
	(42,49,'Options',2,'2017-06-27 01:06:47','2017-06-27 01:06:47','089830ac-664e-4f9a-b430-9414712d54c8'),
	(43,50,'Main',1,'2017-06-27 01:06:47','2017-06-27 01:06:47','41177f2c-4dc3-4f8c-9722-586bebbc7839'),
	(44,50,'Options',2,'2017-06-27 01:06:47','2017-06-27 01:06:47','41842b8e-ef3f-45e5-9545-a2691671affe'),
	(45,51,'Main',1,'2017-06-27 01:06:47','2017-06-27 01:06:47','680f47a1-ac26-4a44-ac2c-85feeec5ebad'),
	(46,51,'Options',2,'2017-06-27 01:06:47','2017-06-27 01:06:47','c86dbe11-d75d-4f4a-b4bb-deee7623b937'),
	(47,52,'Main',1,'2017-06-27 01:06:47','2017-06-27 01:06:47','71825396-4a19-4be9-bf4a-b1b58070ec78'),
	(48,52,'Options',2,'2017-06-27 01:06:47','2017-06-27 01:06:47','41aa59a9-f285-412e-a23c-e305c9f0473b'),
	(49,53,'Main',1,'2017-06-27 01:06:47','2017-06-27 01:06:47','2a19c1bb-a7b1-42e8-bf8f-e5ea7bd80abf'),
	(50,53,'Options',2,'2017-06-27 01:06:47','2017-06-27 01:06:47','75f868d3-da6c-4595-b521-a6e1da417645'),
	(51,54,'Main',1,'2017-06-27 01:06:47','2017-06-27 01:06:47','a0d4972b-21b5-491e-b576-a1ba9788323f'),
	(52,54,'Options',2,'2017-06-27 01:06:47','2017-06-27 01:06:47','ffb4fbe6-8851-418c-8ed3-5c010957207e'),
	(53,55,'Main',1,'2017-06-27 01:06:47','2017-06-27 01:06:47','b46f9743-82ae-4a24-ad7f-ac88f9e8fdcd'),
	(54,55,'Options',2,'2017-06-27 01:06:47','2017-06-27 01:06:47','b8340d10-eafc-4cd8-9670-1a6336905bb5'),
	(55,56,'Main',1,'2017-06-27 01:06:47','2017-06-27 01:06:47','aec2d432-4be8-49c1-800a-39984ec36e7e'),
	(56,56,'Options',2,'2017-06-27 01:06:47','2017-06-27 01:06:47','97520ae0-957d-44c1-9c7f-6b50fe6812ca'),
	(57,57,'Main',1,'2017-06-27 01:06:47','2017-06-27 01:06:47','9d562f34-8ea1-4efb-a3f2-d08dae644a70'),
	(58,57,'Options',2,'2017-06-27 01:06:47','2017-06-27 01:06:47','71d09a68-715c-429a-9374-c3d4ee18aa6f'),
	(59,58,'Main',1,'2017-06-27 01:06:47','2017-06-27 01:06:47','efd8cb7b-d390-44f9-8e48-9d8486d7b355'),
	(60,58,'Options',2,'2017-06-27 01:06:47','2017-06-27 01:06:47','97196a71-68b1-4a29-ba80-76f8fb79548a'),
	(61,59,'Main',1,'2017-06-27 01:06:47','2017-06-27 01:06:47','520dc05a-5143-447d-a7db-4c1bcc62aa30'),
	(62,59,'Options',2,'2017-06-27 01:06:47','2017-06-27 01:06:47','59ff6142-80ab-42cf-a7ab-89236d9193d1'),
	(63,60,'Main',1,'2017-06-27 01:06:47','2017-06-27 01:06:47','15697ba0-703b-4a44-95ea-eb19f764e480'),
	(64,60,'Options',2,'2017-06-27 01:06:47','2017-06-27 01:06:47','b51889ab-e8f4-43fb-83a1-a6a9d05ac364'),
	(65,61,'Main',1,'2017-06-27 01:06:47','2017-06-27 01:06:47','bda5a67f-a95b-4fad-84e5-fb08da4cef03'),
	(66,61,'Options',2,'2017-06-27 01:06:47','2017-06-27 01:06:47','92ab6c49-05c7-49f6-9644-5cb34594f84a'),
	(67,62,'Tab 1',1,'2017-06-27 01:06:47','2017-06-27 01:06:47','121848d2-b4e6-45a2-a554-1a082c6da551'),
	(68,63,'Tab 1',1,'2017-06-27 01:06:47','2017-06-27 01:06:47','57042eea-363f-4948-942f-326ef5708b4d'),
	(69,64,'Main',1,'2017-06-27 01:06:47','2017-06-27 01:06:47','a770c68f-fca7-47a0-9f40-ed7f5a1fe3bf'),
	(70,64,'Layout',2,'2017-06-27 01:06:47','2017-06-27 01:06:47','c4b2d4f8-3fa5-4caf-8c99-29cf45166b01'),
	(71,65,'Main',1,'2017-06-27 01:06:47','2017-06-27 01:06:47','5ad43943-d012-4a5d-a4f5-005539b77dcb'),
	(72,65,'Options',2,'2017-06-27 01:06:47','2017-06-27 01:06:47','4ad96c37-ffd3-46ec-af96-1323bb337960'),
	(73,66,'Tab 1',1,'2017-06-27 01:06:47','2017-06-27 01:06:47','c50bd1ae-1e53-445c-afb1-0de3580be6e9'),
	(74,67,'Tab 1',1,'2017-06-27 01:06:47','2017-06-27 01:06:47','62de5f6b-d6bf-4c76-ba80-1630fd5bf285'),
	(75,68,'Tab 1',1,'2017-06-27 01:06:47','2017-06-27 01:06:47','b298d7f9-d6c6-4465-ac91-e5d2932b89c9'),
	(76,69,'Tab 1',1,'2017-06-27 01:06:47','2017-06-27 01:06:47','5dcdd291-22b2-45b7-92bd-4fbe2f3ddcca'),
	(77,70,'Content',1,'2017-06-27 01:06:47','2017-06-27 01:06:47','62d06b4b-6b8e-4a89-85c9-8b9dd454d9a5'),
	(78,70,'Featured Image',2,'2017-06-27 01:06:47','2017-06-27 01:06:47','87002b2b-d3ef-43e0-b71a-426447c6c4a2'),
	(79,71,'Content',1,'2017-06-27 01:06:47','2017-06-27 01:06:47','55f1f051-72e6-4540-85c4-ff6a2739769e'),
	(80,71,'Featured Image',2,'2017-06-27 01:06:47','2017-06-27 01:06:47','974a9da6-89f2-43ac-ade7-55fd178f2538'),
	(81,71,'Meta',3,'2017-06-27 01:06:47','2017-06-27 01:06:47','33e35a4d-f36a-43b2-a7cd-b3ad9f16b5b4'),
	(82,71,'Seo',4,'2017-06-27 01:06:47','2017-06-27 01:06:47','6cb471e4-8d18-44aa-b0d6-195ec16a3722'),
	(83,72,'Content',1,'2017-06-27 01:06:47','2017-06-27 01:06:47','3c5acfee-75d7-4d6c-97c0-f760ce4ec54c'),
	(84,72,'Featured Image',2,'2017-06-27 01:06:47','2017-06-27 01:06:47','7fd07bb0-af76-4e42-bca4-475958f91a69'),
	(85,72,'Seo',3,'2017-06-27 01:06:47','2017-06-27 01:06:47','40074bae-5874-4ed5-a46e-4f4eb39629de'),
	(86,73,'Content',1,'2017-06-27 01:06:47','2017-06-27 01:06:47','11ba8241-b73c-4a7e-a547-1916364f49d9'),
	(87,73,'Hero',2,'2017-06-27 01:06:47','2017-06-27 01:06:47','c7410c04-cd5c-4ac0-b83c-95198ea0d289'),
	(88,73,'Seo',3,'2017-06-27 01:06:47','2017-06-27 01:06:47','f018583b-52b9-432d-aaa3-8c53883c848b'),
	(89,74,'Content',1,'2017-06-27 01:06:47','2017-06-27 01:06:47','8c4d267b-89b7-4622-a93a-7280891d9f73'),
	(90,74,'Featured Image',2,'2017-06-27 01:06:47','2017-06-27 01:06:47','dbe2a0e0-fb59-4e90-a431-15df84578e93'),
	(91,74,'Seo',3,'2017-06-27 01:06:47','2017-06-27 01:06:47','db654e45-ab0b-475c-93d8-6875054a1406'),
	(92,75,'Inhalt',1,'2017-06-27 01:06:47','2017-06-27 01:06:47','89f1fc86-5806-4b81-b310-5946e2fab36f'),
	(93,76,'Inhalt',1,'2017-06-27 01:06:47','2017-06-27 01:06:47','e56dc8f9-ea9f-45c9-8c10-bd1f8b78d70d'),
	(94,77,'Content',1,'2017-06-27 01:06:47','2017-06-27 01:06:47','97e422c9-d41c-49b6-9e67-2ee52d123aff'),
	(95,77,'Featured Image',2,'2017-06-27 01:06:47','2017-06-27 01:06:47','8de38f24-39e8-46a3-b946-571f0f3db03c'),
	(96,77,'Seo',3,'2017-06-27 01:06:47','2017-06-27 01:06:47','f761dde0-d1dd-4d70-af1b-666f9ffab9b8'),
	(97,78,'Tab 1',1,'2017-06-27 01:06:47','2017-06-27 01:06:47','7062abeb-6578-498b-ad8f-9790bb14efe0');

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
	(1,1,'Body','body','global',NULL,1,'RichText','{\"configFile\":\"Standard.json\",\"columnType\":\"text\"}','2017-06-27 01:02:20','2017-06-27 01:02:20','c4750bef-665f-4983-9698-0427f723cc10'),
	(2,1,'Tags','tags','global',NULL,0,'Tags','{\"source\":\"taggroup:1\"}','2017-06-27 01:02:20','2017-06-27 01:02:20','58ea6b88-6b04-43de-8a88-6d53eb3f0250'),
	(3,2,'Accordion','objAccordion','global','Accordion Block - please specify a title',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-06-27 01:06:41','2017-06-27 01:06:41','c6188567-9f65-42b6-916d-c58ef035efa4'),
	(4,2,'Accordion Wrapper','objAccordionWrapper','global','Wrapper of a group of Accordions.',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-06-27 01:06:41','2017-06-27 01:06:41','48dbfc9a-babf-446b-a5e7-eac2329b63e4'),
	(5,NULL,'Style','style','superTableBlockType:1','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1}]}','2017-06-27 01:06:41','2017-06-27 01:06:41','78443a95-31bc-462b-a21b-a95396ab48b0'),
	(6,2,'Anchor','objAnchor','global','Anchor name - no special characters and can not start with a number',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-06-27 01:06:41','2017-06-27 01:06:41','5fa16c3f-ef1a-4ad6-a80a-5200fce23d69'),
	(7,3,'Anchor Options','setAnchor','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-06-27 01:06:41','2017-06-27 01:06:41','44b6913d-37b5-4235-81cb-2668c1fb4a33'),
	(8,NULL,'Positionsfix','positionfix','superTableBlockType:2','If the anchor is too high or too low, the position value can be adjusted (higher or lower).',0,'PlainText','{\"placeholder\":\"-10px\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-06-27 01:06:41','2017-06-27 01:06:41','f1218e4e-e6dd-4f26-831d-6fb31ef4c03f'),
	(9,2,'Button','objButton','global','Button for linking internal and external content',0,'FruitLinkIt','{\"types\":[\"email\",\"custom\",\"entry\",\"category\",\"asset\"],\"defaultText\":\"Link\",\"allowCustomText\":1,\"allowTarget\":1,\"entrySources\":[],\"entrySelectionLabel\":\"Select an entry\",\"assetSources\":\"*\",\"assetSelectionLabel\":\"Select an asset\",\"categorySources\":\"*\",\"categorySelectionLabel\":\"Select a category\"}','2017-06-27 01:06:41','2017-06-27 01:06:41','1b8a3bcd-ef1b-4fa3-876a-2bfbef139edc'),
	(10,3,'Button Options','setButton','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"},\"new4\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-06-27 01:06:41','2017-06-27 01:06:41','906cf2f0-15e2-46f9-b89e-7584159be9d8'),
	(11,NULL,'Style','style','superTableBlockType:3','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1},{\"label\":\"Style 1\",\"value\":\"style1\",\"default\":\"\"}]}','2017-06-27 01:06:41','2017-06-27 01:06:41','e1ebcc7b-1ce1-4756-a5df-0307eeab20de'),
	(12,NULL,'Size','size','superTableBlockType:3','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1},{\"label\":\"Gro\\u00df\",\"value\":\"big\",\"default\":\"\"},{\"label\":\"Klein\",\"value\":\"small\",\"default\":\"\"}]}','2017-06-27 01:06:41','2017-06-27 01:06:41','e29ba38e-1394-47b9-937f-1f4b9ad884ee'),
	(13,NULL,'Full Width','fullwidth','superTableBlockType:3','Wenn der Button Zentriert angelegt wurde, kann man ihm auch die volle Breite geben',0,'Lightswitch','{\"default\":\"\"}','2017-06-27 01:06:41','2017-06-27 01:06:41','e90c233d-8034-40b6-8837-c4dd36346828'),
	(14,NULL,'Position','position','superTableBlockType:3','Regulär sind die Buttons linksbündig angeordnet, können hiermit überschrieben werden.',0,'Dropdown','{\"options\":[{\"label\":\"Left\",\"value\":\"left\",\"default\":1},{\"label\":\"Center\",\"value\":\"center\",\"default\":\"\"},{\"label\":\"Right\",\"value\":\"right\",\"default\":\"\"}]}','2017-06-27 01:06:41','2017-06-27 01:06:41','02192d3f-766f-4cb7-abf6-a28ae27a0050'),
	(15,2,'Card','objCard','global','Text Box with Media Assets ',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"},\"new4\":{\"width\":\"\"},\"new5\":{\"width\":\"\"},\"new6\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-06-27 01:06:41','2017-06-27 01:06:41','0699ca2c-678d-4466-a306-6fbc47144d03'),
	(16,NULL,'Image','photo','superTableBlockType:4','A picture will be integrated in any case. If a video is used, the picture serves as a fallback.',0,'Assets','{\"useSingleFolder\":\"\",\"sources\":\"*\",\"defaultUploadLocationSource\":\"1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":1,\"allowedKinds\":[\"image\"],\"limit\":1,\"viewMode\":\"list\",\"selectionLabel\":\"\"}','2017-06-27 01:06:41','2017-06-27 01:06:41','a19e237e-b3aa-430e-848d-7b7d4839d738'),
	(17,NULL,'Headline','headline','superTableBlockType:4','Optional headline',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-06-27 01:06:41','2017-06-27 01:06:41','59488f62-e659-4e5a-9ae4-fc2552ea2a92'),
	(18,NULL,'Subline','subline','superTableBlockType:4','Optional subline',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-06-27 01:06:41','2017-06-27 01:06:41','b455956d-4ef1-4ad4-a5f7-924dc2167d48'),
	(19,NULL,'Meta','meta','superTableBlockType:4','Optionale meta field',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-06-27 01:06:42','2017-06-27 01:06:42','a4a1c2a9-282e-4438-b8a4-c7fc8a2518e2'),
	(20,NULL,'Body','body','superTableBlockType:4','',0,'RichText','{\"configFile\":\"Reduced.json\",\"availableAssetSources\":\"*\",\"availableTransforms\":\"*\",\"cleanupHtml\":1,\"purifyHtml\":1,\"purifierConfig\":\"\",\"columnType\":\"text\"}','2017-06-27 01:06:42','2017-06-27 01:06:42','347467be-8592-43e8-8171-1897fcffcea9'),
	(21,NULL,'Link','cardlink','superTableBlockType:4','Optional Card Link',0,'FruitLinkIt','{\"types\":[\"custom\",\"entry\",\"category\",\"asset\"],\"defaultText\":\"\",\"allowCustomText\":\"\",\"allowTarget\":\"\",\"entrySources\":[],\"entrySelectionLabel\":\"Select an entry\",\"assetSources\":\"*\",\"assetSelectionLabel\":\"Select an asset\",\"categorySources\":\"*\",\"categorySelectionLabel\":\"Select a category\"}','2017-06-27 01:06:42','2017-06-27 01:06:42','39b27fe9-e111-4018-8913-76c741caa9d8'),
	(22,3,'Card Options','setCard','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-06-27 01:06:42','2017-06-27 01:06:42','cc495f1e-69a4-407d-8995-cd362027bd04'),
	(23,NULL,'Style','style','superTableBlockType:5','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1}]}','2017-06-27 01:06:42','2017-06-27 01:06:42','a518b987-6d7a-44ff-b4a7-19b37251adeb'),
	(24,NULL,'Media Ratio','mediaRatio','superTableBlockType:5','Aspect ratio of the image',0,'PlainText','{\"placeholder\":\"16:9\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-06-27 01:06:42','2017-06-27 01:06:42','123efa69-b7d2-4dec-a18a-58ed3aa87baa'),
	(25,2,'Card Slider','objCardSlider','global','A slider module for cards',0,'SuperTable_Label','{\"value\":\"\"}','2017-06-27 01:06:42','2017-06-27 01:06:42','29d2223c-2c3d-42d9-8417-3a8936f038e8'),
	(26,3,'Card Slider Options','setCardSlider','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-06-27 01:06:42','2017-06-27 01:06:42','812d9f7f-3781-4f7a-bca5-2ea2579353a2'),
	(27,NULL,'Style','style','superTableBlockType:6','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1},{\"label\":\"Style 1\",\"value\":\"style1\",\"default\":\"\"}]}','2017-06-27 01:06:42','2017-06-27 01:06:42','cf3efb4d-3c63-4770-9eea-35ba2faab288'),
	(28,NULL,'Setup','setup','superTableBlockType:6','Optional. Wähle eines der bestehenden Setups aus oder definiere ein neues unter `Kategorien > Settings : Image Slider`',0,'Categories','{\"source\":\"group:2\",\"limit\":1,\"selectionLabel\":\"Setup ausw\\u00e4hlen\"}','2017-06-27 01:06:42','2017-06-27 01:06:42','78638db1-5c05-4f8a-a79d-f3c00e78a69d'),
	(29,4,'Category Select: Blog','categorySelectBlog','global','',0,'Categories','{\"source\":\"group:1\",\"limit\":1,\"selectionLabel\":\"\"}','2017-06-27 01:06:42','2017-06-27 01:06:42','8681f851-fed5-4a42-a610-b71821e8e60e'),
	(30,4,'Comment Switch','commentSwitch','global','To disable comments',0,'Lightswitch','{\"default\":\"\"}','2017-06-27 01:06:42','2017-06-27 01:06:42','12b7e29d-2bdc-434c-861f-871d6cf7445f'),
	(31,6,'Copyright','copyright','global','Copyright Message',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-06-27 01:06:42','2017-06-27 01:06:42','1ea38cf0-5126-4f45-8b6f-8044ee30c86c'),
	(32,6,'Disqus Name','disqusName','global','Name of your disqus account',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-06-27 01:06:42','2017-06-27 01:06:42','e0697369-b7fd-4e9f-8dcd-4f09e02104fc'),
	(33,2,'Embed Content','objEmbedContent','global','To include external content such as videos, code snippets, or maps',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":1,\"minRows\":null}','2017-06-27 01:06:42','2017-06-27 01:06:42','85932817-66ee-442d-b931-288c2096e799'),
	(34,NULL,'Embed URL','embedUrl','superTableBlockType:7','If it is a video of Youtube, Vimeo or Facebook, you can copy the URL into the field.',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-06-27 01:06:42','2017-06-27 01:06:42','ee2c9c6c-f07a-40cc-a583-99c3b4f7cbbf'),
	(35,NULL,'Embed Code','embed','superTableBlockType:7','Insert the corresponding IFrame code here. If the URL field is filled, the code is ignored.',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":1}','2017-06-27 01:06:42','2017-06-27 01:06:42','a3eef0b1-47a4-4195-b933-f4c3666200a4'),
	(36,NULL,'Caption','caption','superTableBlockType:7','Optional asset caption',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-06-27 01:06:42','2017-06-27 01:06:42','9629a87e-b5ca-41b7-8f2b-b5e30246361a'),
	(37,3,'Embed Content Options','setEmbedContent','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"},\"new4\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-06-27 01:06:42','2017-06-27 01:06:42','35a1c95f-7fe7-49b7-8368-8b1a9cf063c5'),
	(38,NULL,'Style','style','superTableBlockType:8','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":\"\"},{\"label\":\"Style 1\",\"value\":\"style1\",\"default\":\"\"}]}','2017-06-27 01:06:42','2017-06-27 01:06:42','949b3f59-022a-4fe0-99e9-b998cab09daf'),
	(39,NULL,'Responsive','responsive','superTableBlockType:8','Do you want to display the content responsive?',0,'Lightswitch','{\"default\":\"\"}','2017-06-27 01:06:42','2017-06-27 01:06:42','17a923e9-f6b3-4790-9ddc-b9cf2be7c56f'),
	(40,NULL,'Ratio','ratio','superTableBlockType:8','Ratio of the iFrame',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-06-27 01:06:42','2017-06-27 01:06:42','7bd11a1a-62aa-480e-839e-26abbf737de2'),
	(41,NULL,'Align','align','superTableBlockType:8','Alignment for content smaller than the page',0,'Dropdown','{\"options\":[{\"label\":\"Center\",\"value\":\"center\",\"default\":1},{\"label\":\"Left\",\"value\":\"left\",\"default\":\"\"},{\"label\":\"Right\",\"value\":\"right\",\"default\":\"\"}]}','2017-06-27 01:06:42','2017-06-27 01:06:42','93800c32-4715-4471-8943-90020688d701'),
	(42,4,'Featured Image','featuredImage','global','Image of the respective posts - is used for surveys, headers, SEO and OG tags',0,'Assets','{\"useSingleFolder\":\"\",\"sources\":\"*\",\"defaultUploadLocationSource\":\"1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":1,\"allowedKinds\":[\"image\"],\"limit\":1,\"viewMode\":\"large\",\"selectionLabel\":\"Featured Image hinzuf\\u00fcgen\"}','2017-06-27 01:06:42','2017-06-27 01:06:42','ac123c5a-963d-4796-8d8f-9bd3941d3ea9'),
	(43,4,'Featured Image Labeling','featuredImageLabeling','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-06-27 01:06:42','2017-06-27 01:06:42','03ef99f5-d3f0-4940-9411-fae2873b6876'),
	(44,NULL,'Headline','headline','superTableBlockType:9','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-06-27 01:06:42','2017-06-27 01:06:42','456ade82-dc41-417b-98f0-bfa9a6eaa89c'),
	(45,NULL,'Link','linkit','superTableBlockType:9','',0,'FruitLinkIt','{\"types\":[\"tel\",\"custom\",\"entry\",\"category\",\"asset\"],\"defaultText\":\"Link\",\"allowCustomText\":1,\"allowTarget\":1,\"entrySources\":[],\"entrySelectionLabel\":\"Select an entry\",\"assetSources\":\"*\",\"assetSelectionLabel\":\"Select an asset\",\"categorySources\":\"*\",\"categorySelectionLabel\":\"Select a category\"}','2017-06-27 01:06:42','2017-06-27 01:06:42','a2f68c5a-ab93-4c24-9959-cbc1cfb8f793'),
	(46,4,'Featured Image Options','featuredImageOptions','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-06-27 01:06:42','2017-06-27 01:06:42','b17feda3-2a9d-4550-aa76-4ce87d7e0991'),
	(47,NULL,'Fullbleed','fullbleed','superTableBlockType:10','Should the image be spread over the entire browser width?',0,'Lightswitch','{\"default\":\"\"}','2017-06-27 01:06:43','2017-06-27 01:06:43','bd6fab43-9a6a-4391-8b7e-1c3930420a82'),
	(48,NULL,'Ratio','ratio','superTableBlockType:10','Image Ratio',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-06-27 01:06:43','2017-06-27 01:06:43','62065877-e01b-4553-9914-ae3ed911d455'),
	(49,6,'Fokuspunkt','focalpoint','global','',0,'FocalPointField_FocalPoint','{\"defaultFocalPoint\":\"50% 50%\"}','2017-06-27 01:06:43','2017-06-27 01:06:43','f0af8025-0810-4137-b92e-b986c4f0d29d'),
	(50,2,'Gallery','objGallery','global','Gallery module with Lightbox Support and two layout types',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":null,\"selectionLabel\":\"Add a picture\",\"maxRows\":30,\"minRows\":null}','2017-06-27 01:06:43','2017-06-27 01:06:43','670549cd-26f2-41af-9c76-1bf6eb4a780c'),
	(51,NULL,'Image','photo','superTableBlockType:11','',0,'Assets','{\"useSingleFolder\":\"\",\"sources\":\"*\",\"defaultUploadLocationSource\":\"1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":1,\"allowedKinds\":[\"image\"],\"limit\":1,\"viewMode\":\"list\",\"selectionLabel\":\"\"}','2017-06-27 01:06:43','2017-06-27 01:06:43','d6966f67-1c7a-4e4e-857b-76d9777ee4a8'),
	(52,NULL,'Caption','caption','superTableBlockType:11','Optional caption is only visible in the lightbox.',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-06-27 01:06:43','2017-06-27 01:06:43','f344ea7c-6ae6-452f-b23d-758649661411'),
	(53,3,'Gallery Options','setGallery','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-06-27 01:06:43','2017-06-27 01:06:43','ff703ee4-1ebc-41ea-a1e4-54bdfdbde142'),
	(54,NULL,'Layout Typ','layoutType','superTableBlockType:12','Smart for a thumbnail layout in Tumbler Styles (Photogrid), Simple for simple thumbnail matching',0,'Dropdown','{\"options\":[{\"label\":\"Simple\",\"value\":\"simple\",\"default\":\"\"},{\"label\":\"Smart\",\"value\":\"smart\",\"default\":\"\"}]}','2017-06-27 01:06:43','2017-06-27 01:06:43','71a7a42c-4e3a-4889-bf8a-361eb8bda850'),
	(55,NULL,'Ratio','ratio','superTableBlockType:12','Image ratio of the thumbnails for the Simplen layout mode. Format \'1:1\'',0,'PlainText','{\"placeholder\":\"1:1\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-06-27 01:06:43','2017-06-27 01:06:43','6a4d9dd8-d2b0-468f-a71e-c1716d10dbf0'),
	(56,NULL,'Width','width','superTableBlockType:12','Thumbnail width for the Simple Layout. Regularly, the width of thumbnails depends on the number of images per row. If this is too big or too small, you can set the width yourself.',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-06-27 01:06:43','2017-06-27 01:06:43','662ed534-00c8-47a8-b2f2-0a1e0dbc106a'),
	(57,2,'Headline','objHeadline','global','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-06-27 01:06:43','2017-06-27 01:06:43','dc1db73b-8a47-4f23-8da2-054003b6b0c7'),
	(58,3,'Headline Option','setHeadline','global','Size of the headline, the regular headline has a semantic size of a H2. The override controller can be used to readjust the size independent of its semantics.',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":1,\"minRows\":null}','2017-06-27 01:06:43','2017-06-27 01:06:43','99f8e11c-024b-4c2f-9816-7b65c1a8aef6'),
	(59,NULL,'Style','style','superTableBlockType:13','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":\"\"},{\"label\":\"Style 1\",\"value\":\"style1\",\"default\":\"\"}]}','2017-06-27 01:06:43','2017-06-27 01:06:43','c95c1820-916f-4610-8a86-505edb626efe'),
	(60,NULL,'Semantic Size','semantic','superTableBlockType:13','',0,'Dropdown','{\"options\":[{\"label\":\"H1\",\"value\":\"h1\",\"default\":\"\"},{\"label\":\"H2\",\"value\":\"h2\",\"default\":1},{\"label\":\"H3\",\"value\":\"h3\",\"default\":\"\"},{\"label\":\"H4\",\"value\":\"h4\",\"default\":\"\"},{\"label\":\"H5\",\"value\":\"h5\",\"default\":\"\"},{\"label\":\"H6\",\"value\":\"h6\",\"default\":\"\"}]}','2017-06-27 01:06:43','2017-06-27 01:06:43','74608dcd-b849-40a7-b9ba-1d0353ff74d9'),
	(61,NULL,'Override','override','superTableBlockType:13','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1},{\"label\":\"H1\",\"value\":\"h1\",\"default\":\"\"},{\"label\":\"H2\",\"value\":\"h2\",\"default\":\"\"},{\"label\":\"H3\",\"value\":\"h3\",\"default\":\"\"},{\"label\":\"H4\",\"value\":\"h4\",\"default\":\"\"},{\"label\":\"H5\",\"value\":\"h5\",\"default\":\"\"},{\"label\":\"H6\",\"value\":\"h6\",\"default\":\"\"}]}','2017-06-27 01:06:43','2017-06-27 01:06:43','19df0cc8-ae1e-4f54-be58-eeac5cf3820f'),
	(62,4,'Hero','hero','global','Hero Image for Homepages',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-06-27 01:06:43','2017-06-27 01:06:43','24691d60-da65-403d-b0a2-7b16d208ee1e'),
	(63,NULL,'Image','photo','superTableBlockType:14','',0,'Assets','{\"useSingleFolder\":\"\",\"sources\":\"*\",\"defaultUploadLocationSource\":\"1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":1,\"allowedKinds\":[\"image\"],\"targetLocale\":\"\",\"limit\":1,\"viewMode\":\"large\",\"selectionLabel\":\"\"}','2017-06-27 01:06:43','2017-06-27 01:06:43','ba255fe3-fba1-4102-97c7-386545910986'),
	(64,NULL,'Headline','headline','superTableBlockType:14','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-06-27 01:06:43','2017-06-27 01:06:43','28943ced-63af-458d-8deb-677c3e8a1ef8'),
	(65,NULL,'Linkit','linkit','superTableBlockType:14','',0,'FruitLinkIt','{\"types\":[\"custom\",\"entry\",\"category\"],\"defaultText\":\"Link\",\"allowCustomText\":1,\"allowTarget\":1,\"entrySources\":[],\"entrySelectionLabel\":\"Select an entry\",\"assetSources\":\"*\",\"assetSelectionLabel\":\"Select an asset\",\"categorySources\":\"*\",\"categorySelectionLabel\":\"Select a category\"}','2017-06-27 01:06:43','2017-06-27 01:06:43','7e7be372-c923-4a27-8ad2-a23e3d23a5de'),
	(66,2,'Horizontal Ruler','objHorizontalRuler','global','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1},{\"label\":\"Style 1\",\"value\":\"style1\",\"default\":\"\"}]}','2017-06-27 01:06:43','2017-06-27 01:06:43','90a94d49-850e-4836-99fe-151c6ff6f759'),
	(67,2,'Image Slider','objImageSlider','global','Slider Modul',0,'Assets','{\"useSingleFolder\":\"\",\"sources\":\"*\",\"defaultUploadLocationSource\":\"1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":1,\"allowedKinds\":[\"image\"],\"limit\":10,\"viewMode\":\"large\",\"selectionLabel\":\"\"}','2017-06-27 01:06:43','2017-06-27 01:06:43','2b58e595-9b8a-4c4d-82dc-8d2c90db8725'),
	(68,3,'Image Slider Options','setImageSlider','global','The ratio applies to all images, Craft will crops the pictures so they fit into the format (Default is 16:10). The Caption is optional and applies to the entire slider.',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-06-27 01:06:43','2017-06-27 01:06:43','7e978997-74b7-46f2-8892-fa92279296ea'),
	(69,NULL,'Style','style','superTableBlockType:15','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":\"\"},{\"label\":\"Style 1\",\"value\":\"style1\",\"default\":\"\"}]}','2017-06-27 01:06:43','2017-06-27 01:06:43','68330fc6-245c-418c-8732-06902d91171f'),
	(70,NULL,'Ratio','ratio','superTableBlockType:15','Image ratio for all slides',0,'PlainText','{\"placeholder\":\"16:10\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-06-27 01:06:43','2017-06-27 01:06:43','55abbe8c-0ff3-4d6d-b07d-0efdfbb8b084'),
	(71,NULL,'Setup','setup','superTableBlockType:15','Optional. Select one of the existing setups or define a new one under `Categories> Settings: Image Slider`',0,'Categories','{\"source\":\"group:2\",\"limit\":1,\"selectionLabel\":\"Setup ausw\\u00e4hlen\"}','2017-06-27 01:06:43','2017-06-27 01:06:43','472158d1-3d7f-4af2-b43c-cf97d4da97d2'),
	(72,2,'Jumpnavigation','objJumpNavigation','global','Buttons for jump navigations',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":null,\"selectionLabel\":\"Add a link\",\"maxRows\":null,\"minRows\":null}','2017-06-27 01:06:43','2017-06-27 01:06:43','68b09d42-7235-4ac5-b28f-bbf1b1dd8e5a'),
	(73,NULL,'Linkname','linkname','superTableBlockType:16','Name of the link',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-06-27 01:06:44','2017-06-27 01:06:44','0ffdff8d-8893-42e2-8ad1-1a6f9c47d54f'),
	(74,NULL,'Anchor','anchor','superTableBlockType:16','Name of the anchor without # (and no other no special character)',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-06-27 01:06:44','2017-06-27 01:06:44','cb95cad4-7d2d-4375-8fb6-384c8cdbcc99'),
	(75,3,'Jumpnavigation Options','setJumpNavigation','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-06-27 01:06:44','2017-06-27 01:06:44','91c35b91-33e3-4014-919b-d30f505669af'),
	(76,NULL,'Style','style','superTableBlockType:17','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1},{\"label\":\"Style 1\",\"value\":\"style1\",\"default\":\"\"}]}','2017-06-27 01:06:44','2017-06-27 01:06:44','d06ea0c9-fca1-4f97-a870-b453e5d0002f'),
	(77,NULL,'Layout','layout','superTableBlockType:17','The default layout is a simple left-aligned string of the links, with the full width, the buttons are arranged in the full width (break at too small size but around which the buttons are interrelated). The buttons are arranged like a list.',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1},{\"label\":\"Full Width\",\"value\":\"fullwidth\",\"default\":\"\"},{\"label\":\"List\",\"value\":\"list\",\"default\":\"\"}]}','2017-06-27 01:06:44','2017-06-27 01:06:44','9661203a-ea60-4ee7-a5f1-16de5fe5879d'),
	(78,2,'List','objList','global','',0,'Table','{\"columns\":{\"col1\":{\"heading\":\"Eintrag\",\"handle\":\"entry\",\"width\":\"\",\"type\":\"singleline\"}},\"defaults\":[]}','2017-06-27 01:06:44','2017-06-27 01:06:44','7c69ca64-92b6-4645-92ec-673d61eb9321'),
	(79,3,'List Options','setList','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-06-27 01:06:44','2017-06-27 01:06:44','6cf1f38e-a9f7-40ba-b94b-cc721c0987ad'),
	(80,NULL,'Typ','listtype','superTableBlockType:18','Listtype',0,'Dropdown','{\"options\":[{\"label\":\"Unsorted UL\",\"value\":\"ul\",\"default\":1},{\"label\":\"Sorted OL\",\"value\":\"ol\",\"default\":\"\"}]}','2017-06-27 01:06:44','2017-06-27 01:06:44','a9d3a34e-ff59-406d-b12e-47fac18b0ffb'),
	(81,NULL,'Bullet','bullet','superTableBlockType:18','Style of Bullets on unsorted lists',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1},{\"label\":\"Circle\",\"value\":\"circle\",\"default\":\"\"},{\"label\":\"Square\",\"value\":\"square\",\"default\":\"\"},{\"label\":\"Custom\",\"value\":\"custom\",\"default\":\"\"}]}','2017-06-27 01:06:44','2017-06-27 01:06:44','cb403bac-8e93-4983-b4a8-8b90eccd0694'),
	(82,2,'Markdown','objMarkdown','global','For contents in the Markdown format (http://markdown.de/)',0,'Doxter','{\"enableSoftTabs\":1,\"tabSize\":2,\"rows\":4,\"toolbarPlacement\":\"bottom\"}','2017-06-27 01:06:44','2017-06-27 01:06:44','359a9bec-5e72-4ad0-af84-86b566e7b549'),
	(83,3,'Markdown Options','setMarkdown','global','Markdown Optionen',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-06-27 01:06:44','2017-06-27 01:06:44','076d6afc-70c7-486f-9526-2c1db026025a'),
	(84,NULL,'Style','style','superTableBlockType:19','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":\"\"},{\"label\":\"Style1\",\"value\":\"style1\",\"default\":\"\"}]}','2017-06-27 01:06:44','2017-06-27 01:06:44','1557c453-73d3-4fe0-acaf-46be49651e63'),
	(85,NULL,'Add Anchor','addAnchor','superTableBlockType:19','Should the headings h1 - h3 be equipped with an anchor?',0,'Lightswitch','{\"default\":\"\"}','2017-06-27 01:06:44','2017-06-27 01:06:44','065773f7-2cf5-42dc-b9f6-709475f4a48c'),
	(86,2,'Media Image','objMediaImage','global','This image takes the full content width and can be provided with a caption.',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-06-27 01:06:44','2017-06-27 01:06:44','daca1f5e-a187-4243-8b9b-7d00b0f96026'),
	(87,NULL,'Image','photo','superTableBlockType:20','',0,'Assets','{\"useSingleFolder\":\"\",\"sources\":\"*\",\"defaultUploadLocationSource\":\"1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":1,\"allowedKinds\":[\"image\"],\"limit\":1,\"viewMode\":\"large\",\"selectionLabel\":\"\"}','2017-06-27 01:06:44','2017-06-27 01:06:44','88eb68f6-2957-4af6-aad4-d67d3aeeb017'),
	(88,NULL,'Caption','caption','superTableBlockType:20','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-06-27 01:06:44','2017-06-27 01:06:44','4cff7ff6-d388-42f7-a9be-69a33dbc00a2'),
	(89,3,'Media Image Options','setMediaImage','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-06-27 01:06:44','2017-06-27 01:06:44','dc75d0e6-7215-4732-83ed-476dd5c7149f'),
	(90,NULL,'Style','style','superTableBlockType:21','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":\"\"},{\"label\":\"Style 1\",\"value\":\"style1\",\"default\":\"\"}]}','2017-06-27 01:06:44','2017-06-27 01:06:44','a6338e6e-59b4-4aa4-a245-94c4474b5816'),
	(91,NULL,'Ratio','ratio','superTableBlockType:21','Size ratio of the image',0,'PlainText','{\"placeholder\":\"16:9\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-06-27 01:06:44','2017-06-27 01:06:44','aa58f0a6-ffbd-4c11-8ffb-7d82dab5e409'),
	(92,NULL,'Hight Restriction','heightrestriction','superTableBlockType:21','If it is a picture in the portrait format, it can be that it is longer than the viewport is high. The height limit limits the height to maximum viewport height - you no longer have to scroll around the entire image.',0,'Lightswitch','{\"default\":\"\"}','2017-06-27 01:06:44','2017-06-27 01:06:44','fbd8a462-3a1b-4690-b9c3-edf5d7887741'),
	(93,2,'Quote','objQuote','global','For quote blocks with Author',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":1,\"minRows\":null}','2017-06-27 01:06:44','2017-06-27 01:06:44','300f77af-3e18-4f08-be73-11cfc8c26e39'),
	(94,NULL,'Quote','copy','superTableBlockType:22','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":1,\"initialRows\":2}','2017-06-27 01:06:44','2017-06-27 01:06:44','90ee36f6-5bbf-4fc8-92bd-bc7a7fe9705f'),
	(95,NULL,'Source','source','superTableBlockType:22','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-06-27 01:06:44','2017-06-27 01:06:44','68d7c5a7-1a72-4fb9-850f-1b76e040aa65'),
	(96,3,'Quote Options','setQuote','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-06-27 01:06:44','2017-06-27 01:06:44','dad67892-3732-42b2-9e80-76bc93d67301'),
	(97,NULL,'Style','style','superTableBlockType:23','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":\"\"},{\"label\":\"Style 1\",\"value\":\"style1\",\"default\":\"\"}]}','2017-06-27 01:06:45','2017-06-27 01:06:45','6ea94d3c-926a-4448-b85f-6e162cc08329'),
	(98,2,'Richtext','objRichtext','global','',0,'RichText','{\"configFile\":\"Standard.json\",\"availableAssetSources\":\"*\",\"availableTransforms\":\"*\",\"cleanupHtml\":1,\"purifyHtml\":1,\"columnType\":\"text\"}','2017-06-27 01:06:45','2017-06-27 01:06:45','09291e6c-d6e2-408b-8332-a931e5647832'),
	(99,3,'Richtext Options','setRichtext','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-06-27 01:06:45','2017-06-27 01:06:45','6ce90a4f-5f81-406d-aa7a-9dcced57b0c9'),
	(100,NULL,'Style','style','superTableBlockType:24','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1},{\"label\":\"Lead\",\"value\":\"lead\",\"default\":\"\"},{\"label\":\"Center\",\"value\":\"center\",\"default\":\"\"}]}','2017-06-27 01:06:45','2017-06-27 01:06:45','8abf4660-e7db-4ac4-b401-779c660da55e'),
	(101,3,'Section Background','setSectionBackground','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"},\"new4\":{\"width\":\"\"},\"new5\":{\"width\":\"\"},\"new6\":{\"width\":\"\"},\"new7\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-06-27 01:06:45','2017-06-27 01:06:45','b435a274-4f12-482d-8d8e-4ea85f7809b9'),
	(102,NULL,'Image ','backgroundImage','superTableBlockType:25','',0,'Assets','{\"useSingleFolder\":\"\",\"sources\":\"*\",\"defaultUploadLocationSource\":\"1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":1,\"allowedKinds\":[\"image\"],\"limit\":1,\"viewMode\":\"large\",\"selectionLabel\":\"\"}','2017-06-27 01:06:45','2017-06-27 01:06:45','bcac7b3f-0579-4e86-b22b-88a2eaf05b7b'),
	(103,NULL,'Adapt Container','adaptContainer','superTableBlockType:25','Do you want the background container to be as broad as the content container?\r\n',0,'Lightswitch','{\"default\":\"\"}','2017-06-27 01:06:45','2017-06-27 01:06:45','1fe7051b-ea34-4e8f-acd8-1d76bd16c00c'),
	(104,NULL,'Width','width','superTableBlockType:25','Width of the background image - default always full width',0,'Dropdown','{\"options\":[{\"label\":\"Full\",\"value\":\"default\",\"default\":\"\"},{\"label\":\"Half\",\"value\":\"half\",\"default\":\"\"}]}','2017-06-27 01:06:45','2017-06-27 01:06:45','a2767d16-9443-4098-ba66-3ccc1af3233b'),
	(105,NULL,'Align','align','superTableBlockType:25','Orientation of the background - not applicable for full area',0,'Dropdown','{\"options\":[{\"label\":\"Left\",\"value\":\"default\",\"default\":1},{\"label\":\"Right\",\"value\":\"right\",\"default\":\"\"}]}','2017-06-27 01:06:45','2017-06-27 01:06:45','1cc03a05-6e86-4b80-be7e-ca0c1dee55b6'),
	(106,NULL,'Behavior','behavior','superTableBlockType:25','Additional layout rules',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":\"\"},{\"label\":\"Behavior 1\",\"value\":\"behavior1\",\"default\":\"\"}]}','2017-06-27 01:06:45','2017-06-27 01:06:45','1147f353-2f47-4fc3-ad2c-d06cc6da5b88'),
	(107,NULL,'Position','position','superTableBlockType:25','Background Position of the image (css syntax)\r\n',0,'PlainText','{\"placeholder\":\"center center\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-06-27 01:06:45','2017-06-27 01:06:45','8dd63a98-a39d-4662-8b2d-48d5fd9f630d'),
	(108,NULL,'Ratio','ratio','superTableBlockType:25','Ratio of the background image',0,'PlainText','{\"placeholder\":\"16:9\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-06-27 01:06:45','2017-06-27 01:06:45','35c75912-77f7-4e79-9f69-dbbf116e8436'),
	(109,2,'Section Column','objSectionColumn','global','Column in a section',0,'SuperTable_Label','{\"value\":\"\"}','2017-06-27 01:06:45','2017-06-27 01:06:45','86bf0617-8913-46d4-a894-fc976303a2f1'),
	(110,3,'Section Column Options','setSectionColumn','global','Spalte in einer Sektion',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-06-27 01:06:45','2017-06-27 01:06:45','0c4a040a-d323-43d6-bb7e-ef7bc37f850d'),
	(111,NULL,'Style','style','superTableBlockType:26','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":\"\"},{\"label\":\"Style 1\",\"value\":\"style1\",\"default\":\"\"}]}','2017-06-27 01:06:45','2017-06-27 01:06:45','f92eba14-51de-44c5-a7b3-818e53ab09be'),
	(112,NULL,'Align','align','superTableBlockType:26','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1},{\"label\":\"Left\",\"value\":\"left\",\"default\":\"\"},{\"label\":\"Center\",\"value\":\"center\",\"default\":\"\"},{\"label\":\"Right\",\"value\":\"right\",\"default\":\"\"}]}','2017-06-27 01:06:45','2017-06-27 01:06:45','13e04a7a-afac-4bb8-9fed-716ee2e75371'),
	(113,NULL,'Vertical Align','verticalAlign','superTableBlockType:26','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1},{\"label\":\"Top\",\"value\":\"top\",\"default\":\"\"},{\"label\":\"Middle\",\"value\":\"middle\",\"default\":\"\"},{\"label\":\"Bottom\",\"value\":\"bottom\",\"default\":\"\"}]}','2017-06-27 01:06:45','2017-06-27 01:06:45','41489d91-9044-4714-aa3a-2edfa18bb8dd'),
	(114,3,'Section Layout','setSectionLayout','global','Weighting of individual columns.',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-06-27 01:06:45','2017-06-27 01:06:45','f5396006-1721-49b9-85fe-c7f9270038ab'),
	(115,NULL,'Two columns','twoColumns','superTableBlockType:27','Width ratio for two columns',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"1-1\",\"default\":\"\"},{\"label\":\"2-1\",\"value\":\"2-1\",\"default\":\"\"},{\"label\":\"1-2\",\"value\":\"1-2\",\"default\":\"\"},{\"label\":\"3-1\",\"value\":\"3-1\",\"default\":\"\"},{\"label\":\"1-3\",\"value\":\"1-3\",\"default\":\"\"}]}','2017-06-27 01:06:45','2017-06-27 01:06:45','0953f249-146d-4a6a-aa12-bc2de8515f7f'),
	(116,NULL,'Three Columns','threeColumns','superTableBlockType:27','Width ratio for three columns',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"1-1-1\",\"default\":\"\"},{\"label\":\"2-6-2\",\"value\":\"2-6-2\",\"default\":\"\"},{\"label\":\"3-5-2\",\"value\":\"3-5-2\",\"default\":\"\"},{\"label\":\"2-5-3\",\"value\":\"2-5-3\",\"default\":\"\"}]}','2017-06-27 01:06:45','2017-06-27 01:06:45','1133984f-9760-4523-9bb6-22f62da876ca'),
	(117,NULL,'Four Columns','fourColumns','superTableBlockType:27','Width ratio for four columns',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"1-1-1-1\",\"default\":\"\"},{\"label\":\"2-3-3-2\",\"value\":\"2-3-3-2\",\"default\":\"\"},{\"label\":\"2-3-4-1\",\"value\":\"2-3-4-1\",\"default\":\"\"}]}','2017-06-27 01:06:45','2017-06-27 01:06:45','08f6eb97-7268-4f72-ab1b-ad26dab78dc5'),
	(118,3,'Section Options','setSection','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"},\"new4\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-06-27 01:06:45','2017-06-27 01:06:45','e9ed7d50-1baf-4110-bf22-c8d0a30d8e13'),
	(119,NULL,'Style','style','superTableBlockType:28','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1},{\"label\":\"Style 1\",\"value\":\"style1\",\"default\":\"\"}]}','2017-06-27 01:06:45','2017-06-27 01:06:45','1c831955-15e9-4195-8a22-bd8376f920ac'),
	(120,NULL,'Full height','fullheight','superTableBlockType:28','Should the section be extended to the full viewport height?',0,'Lightswitch','{\"default\":\"\"}','2017-06-27 01:06:45','2017-06-27 01:06:45','851cacb7-1ac8-4ea6-bb5c-7deb6b7e46cb'),
	(121,NULL,'Inner Container','innerContainer','superTableBlockType:28','Layout of the inner container',0,'Dropdown','{\"options\":[{\"label\":\"Default Page Width\",\"value\":\"default\",\"default\":1},{\"label\":\"Full Viewport\",\"value\":\"full\",\"default\":\"\"},{\"label\":\"Bigger 25%\",\"value\":\"bigger-25\",\"default\":\"\"},{\"label\":\"Bigger 45%\",\"value\":\"bigger-45\",\"default\":\"\"},{\"label\":\"Smaller 25%\",\"value\":\"smaller-25\",\"default\":\"\"},{\"label\":\"Smaller 50%\",\"value\":\"smaller-50\",\"default\":\"\"}]}','2017-06-27 01:06:45','2017-06-27 01:06:45','86bf0a34-91cf-4edc-800e-f651046287f3'),
	(122,NULL,'Anchor','anchor','superTableBlockType:28','Optional anchor for jump navigation without # (and without special characters)',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-06-27 01:06:45','2017-06-27 01:06:45','8b66bc27-4d5a-44b6-b372-7050c67cefa3'),
	(123,2,'Section Wrapper','objSection','global','Subsegment of a content module, when the page wrapper is removed the section can run over the full browser width.',0,'SuperTable_Label','{\"value\":\"\"}','2017-06-27 01:06:46','2017-06-27 01:06:46','a528da42-3b7b-4fb1-8396-edda3e145190'),
	(124,4,'SEO','seo','global','',0,'Seomatic_Meta','{\"assetSources\":\"*\",\"seoMainEntityCategory\":\"CreativeWork\",\"seoMainEntityOfPage\":\"Article\",\"seoTitleSource\":\"field\",\"seoTitleSourceField\":\"title\",\"seoTitle\":\"\",\"seoTitleSourceChangeable\":1,\"seoDescriptionSource\":\"field\",\"seoDescriptionSourceField\":\"body\",\"seoDescription\":\"\",\"seoDescriptionSourceChangeable\":1,\"seoKeywordsSource\":\"custom\",\"seoKeywordsSourceField\":\"title\",\"seoKeywords\":\"\",\"seoKeywordsSourceChangeable\":1,\"seoImageIdSource\":\"field\",\"seoImageIdSourceField\":\"featuredImage\",\"seoImageIdSourceChangeable\":1,\"seoImageTransform\":\"\",\"twitterCardType\":\"summary_large_image\",\"twitterCardTypeChangeable\":1,\"seoTwitterImageIdSource\":\"field\",\"seoTwitterImageIdSourceField\":\"featuredImage\",\"seoTwitterImageIdSourceChangeable\":1,\"seoTwitterImageTransform\":\"\",\"openGraphType\":\"article\",\"openGraphTypeChangeable\":1,\"seoFacebookImageIdSource\":\"field\",\"seoFacebookImageIdSourceField\":\"featuredImage\",\"seoFacebookImageIdSourceChangeable\":1,\"seoFacebookImageTransform\":\"\",\"robots\":\"all\",\"robotsChangeable\":1}','2017-06-27 01:06:46','2017-06-27 01:06:46','43d641e8-c80a-4b5c-b4b8-5e4e0610efb7'),
	(125,2,'Slideout Box','objSlideOutBox','global','A content box that expands by click - intended to hide the user rather irrelevant content.',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-06-27 01:06:46','2017-06-27 01:06:46','559baf2f-c824-46b2-b098-d4156eebcbba'),
	(126,NULL,'Trigger','trigger','superTableBlockType:29','Activation link to open the box',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-06-27 01:06:46','2017-06-27 01:06:46','188625c3-3e60-43d7-a405-9f2619905d24'),
	(127,NULL,'Body','body','superTableBlockType:29','',0,'RichText','{\"configFile\":\"\",\"availableAssetSources\":\"*\",\"availableTransforms\":\"*\",\"cleanupHtml\":\"\",\"purifyHtml\":1,\"purifierConfig\":\"\",\"columnType\":\"text\"}','2017-06-27 01:06:46','2017-06-27 01:06:46','f57cbe41-439e-454a-81c5-5a2c011b092e'),
	(128,3,'Slideout Box Options','setSlideOutBox','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-06-27 01:06:46','2017-06-27 01:06:46','cd00fc15-c088-43c6-b106-62147ba30bf9'),
	(129,NULL,'Style','style','superTableBlockType:30','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":\"\"},{\"label\":\"Style 1\",\"value\":\"style1\",\"default\":\"\"}]}','2017-06-27 01:06:46','2017-06-27 01:06:46','12af8132-bbfa-413b-bbbf-928628db14d6'),
	(130,3,'Slider Setup','setSliderSetup','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"},\"new4\":{\"width\":\"\"},\"new5\":{\"width\":\"\"},\"new6\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-06-27 01:06:46','2017-06-27 01:06:46','ed1cda86-1542-43cd-aed9-cf52f636edb1'),
	(131,NULL,'Autoplay','autoplay','superTableBlockType:31','Speed of Autoplay mode',0,'Dropdown','{\"options\":[{\"label\":\"Deaktiviert\",\"value\":\"default\",\"default\":1},{\"label\":\"Slow\",\"value\":\"slow\",\"default\":\"\"},{\"label\":\"Medium\",\"value\":\"medium\",\"default\":\"\"},{\"label\":\"Fast\",\"value\":\"fast\",\"default\":\"\"}]}','2017-06-27 01:06:46','2017-06-27 01:06:46','5fd80d17-0f70-49b3-bcc8-ab436e165901'),
	(132,NULL,'Animation Speed','speed','superTableBlockType:31','Setting the animation speed',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":\"\"},{\"label\":\"Slow\",\"value\":\"slow\",\"default\":\"\"},{\"label\":\"Medium\",\"value\":\"medium\",\"default\":\"\"},{\"label\":\"Fast\",\"value\":\"fast\",\"default\":\"\"}]}','2017-06-27 01:06:46','2017-06-27 01:06:46','3ab2d0eb-775d-44c8-ad49-9152dbabce60'),
	(133,NULL,'Loop','loop','superTableBlockType:31','Should the slider run endlessly?',0,'Lightswitch','{\"default\":\"\"}','2017-06-27 01:06:46','2017-06-27 01:06:46','d91625a3-b2b4-4098-86c2-d31efcaa34e1'),
	(134,NULL,'Hide Navigation','navigation','superTableBlockType:31','Should a navigation be hidden?',0,'Lightswitch','{\"default\":\"\"}','2017-06-27 01:06:46','2017-06-27 01:06:46','aace38ba-cffb-4bbe-8537-0646c4fe04fc'),
	(135,NULL,'Hide Pagination','pagination','superTableBlockType:31','Should a pagination be hidden?',0,'Lightswitch','{\"default\":\"\"}','2017-06-27 01:06:46','2017-06-27 01:06:46','f961c1b2-2243-412b-bf1b-52e6ecf219b3'),
	(136,NULL,'Autoheight','autoHeight','superTableBlockType:31','With Autoheight, the height of each Slides is Dynamic',0,'Lightswitch','{\"default\":\"\"}','2017-06-27 01:06:46','2017-06-27 01:06:46','c63e777b-d3ff-4728-98ea-305bfd83c517'),
	(137,3,'Slider Setup General','setSliderSetupGeneral','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"},\"new4\":{\"width\":\"\"},\"new5\":{\"width\":\"\"},\"new6\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-06-27 01:06:46','2017-06-27 01:06:46','31e6e27f-e89b-4ab4-b67c-5798065714c7'),
	(138,NULL,'Slide Position','position','superTableBlockType:32','Position of the slides',0,'Dropdown','{\"options\":[{\"label\":\"Center\",\"value\":\"center\",\"default\":1},{\"label\":\"Left\",\"value\":\"left\",\"default\":\"\"},{\"label\":\"Right\",\"value\":\"right\",\"default\":\"\"}]}','2017-06-27 01:06:46','2017-06-27 01:06:46','3be24fba-2a63-4943-8f43-1186e38934d7'),
	(139,NULL,'Slides per View','slidesPerView','superTableBlockType:32','Number of visible slides',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1},{\"label\":\"Auto\",\"value\":\"auto\",\"default\":\"\"},{\"label\":2,\"value\":\"two\",\"default\":\"\"},{\"label\":3,\"value\":\"three\",\"default\":\"\"},{\"label\":4,\"value\":\"four\",\"default\":\"\"},{\"label\":5,\"value\":\"five\",\"default\":\"\"}]}','2017-06-27 01:06:46','2017-06-27 01:06:46','d80e5a30-b111-4b80-9940-1797a3d4f865'),
	(140,NULL,'Space Between','spaceBetween','superTableBlockType:32','Distances between the slides',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-06-27 01:06:46','2017-06-27 01:06:46','9418d0fc-3606-4078-b4e5-4b659fff2004'),
	(141,NULL,'Group Cell','groupCell','superTableBlockType:32','Slides can be grouped.',0,'Dropdown','{\"options\":[{\"label\":\"Nicht gruppiert\",\"value\":\"default\",\"default\":1},{\"label\":2,\"value\":\"\\\"2\\\"\",\"default\":\"\"},{\"label\":3,\"value\":\"\\\"3\\\"\",\"default\":\"\"},{\"label\":4,\"value\":\"\\\"4\\\"\",\"default\":\"\"},{\"label\":5,\"value\":\"\\\"5\\\"\",\"default\":\"\"},{\"label\":6,\"value\":\"\\\"6\\\"\",\"default\":\"\"}]}','2017-06-27 01:06:46','2017-06-27 01:06:46','39b2f824-9246-4fe3-bf33-4ec87fba126e'),
	(142,NULL,'Freescroll','freescroll','superTableBlockType:32','With Freescroll, the slider can be moved freely',0,'Lightswitch','{\"default\":\"\"}','2017-06-27 01:06:46','2017-06-27 01:06:46','68e1d855-7bfa-4c07-8104-d353beea7fc7'),
	(143,NULL,'Responsive','responsive','superTableBlockType:32','If multiple slides are displayed at the same time, you can reduce the number of columns by using Responsive with smaller viewport.',0,'Lightswitch','{\"default\":\"\"}','2017-06-27 01:06:46','2017-06-27 01:06:46','399edcdb-2c86-495e-9d36-d946bc99634d'),
	(144,6,'Social Networks','socialNetworks','global','Links to the social networks',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":null,\"selectionLabel\":\"Add Network\",\"maxRows\":null,\"minRows\":null}','2017-06-27 01:06:46','2017-06-27 01:06:46','48c48bd7-3bb1-42bf-b19f-2036c96c893d'),
	(145,NULL,'Icon','icon','superTableBlockType:33','Networktype',0,'Dropdown','{\"options\":[{\"label\":\"Facebook\",\"value\":\"facebook\",\"default\":\"\"},{\"label\":\"Twitter\",\"value\":\"twitter\",\"default\":\"\"},{\"label\":\"Googleplus\",\"value\":\"googleplus\",\"default\":\"\"},{\"label\":\"Pinterest\",\"value\":\"pinterest\",\"default\":\"\"},{\"label\":\"Instagram\",\"value\":\"instagram\",\"default\":\"\"},{\"label\":\"Vimeo\",\"value\":\"vimeo\",\"default\":\"\"},{\"label\":\"Youtube\",\"value\":\"youtube\",\"default\":\"\"}]}','2017-06-27 01:06:46','2017-06-27 01:06:46','0a313051-55df-4a0c-b09e-d08aef057bff'),
	(146,NULL,'Link','linkit','superTableBlockType:33','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-06-27 01:06:46','2017-06-27 01:06:46','94ac6956-814f-433d-9dbc-401a1f12ed4a'),
	(147,NULL,'Caption','caption','superTableBlockType:33','Caption of the popover',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-06-27 01:06:46','2017-06-27 01:06:46','979b207b-3c9f-46ea-b8d1-de339763b068'),
	(148,2,'Spacer','objSpacer','global','Element to expand the distance. A spacer is 20px',0,'Dropdown','{\"options\":[{\"label\":\"0.25 Spacer\",\"value\":\"--025\",\"default\":\"\"},{\"label\":\"0.50 Spacer\",\"value\":\"--050\",\"default\":1},{\"label\":\"0.75 Spacer\",\"value\":\"--075\",\"default\":\"\"},{\"label\":\"1 Spacer\",\"value\":\"--1\",\"default\":\"\"},{\"label\":\"2 Spacer\",\"value\":\"--2\",\"default\":\"\"},{\"label\":\"3 Spacer\",\"value\":\"--3\",\"default\":\"\"},{\"label\":\"4 Spacer\",\"value\":\"--4\",\"default\":\"\"},{\"label\":\"5 Spacer\",\"value\":\"--5\",\"default\":\"\"},{\"label\":\"6 Spacer\",\"value\":\"--6\",\"default\":\"\"},{\"label\":\"7 Spacer\",\"value\":\"--7\",\"default\":\"\"},{\"label\":\"8 Spacer\",\"value\":\"--8\",\"default\":\"\"},{\"label\":\"9 Spacer\",\"value\":\"--9\",\"default\":\"\"},{\"label\":\"10 Spacer\",\"value\":\"--10\",\"default\":\"\"}]}','2017-06-27 01:06:46','2017-06-27 01:06:46','2caf5919-6ba5-4944-9984-9b460b9a6db2'),
	(149,2,'Tab','objTab','global','The individual tab, please enter the title of the tab',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-06-27 01:06:47','2017-06-27 01:06:47','c4eb0f1c-9ac5-4b07-b20c-1bbba0167a1e'),
	(150,2,'Tab Wrapper','objTabWrapper','global','Wrapper of the Tab group',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-06-27 01:06:47','2017-06-27 01:06:47','b917150e-0fae-4390-a1ef-e51a57ff4ccb'),
	(151,NULL,'Style','style','superTableBlockType:34','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1},{\"label\":\"Style 1\",\"value\":\"style1\",\"default\":\"\"}]}','2017-06-27 01:06:47','2017-06-27 01:06:47','a94129fd-acc4-412a-8048-f2c1c617a5c4'),
	(152,5,'Content Builder','contentBuilder','global','',0,'Neo','{\"maxBlocks\":null}','2017-06-27 01:06:47','2017-06-27 01:06:47','c2ec1cdf-b4b2-4ef7-bfe4-0555478cdc5b');

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
	(5,'Footer','footer',75,'2017-06-27 01:06:47','2017-06-27 01:06:47','e420f0a8-b40c-49af-b8bb-7b4ea87dee9d'),
	(6,'Main','main',76,'2017-06-27 01:06:47','2017-06-27 01:06:47','96d7c4c6-aefe-4f37-84c7-19d7083d467f');

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
	(1,'2.6.2984','2.6.10',0,'Ktest3','http://ktest3.local','UTC',1,0,'2017-06-27 01:02:14','2017-06-27 01:02:14','4754dd86-68a6-40ac-baa2-9fcfac384d62');

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
	('de',1,'2017-06-27 01:02:15','2017-06-27 01:02:15','eced679d-9857-4510-aa11-6d993e08315f');

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
	(1,NULL,'m000000_000000_base','2017-06-27 01:02:15','2017-06-27 01:02:15','2017-06-27 01:02:15','e75d75d0-8947-4e99-8e63-9f9ce55f1000'),
	(2,NULL,'m140730_000001_add_filename_and_format_to_transformindex','2017-06-27 01:02:15','2017-06-27 01:02:15','2017-06-27 01:02:15','5f77044a-c831-4b2c-8a73-9c0b6c7b64cf'),
	(3,NULL,'m140815_000001_add_format_to_transforms','2017-06-27 01:02:15','2017-06-27 01:02:15','2017-06-27 01:02:15','291b85f2-163e-4abb-bf67-f2fb59d3f09c'),
	(4,NULL,'m140822_000001_allow_more_than_128_items_per_field','2017-06-27 01:02:15','2017-06-27 01:02:15','2017-06-27 01:02:15','ec60289a-f06b-4224-ae8b-a911b6a732b8'),
	(5,NULL,'m140829_000001_single_title_formats','2017-06-27 01:02:15','2017-06-27 01:02:15','2017-06-27 01:02:15','f97b3b50-5986-43ae-8cfe-a5e6b5dfd866'),
	(6,NULL,'m140831_000001_extended_cache_keys','2017-06-27 01:02:15','2017-06-27 01:02:15','2017-06-27 01:02:15','fd0dea53-3089-45d6-89b3-aee84e75996d'),
	(7,NULL,'m140922_000001_delete_orphaned_matrix_blocks','2017-06-27 01:02:15','2017-06-27 01:02:15','2017-06-27 01:02:15','5f6a8f7d-ff26-411e-b073-2986fe2420ff'),
	(8,NULL,'m141008_000001_elements_index_tune','2017-06-27 01:02:15','2017-06-27 01:02:15','2017-06-27 01:02:15','cd743b2f-492a-4838-af7b-6493b56b6dda'),
	(9,NULL,'m141009_000001_assets_source_handle','2017-06-27 01:02:15','2017-06-27 01:02:15','2017-06-27 01:02:15','e3a63c5e-f7de-439c-a285-3b120d405ee9'),
	(10,NULL,'m141024_000001_field_layout_tabs','2017-06-27 01:02:15','2017-06-27 01:02:15','2017-06-27 01:02:15','2729300e-6bd3-4d0d-b97a-262478e8768e'),
	(11,NULL,'m141030_000000_plugin_schema_versions','2017-06-27 01:02:15','2017-06-27 01:02:15','2017-06-27 01:02:15','04f64877-d62f-492c-bbfb-f7d7ed71f6a1'),
	(12,NULL,'m141030_000001_drop_structure_move_permission','2017-06-27 01:02:15','2017-06-27 01:02:15','2017-06-27 01:02:15','866f5a2e-8e59-4b6b-a9a0-0ca80e995a9e'),
	(13,NULL,'m141103_000001_tag_titles','2017-06-27 01:02:15','2017-06-27 01:02:15','2017-06-27 01:02:15','0015669b-3eb7-4891-a13d-78f21001f207'),
	(14,NULL,'m141109_000001_user_status_shuffle','2017-06-27 01:02:15','2017-06-27 01:02:15','2017-06-27 01:02:15','76c96c94-df18-4a13-b7b6-e539b4eec53a'),
	(15,NULL,'m141126_000001_user_week_start_day','2017-06-27 01:02:15','2017-06-27 01:02:15','2017-06-27 01:02:15','34897976-4320-4772-9838-318a021caa04'),
	(16,NULL,'m150210_000001_adjust_user_photo_size','2017-06-27 01:02:15','2017-06-27 01:02:15','2017-06-27 01:02:15','6432f089-df76-4577-b455-5374fbbc5c98'),
	(17,NULL,'m150724_000001_adjust_quality_settings','2017-06-27 01:02:15','2017-06-27 01:02:15','2017-06-27 01:02:15','d35f4968-a563-4bff-bfc6-c330b1aa6262'),
	(18,NULL,'m150827_000000_element_index_settings','2017-06-27 01:02:15','2017-06-27 01:02:15','2017-06-27 01:02:15','03deb5f9-4909-454a-8f7a-04e7c04950ed'),
	(19,NULL,'m150918_000001_add_colspan_to_widgets','2017-06-27 01:02:15','2017-06-27 01:02:15','2017-06-27 01:02:15','f34919e7-e1cf-4ce6-8c87-5a4fc5dbedf8'),
	(20,NULL,'m151007_000000_clear_asset_caches','2017-06-27 01:02:15','2017-06-27 01:02:15','2017-06-27 01:02:15','a5002882-f84c-4605-91f7-aa8dba2b6adf'),
	(21,NULL,'m151109_000000_text_url_formats','2017-06-27 01:02:15','2017-06-27 01:02:15','2017-06-27 01:02:15','8989a072-67ba-42df-92c0-760c5970f0dd'),
	(22,NULL,'m151110_000000_move_logo','2017-06-27 01:02:15','2017-06-27 01:02:15','2017-06-27 01:02:15','5f900a49-e5de-40d5-9e20-bf50f663aee3'),
	(23,NULL,'m151117_000000_adjust_image_widthheight','2017-06-27 01:02:15','2017-06-27 01:02:15','2017-06-27 01:02:15','a340494d-63db-444a-adc8-5edfb8a3e18f'),
	(24,NULL,'m151127_000000_clear_license_key_status','2017-06-27 01:02:15','2017-06-27 01:02:15','2017-06-27 01:02:15','004cf3bc-0a7d-45cb-90ce-1a3ca701df08'),
	(25,NULL,'m151127_000000_plugin_license_keys','2017-06-27 01:02:15','2017-06-27 01:02:15','2017-06-27 01:02:15','31b73ee3-48e8-4269-ae4a-4a232150ba2b'),
	(26,NULL,'m151130_000000_update_pt_widget_feeds','2017-06-27 01:02:15','2017-06-27 01:02:15','2017-06-27 01:02:15','c5961d5b-f210-46c8-b88c-738d7621ed18'),
	(27,NULL,'m160114_000000_asset_sources_public_url_default_true','2017-06-27 01:02:15','2017-06-27 01:02:15','2017-06-27 01:02:15','a73d514b-9652-4bbf-af7e-c8fbbc7b15ec'),
	(28,NULL,'m160223_000000_sortorder_to_smallint','2017-06-27 01:02:15','2017-06-27 01:02:15','2017-06-27 01:02:15','04b51386-ef00-4f15-b457-1b3547758ba5'),
	(29,NULL,'m160229_000000_set_default_entry_statuses','2017-06-27 01:02:15','2017-06-27 01:02:15','2017-06-27 01:02:15','269b7d93-e568-467a-a30a-e2c2a8f29b43'),
	(30,NULL,'m160304_000000_client_permissions','2017-06-27 01:02:15','2017-06-27 01:02:15','2017-06-27 01:02:15','7605b953-2426-4361-a8ef-7b065b4326c1'),
	(31,NULL,'m160322_000000_asset_filesize','2017-06-27 01:02:15','2017-06-27 01:02:15','2017-06-27 01:02:15','a7dd028f-cad0-4b28-88f8-300c4e0eddbc'),
	(32,NULL,'m160503_000000_orphaned_fieldlayouts','2017-06-27 01:02:15','2017-06-27 01:02:15','2017-06-27 01:02:15','b1952c99-c277-49ef-b5b3-a2944a553847'),
	(33,NULL,'m160510_000000_tasksettings','2017-06-27 01:02:15','2017-06-27 01:02:15','2017-06-27 01:02:15','8af4e6db-7cfb-40b5-91eb-96681ad3751c'),
	(34,NULL,'m160829_000000_pending_user_content_cleanup','2017-06-27 01:02:15','2017-06-27 01:02:15','2017-06-27 01:02:15','c9974cac-c78b-4019-8d92-5db316bcc770'),
	(35,NULL,'m160830_000000_asset_index_uri_increase','2017-06-27 01:02:15','2017-06-27 01:02:15','2017-06-27 01:02:15','da9010d7-df87-46cd-ada2-ef211b963795'),
	(36,NULL,'m160919_000000_usergroup_handle_title_unique','2017-06-27 01:02:15','2017-06-27 01:02:15','2017-06-27 01:02:15','5b240055-ce55-418c-8196-bee34d0982aa'),
	(37,NULL,'m161108_000000_new_version_format','2017-06-27 01:02:15','2017-06-27 01:02:15','2017-06-27 01:02:15','5ad9188e-cccc-45d0-ac9d-f57e82a027d5'),
	(38,NULL,'m161109_000000_index_shuffle','2017-06-27 01:02:15','2017-06-27 01:02:15','2017-06-27 01:02:15','c2c5de31-cb41-4a73-8723-29fbd075a9ad'),
	(39,NULL,'m170612_000000_route_index_shuffle','2017-06-27 01:02:15','2017-06-27 01:02:15','2017-06-27 01:02:15','7a21f85b-acf2-407d-87fe-9bb09bc5801f'),
	(40,3,'m150901_144609_superTable_fixForContentTables','2017-06-27 01:02:42','2017-06-27 01:02:42','2017-06-27 01:02:42','46410e7c-3bf2-4b4d-8faf-a6d38f4f3746'),
	(41,4,'m151225_000000_seomatic_addHumansField','2017-06-27 01:02:43','2017-06-27 01:02:43','2017-06-27 01:02:43','eb02dcce-f4c5-4a26-9477-590e617bff87'),
	(42,4,'m151226_000000_seomatic_addTwitterFacebookFields','2017-06-27 01:02:43','2017-06-27 01:02:43','2017-06-27 01:02:43','ace8c21e-faa1-4072-a43d-58b91507d5bd'),
	(43,4,'m160101_000000_seomatic_addRobotsFields','2017-06-27 01:02:43','2017-06-27 01:02:43','2017-06-27 01:02:43','734e25ba-34e3-475e-8bf3-cb296b428bc2'),
	(44,4,'m160111_000000_seomatic_addTitleFields','2017-06-27 01:02:43','2017-06-27 01:02:43','2017-06-27 01:02:43','89feea84-4f63-4bee-a27c-23641c38854d'),
	(45,4,'m160122_000000_seomatic_addTypeFields','2017-06-27 01:02:43','2017-06-27 01:02:43','2017-06-27 01:02:43','bec16442-b136-4e51-82cd-3f27084fe6f0'),
	(46,4,'m160123_000000_seomatic_addOpeningHours','2017-06-27 01:02:43','2017-06-27 01:02:43','2017-06-27 01:02:43','a511fbba-9967-4e6a-97fb-e02a64b0103f'),
	(47,4,'m160202_000000_seomatic_addSocialHandles','2017-06-27 01:02:43','2017-06-27 01:02:43','2017-06-27 01:02:43','83ae824c-b8fe-4638-8869-9f2318c5be80'),
	(48,4,'m160204_000000_seomatic_addGoogleAnalytics','2017-06-27 01:02:43','2017-06-27 01:02:43','2017-06-27 01:02:43','046c2e48-63ca-4ce5-a60a-6671bd4a936d'),
	(49,4,'m160205_000000_seomatic_addResturantMenu','2017-06-27 01:02:43','2017-06-27 01:02:43','2017-06-27 01:02:43','70b1566d-dfcc-4db8-922e-44597854e578'),
	(50,4,'m160206_000000_seomatic_addGoogleAnalyticsPlugins','2017-06-27 01:02:43','2017-06-27 01:02:43','2017-06-27 01:02:43','a1625fb7-92fd-4259-8fc5-4493c29612eb'),
	(51,4,'m160206_000000_seomatic_addGoogleAnalyticsSendPageView','2017-06-27 01:02:43','2017-06-27 01:02:43','2017-06-27 01:02:43','6515c032-fc44-4eb6-b916-d2e36d3d0c9d'),
	(52,4,'m160209_000000_seomatic_alterDescriptionsColumns','2017-06-27 01:02:43','2017-06-27 01:02:43','2017-06-27 01:02:43','dd41cf46-0242-4525-886a-a634d37cd529'),
	(53,4,'m160209_000001_seomatic_addRobotsTxt','2017-06-27 01:02:43','2017-06-27 01:02:43','2017-06-27 01:02:43','d5eb9be9-6f8e-4025-bc41-fc1ae09d185f'),
	(54,4,'m160227_000000_seomatic_addFacebookAppId','2017-06-27 01:02:43','2017-06-27 01:02:43','2017-06-27 01:02:43','b9939721-d80e-47fb-85e0-f0aa6e4b9764'),
	(55,4,'m160416_000000_seomatic_addContactPoints','2017-06-27 01:02:43','2017-06-27 01:02:43','2017-06-27 01:02:43','ad6d00dd-e861-42ce-9c65-2ac776f6f5df'),
	(56,4,'m160509_000000_seomatic_addSiteLinksBing','2017-06-27 01:02:43','2017-06-27 01:02:43','2017-06-27 01:02:43','642fd5c7-da69-4e96-b898-083bddca532a'),
	(57,4,'m160707_000000_seomatic_addGoogleTagManager','2017-06-27 01:02:43','2017-06-27 01:02:43','2017-06-27 01:02:43','befca411-da19-43d8-9d67-ca0099ed5cbd'),
	(58,4,'m160715_000000_seomatic_addSeoImageTransforms','2017-06-27 01:02:43','2017-06-27 01:02:43','2017-06-27 01:02:43','14ba0ac7-5978-4e1c-920b-0dc85f0c8f15'),
	(59,4,'m160723_000000_seomatic_addSeoMainEntityOfPage','2017-06-27 01:02:43','2017-06-27 01:02:43','2017-06-27 01:02:43','84aa5bec-4b59-42c5-a3b7-9f7172f772fd'),
	(60,4,'m160724_000000_seomatic_addSeoMainEntityCategory','2017-06-27 01:02:43','2017-06-27 01:02:43','2017-06-27 01:02:43','28e2d3a6-71d9-4ffa-af4b-0bf748ccf35a'),
	(61,4,'m160811_000000_seomatic_addVimeo','2017-06-27 01:02:43','2017-06-27 01:02:43','2017-06-27 01:02:43','6c645357-3179-4a0c-b89d-9d0057c25524'),
	(62,4,'m160904_000000_seomatic_addTwitterFacebookImages','2017-06-27 01:02:43','2017-06-27 01:02:43','2017-06-27 01:02:43','79b29f30-67a7-4850-abf0-f670db7e7d64'),
	(63,4,'m161220_000000_seomatic_addPriceRange','2017-06-27 01:02:43','2017-06-27 01:02:43','2017-06-27 01:02:43','9cf9d485-822a-4325-a3be-152bdb87a9c5'),
	(64,4,'m170212_000000_seomatic_addGoogleAnalyticsAnonymizeIp','2017-06-27 01:02:43','2017-06-27 01:02:43','2017-06-27 01:02:43','1e2eae6e-ab63-4d49-ad73-e0833d6f6ab8'),
	(65,4,'m170212_000000_seomatic_addWikipedia','2017-06-27 01:02:43','2017-06-27 01:02:43','2017-06-27 01:02:43','a0415ef0-466d-417f-b32d-64260b9ac30c'),
	(66,5,'m160428_202308_Neo_UpdateBlockLevels','2017-06-27 01:02:51','2017-06-27 01:02:51','2017-06-27 01:02:51','e7806658-2bec-46a2-b953-99893070e1a6'),
	(67,5,'m160515_005002_Neo_UpdateBlockStructure','2017-06-27 01:02:51','2017-06-27 01:02:51','2017-06-27 01:02:51','fba6c292-13f8-4d63-9ecd-ca71464eaaf6'),
	(68,5,'m160605_191540_Neo_UpdateBlockStructureLocales','2017-06-27 01:02:51','2017-06-27 01:02:51','2017-06-27 01:02:51','cda3e4a1-2ae6-48bb-98c2-864b9d943e80'),
	(69,5,'m161029_230849_Neo_AddMaxChildBlocksSetting','2017-06-27 01:02:51','2017-06-27 01:02:51','2017-06-27 01:02:51','75689307-91ed-4ee1-831c-45d33be23b13'),
	(70,6,'m160208_010101_FruitLinkIt_UpdateExistingLinkItFields','2017-06-27 01:02:53','2017-06-27 01:02:53','2017-06-27 01:02:53','f50684f4-0a25-41c0-b788-38ebae04b5e6'),
	(71,14,'m170614_141800_amCommand_defaultElementTypeSettings','2017-06-27 01:03:10','2017-06-27 01:03:10','2017-06-27 01:03:10','b2674131-59fd-482d-8028-d0d952742892'),
	(72,15,'m150212_145000_AmNav_renamePagesToNodes','2017-06-27 01:03:12','2017-06-27 01:03:12','2017-06-27 01:03:12','8caf3984-d1b4-4f14-bb53-ca3bee9add55'),
	(73,15,'m150217_112800_AmNav_expandPageData','2017-06-27 01:03:12','2017-06-27 01:03:12','2017-06-27 01:03:12','a695ade4-4f1c-4ef9-a879-db60b60bb5d5'),
	(74,15,'m150403_093000_AmNav_nodesWithElements','2017-06-27 01:03:12','2017-06-27 01:03:12','2017-06-27 01:03:12','9a33bfed-0a8b-43fd-b826-cb31a8047433'),
	(75,15,'m150512_105600_AmNav_addOptionalClass','2017-06-27 01:03:12','2017-06-27 01:03:12','2017-06-27 01:03:12','94a95bc4-e9b2-401e-96bc-7e1cadde658a');

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
	(1,5,2,152,NULL,'2017-06-27 01:12:21','2017-06-27 01:12:21','2d21a288-0e34-404d-bf7c-1ece1a0f2b9e'),
	(2,6,9,152,NULL,'2017-06-27 01:16:06','2017-06-27 01:16:06','3190428d-28ca-4db6-80c0-42b0a1ade4ce');

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
	(1,152,47,'Headline','objHeadline',NULL,NULL,'',1,2,'2017-06-27 01:06:47','2017-06-27 01:06:47','ab2f398d-2bd2-4f66-9979-896b5ac110c7'),
	(2,152,48,'Richtext','objRichtext',NULL,NULL,'',1,3,'2017-06-27 01:06:47','2017-06-27 01:06:47','7e7142b1-ba62-4493-b9ef-017ab8376ddb'),
	(3,152,49,'Markdown','objMarkdown',NULL,NULL,'',1,4,'2017-06-27 01:06:47','2017-06-27 01:06:47','f87d0307-1a09-4b09-b1d8-322ce00c17f3'),
	(4,152,50,'Liste','objList',NULL,NULL,'',1,5,'2017-06-27 01:06:47','2017-06-27 01:06:47','60b1ccfa-ae47-456f-8b07-f38a586d29f3'),
	(5,152,51,'Zitat','objQuote',NULL,NULL,'',1,6,'2017-06-27 01:06:47','2017-06-27 01:06:47','4c9bcc23-c5f0-4de5-aafa-2f3aa4674594'),
	(6,152,52,'Media Image','objMediaImage',NULL,NULL,'',1,8,'2017-06-27 01:06:47','2017-06-27 01:06:47','590ac5cf-ac93-42fa-a0e4-96ab3cc0356c'),
	(7,152,53,'Embed Content','objEmbedContent',NULL,NULL,'',1,9,'2017-06-27 01:06:47','2017-06-27 01:06:47','c040123b-1430-4256-a319-2dfc46ea4efc'),
	(8,152,54,'Card','objCard',NULL,NULL,'',1,10,'2017-06-27 01:06:47','2017-06-27 01:06:47','1081fd68-3596-4236-b83f-64997107b1df'),
	(9,152,55,'Galerie','objGallery',NULL,NULL,'',1,11,'2017-06-27 01:06:47','2017-06-27 01:06:47','b3c50671-a13f-4213-8367-77a614f5e91b'),
	(10,152,56,'Image Slider','objImageSlider',NULL,NULL,'',1,12,'2017-06-27 01:06:47','2017-06-27 01:06:47','9b5be2b8-93f0-44a6-b82f-cf4da5519834'),
	(11,152,57,'Card Slider','objCardSlider',NULL,NULL,'[\"objCard\"]',1,13,'2017-06-27 01:06:47','2017-06-27 01:06:47','10c45e24-7a3b-4274-b00c-75d308bb63fe'),
	(12,152,58,'Button','objButton',NULL,NULL,'',1,15,'2017-06-27 01:06:47','2017-06-27 01:06:47','05cc241b-1dba-4bb1-bf55-d4872591019b'),
	(13,152,59,'Slide Out Box','objSlideOutBox',NULL,NULL,'',1,16,'2017-06-27 01:06:47','2017-06-27 01:06:47','69285874-486f-4d13-b6fc-f6d168f5082c'),
	(14,152,60,'Sprungnavigation','objJumpNavigation',NULL,NULL,'',1,17,'2017-06-27 01:06:47','2017-06-27 01:06:47','9603e361-a28f-4859-aafc-5edaf9bd410d'),
	(15,152,61,'Anker','objAnchor',NULL,NULL,'',1,19,'2017-06-27 01:06:47','2017-06-27 01:06:47','346dabf5-4ce0-4fef-817d-04f29f5ba5e6'),
	(16,152,62,'Trennlinie','objHorizontalRuler',NULL,NULL,'',1,20,'2017-06-27 01:06:47','2017-06-27 01:06:47','92342f25-087a-4243-8a08-705d67ca79df'),
	(17,152,63,'Spacer','objSpacer',NULL,NULL,'',1,21,'2017-06-27 01:06:47','2017-06-27 01:06:47','91081dd2-b6ac-4cc1-809e-fd50ec9f6938'),
	(18,152,64,'Section Wrapper','objSection',NULL,4,'[\"objSectionColumn\"]',1,23,'2017-06-27 01:06:47','2017-06-27 01:06:47','4a3c30be-370e-4bd5-bbc5-7568f4c05be1'),
	(19,152,65,'Section Column','objSectionColumn',NULL,NULL,'[\"objHeadline\",\"objRichtext\",\"objMarkdown\",\"objList\",\"objQuote\",\"objMediaImage\",\"objEmbedContent\",\"objCard\",\"objGallery\",\"objImageSlider\",\"objCardSlider\",\"objButton\",\"objSlideOutBox\",\"objJumpNavigation\",\"objAnchor\",\"objHorizontalRuler\",\"objSpacer\",\"objAccordionWrapper\",\"objTabWrapper\"]',0,24,'2017-06-27 01:06:47','2017-06-27 01:06:47','8a8b2f1d-57f4-44d0-bb58-d3500cbbcd3e'),
	(20,152,66,'Accordion Wrapper','objAccordionWrapper',NULL,NULL,'[\"objAccordion\"]',1,25,'2017-06-27 01:06:47','2017-06-27 01:06:47','f09346fe-ffbe-4aa4-9af2-13fbead55171'),
	(21,152,67,'Accordion','objAccordion',NULL,NULL,'[\"objHeadline\",\"objRichtext\",\"objMarkdown\",\"objList\",\"objQuote\",\"objMediaImage\",\"objEmbedContent\",\"objGallery\",\"objImageSlider\",\"objCardSlider\",\"objButton\",\"objSlideOutBox\",\"objJumpNavigation\",\"objAnchor\",\"objHorizontalRuler\",\"objSpacer\"]',0,26,'2017-06-27 01:06:47','2017-06-27 01:06:47','0d3f9ea9-6c25-4345-ad0c-57778b041183'),
	(22,152,68,'Tab Wrapper','objTabWrapper',NULL,NULL,'[\"objTab\"]',1,27,'2017-06-27 01:06:47','2017-06-27 01:06:47','9830dd13-126b-4ade-a6ce-bfccd83a2da1'),
	(23,152,69,'Tab','objTab',NULL,NULL,'[\"objHeadline\",\"objRichtext\",\"objMarkdown\",\"objList\",\"objQuote\",\"objMediaImage\",\"objEmbedContent\",\"objGallery\",\"objImageSlider\",\"objCardSlider\",\"objButton\",\"objSlideOutBox\",\"objJumpNavigation\",\"objAnchor\",\"objHorizontalRuler\",\"objSpacer\"]',0,28,'2017-06-27 01:06:47','2017-06-27 01:06:47','642e538c-2a8f-48e1-8695-c9f876869639');

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
	(1,152,'Textmodule',1,'2017-06-27 01:06:47','2017-06-27 01:06:47','a9c653ab-c215-4ca0-9cb9-198dcc0ec02c'),
	(2,152,'Mediamodule',7,'2017-06-27 01:06:47','2017-06-27 01:06:47','12a09de3-ca66-4aba-835c-1f805328f9b7'),
	(3,152,'Interaktiv',14,'2017-06-27 01:06:47','2017-06-27 01:06:47','f2225315-27c2-439a-a880-3a61a4139d89'),
	(4,152,'Layout',18,'2017-06-27 01:06:47','2017-06-27 01:06:47','428172b1-5bf8-498a-a80c-49f38f6a4df6'),
	(5,152,'Wrapper',22,'2017-06-27 01:06:47','2017-06-27 01:06:47','b5f037ab-2565-4496-a655-2c1fc47771b4');

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
	(1,'VideoEmbedUtility','1.0.0',NULL,NULL,'unknown',1,NULL,'2017-06-27 01:02:37','2017-06-27 01:02:37','2017-06-27 01:02:37','2762b21b-f95a-4bd2-ad15-4f66c2b8d210'),
	(2,'TheArchitect','1.6.0','1.6.0',NULL,'unknown',1,NULL,'2017-06-27 01:02:40','2017-06-27 01:02:40','2017-06-27 01:02:40','97a56b04-5c18-4fba-b094-2dbbf50947ea'),
	(3,'SuperTable','1.0.5','1.0.0',NULL,'unknown',1,NULL,'2017-06-27 01:02:42','2017-06-27 01:02:42','2017-06-27 01:02:42','e0baec1e-ee9a-4d9d-9e14-d0ae54c49268'),
	(4,'Seomatic','1.1.47','1.1.25',NULL,'unknown',1,NULL,'2017-06-27 01:02:43','2017-06-27 01:02:43','2017-06-27 01:02:43','fff06059-a4a2-4717-8454-5912b8ef82c5'),
	(5,'Neo','1.4.1','1.4.1',NULL,'unknown',1,NULL,'2017-06-27 01:02:51','2017-06-27 01:02:51','2017-06-27 01:02:51','9932f6a4-008c-4681-a766-35018cf47b1c'),
	(6,'FruitLinkIt','2.3.1','2.3.0',NULL,'unknown',1,NULL,'2017-06-27 01:02:53','2017-06-27 01:02:53','2017-06-27 01:02:53','4a1358ec-9c7e-405b-80f5-4eadaae02fbf'),
	(7,'Kint','1.1.0','1.0.0',NULL,'unknown',1,NULL,'2017-06-27 01:02:55','2017-06-27 01:02:55','2017-06-27 01:02:55','4ee99306-9953-49a1-8f45-b422808efb18'),
	(8,'Imager','1.5.3','1.0.0',NULL,'unknown',1,NULL,'2017-06-27 01:02:57','2017-06-27 01:02:57','2017-06-27 01:02:57','8c6994ed-e47f-4b6f-8ac5-2db2b19da9f9'),
	(9,'GitPlugins','0.1.0',NULL,NULL,'unknown',1,NULL,'2017-06-27 01:02:58','2017-06-27 01:02:58','2017-06-27 01:02:58','374a4bb0-daf4-4445-aa33-cdfbc67f9703'),
	(10,'FocalPointField','1.0.2',NULL,NULL,'unknown',1,NULL,'2017-06-27 01:03:01','2017-06-27 01:03:01','2017-06-27 01:03:01','127b8ce5-958f-455a-b91e-0432ff15517e'),
	(11,'Doxter','1.3.0','1.0.0',NULL,'unknown',1,NULL,'2017-06-27 01:03:04','2017-06-27 01:03:04','2017-06-27 01:03:04','ae4f7eb3-575f-4457-8791-2e6ef96ac023'),
	(12,'CpSortCols','1.1.1','1.0',NULL,'unknown',1,NULL,'2017-06-27 01:03:06','2017-06-27 01:03:06','2017-06-27 01:03:06','905a645d-4d18-4cd7-a528-99b6789f4df9'),
	(13,'CpFieldLinks','1.2.2','1.0',NULL,'unknown',1,NULL,'2017-06-27 01:03:09','2017-06-27 01:03:09','2017-06-27 01:03:09','15c8de92-5289-40ee-9f6d-162e389803c5'),
	(14,'AmCommand','2.0.2','2.0.1',NULL,'unknown',1,NULL,'2017-06-27 01:03:10','2017-06-27 01:03:10','2017-06-27 01:03:10','1b7ad04c-44d2-4597-8cb3-80fb9b3178ad'),
	(15,'AmNav','1.7.1',NULL,NULL,'unknown',1,NULL,'2017-06-27 01:03:12','2017-06-27 01:03:12','2017-06-27 01:03:12','4f0f8f98-4024-4a7b-ab86-d38e67eff5f9');

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
	(1,63,8,NULL,7,1,'2017-06-27 01:12:21','2017-06-27 01:12:21','12c9c74c-4aaa-48f9-94e1-16e503f5cfbf'),
	(2,42,9,NULL,7,1,'2017-06-27 01:16:06','2017-06-27 01:16:06','b1cd9991-87c5-48b5-9ef5-8a2e84e07602');

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
	(1,NULL,'[\"rss\"]','rss','rss/blog.rss',1,'2017-06-27 01:06:47','2017-06-27 01:06:47','3c1172de-011d-45b0-b821-712a54751de9'),
	(2,NULL,'[\"feed\"]','feed','rss/blog.rss',2,'2017-06-27 01:06:47','2017-06-27 01:06:47','1a9a1a8b-606e-432b-bbd5-d79c4cc85dd4'),
	(3,NULL,'[\"rss\\/blog.rss\"]','rss\\/blog\\.rss','rss/blog.rss',3,'2017-06-27 01:06:47','2017-06-27 01:06:47','efba27f3-6a74-4c1c-9aaa-458d94db422f');

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
	(1,'username',0,'de',' gisugosu '),
	(1,'firstname',0,'de',''),
	(1,'lastname',0,'de',''),
	(1,'fullname',0,'de',''),
	(1,'email',0,'de',' gisu2onic gmail com '),
	(1,'slug',0,'de',''),
	(2,'slug',0,'de',' homepage '),
	(2,'title',0,'de',' welcome to ktest3 local '),
	(2,'field',1,'de',' it s true this site doesn t have a whole lot of content yet but don t worry our web developers have just installed the cms and they re setting things up for the content editors this very moment soon ktest3 local will be an oasis of fresh perspectives sharp analyses and astute opinions that will keep you coming back again and again '),
	(7,'kind',0,'de',' image '),
	(7,'slug',0,'de',' dsc 8059 '),
	(7,'title',0,'de',' dsc 8059 '),
	(2,'field',152,'de',''),
	(2,'field',62,'de',' summer holiday dsc 8059 '),
	(2,'field',124,'de',' 1 de 1 0 template creativework article welcome to ktest3 local welcome to ktest3 local summary_large_image article all field title field title custom title field field field '),
	(8,'field',63,'de',' dsc 8059 '),
	(7,'extension',0,'de',' jpg '),
	(7,'filename',0,'de',' dsc_8059 jpg '),
	(4,'slug',0,'de',' 404 '),
	(4,'title',0,'de',' 404 '),
	(5,'field',31,'de',''),
	(5,'slug',0,'de',''),
	(6,'field',144,'de',' sdfsdf facebook dsfsdf '),
	(6,'field',32,'de',''),
	(6,'slug',0,'de',''),
	(8,'field',64,'de',' summer holiday '),
	(8,'field',65,'de',''),
	(8,'slug',0,'de',''),
	(9,'field',152,'de',''),
	(9,'field',42,'de',' dsc 8059 '),
	(9,'field',46,'de',' 0 '),
	(9,'field',43,'de',''),
	(9,'field',124,'de',' 1 de 1 0 template creativework article just a test just a test summary_large_image article all 7 7 7 field title field title custom title field featuredimage field featuredimage field featuredimage '),
	(9,'slug',0,'de',' just a test '),
	(9,'title',0,'de',' just a test '),
	(10,'field',47,'de',' 0 '),
	(10,'field',48,'de',''),
	(10,'slug',0,'de',''),
	(11,'field',44,'de',''),
	(11,'field',45,'de',''),
	(11,'slug',0,'de',''),
	(12,'field',145,'de',' facebook '),
	(12,'field',146,'de',' dsfsdf '),
	(12,'field',147,'de',' sdfsdf '),
	(12,'slug',0,'de','');

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
	(1,NULL,'Homepage','homepage','single',1,'index',1,'2017-06-27 01:02:20','2017-06-27 01:02:20','7bda7172-6fc8-4145-bffe-443e9416538f'),
	(3,NULL,'404','error404','single',1,'404',1,'2017-06-27 01:04:54','2017-06-27 01:04:54','a24be880-d1a5-423f-8372-4b09f6ba8188'),
	(4,NULL,'Blog Channel','blogChannel','channel',1,'general/entry',1,'2017-06-27 01:04:54','2017-06-27 01:04:54','2142228f-8743-4ada-8ddc-a2b429ccc9b5'),
	(5,1,'Blog Pages','blogPages','structure',1,'general/pages',1,'2017-06-27 01:04:54','2017-06-27 01:04:54','b0bab96f-ec10-498b-a8c2-2c3e6ba7a037'),
	(6,2,'Pages','pages','structure',1,'general/pages',1,'2017-06-27 01:04:54','2017-06-27 01:04:54','2825d981-70ed-45ea-ac34-8fb46982fcc7');

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
	(1,1,'de',1,'__home__',NULL,'2017-06-27 01:02:20','2017-06-27 01:02:20','2ee1fc81-57b9-42eb-b05f-74bd108dbfee'),
	(3,3,'de',1,'404',NULL,'2017-06-27 01:04:54','2017-06-27 01:04:54','c216b6db-b5f3-48ae-8f87-d3a2f76a3065'),
	(4,4,'de',1,'blog/e/{slug}',NULL,'2017-06-27 01:04:54','2017-06-27 01:04:54','2d5b8836-f42f-40fe-8003-207dd6d29a6f'),
	(5,5,'de',1,'blog/{slug}','{parent.uri}/{slug}','2017-06-27 01:04:54','2017-06-27 01:04:54','776065bf-8610-4fb2-a1e4-d8b68c206865'),
	(6,6,'de',1,'{slug}','{parent.uri}/{slug}','2017-06-27 01:04:54','2017-06-27 01:04:54','ca7825e7-7c01-42b5-a0f8-4a324e4b723e');

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
	(1,NULL,NULL,NULL,NULL,NULL,'de','Ktest3','This is the default global title of the site pages.','|','after','This is the default global natural language description of the content on the site pages.','default,global,comma-separated,keywords','','','','summary','website','','# robots.txt for {{ siteUrl }}\n\nSitemap: {{ siteUrl |trim(\'/\') }}/sitemap.xml\n\n# Don\'t allow web crawlers to index Craft\n\nUser-agent: *\nDisallow: /craft/\n','','','','','','',1,0,0,0,0,0,0,'Organization','Corporation','','Ktest3','','','http://ktest3.local/','','','','','','','','','','','','','','','$$$','','','','','','','','','','','','','','','','','','','','','Organization','Corporation','','','','','','','','','','','','','','','','','','','','','','','','','','','/* TEAM */\n\n{% if seomaticCreator.name is defined and seomaticCreator.name %}\nCreator: {{ seomaticCreator.name }}\n{% endif %}\n{% if seomaticCreator.url is defined and seomaticCreator.url %}\nURL: {{ seomaticCreator.url }}\n{% endif %}\n{% if seomaticCreator.description is defined and seomaticCreator.description %}\nDescription: {{ seomaticCreator.description }}\n{% endif %}\n\n/* THANKS */\n\nPixel & Tonic - https://pixelandtonic.com\n\n/* SITE */\n\nStandards: HTML5, CSS3\nComponents: Craft CMS, Yii, PHP, Javascript, SEOmatic','2017-06-27 01:09:11','2017-06-27 01:09:11','c64fe073-2c15-49d9-a7a7-b591dd9678d5');

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
	(1,1,'3de01ce92f39ffa8bbc3b050b63380600545904aczozMjoiV0R+ZlJiNmljTENkXzBjY0h1ZU5oZFdWOGpYemp3VWkiOw==','2017-06-27 01:02:20','2017-06-27 01:02:20','c4c1e811-6c55-4a2c-b466-fff954b64594');

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
	(1,2,NULL,1,1,4,0,'2017-06-27 01:16:06','2017-06-27 01:16:06','036ec52a-8176-47c7-9209-5a5879add151'),
	(2,2,9,1,2,3,1,'2017-06-27 01:16:06','2017-06-27 01:16:06','4b69a732-30d9-4165-8d29-4f78efe1c630');

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
	(1,2,'2017-06-27 01:04:54','2017-06-27 01:04:54','4a351ee1-283d-4c51-9868-12b26d92a7c4'),
	(2,2,'2017-06-27 01:04:54','2017-06-27 01:04:54','7005862a-d219-4868-979b-3df80651c646'),
	(3,1,'2017-06-27 01:06:41','2017-06-27 01:06:47','8e2e4e82-329c-4f5f-b949-2f6a4a158c16'),
	(4,1,'2017-06-27 01:06:41','2017-06-27 01:06:47','8438c6c7-f353-4ddf-b7d0-668d69af8e1c'),
	(5,NULL,'2017-06-27 01:12:21','2017-06-27 01:12:21','28bc140d-e8dd-42da-80d7-aed5071c3552'),
	(6,NULL,'2017-06-27 01:16:06','2017-06-27 01:16:06','10956a38-d506-4ee6-b748-f9374b60f93b');

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
	(8,2,62,14,1,NULL,'2017-06-27 01:12:21','2017-06-27 01:12:21','d0275b1b-10e2-4d21-94cd-c3bcd0faa521'),
	(10,9,46,10,1,NULL,'2017-06-27 01:16:06','2017-06-27 01:16:06','1191d2ab-b2dd-44f3-a803-e64c1b68b815'),
	(11,9,43,9,1,NULL,'2017-06-27 01:16:06','2017-06-27 01:16:06','d010e910-b7f7-48d5-bfb1-559a35d1f4ee'),
	(12,6,144,33,1,NULL,'2017-06-27 01:26:36','2017-06-27 01:26:36','a29f0129-b47c-4638-935e-8a00a5d44856');

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
	(1,4,13,'2017-06-27 01:06:41','2017-06-27 01:06:41','8d2948e9-7be9-422d-af81-adf48fe323bc'),
	(2,7,14,'2017-06-27 01:06:41','2017-06-27 01:06:41','eaa2cd16-ad99-47dc-8993-9a6288381476'),
	(3,10,15,'2017-06-27 01:06:41','2017-06-27 01:06:41','a073e61c-883e-45d3-a2e3-4a42490aaab2'),
	(4,15,16,'2017-06-27 01:06:41','2017-06-27 01:06:42','7d879e2a-2f33-460e-b176-ca06a9de8fbf'),
	(5,22,17,'2017-06-27 01:06:42','2017-06-27 01:06:42','7c06b25a-a040-4035-bb17-2d93721407a7'),
	(6,26,18,'2017-06-27 01:06:42','2017-06-27 01:06:42','4e702730-015b-4927-8885-561ae75d3675'),
	(7,33,19,'2017-06-27 01:06:42','2017-06-27 01:06:42','78ba803a-b4b8-4740-be89-c7808262d2ed'),
	(8,37,20,'2017-06-27 01:06:42','2017-06-27 01:06:42','670bdf27-2485-4578-8b67-e113e4ec8be9'),
	(9,43,21,'2017-06-27 01:06:42','2017-06-27 01:06:42','54eb6c13-6d87-455d-89aa-417b39b640af'),
	(10,46,22,'2017-06-27 01:06:43','2017-06-27 01:06:43','0d245a32-1897-4d36-8079-54c48d7310f7'),
	(11,50,23,'2017-06-27 01:06:43','2017-06-27 01:06:43','f1b21941-1c0d-4f16-8a42-9f691914af10'),
	(12,53,24,'2017-06-27 01:06:43','2017-06-27 01:06:43','93c4cab6-aa11-48a6-b313-ac1d4d4ac6d7'),
	(13,58,25,'2017-06-27 01:06:43','2017-06-27 01:06:43','fdfcce67-71a6-4a61-8db3-a15c1f34159e'),
	(14,62,26,'2017-06-27 01:06:43','2017-06-27 01:06:43','09dbac26-76d7-4d81-bb2f-cd9931ab33d1'),
	(15,68,27,'2017-06-27 01:06:43','2017-06-27 01:06:43','2618214a-ed16-4cb1-9123-c1d81f12796b'),
	(16,72,28,'2017-06-27 01:06:44','2017-06-27 01:06:44','bc63a6b8-6a94-4782-aae6-09ef1bbfa925'),
	(17,75,29,'2017-06-27 01:06:44','2017-06-27 01:06:44','2de38a66-9ceb-4277-b2bb-1a4a3bb711a0'),
	(18,79,30,'2017-06-27 01:06:44','2017-06-27 01:06:44','a027b234-9051-4b0e-9fe3-5d90922c40fc'),
	(19,83,31,'2017-06-27 01:06:44','2017-06-27 01:06:44','5d21312f-86b2-4cc1-9f67-1d9b3853e80d'),
	(20,86,32,'2017-06-27 01:06:44','2017-06-27 01:06:44','30a7f3f9-3180-44ad-85b2-0d25c13d01b4'),
	(21,89,33,'2017-06-27 01:06:44','2017-06-27 01:06:44','2edb38c1-ace1-4cce-9e44-cba5ae7ce761'),
	(22,93,34,'2017-06-27 01:06:44','2017-06-27 01:06:44','9c48cff8-aff6-4211-ae85-b3f9cc10ce4a'),
	(23,96,35,'2017-06-27 01:06:45','2017-06-27 01:06:45','173d2ee9-7a68-40f2-ac3f-6f590b32338e'),
	(24,99,36,'2017-06-27 01:06:45','2017-06-27 01:06:45','4e15dd32-864a-4ee5-af86-25581a29ea5b'),
	(25,101,37,'2017-06-27 01:06:45','2017-06-27 01:06:45','58665042-3009-4995-b824-0c6feb3cd216'),
	(26,110,38,'2017-06-27 01:06:45','2017-06-27 01:06:45','3085c185-e7fd-4ce1-a6e8-7410ea9cb3cc'),
	(27,114,39,'2017-06-27 01:06:45','2017-06-27 01:06:45','f47156b8-5828-4568-b358-d3c8a343bbb7'),
	(28,118,40,'2017-06-27 01:06:45','2017-06-27 01:06:45','c24b17b5-385e-4343-9c4d-93181258a5e2'),
	(29,125,41,'2017-06-27 01:06:46','2017-06-27 01:06:46','f0693f5a-9418-4285-b217-c5adb7a5be35'),
	(30,128,42,'2017-06-27 01:06:46','2017-06-27 01:06:46','0a3583a1-bc02-4bf4-aac6-45ba837ea803'),
	(31,130,43,'2017-06-27 01:06:46','2017-06-27 01:06:46','f60bc5c7-1729-48e5-b59f-1ef35763af60'),
	(32,137,44,'2017-06-27 01:06:46','2017-06-27 01:06:46','f6752274-b571-4fab-b1d9-91f4eafb8050'),
	(33,144,45,'2017-06-27 01:06:46','2017-06-27 01:06:46','dac0e5e3-3040-4844-b057-8ab60873b69a'),
	(34,150,46,'2017-06-27 01:06:47','2017-06-27 01:06:47','ff06ba88-980e-42ab-81ab-550fe9b5fec3');

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

LOCK TABLES `craft_supertablecontent_featuredimagelabeling` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_featuredimagelabeling` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_featuredimagelabeling` (`id`, `elementId`, `locale`, `field_headline`, `field_linkit`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,11,'de','','','2017-06-27 01:16:06','2017-06-27 01:16:06','2d08183c-4fac-4d31-87d3-b569788d23a7');

/*!40000 ALTER TABLE `craft_supertablecontent_featuredimagelabeling` ENABLE KEYS */;
UNLOCK TABLES;


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
	(1,10,'de',0,'','2017-06-27 01:16:06','2017-06-27 01:16:06','faa2327e-824a-4c25-80aa-198018532467');

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
	(1,8,'de','Summer Holiday','','2017-06-27 01:12:21','2017-06-27 01:12:21','044823b7-05f6-4047-97a0-508810515fc8');

/*!40000 ALTER TABLE `craft_supertablecontent_hero` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertablecontent_objaccordionwrapper
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_objaccordionwrapper`;

CREATE TABLE `craft_supertablecontent_objaccordionwrapper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_style` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
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
  `field_style` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_objtabwrapper_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_objtabwrapper_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_objtabwrapper_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_objtabwrapper_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
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
  `field_style` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `field_size` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `field_fullwidth` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_position` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'left',
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
  `field_style` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `field_mediaRatio` text COLLATE utf8_unicode_ci,
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
  `field_style` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
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
  `field_style` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_responsive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_ratio` text COLLATE utf8_unicode_ci,
  `field_align` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'center',
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



# Export von Tabelle craft_supertablecontent_setheadline
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_setheadline`;

CREATE TABLE `craft_supertablecontent_setheadline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_style` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_semantic` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'h2',
  `field_override` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_setheadline_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_setheadline_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_setheadline_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_setheadline_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_setimageslider
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_setimageslider`;

CREATE TABLE `craft_supertablecontent_setimageslider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_style` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_ratio` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_setimageslider_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_setimageslider_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_setimageslider_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_setimageslider_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_setjumpnavigation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_setjumpnavigation`;

CREATE TABLE `craft_supertablecontent_setjumpnavigation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_style` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `field_layout` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
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
  `field_style` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_addAnchor` tinyint(1) unsigned NOT NULL DEFAULT '0',
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
  `field_style` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_ratio` text COLLATE utf8_unicode_ci,
  `field_heightrestriction` tinyint(1) unsigned NOT NULL DEFAULT '0',
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
  `field_style` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
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
  `field_style` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_setrichtext_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_setrichtext_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_setrichtext_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_setrichtext_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_setsection
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_setsection`;

CREATE TABLE `craft_supertablecontent_setsection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_style` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `field_fullheight` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_innerContainer` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `field_anchor` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_setsection_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_setsection_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_setsection_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_setsection_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_setsectionbackground
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_setsectionbackground`;

CREATE TABLE `craft_supertablecontent_setsectionbackground` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_adaptContainer` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_width` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_align` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `field_behavior` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_position` text COLLATE utf8_unicode_ci,
  `field_ratio` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertableconten_setsectionbackgrou_elementI_locale_unq_id` (`elementId`,`locale`),
  KEY `craft_supertablecontent_setsectionbackground_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_setsectionbackground_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_setsectionbackground_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_setsectioncolumn
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_setsectioncolumn`;

CREATE TABLE `craft_supertablecontent_setsectioncolumn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_style` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_align` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `field_verticalAlign` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
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
  `field_style` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
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

LOCK TABLES `craft_supertablecontent_socialnetworks` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_socialnetworks` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_socialnetworks` (`id`, `elementId`, `locale`, `field_icon`, `field_linkit`, `field_caption`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,12,'de','facebook','dsfsdf','sdfsdf','2017-06-27 01:26:36','2017-06-27 01:26:36','c4d44bbb-1679-475d-9a2c-3937083c9de6');

/*!40000 ALTER TABLE `craft_supertablecontent_socialnetworks` ENABLE KEYS */;
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
	(1,'email','{\"protocol\":\"php\",\"emailAddress\":\"gisu2onic@gmail.com\",\"senderName\":\"Ktest3\"}','2017-06-27 01:02:20','2017-06-27 01:02:20','6b879a2c-93cd-4dba-9ae3-e98e669f6dec');

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
	(1,'Default','default',1,'2017-06-27 01:02:20','2017-06-27 01:02:20','3dc1c01b-3405-4ae2-9a78-27cc0b1efa6d');

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
  KEY `craft_templatecaches_expiryDate_cacheKey_locale_path_idx` (`expiryDate`,`cacheKey`,`locale`,`path`),
  KEY `craft_templatecaches_locale_fk` (`locale`),
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
	(1,'gisugosu',NULL,NULL,NULL,'gisu2onic@gmail.com','$2y$13$GNb9Bwlfg3FkkD2tVj9Ioelh7EacE0X4daApovn2zNwb8dXlqS3Qa',NULL,1,1,0,0,0,0,0,'2017-06-27 01:02:20','::1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2017-06-27 01:02:17','2017-06-27 01:02:17','2017-06-27 01:02:20','ba8c5432-bfb8-48fa-9841-e3117c2da6ce');

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
	(1,1,'RecentEntries',1,NULL,NULL,1,'2017-06-27 01:02:24','2017-06-27 01:02:24','aa9e32d6-5f20-4003-a812-a98478e7b053'),
	(2,1,'GetHelp',2,NULL,NULL,1,'2017-06-27 01:02:24','2017-06-27 01:02:24','ca12ce83-187a-4111-882c-cb2aa014cd05'),
	(3,1,'Updates',3,NULL,NULL,1,'2017-06-27 01:02:24','2017-06-27 01:02:24','2b268452-89f8-4f0d-ab58-c500e46ce53a'),
	(4,1,'Feed',4,NULL,'{\"url\":\"https:\\/\\/craftcms.com\\/news.rss\",\"title\":\"Craft News\"}',1,'2017-06-27 01:02:24','2017-06-27 01:02:24','e30ae4f6-d2d5-48fa-8037-dc6d2dc8b92e');

/*!40000 ALTER TABLE `craft_widgets` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
