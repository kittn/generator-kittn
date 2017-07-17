# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.6.34)
# Datenbank: ulfblog
# Erstellt am: 2017-07-16 14:13:56 +0000
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
	(1,NULL,1,'Bilder','','2017-07-04 22:00:58','2017-07-04 22:00:58','4ce5a23f-3510-4a3a-a93f-901e27d329ae');

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
	(1,'Bilder','images','Local','{\"path\":\"{basePath}uploads\\/images\\/\",\"publicURLs\":1,\"url\":\"{baseUrl}uploads\\/images\\/\"}',1,70,'2017-07-04 22:00:57','2017-07-04 22:01:04','5cdce67f-c18e-450f-b05f-67cd30e0c7e8');

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
	(7,2,'2017-07-05 20:08:13','2017-07-05 20:08:13','e9544ba7-4930-435b-914f-f5ee135aea68');

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
	(2,4,79,'Settings: Image Slider','settingsImageSlider',0,NULL,'2017-07-04 22:00:58','2017-07-04 22:01:04','15e70a07-1e99-48e4-afe7-d7038e9dbe7a');

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
	(4,2,'en',NULL,NULL,'2017-07-04 22:03:19','2017-07-04 22:03:19','ab888d7b-0d11-451f-8c31-e618adf685be');

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
	(1,1,'de',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,'2017-07-04 21:45:00','2017-07-16 14:02:16','cbaf4989-9591-427d-8938-162b4d17915b'),
	(2,2,'de','Home','<p>It’s true, this site doesn’t have a whole lot of content yet, but don’t worry. Our web developers have just installed the CMS, and they’re setting things up for the content editors this very moment. Soon Ktest10.local will be an oasis of fresh perspectives, sharp analyses, and astute opinions that will keep you coming back again and again.</p>',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,NULL,NULL,'{\"id\":null,\"enabled\":1,\"archived\":0,\"locale\":\"de\",\"localeEnabled\":1,\"slug\":null,\"uri\":null,\"dateCreated\":null,\"dateUpdated\":null,\"root\":null,\"lft\":null,\"rgt\":null,\"level\":null,\"searchScore\":null,\"elementId\":0,\"metaType\":\"template\",\"metaPath\":\"\",\"seoMainEntityCategory\":\"CreativeWork\",\"seoMainEntityOfPage\":\"Article\",\"seoTitle\":\"Home\",\"seoDescription\":\"Home\",\"seoKeywords\":\"\",\"seoImageTransform\":\"\",\"seoFacebookImageTransform\":\"\",\"seoTwitterImageTransform\":\"\",\"twitterCardType\":\"summary_large_image\",\"openGraphType\":\"article\",\"robots\":\"all\",\"seoImageId\":\"\",\"seoTwitterImageId\":\"\",\"seoFacebookImageId\":\"\",\"seoTitleUnparsed\":\"Home\",\"seoDescriptionUnparsed\":\"Home\",\"seoKeywordsUnparsed\":\"\",\"seoTitleSource\":\"field\",\"seoTitleSourceField\":\"title\",\"seoDescriptionSource\":\"field\",\"seoDescriptionSourceField\":\"title\",\"seoKeywordsSource\":\"custom\",\"seoKeywordsSourceField\":\"title\",\"seoImageIdSource\":\"field\",\"seoImageIdSourceField\":\"\",\"seoTwitterImageIdSource\":\"field\",\"seoTwitterImageIdSourceField\":\"\",\"seoFacebookImageIdSource\":\"field\",\"seoFacebookImageIdSourceField\":\"\",\"seoCommerceVariants\":null,\"__model__\":\"Craft\\\\Seomatic_MetaFieldModel\"}','--050',NULL,'2017-07-04 21:45:04','2017-07-05 21:34:43','9fb54827-4097-4fa5-a8fd-1d35d9c8bd38'),
	(4,4,'de','404',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,'2017-07-04 22:00:57','2017-07-05 21:33:48','0276ef36-ab9b-4ef1-a923-788dd824faf2'),
	(5,5,'de',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,'2017-07-04 22:01:04','2017-07-04 22:03:20','2403fbb2-6815-4688-9579-12f44c00389e'),
	(6,6,'de',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,'2017-07-04 22:01:04','2017-07-04 22:03:20','7252c02a-aa48-4507-8a8a-f101ab29f8d4'),
	(7,5,'en',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,'2017-07-04 22:03:20','2017-07-04 22:03:20','f0e44c50-1591-4839-99f2-35b7e6ad43dc'),
	(8,6,'en',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,'2017-07-04 22:03:20','2017-07-04 22:03:20','c225a677-ac00-479a-8b2f-6add1e66827c'),
	(9,7,'de','Carousel',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,'2017-07-05 20:08:13','2017-07-05 20:08:13','261ced72-8fae-449e-b661-441803e6aed8'),
	(10,7,'en','Carousel',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,'2017-07-05 20:08:13','2017-07-05 20:08:13','140b40f2-6bd4-44cf-b725-606af79ceab2'),
	(11,4,'en','404',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,NULL,NULL,NULL,'--050',NULL,'2017-07-05 21:33:48','2017-07-05 21:33:48','a6a1aa02-76c4-40ea-8709-e78a77f4fa97'),
	(12,2,'en','Home','<p>It’s true, this site doesn’t have a whole lot of content yet, but don’t worry. Our web developers have just installed the CMS, and they’re setting things up for the content editors this very moment. Soon Ktest10.local will be an oasis of fresh perspectives, sharp analyses, and astute opinions that will keep you coming back again and again.</p>',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,NULL,NULL,'{\"id\":null,\"enabled\":1,\"archived\":0,\"locale\":\"de\",\"localeEnabled\":1,\"slug\":null,\"uri\":null,\"dateCreated\":null,\"dateUpdated\":null,\"root\":null,\"lft\":null,\"rgt\":null,\"level\":null,\"searchScore\":null,\"elementId\":0,\"metaType\":\"template\",\"metaPath\":\"\",\"seoMainEntityCategory\":\"CreativeWork\",\"seoMainEntityOfPage\":\"Article\",\"seoTitle\":\"Home\",\"seoDescription\":\"Home\",\"seoKeywords\":\"\",\"seoImageTransform\":\"\",\"seoFacebookImageTransform\":\"\",\"seoTwitterImageTransform\":\"\",\"twitterCardType\":\"summary_large_image\",\"openGraphType\":\"article\",\"robots\":\"all\",\"seoImageId\":\"\",\"seoTwitterImageId\":\"\",\"seoFacebookImageId\":\"\",\"seoTitleUnparsed\":\"Home\",\"seoDescriptionUnparsed\":\"Home\",\"seoKeywordsUnparsed\":\"\",\"seoTitleSource\":\"field\",\"seoTitleSourceField\":\"title\",\"seoDescriptionSource\":\"field\",\"seoDescriptionSourceField\":\"title\",\"seoKeywordsSource\":\"custom\",\"seoKeywordsSourceField\":\"title\",\"seoImageIdSource\":\"field\",\"seoImageIdSourceField\":\"\",\"seoTwitterImageIdSource\":\"field\",\"seoTwitterImageIdSourceField\":\"\",\"seoFacebookImageIdSource\":\"field\",\"seoFacebookImageIdSourceField\":\"\",\"seoCommerceVariants\":null,\"__model__\":\"Craft\\\\Seomatic_MetaFieldModel\"}','--050',NULL,'2017-07-05 21:34:43','2017-07-05 21:34:43','a6ab581b-b6ea-4919-abac-ed9597442825'),
	(13,11,'de','Hello World','<p>This is for SEO, OG and RSS Feed Content</p>',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,NULL,NULL,'{\"id\":null,\"enabled\":1,\"archived\":0,\"locale\":\"de\",\"localeEnabled\":1,\"slug\":null,\"uri\":null,\"dateCreated\":null,\"dateUpdated\":null,\"root\":null,\"lft\":null,\"rgt\":null,\"level\":null,\"searchScore\":null,\"elementId\":0,\"metaType\":\"template\",\"metaPath\":\"\",\"seoMainEntityCategory\":\"CreativeWork\",\"seoMainEntityOfPage\":\"Article\",\"seoTitle\":\"Hello World\",\"seoDescription\":\"This is for SEO, OG and RSS Feed Content\",\"seoKeywords\":\"\",\"seoImageTransform\":\"\",\"seoFacebookImageTransform\":\"\",\"seoTwitterImageTransform\":\"\",\"twitterCardType\":\"summary_large_image\",\"openGraphType\":\"article\",\"robots\":\"all\",\"seoImageId\":\"\",\"seoTwitterImageId\":\"\",\"seoFacebookImageId\":\"\",\"seoTitleUnparsed\":\"Hello World\",\"seoDescriptionUnparsed\":\"This is for SEO, OG and RSS Feed Content\",\"seoKeywordsUnparsed\":\"\",\"seoTitleSource\":\"field\",\"seoTitleSourceField\":\"title\",\"seoDescriptionSource\":\"field\",\"seoDescriptionSourceField\":\"body\",\"seoKeywordsSource\":\"custom\",\"seoKeywordsSourceField\":\"title\",\"seoImageIdSource\":\"field\",\"seoImageIdSourceField\":\"featuredImage\",\"seoTwitterImageIdSource\":\"field\",\"seoTwitterImageIdSourceField\":\"featuredImage\",\"seoFacebookImageIdSource\":\"field\",\"seoFacebookImageIdSourceField\":\"featuredImage\",\"seoCommerceVariants\":null,\"__model__\":\"Craft\\\\Seomatic_MetaFieldModel\"}','--050',NULL,'2017-07-16 14:05:54','2017-07-16 14:05:54','315cb79b-92ce-4a59-81b1-bcbf0c0cfa29'),
	(14,11,'en','Hello World','<p>This is for SEO, OG and RSS Feed Content</p>',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'default',NULL,NULL,NULL,NULL,NULL,'{\"id\":null,\"enabled\":1,\"archived\":0,\"locale\":\"de\",\"localeEnabled\":1,\"slug\":null,\"uri\":null,\"dateCreated\":null,\"dateUpdated\":null,\"root\":null,\"lft\":null,\"rgt\":null,\"level\":null,\"searchScore\":null,\"elementId\":0,\"metaType\":\"template\",\"metaPath\":\"\",\"seoMainEntityCategory\":\"CreativeWork\",\"seoMainEntityOfPage\":\"Article\",\"seoTitle\":\"Hello World\",\"seoDescription\":\"This is for SEO, OG and RSS Feed Content\",\"seoKeywords\":\"\",\"seoImageTransform\":\"\",\"seoFacebookImageTransform\":\"\",\"seoTwitterImageTransform\":\"\",\"twitterCardType\":\"summary_large_image\",\"openGraphType\":\"article\",\"robots\":\"all\",\"seoImageId\":\"\",\"seoTwitterImageId\":\"\",\"seoFacebookImageId\":\"\",\"seoTitleUnparsed\":\"\",\"seoDescriptionUnparsed\":\"\",\"seoKeywordsUnparsed\":\"\",\"seoTitleSource\":\"field\",\"seoTitleSourceField\":\"title\",\"seoDescriptionSource\":\"field\",\"seoDescriptionSourceField\":\"body\",\"seoKeywordsSource\":\"custom\",\"seoKeywordsSourceField\":\"title\",\"seoImageIdSource\":\"field\",\"seoImageIdSourceField\":\"featuredImage\",\"seoTwitterImageIdSource\":\"field\",\"seoTwitterImageIdSourceField\":\"featuredImage\",\"seoFacebookImageIdSource\":\"field\",\"seoFacebookImageIdSourceField\":\"featuredImage\",\"seoCommerceVariants\":null,\"__model__\":\"Craft\\\\Seomatic_MetaFieldModel\"}','--050',NULL,'2017-07-16 14:05:54','2017-07-16 14:05:54','0972d0e1-a5c5-4af3-bd27-d1f0524cf107');

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
	(3,'Category','{\"sourceOrder\":[[\"heading\",\"Settings\"],[\"key\",\"group:2\"],[\"heading\",\"Blog\"],[\"key\",\"group:1\"]],\"sources\":{\"group:1\":{\"tableAttributes\":{\"1\":\"link\"}}}}','2017-07-04 22:08:08','2017-07-04 22:08:36','5800665a-e36c-41ce-b880-f87a7a03d925');

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
	(2,'Entry',1,0,'2017-07-04 21:45:04','2017-07-05 21:34:43','e03cba08-abbf-4500-ba9c-502704e48f78'),
	(4,'Entry',1,0,'2017-07-04 22:00:57','2017-07-05 21:33:47','cba1ee13-1a0f-4ba9-aefd-54b2c80a7e55'),
	(5,'GlobalSet',1,0,'2017-07-04 22:01:04','2017-07-04 22:03:20','708ae318-3f09-49e3-9839-4e530ae511a9'),
	(6,'GlobalSet',1,0,'2017-07-04 22:01:04','2017-07-04 22:03:20','db06c4ce-1cb8-4c2b-bce8-2402f56b953f'),
	(7,'Category',1,0,'2017-07-05 20:08:13','2017-07-05 20:08:13','80dfd2d2-abac-4878-a8d5-2c6ced2f8f15'),
	(8,'SuperTable_Block',1,0,'2017-07-05 20:08:13','2017-07-05 20:08:13','8c9f1d41-5281-4b17-8796-f85573c4fb9d'),
	(9,'SuperTable_Block',1,0,'2017-07-05 20:08:13','2017-07-05 20:08:13','cba1a30c-9278-4d47-b32d-8e3ce1995823'),
	(10,'SuperTable_Block',1,0,'2017-07-05 21:33:19','2017-07-05 21:33:19','7364e1ea-afed-4617-a0b6-edd67ffa7777'),
	(11,'Entry',1,0,'2017-07-16 14:05:54','2017-07-16 14:05:54','7021e756-3fd2-46a0-ad2a-ee0309c9d166'),
	(12,'SuperTable_Block',1,0,'2017-07-16 14:05:54','2017-07-16 14:05:54','d2e32ad1-b529-4c82-a358-bc90967809c8');

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
	(2,2,'de','homepage','__home__',1,'2017-07-04 21:45:04','2017-07-05 21:34:43','974d33f2-d7ef-425f-959f-022b86c304c5'),
	(4,4,'de','404','404',1,'2017-07-04 22:00:57','2017-07-05 21:33:48','8e3d67f1-9249-4c1f-a99b-9aa785e2b239'),
	(5,5,'de','',NULL,1,'2017-07-04 22:01:04','2017-07-04 22:03:20','eab58c53-7331-412e-bdda-86dedb7ee256'),
	(6,6,'de','',NULL,1,'2017-07-04 22:01:04','2017-07-04 22:03:20','0544ef7d-f059-4c71-a262-f1579e86421f'),
	(7,5,'en','',NULL,1,'2017-07-04 22:03:20','2017-07-04 22:03:20','d39f95b0-d625-4895-9c27-1e36d74296ed'),
	(8,6,'en','',NULL,1,'2017-07-04 22:03:20','2017-07-04 22:03:20','74b24024-1f9e-4726-a798-c6d1254fd0e1'),
	(9,7,'de','carousel',NULL,1,'2017-07-05 20:08:13','2017-07-05 20:08:15','05195cb8-b220-48de-93e2-517c0f2704a9'),
	(10,7,'en','carousel',NULL,1,'2017-07-05 20:08:13','2017-07-05 20:08:15','217b24cd-352d-4c01-bf70-c3204ae434b2'),
	(11,8,'de','',NULL,1,'2017-07-05 20:08:13','2017-07-05 20:08:13','4748ccec-8b0d-457d-b45a-64c04a94b20b'),
	(12,8,'en','',NULL,1,'2017-07-05 20:08:13','2017-07-05 20:08:13','9f7aa1b5-bde2-4600-99dc-b08cec235e91'),
	(13,9,'de','',NULL,1,'2017-07-05 20:08:13','2017-07-05 20:08:13','e76c476d-2b6a-417b-a5c2-d84efd080b97'),
	(14,9,'en','',NULL,1,'2017-07-05 20:08:13','2017-07-05 20:08:13','afb32c4b-ad18-481a-9eab-ab1416eb6855'),
	(15,10,'de','',NULL,1,'2017-07-05 21:33:19','2017-07-05 21:33:19','2a645fcf-c92e-46fd-bb98-01bf9fa06b11'),
	(16,4,'en','404','404',1,'2017-07-05 21:33:48','2017-07-05 21:33:48','7459f1b5-ce3f-454a-9f7f-b1687b2eea15'),
	(17,2,'en','homepage','__home__',1,'2017-07-05 21:34:43','2017-07-05 21:34:43','3f9118d4-db28-4343-aa89-0908b07ec43f'),
	(18,11,'de','hello-world','blog/e/hello-world',1,'2017-07-16 14:05:54','2017-07-16 14:05:54','f0544f07-10fc-4eed-98eb-699504007849'),
	(19,11,'en','hello-world','blog/e/hello-world',1,'2017-07-16 14:05:54','2017-07-16 14:05:54','eef10dc6-05b4-403d-8d21-654b1df146f2'),
	(20,12,'de','',NULL,1,'2017-07-16 14:05:54','2017-07-16 14:05:54','7049b39a-1368-46e1-9a78-a231b84adab9'),
	(21,12,'en','',NULL,1,'2017-07-16 14:05:54','2017-07-16 14:05:54','512e3fb2-2182-4468-9256-301539afa596');

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
	(2,1,1,NULL,'2017-07-05 21:34:42',NULL,'2017-07-04 21:45:04','2017-07-05 21:34:42','a32f5949-bfff-425c-86c9-f54c7897194a'),
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
	(1,2,1,1,'de',1,NULL,'{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Homepage\",\"slug\":\"homepage\",\"postDate\":1499204704,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":[]}','2017-07-04 21:45:04','2017-07-04 21:45:04','965e0e98-f141-4aec-8609-7432da3b9bbb'),
	(2,2,1,1,'de',2,NULL,'{\"typeId\":null,\"authorId\":null,\"title\":\"Welcome to Ktest10.local!\",\"slug\":\"homepage\",\"postDate\":1499204704,\"expiryDate\":null,\"enabled\":\"1\",\"parentId\":null,\"fields\":{\"1\":\"<p>It\\u2019s true, this site doesn\\u2019t have a whole lot of content yet, but don\\u2019t worry. Our web developers have just installed the CMS, and they\\u2019re setting things up for the content editors this very moment. Soon Ktest10.local will be an oasis of fresh perspectives, sharp analyses, and astute opinions that will keep you coming back again and again.<\\/p>\"}}','2017-07-04 21:45:04','2017-07-04 21:45:04','313a8fdb-8604-476e-a329-fd73002135fd'),
	(4,4,3,1,'de',1,NULL,'{\"typeId\":\"3\",\"authorId\":null,\"title\":\"404\",\"slug\":\"404\",\"postDate\":1499205657,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":[]}','2017-07-04 22:00:57','2017-07-04 22:00:57','080283eb-ec61-454d-a304-325202f800b7'),
	(5,2,1,1,'de',3,'','{\"typeId\":null,\"authorId\":null,\"title\":\"Home\",\"slug\":\"homepage\",\"postDate\":1499204704,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"152\":\"\",\"62\":{\"new1\":{\"type\":\"14\",\"fields\":{\"photo\":\"\",\"headline\":\"\",\"linkit\":{\"type\":\"\",\"custom\":\"\",\"entry\":\"\",\"category\":\"\",\"customText\":\"\",\"target\":\"\"}}}},\"124\":{\"seoMainEntityCategory\":\"CreativeWork\",\"seoMainEntityOfPage\":\"Article\",\"seoTitleSource\":\"field\",\"seoTitleSourceField\":\"title\",\"seoTitleUnparsed\":\"\",\"seoDescriptionSource\":\"field\",\"seoDescriptionSourceField\":\"title\",\"seoDescriptionUnparsed\":\"\",\"seoKeywordsSource\":\"custom\",\"seoKeywordsSourceField\":\"title\",\"seoKeywordsUnparsed\":\"\",\"seoImageIdSource\":\"field\",\"seoImageId\":\"\",\"seoImageTransform\":\"\",\"twitterCardType\":\"summary_large_image\",\"seoTwitterImageIdSource\":\"field\",\"seoTwitterImageId\":\"\",\"seoTwitterImageTransform\":\"\",\"openGraphType\":\"article\",\"seoFacebookImageIdSource\":\"field\",\"seoFacebookImageId\":\"\",\"seoFacebookImageTransform\":\"\",\"robots\":\"all\"}}}','2017-07-05 21:33:19','2017-07-05 21:33:19','2bbf5018-03f0-48da-bc07-0cfe789d96b5'),
	(6,11,4,1,'de',1,'','{\"typeId\":null,\"authorId\":\"1\",\"title\":\"Hello World\",\"slug\":\"hello-world\",\"postDate\":1500213954,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"1\":\"<p>This is for SEO, OG and RSS Feed Content<\\/p>\",\"29\":\"\",\"30\":\"\",\"152\":\"\",\"42\":\"\",\"46\":{\"new1\":{\"type\":\"10\",\"fields\":{\"fullbleed\":\"\",\"ratio\":\"\"}}},\"124\":{\"seoMainEntityCategory\":\"CreativeWork\",\"seoMainEntityOfPage\":\"Article\",\"seoTitleSource\":\"field\",\"seoTitleSourceField\":\"title\",\"seoTitleUnparsed\":\"\",\"seoDescriptionSource\":\"field\",\"seoDescriptionSourceField\":\"body\",\"seoDescriptionUnparsed\":\"\",\"seoKeywordsSource\":\"custom\",\"seoKeywordsSourceField\":\"title\",\"seoKeywordsUnparsed\":\"\",\"seoImageIdSource\":\"field\",\"seoImageIdSourceField\":\"featuredImage\",\"seoImageId\":\"\",\"seoImageTransform\":\"\",\"twitterCardType\":\"summary_large_image\",\"seoTwitterImageIdSource\":\"field\",\"seoTwitterImageIdSourceField\":\"featuredImage\",\"seoTwitterImageId\":\"\",\"seoTwitterImageTransform\":\"\",\"openGraphType\":\"article\",\"seoFacebookImageIdSource\":\"field\",\"seoFacebookImageIdSourceField\":\"featuredImage\",\"seoFacebookImageId\":\"\",\"seoFacebookImageTransform\":\"\",\"robots\":\"all\"}}}','2017-07-16 14:05:54','2017-07-16 14:05:54','1aba8b7e-3eb9-437b-afa4-64d5062e18e7');

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
	(4,13,3,5,0,1,'2017-07-04 22:00:58','2017-07-04 22:00:58','c952eba5-d086-4850-b546-d67d6645e953'),
	(5,14,4,8,0,1,'2017-07-04 22:00:58','2017-07-04 22:00:58','244da357-ea8a-45f6-a8ec-de2a8bc68476'),
	(16,17,7,23,0,1,'2017-07-04 22:00:59','2017-07-04 22:00:59','3def6ada-5764-43ea-b3c9-a5064d7d04a4'),
	(17,17,7,24,0,2,'2017-07-04 22:00:59','2017-07-04 22:00:59','784d7cdc-9f5c-4128-968d-1ca37bdb2bb2'),
	(23,20,10,38,0,1,'2017-07-04 22:00:59','2017-07-04 22:00:59','0f2fc300-b891-4075-8cdd-757ee82a884f'),
	(24,20,10,39,0,2,'2017-07-04 22:00:59','2017-07-04 22:00:59','1a5ce808-3d79-493b-a657-0296632fce9b'),
	(25,20,10,40,0,3,'2017-07-04 22:00:59','2017-07-04 22:00:59','4070eb47-3e0d-438c-b18f-da5113816554'),
	(26,20,10,41,0,4,'2017-07-04 22:00:59','2017-07-04 22:00:59','bb73a3c0-1de7-4a1c-8565-e089ebdba934'),
	(29,22,12,47,0,1,'2017-07-04 22:00:59','2017-07-04 22:00:59','b49c1376-cf82-46f3-bb2b-e9de5ff1242b'),
	(30,22,12,48,0,2,'2017-07-04 22:00:59','2017-07-04 22:00:59','df91d248-40f5-4aba-9d6a-ae087aedb97d'),
	(36,25,15,59,0,1,'2017-07-04 22:01:00','2017-07-04 22:01:00','b485879e-9470-49af-bb43-f64590a46fa3'),
	(37,25,15,60,0,2,'2017-07-04 22:01:00','2017-07-04 22:01:00','2aa54c60-48df-425c-8177-cabdd8b3d045'),
	(38,25,15,61,0,3,'2017-07-04 22:01:00','2017-07-04 22:01:00','36610260-7668-4daa-89de-a694a25166c2'),
	(47,29,19,76,0,1,'2017-07-04 22:01:01','2017-07-04 22:01:01','aefe510e-cf8a-471a-9a1f-67d6320927aa'),
	(48,29,19,77,0,2,'2017-07-04 22:01:01','2017-07-04 22:01:01','9040cc3f-9972-470c-8e2f-5ae0ad694832'),
	(49,30,20,80,0,1,'2017-07-04 22:01:01','2017-07-04 22:01:01','13811e82-1343-434c-b1db-67d017146e88'),
	(50,30,20,81,0,2,'2017-07-04 22:01:01','2017-07-04 22:01:01','b290bb17-237b-45b6-9a46-5cbcae44a0cb'),
	(51,31,21,84,0,1,'2017-07-04 22:01:01','2017-07-04 22:01:01','da2079f9-439c-4027-9fb6-aa4d76c99425'),
	(52,31,21,85,0,2,'2017-07-04 22:01:01','2017-07-04 22:01:01','37076be0-c3ee-4a73-bac4-bc93d3e590ec'),
	(55,33,23,90,0,1,'2017-07-04 22:01:01','2017-07-04 22:01:01','6f1f9087-4755-4417-82ce-37e50fe5f134'),
	(56,33,23,91,0,2,'2017-07-04 22:01:01','2017-07-04 22:01:01','266230c3-4453-49b5-8baa-daec3814b49b'),
	(57,33,23,92,0,3,'2017-07-04 22:01:01','2017-07-04 22:01:01','c1e00170-bd2c-4b80-a749-693666fa65d8'),
	(60,35,25,97,0,1,'2017-07-04 22:01:01','2017-07-04 22:01:01','50391117-d74b-46b0-a7bf-c0efe3430ad3'),
	(61,36,26,100,0,1,'2017-07-04 22:01:02','2017-07-04 22:01:02','3a394bd1-d903-4ce3-b692-03b0211cd5b3'),
	(62,37,27,102,0,1,'2017-07-04 22:01:02','2017-07-04 22:01:02','67a5d6b9-8106-4b18-ac2a-30a71ce07bde'),
	(63,37,27,103,0,2,'2017-07-04 22:01:02','2017-07-04 22:01:02','a4240225-0248-4829-958a-1556ab8d375a'),
	(64,37,27,104,0,3,'2017-07-04 22:01:02','2017-07-04 22:01:02','cf8cedaf-1064-4871-9cf6-b80436fb61cd'),
	(65,37,27,105,0,4,'2017-07-04 22:01:02','2017-07-04 22:01:02','cee7cf76-149f-4220-ba75-1f358e6cc45d'),
	(66,37,27,106,0,5,'2017-07-04 22:01:02','2017-07-04 22:01:02','de524a1d-ba6e-4746-80f5-a4c1ba3df0e4'),
	(67,37,27,107,0,6,'2017-07-04 22:01:02','2017-07-04 22:01:02','491cf0b3-a13f-4ee9-8d7a-3dd434681ffa'),
	(68,37,27,108,0,7,'2017-07-04 22:01:02','2017-07-04 22:01:02','bbc63950-649c-4683-a60a-01d4a3b0e1d7'),
	(69,38,28,111,0,1,'2017-07-04 22:01:02','2017-07-04 22:01:02','10fbba00-13f3-4889-a2e6-28f924746731'),
	(70,38,28,112,0,2,'2017-07-04 22:01:02','2017-07-04 22:01:02','b25be3fe-3ab3-476a-a030-dcd4ec81d704'),
	(71,38,28,113,0,3,'2017-07-04 22:01:02','2017-07-04 22:01:02','541b5ff7-236e-43d3-8991-e0ad5bd09df3'),
	(72,39,29,115,0,1,'2017-07-04 22:01:02','2017-07-04 22:01:02','5f37e457-f604-4225-87a8-16211890cf1a'),
	(73,39,29,116,0,2,'2017-07-04 22:01:02','2017-07-04 22:01:02','5b87580e-95cc-4b45-9c72-7374d0eb49c9'),
	(74,39,29,117,0,3,'2017-07-04 22:01:02','2017-07-04 22:01:02','66227b30-ca14-4e4f-93ed-f711e246f4ca'),
	(75,40,30,119,0,1,'2017-07-04 22:01:02','2017-07-04 22:01:02','85ab57c2-e02a-414c-b943-75af918b3874'),
	(76,40,30,120,0,2,'2017-07-04 22:01:02','2017-07-04 22:01:02','c6b9db23-c623-4df7-90d8-786f8ce83827'),
	(77,40,30,121,0,3,'2017-07-04 22:01:02','2017-07-04 22:01:02','9ab6a940-5942-49f3-abb4-3769d38bb8a6'),
	(78,40,30,122,0,4,'2017-07-04 22:01:02','2017-07-04 22:01:02','43c6de9f-2762-47b6-a05a-6523d47afbf9'),
	(81,42,32,129,0,1,'2017-07-04 22:01:03','2017-07-04 22:01:03','20b82be2-000d-45ea-975f-9ed4661f8312'),
	(82,43,33,131,0,1,'2017-07-04 22:01:03','2017-07-04 22:01:03','d67f5453-8769-4b7d-b189-56197d230619'),
	(83,43,33,132,0,2,'2017-07-04 22:01:03','2017-07-04 22:01:03','993e5776-c2db-40c1-b70d-efab3deebe03'),
	(84,43,33,133,0,3,'2017-07-04 22:01:03','2017-07-04 22:01:03','4a435e67-dd8c-496c-9108-570f01195232'),
	(85,43,33,134,0,4,'2017-07-04 22:01:03','2017-07-04 22:01:03','f85e827f-6f83-4b25-809e-44b1dc197d25'),
	(86,43,33,135,0,5,'2017-07-04 22:01:03','2017-07-04 22:01:03','97e1b538-e5e8-4dab-8048-309d95f919c5'),
	(87,43,33,136,0,6,'2017-07-04 22:01:03','2017-07-04 22:01:03','62d29ab4-ee80-4f55-8fed-a0c6c6a3e139'),
	(88,44,34,138,0,1,'2017-07-04 22:01:03','2017-07-04 22:01:03','07f7541c-545b-4e02-acfa-8d43d0b06b48'),
	(89,44,34,139,0,2,'2017-07-04 22:01:03','2017-07-04 22:01:03','10ff86de-3182-46a7-b95d-83305f073f47'),
	(90,44,34,140,0,3,'2017-07-04 22:01:03','2017-07-04 22:01:03','aff44290-5af4-43fd-8ae1-6d06092fe3a7'),
	(91,44,34,141,0,4,'2017-07-04 22:01:03','2017-07-04 22:01:03','7f25814c-f888-4a31-9515-41057cccb158'),
	(92,44,34,142,0,5,'2017-07-04 22:01:03','2017-07-04 22:01:03','d3b4991a-555a-4ccf-90d6-703c321b13c0'),
	(93,44,34,143,0,6,'2017-07-04 22:01:03','2017-07-04 22:01:03','aeed4c68-aa27-44da-a526-0d651b36aeff'),
	(97,46,36,151,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','0ade2f3e-3ec3-493d-b431-30cd37845fb9'),
	(98,47,37,57,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','9a6c79af-8687-4035-ae8b-2c82c90de573'),
	(99,47,38,58,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','9a3b8d87-60e6-4c4f-915e-46f7fb357261'),
	(100,48,39,98,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','e081fd16-e24e-4f47-994d-8379cd9be725'),
	(101,48,40,99,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','d36844cc-46b7-423a-8ede-b47fc7b79c7a'),
	(102,49,41,82,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','37c25c47-b706-4af1-83a2-54b585f2fc71'),
	(103,49,42,83,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','a739ba0f-c20e-4d1b-9471-c3ce41b3c0ca'),
	(104,50,43,78,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','b7e00da9-ce64-499b-82b3-968f1dfc40e8'),
	(105,50,44,79,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','a7b0fbc7-1eca-46e5-a6c4-39c1d1c5b258'),
	(106,51,45,93,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','d485a233-6c7b-4148-b48c-ed60140ed4cd'),
	(107,51,46,96,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','c4a1f986-d1fb-4039-98ff-ca233390f8ed'),
	(108,52,47,86,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','71a92a06-2d91-4abc-98d7-bb81c2ceff64'),
	(109,52,48,89,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','0aff90aa-b2c1-4607-a4a0-64ded1e18dc0'),
	(110,53,49,33,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','845363e5-4fd2-44c4-b57f-cc9e65302cf5'),
	(111,53,50,37,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','c8366e1e-4051-4216-a4bb-6092cd08c2da'),
	(112,54,51,15,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','39e8105d-aef0-4420-a74a-ce798b8dbb50'),
	(113,54,52,22,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','b1339a2f-27e6-4b50-815f-a883148e9674'),
	(114,55,53,50,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','86ae9bb0-aa4f-40d8-a096-2e9fd87f181b'),
	(115,55,54,53,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','7eb8b7cd-0ff6-4f35-8cfb-610f9b3348dd'),
	(116,56,55,67,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','30f6b0fd-8ef0-4b2d-9d5f-e5edaea53ad5'),
	(117,56,56,68,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','1a8cbfb5-b50c-47c9-90ec-02e0077052b1'),
	(118,57,57,25,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','a9279a8e-4655-4339-9569-ea6f151ea892'),
	(119,57,58,26,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','ca24a5c3-16f9-4a9f-a8b4-a10edab54ff7'),
	(120,58,59,9,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','0643a574-7a33-4b02-ac1f-b8970aff6734'),
	(121,58,60,10,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','971cf587-2c68-4861-a42b-758677ff1da1'),
	(122,59,61,125,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','8a54113e-f2ae-4e03-8227-f258e171b487'),
	(123,59,62,128,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','a13b2e8a-3463-48fa-9ffd-ecbe6dc3df80'),
	(124,60,63,72,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','0ea7c921-9405-468a-bdde-203a798855b9'),
	(125,60,64,75,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','56507a5d-eb54-4eb6-b2f8-c43d1132e068'),
	(126,61,65,6,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','46a69d75-0844-4a3a-afbe-09ac08692429'),
	(127,61,66,7,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','365a9f64-bfbc-4014-8ccc-38d0a054642c'),
	(128,62,67,66,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','7a74ec81-2dcd-4377-874d-41f84a3d21f6'),
	(129,63,68,148,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','b97e53ac-460f-43f4-b9b4-fb87cf9d0a00'),
	(130,64,69,123,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','075d21ce-039b-44a7-be73-6195b416073a'),
	(131,64,70,118,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','a19ae68c-ba91-4605-ace4-dfce1e92c8a2'),
	(132,64,70,114,0,2,'2017-07-04 22:01:04','2017-07-04 22:01:04','d05043cc-0bc8-4e31-85fe-155ae8b7ff3f'),
	(133,64,70,101,0,3,'2017-07-04 22:01:04','2017-07-04 22:01:04','fcafd6fa-3856-4e9e-9d0d-fc66ea8d3ce8'),
	(134,65,71,109,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','3250b501-9b49-423d-9a9a-362bdd2ab45d'),
	(135,65,72,110,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','7f973354-5d5b-488c-94ad-42ffae5a5d9c'),
	(136,66,73,4,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','19765b04-4314-4bc3-82bc-4427c678196e'),
	(137,67,74,3,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','e6f2deab-27d5-4199-9fb7-abefe9e7329c'),
	(138,68,75,150,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','7dda3ddf-35cc-43cc-91ca-a347e22b06c8'),
	(139,69,76,149,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','4ff3a0bd-449e-404c-b7af-60f9e962c0a0'),
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
	(166,77,94,144,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','487f1e2d-80ee-4f04-bfc3-aa646fe22189'),
	(167,77,94,32,0,2,'2017-07-04 22:01:04','2017-07-04 22:01:04','4569c2b4-8984-4b8b-b807-5056b74130da'),
	(168,78,95,1,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','548fa82f-f87b-42a9-9660-896680bef8f1'),
	(169,78,95,152,0,2,'2017-07-04 22:01:04','2017-07-04 22:01:04','9aae5bea-7909-4296-b9c6-a0872709d2f0'),
	(170,78,96,42,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','78d585dc-5979-4e36-911e-0fbef241d348'),
	(171,78,96,46,0,2,'2017-07-04 22:01:04','2017-07-04 22:01:04','ab77de9d-0460-43db-80c5-45b6ec80cbf7'),
	(172,78,96,43,0,3,'2017-07-04 22:01:04','2017-07-04 22:01:04','4824f480-6463-4920-bfb3-32bf8ccca35e'),
	(173,78,97,124,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','52b2f271-01a0-4901-bfa0-0700cf899fd3'),
	(174,79,98,137,0,1,'2017-07-04 22:01:04','2017-07-04 22:01:04','b23035b6-bc28-452e-b923-c32789e1c359'),
	(175,79,98,130,0,2,'2017-07-04 22:01:04','2017-07-04 22:01:04','6a2e4148-4bb6-4ad9-8fc7-c51ede6367bc'),
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
	(190,84,103,34,0,1,'2017-07-05 19:46:26','2017-07-05 19:46:26','c449cb14-9993-49c4-87a2-e68f25b4e5dc'),
	(191,84,103,35,0,2,'2017-07-05 19:46:26','2017-07-05 19:46:26','e21c21bd-bd8a-4004-a4f1-60605e47a458'),
	(192,84,103,36,0,3,'2017-07-05 19:46:26','2017-07-05 19:46:26','10cd5d8e-de41-4d85-8fb2-730a5b2449b5'),
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
	(203,90,109,11,0,1,'2017-07-05 19:58:39','2017-07-05 19:58:39','cf5c3068-4c17-44a0-be72-d255c49a6ad4'),
	(204,90,109,12,0,2,'2017-07-05 19:58:39','2017-07-05 19:58:39','f6a03c73-e09a-45d2-9164-c5529c8afa40'),
	(205,90,109,13,0,3,'2017-07-05 19:58:39','2017-07-05 19:58:39','7c2cbf46-135c-47c6-897c-240750dab1e2'),
	(206,90,109,14,0,4,'2017-07-05 19:58:39','2017-07-05 19:58:39','068ae5df-f27a-421f-87c2-0c2b33ee70c2'),
	(207,91,110,27,0,1,'2017-07-05 19:59:30','2017-07-05 19:59:30','4de72505-359b-4db6-be96-fb06f99ed353'),
	(208,91,110,28,0,2,'2017-07-05 19:59:30','2017-07-05 19:59:30','9a7fae18-31b3-4cb5-8ad2-5495b5ccdedd'),
	(209,92,111,54,0,1,'2017-07-05 20:01:59','2017-07-05 20:01:59','eb1eeb45-2c6e-4e88-8aef-a989f5600dde'),
	(210,92,111,55,0,2,'2017-07-05 20:01:59','2017-07-05 20:01:59','8ed4a56c-4441-4198-8ff7-f881df926583'),
	(211,92,111,56,0,3,'2017-07-05 20:01:59','2017-07-05 20:01:59','a027fa62-0143-4169-afb5-fd072caf766f'),
	(212,93,112,69,0,1,'2017-07-05 20:03:04','2017-07-05 20:03:04','4705c281-a67c-4d6e-9862-231c7d576b18'),
	(213,93,112,70,0,2,'2017-07-05 20:03:04','2017-07-05 20:03:04','2d92e231-78c8-4eb9-b30a-14cda89d1255'),
	(214,93,112,71,0,3,'2017-07-05 20:03:04','2017-07-05 20:03:04','5528ba95-2583-4a9d-8266-29fe921fc81a'),
	(215,94,113,152,0,1,'2017-07-05 21:42:35','2017-07-05 21:42:35','e1463f60-88ff-48df-a4d3-05364f07b574'),
	(216,94,114,42,0,1,'2017-07-05 21:42:35','2017-07-05 21:42:35','964e0575-25af-4e48-b82d-e47d6ad64315'),
	(217,94,114,46,0,2,'2017-07-05 21:42:35','2017-07-05 21:42:35','e1ce04db-e095-40a9-b116-8a812b5e6ec7'),
	(218,94,114,43,0,3,'2017-07-05 21:42:35','2017-07-05 21:42:35','1ddf4b04-43f3-49b9-8d0b-d218efa97183'),
	(219,94,115,124,0,1,'2017-07-05 21:42:35','2017-07-05 21:42:35','54d7a372-8749-41a0-a7db-2fd9f6026d84');

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
	(13,'SuperTable_Block','2017-07-04 22:00:58','2017-07-04 22:00:58','228b2d13-cc8f-4e8a-92a2-eb9c48e8c70f'),
	(14,'SuperTable_Block','2017-07-04 22:00:58','2017-07-04 22:00:58','1b636996-9dd4-42dc-ad4c-8805ba93560e'),
	(17,'SuperTable_Block','2017-07-04 22:00:59','2017-07-04 22:00:59','f8211dc4-a97f-467e-a3a1-3f4a632ace92'),
	(20,'SuperTable_Block','2017-07-04 22:00:59','2017-07-04 22:00:59','f710f7d3-ee03-480a-9aae-c17dee6086ff'),
	(22,'SuperTable_Block','2017-07-04 22:00:59','2017-07-04 22:00:59','e224a1ac-3f07-4868-86b5-98e893241a62'),
	(25,'SuperTable_Block','2017-07-04 22:01:00','2017-07-04 22:01:00','c546d14c-b6c2-41c1-9e6c-99cf3c7e848c'),
	(29,'SuperTable_Block','2017-07-04 22:01:01','2017-07-04 22:01:01','fc5fcab0-7a37-4c8f-b992-ac79981f3571'),
	(30,'SuperTable_Block','2017-07-04 22:01:01','2017-07-04 22:01:01','c33d60eb-79ea-4185-a93b-f5f913aaf441'),
	(31,'SuperTable_Block','2017-07-04 22:01:01','2017-07-04 22:01:01','7ffbec27-efa5-4f55-891d-915fb81a21ba'),
	(33,'SuperTable_Block','2017-07-04 22:01:01','2017-07-04 22:01:01','4b0ef6c3-3e39-474f-8f91-a8e0fe439e4c'),
	(35,'SuperTable_Block','2017-07-04 22:01:01','2017-07-04 22:01:01','22ce161e-ee84-458c-b950-832f2978682d'),
	(36,'SuperTable_Block','2017-07-04 22:01:02','2017-07-04 22:01:02','26d8ce7d-95e0-4123-a9cc-a85cef53a12d'),
	(37,'SuperTable_Block','2017-07-04 22:01:02','2017-07-04 22:01:02','0b5b1814-d7b3-43c9-8555-b8b5f2707fd8'),
	(38,'SuperTable_Block','2017-07-04 22:01:02','2017-07-04 22:01:02','64f1504d-04a2-4a6d-8806-96a0a9707642'),
	(39,'SuperTable_Block','2017-07-04 22:01:02','2017-07-04 22:01:02','07cfef50-6326-4a6e-a464-23c8e9869494'),
	(40,'SuperTable_Block','2017-07-04 22:01:02','2017-07-04 22:01:02','58f63c10-5bdf-45fd-a27c-5d2d9f8a131f'),
	(42,'SuperTable_Block','2017-07-04 22:01:03','2017-07-04 22:01:03','272d3afb-e481-43e8-b373-dd1cd3773095'),
	(43,'SuperTable_Block','2017-07-04 22:01:03','2017-07-04 22:01:03','473b8a14-c1a2-484a-8e9f-b6b894b2e0d2'),
	(44,'SuperTable_Block','2017-07-04 22:01:03','2017-07-04 22:01:03','65d887bd-f125-4395-b3c7-eb351ed72ce4'),
	(46,'SuperTable_Block','2017-07-04 22:01:04','2017-07-04 22:01:04','c090832c-3917-4a23-82f6-310ea979a773'),
	(47,'Neo_Block','2017-07-04 22:01:04','2017-07-04 22:01:04','5e7252dd-64e8-4aa6-b752-d9db37e9ed43'),
	(48,'Neo_Block','2017-07-04 22:01:04','2017-07-04 22:01:04','82d286f6-776b-40a4-a665-bb49b67e15a0'),
	(49,'Neo_Block','2017-07-04 22:01:04','2017-07-04 22:01:04','1e926c22-6c56-4d1f-9aa2-69eb74f82c39'),
	(50,'Neo_Block','2017-07-04 22:01:04','2017-07-04 22:01:04','a9aea2ad-0241-4f46-bc78-9c9b54513a9f'),
	(51,'Neo_Block','2017-07-04 22:01:04','2017-07-04 22:01:04','40ec5335-02fe-4c0a-b6b8-a950926ce4d8'),
	(52,'Neo_Block','2017-07-04 22:01:04','2017-07-04 22:01:04','5752f9d5-da90-4599-a18e-1a28eabd64ba'),
	(53,'Neo_Block','2017-07-04 22:01:04','2017-07-04 22:01:04','48fef88a-0c3a-4d05-a259-cbd668a2c30f'),
	(54,'Neo_Block','2017-07-04 22:01:04','2017-07-04 22:01:04','5939b1ed-ca2c-4adc-8000-c8526754be96'),
	(55,'Neo_Block','2017-07-04 22:01:04','2017-07-04 22:01:04','e1ec603f-7652-4f5d-ac0b-ca0989a86b84'),
	(56,'Neo_Block','2017-07-04 22:01:04','2017-07-04 22:01:04','814bd146-2761-4abc-861f-60e6598dba8b'),
	(57,'Neo_Block','2017-07-04 22:01:04','2017-07-04 22:01:04','7e80b917-b332-492a-bd01-a477112a8f8c'),
	(58,'Neo_Block','2017-07-04 22:01:04','2017-07-04 22:01:04','30f1261f-e6a6-4d76-b860-ac043c4b407b'),
	(59,'Neo_Block','2017-07-04 22:01:04','2017-07-04 22:01:04','8be5200b-8450-4649-a3c4-15918d997fe2'),
	(60,'Neo_Block','2017-07-04 22:01:04','2017-07-04 22:01:04','d5229d37-d33e-4660-be35-7c0a022483d4'),
	(61,'Neo_Block','2017-07-04 22:01:04','2017-07-04 22:01:04','5aa798ca-433e-4a8f-8209-8af989a785d1'),
	(62,'Neo_Block','2017-07-04 22:01:04','2017-07-04 22:01:04','7fcf0505-5647-490a-ae90-dab255673a81'),
	(63,'Neo_Block','2017-07-04 22:01:04','2017-07-04 22:01:04','97ed133f-9531-495c-b731-1e8be519ba1a'),
	(64,'Neo_Block','2017-07-04 22:01:04','2017-07-04 22:01:04','9fa533f6-dc18-49ee-85f4-bd62b9fa3191'),
	(65,'Neo_Block','2017-07-04 22:01:04','2017-07-04 22:01:04','ccb8a710-d824-4829-a0fa-b8c6e9c53c80'),
	(66,'Neo_Block','2017-07-04 22:01:04','2017-07-04 22:01:04','b3f4f027-7e56-46d3-bb92-ab39fd495a11'),
	(67,'Neo_Block','2017-07-04 22:01:04','2017-07-04 22:01:04','7eaa46ba-956c-4b46-8815-692019e6b36e'),
	(68,'Neo_Block','2017-07-04 22:01:04','2017-07-04 22:01:04','2872772b-791d-46e5-b496-9daa765d111b'),
	(69,'Neo_Block','2017-07-04 22:01:04','2017-07-04 22:01:04','f0e80404-cae0-4f17-a4cf-cca7e33011c6'),
	(70,'Asset','2017-07-04 22:01:04','2017-07-04 22:01:04','0d775a4e-4adf-44bf-bfa3-45886ca4274e'),
	(71,'Entry','2017-07-04 22:01:04','2017-07-04 22:01:04','99e7ec71-bd5d-4680-aaec-b324025837cb'),
	(72,'Entry','2017-07-04 22:01:04','2017-07-04 22:01:04','274b2bac-9df5-4840-9b31-41811995e52c'),
	(73,'Entry','2017-07-04 22:01:04','2017-07-04 22:01:04','cd9eab50-de40-4812-b1fb-28880078d1bc'),
	(74,'Entry','2017-07-04 22:01:04','2017-07-04 22:01:04','be70f1b1-9f1a-408e-b407-3532828f4daa'),
	(76,'GlobalSet','2017-07-04 22:01:04','2017-07-04 22:01:04','852b2c7c-b9ad-4faa-867f-dae67ae11554'),
	(77,'GlobalSet','2017-07-04 22:01:04','2017-07-04 22:01:04','88d10fa3-57c7-45f2-b1b3-d45a7514c5d9'),
	(78,'Category','2017-07-04 22:01:04','2017-07-04 22:01:04','6a49b926-0b0e-4879-9dc4-39d03a2a1e23'),
	(79,'Category','2017-07-04 22:01:04','2017-07-04 22:01:04','ef46bca7-eee1-4b4e-a034-25cc3a451f7c'),
	(80,'SuperTable_Block','2017-07-04 22:15:15','2017-07-04 22:15:15','42a99583-0baf-4109-8572-c42df62f067d'),
	(81,'SuperTable_Block','2017-07-04 22:15:50','2017-07-04 22:15:50','44d18cd4-9862-4e0b-8372-4f6b589f74e7'),
	(82,'SuperTable_Block','2017-07-04 22:16:21','2017-07-04 22:16:21','9e355cb0-7fb9-43d5-8265-a819a35b5652'),
	(83,'SuperTable_Block','2017-07-05 19:45:58','2017-07-05 19:45:58','809bf866-392f-4ee9-b190-23a0ef42f988'),
	(84,'SuperTable_Block','2017-07-05 19:46:26','2017-07-05 19:46:26','4474a66e-b024-4f52-ad9a-9c2def1460f6'),
	(85,'SuperTable_Block','2017-07-05 19:47:03','2017-07-05 19:47:03','7376dd31-4e2d-4751-b50e-dd8afb1dfbd4'),
	(86,'SuperTable_Block','2017-07-05 19:48:20','2017-07-05 19:48:20','dc37a271-9904-4b81-a17a-813087a8907f'),
	(87,'SuperTable_Block','2017-07-05 19:49:41','2017-07-05 19:49:41','ea7ac693-2c30-4dbf-aa54-a1c6d4a6caeb'),
	(88,'SuperTable_Block','2017-07-05 19:50:10','2017-07-05 19:50:10','3f0d9dc8-f14b-46b9-a1c4-0877d235fe5a'),
	(89,'SuperTable_Block','2017-07-05 19:51:16','2017-07-05 19:51:16','b7271d76-638b-4dbc-91cb-6fb2c4e8f6c5'),
	(90,'SuperTable_Block','2017-07-05 19:58:39','2017-07-05 19:58:39','a3da5964-ccff-4d53-866f-d500a870493a'),
	(91,'SuperTable_Block','2017-07-05 19:59:30','2017-07-05 19:59:30','63705041-d9af-4bac-bbd9-952e0496710c'),
	(92,'SuperTable_Block','2017-07-05 20:01:59','2017-07-05 20:01:59','c8da7ded-ea2b-46f0-9b51-f42d254aa4e5'),
	(93,'SuperTable_Block','2017-07-05 20:03:04','2017-07-05 20:03:04','c6331cd8-359e-4946-af14-aba2e5ad37f4'),
	(94,'Entry','2017-07-05 21:42:35','2017-07-05 21:42:35','eb636e4a-9866-46d5-9f71-1f8af1f56607');

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
	(3,13,'Content',1,'2017-07-04 22:00:58','2017-07-04 22:00:58','923bbef9-1bf5-4091-bf6c-2fbb52b78bf2'),
	(4,14,'Content',1,'2017-07-04 22:00:58','2017-07-04 22:00:58','7cf0bfd4-e7f8-4c73-bb7a-f368a992b01d'),
	(7,17,'Content',1,'2017-07-04 22:00:59','2017-07-04 22:00:59','b158ceb8-cafd-4f4b-b3c3-06399a85efb1'),
	(10,20,'Content',1,'2017-07-04 22:00:59','2017-07-04 22:00:59','2dc798ab-f54e-4744-be66-53a5846dd26d'),
	(12,22,'Content',1,'2017-07-04 22:00:59','2017-07-04 22:00:59','d9e99c94-b136-4a15-bb59-e46abf59472e'),
	(15,25,'Content',1,'2017-07-04 22:01:00','2017-07-04 22:01:00','e1d6a7cc-1adb-4cb0-8ffc-519dc9b6afd6'),
	(19,29,'Content',1,'2017-07-04 22:01:01','2017-07-04 22:01:01','d2db42ba-a18d-4eb7-bb59-240634523ac3'),
	(20,30,'Content',1,'2017-07-04 22:01:01','2017-07-04 22:01:01','754064b4-9351-421f-8583-af6dbb522bd2'),
	(21,31,'Content',1,'2017-07-04 22:01:01','2017-07-04 22:01:01','1e5e1bba-6126-476f-b2a9-32dc9e3c7a44'),
	(23,33,'Content',1,'2017-07-04 22:01:01','2017-07-04 22:01:01','2218f8aa-49de-4bfd-8f72-a59109ff7372'),
	(25,35,'Content',1,'2017-07-04 22:01:01','2017-07-04 22:01:01','dc17a42c-c8eb-4a20-ab52-40da65b41d81'),
	(26,36,'Content',1,'2017-07-04 22:01:02','2017-07-04 22:01:02','982b8e60-7701-47b0-84de-89ad36de1707'),
	(27,37,'Content',1,'2017-07-04 22:01:02','2017-07-04 22:01:02','00b66ddb-096a-476b-88d4-b7b66713a147'),
	(28,38,'Content',1,'2017-07-04 22:01:02','2017-07-04 22:01:02','ea249892-04c5-4671-9753-d699e4d0ab14'),
	(29,39,'Content',1,'2017-07-04 22:01:02','2017-07-04 22:01:02','37e8a986-ce07-4723-bc83-7834bf1ab823'),
	(30,40,'Content',1,'2017-07-04 22:01:02','2017-07-04 22:01:02','4e109252-a2b6-4ad7-808e-7bf69b22989a'),
	(32,42,'Content',1,'2017-07-04 22:01:03','2017-07-04 22:01:03','68d24a94-fa2e-4a84-909e-40eda9c9d460'),
	(33,43,'Content',1,'2017-07-04 22:01:03','2017-07-04 22:01:03','abd3e179-602e-49c4-a866-b8c4f675d841'),
	(34,44,'Content',1,'2017-07-04 22:01:03','2017-07-04 22:01:03','580c8ce8-c4c8-4513-a91d-4c2fd1227300'),
	(36,46,'Content',1,'2017-07-04 22:01:04','2017-07-04 22:01:04','f588e7b0-20ec-4470-a9be-d359ef790f9a'),
	(37,47,'Main',1,'2017-07-04 22:01:04','2017-07-04 22:01:04','8a2dcabb-7927-4d5a-af6a-2fb863e3d76c'),
	(38,47,'Options',2,'2017-07-04 22:01:04','2017-07-04 22:01:04','afc82c86-b692-49a2-9ae7-45d65a467cf2'),
	(39,48,'Main',1,'2017-07-04 22:01:04','2017-07-04 22:01:04','41dcb710-495f-443f-b481-3e1d3d2be6c1'),
	(40,48,'Options',2,'2017-07-04 22:01:04','2017-07-04 22:01:04','a6216289-d2ae-40a2-9322-b93ff0b7ffb6'),
	(41,49,'Main',1,'2017-07-04 22:01:04','2017-07-04 22:01:04','0c6b76c1-17a7-4cfe-8b6e-03037b799fb3'),
	(42,49,'Options',2,'2017-07-04 22:01:04','2017-07-04 22:01:04','d9488817-6078-4a97-a05f-f8ddd458a6f6'),
	(43,50,'Main',1,'2017-07-04 22:01:04','2017-07-04 22:01:04','bd8fdcbd-1ce5-4403-abbd-dbfb042fe095'),
	(44,50,'Options',2,'2017-07-04 22:01:04','2017-07-04 22:01:04','90e5eeed-df28-45f1-9dd0-602d7543228c'),
	(45,51,'Main',1,'2017-07-04 22:01:04','2017-07-04 22:01:04','43551e52-3401-494d-a6f9-31c42ef048f2'),
	(46,51,'Options',2,'2017-07-04 22:01:04','2017-07-04 22:01:04','b456c0dc-b151-4b7b-8e26-1520369873a2'),
	(47,52,'Main',1,'2017-07-04 22:01:04','2017-07-04 22:01:04','e6c794e6-421c-4bb0-a61f-0c756fe68181'),
	(48,52,'Options',2,'2017-07-04 22:01:04','2017-07-04 22:01:04','8923cad7-f093-4cd5-a3ba-d728aff36711'),
	(49,53,'Main',1,'2017-07-04 22:01:04','2017-07-04 22:01:04','05e2862c-02ea-4852-a2e4-182f7a57df18'),
	(50,53,'Options',2,'2017-07-04 22:01:04','2017-07-04 22:01:04','5bafa147-6ee1-4164-8c12-b829a5849bf2'),
	(51,54,'Main',1,'2017-07-04 22:01:04','2017-07-04 22:01:04','701cfba0-5845-42ed-bfd9-4cb33ecf4f11'),
	(52,54,'Options',2,'2017-07-04 22:01:04','2017-07-04 22:01:04','8b95abd4-a663-4575-bc8b-8d9705eb3462'),
	(53,55,'Main',1,'2017-07-04 22:01:04','2017-07-04 22:01:04','0852d201-0c11-4566-abd6-4fbb19c77f9c'),
	(54,55,'Options',2,'2017-07-04 22:01:04','2017-07-04 22:01:04','4c405357-ffcb-480c-ac76-0b37b7087cbc'),
	(55,56,'Main',1,'2017-07-04 22:01:04','2017-07-04 22:01:04','187f8127-11df-4ef1-89b2-05a9abce3892'),
	(56,56,'Options',2,'2017-07-04 22:01:04','2017-07-04 22:01:04','eedebcac-43f9-4612-9e12-fe52b1570932'),
	(57,57,'Main',1,'2017-07-04 22:01:04','2017-07-04 22:01:04','335e4d51-a625-40e7-8a59-f88cb6ca0c8c'),
	(58,57,'Options',2,'2017-07-04 22:01:04','2017-07-04 22:01:04','40bcf1d2-c797-460a-b8a0-3234a386b88e'),
	(59,58,'Main',1,'2017-07-04 22:01:04','2017-07-04 22:01:04','2efa7897-ed9c-44ab-93c0-9065c6ef8b69'),
	(60,58,'Options',2,'2017-07-04 22:01:04','2017-07-04 22:01:04','0d8fbc67-80f1-4765-a9ef-9321599ecc7c'),
	(61,59,'Main',1,'2017-07-04 22:01:04','2017-07-04 22:01:04','07434fb2-9148-44d7-99ff-28f935d4b8d6'),
	(62,59,'Options',2,'2017-07-04 22:01:04','2017-07-04 22:01:04','53ea768f-8a59-4ece-a71e-5f5ba7a45d7b'),
	(63,60,'Main',1,'2017-07-04 22:01:04','2017-07-04 22:01:04','100ae68f-cb70-49bf-b8d5-d45fac07a544'),
	(64,60,'Options',2,'2017-07-04 22:01:04','2017-07-04 22:01:04','f40b170d-f023-4184-a96d-da13e53e4cd4'),
	(65,61,'Main',1,'2017-07-04 22:01:04','2017-07-04 22:01:04','334d6106-2696-431e-b5c5-09a2e876368b'),
	(66,61,'Options',2,'2017-07-04 22:01:04','2017-07-04 22:01:04','ea9b6b35-b676-4ad4-b9fb-52e74d4a8d36'),
	(67,62,'Tab 1',1,'2017-07-04 22:01:04','2017-07-04 22:01:04','ddee2bbc-b842-4812-b227-62c34b029b7b'),
	(68,63,'Tab 1',1,'2017-07-04 22:01:04','2017-07-04 22:01:04','c341b623-63a0-49f0-aabc-47f562044b46'),
	(69,64,'Main',1,'2017-07-04 22:01:04','2017-07-04 22:01:04','4ebfffc9-da12-403d-985b-daed1f959a18'),
	(70,64,'Layout',2,'2017-07-04 22:01:04','2017-07-04 22:01:04','4dbf3c2b-1e7c-44db-9e85-3ca5fcebe49f'),
	(71,65,'Main',1,'2017-07-04 22:01:04','2017-07-04 22:01:04','d8bc4267-36fc-40cd-a68b-de01522aa1b1'),
	(72,65,'Options',2,'2017-07-04 22:01:04','2017-07-04 22:01:04','0e6c8f1b-df36-49a4-bb38-5baa76ce88a7'),
	(73,66,'Tab 1',1,'2017-07-04 22:01:04','2017-07-04 22:01:04','987e8a96-e26f-4ff9-b3f8-9ad38098f79a'),
	(74,67,'Tab 1',1,'2017-07-04 22:01:04','2017-07-04 22:01:04','cb26fa31-2542-4c77-b7d4-8680426eb6cc'),
	(75,68,'Tab 1',1,'2017-07-04 22:01:04','2017-07-04 22:01:04','6740d945-54bd-4cd9-97e3-198629544ef2'),
	(76,69,'Tab 1',1,'2017-07-04 22:01:04','2017-07-04 22:01:04','437b9ee4-8cc4-441f-823a-4da1b18d2c8b'),
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
	(94,77,'Inhalt',1,'2017-07-04 22:01:04','2017-07-04 22:01:04','561f08ba-98f6-48ce-b7a8-c9241e174283'),
	(95,78,'Content',1,'2017-07-04 22:01:04','2017-07-04 22:01:04','2cde8675-1490-4d46-8240-f1de8bba5e02'),
	(96,78,'Featured Image',2,'2017-07-04 22:01:04','2017-07-04 22:01:04','5e0b03d0-cfe4-4bd1-9208-c391741fdec1'),
	(97,78,'Seo',3,'2017-07-04 22:01:04','2017-07-04 22:01:04','c988af3d-fbb9-445a-aa05-7ca3953edb05'),
	(98,79,'Tab 1',1,'2017-07-04 22:01:04','2017-07-04 22:01:04','f6511752-3d04-43ed-8139-4c25e09875de'),
	(99,80,'Content',1,'2017-07-04 22:15:15','2017-07-04 22:15:15','69490453-b3c5-419e-9ca2-89fc5b068bfe'),
	(100,81,'Content',1,'2017-07-04 22:15:50','2017-07-04 22:15:50','a85735ac-d8c0-452d-b85d-829b156fb366'),
	(101,82,'Content',1,'2017-07-04 22:16:21','2017-07-04 22:16:21','f236d76b-dd3a-49af-88ee-c2562ca551ca'),
	(102,83,'Content',1,'2017-07-05 19:45:58','2017-07-05 19:45:58','f99c4065-90a2-46f2-8aa9-9d63eedc3b51'),
	(103,84,'Content',1,'2017-07-05 19:46:26','2017-07-05 19:46:26','e42ae888-7a5e-49e0-8283-79b55c13cebe'),
	(104,85,'Content',1,'2017-07-05 19:47:03','2017-07-05 19:47:03','63e5b111-ada3-43bb-910b-e1a9ecf2344e'),
	(105,86,'Content',1,'2017-07-05 19:48:20','2017-07-05 19:48:20','a514e701-ee15-4641-9fd0-967c90c471be'),
	(106,87,'Content',1,'2017-07-05 19:49:41','2017-07-05 19:49:41','b1bf1a5b-2f3a-4e2f-a940-414ad9b07f90'),
	(107,88,'Content',1,'2017-07-05 19:50:10','2017-07-05 19:50:10','e488346b-d736-4ea3-88dd-99595c6cfecc'),
	(108,89,'Content',1,'2017-07-05 19:51:16','2017-07-05 19:51:16','7f09683d-1495-45c0-85c0-f1c67bf7a46b'),
	(109,90,'Content',1,'2017-07-05 19:58:39','2017-07-05 19:58:39','9ca614aa-129a-4dda-9792-98630742ea2b'),
	(110,91,'Content',1,'2017-07-05 19:59:30','2017-07-05 19:59:30','aa3e7919-f90d-433c-9c9b-bbbe1d780a0f'),
	(111,92,'Content',1,'2017-07-05 20:01:59','2017-07-05 20:01:59','b16a3e43-f01c-4bb2-842e-caec145e5db5'),
	(112,93,'Content',1,'2017-07-05 20:03:04','2017-07-05 20:03:04','a187e745-dd5d-4f95-8c0b-dc049f00629d'),
	(113,94,'Content',1,'2017-07-05 21:42:35','2017-07-05 21:42:35','88220292-6744-4502-bb5e-29eebf040613'),
	(114,94,'Featured Image',2,'2017-07-05 21:42:35','2017-07-05 21:42:35','bba1317b-848b-477f-8f99-60bc89068519'),
	(115,94,'Seo',3,'2017-07-05 21:42:35','2017-07-05 21:42:35','081ca77b-3c0d-4caf-aa11-4e8d25afe7ba');

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
	(4,2,'Accordion Wrapper','objAccordionWrapper','global','Wrapper of a group of Accordions.',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-07-04 22:00:58','2017-07-04 22:00:58','bb9c8859-a791-4ef1-8a39-11e52092a41c'),
	(5,NULL,'Style','style','superTableBlockType:1','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1}]}','2017-07-04 22:00:58','2017-07-04 22:00:58','cd38e7ae-a192-43a1-9a6a-56cc2282a20d'),
	(6,2,'Anchor','objAnchor','global','Anchor name - no special characters and can not start with a number',1,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2017-07-04 22:00:58','2017-07-04 22:18:25','9cbfbff2-20e2-4d3c-9db4-88984f7e427a'),
	(7,3,'Anchor Options','setAnchor','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-07-04 22:00:58','2017-07-04 22:00:58','315a402c-e5ce-4403-83dd-947a08be9186'),
	(8,NULL,'Positionsfix','positionfix','superTableBlockType:2','If the anchor is too high or too low, the position value can be adjusted (higher or lower).',0,'PlainText','{\"placeholder\":\"-10px\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-07-04 22:00:58','2017-07-04 22:00:58','98f9d496-f15c-42c3-b1f5-e666731b63f9'),
	(9,2,'Button','objButton','global','Button for linking internal and external content',1,'FruitLinkIt','{\"types\":[\"email\",\"custom\",\"entry\",\"category\",\"asset\"],\"defaultText\":\"Link\",\"allowCustomText\":\"1\",\"allowTarget\":\"1\",\"entrySources\":\"*\",\"entrySelectionLabel\":\"Select an entry\",\"assetSources\":\"*\",\"assetSelectionLabel\":\"Select an asset\",\"categorySources\":\"*\",\"categorySelectionLabel\":\"Select a category\"}','2017-07-04 22:00:58','2017-07-05 19:44:06','615fdd7c-a1c7-435c-9b14-2c2776614b79'),
	(10,3,'Button Options','setButton','global','',0,'SuperTable','{\"columns\":{\"11\":{\"width\":\"\"},\"12\":{\"width\":\"\"},\"13\":{\"width\":\"\"},\"14\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":\"1\",\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-07-04 22:00:58','2017-07-05 19:58:39','665d788d-0316-495c-a133-0edc2b5f2df6'),
	(11,NULL,'Style','style','superTableBlockType:3','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":\"1\"},{\"label\":\"Style 1\",\"value\":\"style1\",\"default\":\"\"}]}','2017-07-04 22:00:58','2017-07-05 19:58:39','7f6d89c6-fcb0-4cc0-b586-2aa8645ea78a'),
	(12,NULL,'Size','size','superTableBlockType:3','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":\"1\"},{\"label\":\"Big\",\"value\":\"big\",\"default\":\"\"},{\"label\":\"Small\",\"value\":\"small\",\"default\":\"\"}]}','2017-07-04 22:00:58','2017-07-05 19:58:39','1141564b-136a-43b2-943d-7334a13ba93d'),
	(13,NULL,'Full Width','fullwidth','superTableBlockType:3','If the button centered has been created, you can also give it the full width.',0,'Lightswitch','{\"default\":\"\"}','2017-07-04 22:00:58','2017-07-05 19:58:39','3a854de1-2ab4-4e48-a96c-2c3ccac007df'),
	(14,NULL,'Position','position','superTableBlockType:3','The buttons are arranged left-aligned, can be overwritten.',0,'Dropdown','{\"options\":[{\"label\":\"Left\",\"value\":\"left\",\"default\":\"1\"},{\"label\":\"Center\",\"value\":\"center\",\"default\":\"\"},{\"label\":\"Right\",\"value\":\"right\",\"default\":\"\"}]}','2017-07-04 22:00:58','2017-07-05 19:58:39','6dcd4460-6be7-4bf0-b70c-70730d8c50c4'),
	(15,2,'Card','objCard','global','Text Box with Media Assets ',0,'SuperTable','{\"columns\":{\"16\":{\"width\":\"\"},\"17\":{\"width\":\"\"},\"18\":{\"width\":\"\"},\"19\":{\"width\":\"\"},\"20\":{\"width\":\"\"},\"21\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-07-04 22:00:58','2017-07-05 19:45:57','8c46621d-b157-427a-a045-ebdf5ed59d36'),
	(16,NULL,'Image','photo','superTableBlockType:4','A picture will be integrated in any case. If a video is used, the picture serves as a fallback.',0,'Assets','{\"useSingleFolder\":\"\",\"sources\":\"*\",\"defaultUploadLocationSource\":\"1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"1\",\"allowedKinds\":[\"image\"],\"targetLocale\":\"\",\"limit\":\"1\",\"viewMode\":\"list\",\"selectionLabel\":\"\"}','2017-07-04 22:00:58','2017-07-05 19:45:57','fe73df1f-b075-4a5f-83ff-63069b809619'),
	(17,NULL,'Headline','headline','superTableBlockType:4','',1,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2017-07-04 22:00:58','2017-07-05 19:45:57','78032f57-af13-411b-8485-ae8650e9289d'),
	(18,NULL,'Subline','subline','superTableBlockType:4','',1,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2017-07-04 22:00:58','2017-07-05 19:45:57','5a9c422f-79df-4265-a100-53f562ef3ad8'),
	(19,NULL,'Meta','meta','superTableBlockType:4','',1,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2017-07-04 22:00:58','2017-07-05 19:45:57','e8acf229-fa65-46e2-a78e-855f149d3a56'),
	(20,NULL,'Body','body','superTableBlockType:4','',1,'RichText','{\"configFile\":\"Reduced.json\",\"availableAssetSources\":\"*\",\"availableTransforms\":\"*\",\"cleanupHtml\":\"1\",\"purifyHtml\":\"1\",\"purifierConfig\":\"\",\"columnType\":\"text\"}','2017-07-04 22:00:58','2017-07-05 19:45:57','910044eb-9bcc-428c-907c-308bbfe41310'),
	(21,NULL,'Link','cardlink','superTableBlockType:4','Optional Card Link',1,'FruitLinkIt','{\"types\":[\"custom\",\"entry\",\"category\",\"asset\"],\"defaultText\":\"\",\"allowCustomText\":\"\",\"allowTarget\":\"\",\"entrySources\":\"*\",\"entrySelectionLabel\":\"Select an entry\",\"assetSources\":\"*\",\"assetSelectionLabel\":\"Select an asset\",\"categorySources\":\"*\",\"categorySelectionLabel\":\"Select a category\"}','2017-07-04 22:00:58','2017-07-05 19:45:57','8fbbff95-4266-4d89-8258-bc0c5319d2a6'),
	(22,3,'Card Options','setCard','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-07-04 22:00:58','2017-07-04 22:00:58','254b16d5-1862-430c-988a-de6be78e9522'),
	(23,NULL,'Style','style','superTableBlockType:5','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1}]}','2017-07-04 22:00:59','2017-07-04 22:00:59','552db1d3-6cf7-45e4-96d7-6494d49bae73'),
	(24,NULL,'Media Ratio','mediaRatio','superTableBlockType:5','Aspect ratio of the image',0,'PlainText','{\"placeholder\":\"16:9\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-07-04 22:00:59','2017-07-04 22:00:59','0fd2189d-33d6-44ce-a258-4514874b3bb1'),
	(25,2,'Card Slider','objCardSlider','global','A slider module for cards',1,'SuperTable_Label','{\"value\":\"\"}','2017-07-04 22:00:59','2017-07-05 19:46:07','cb6185e0-a7fa-4aa8-b345-9141476f102a'),
	(26,3,'Card Slider Options','setCardSlider','global','',0,'SuperTable','{\"columns\":{\"27\":{\"width\":\"\"},\"28\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":\"1\",\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-07-04 22:00:59','2017-07-05 19:59:30','d9d7aa07-9278-4c29-ab45-3dee58e17bba'),
	(27,NULL,'Style','style','superTableBlockType:6','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":\"1\"},{\"label\":\"Style 1\",\"value\":\"style1\",\"default\":\"\"}]}','2017-07-04 22:00:59','2017-07-05 19:59:30','a10bf7df-23b2-43b0-912d-eab8b5cf6950'),
	(28,NULL,'Setup','setup','superTableBlockType:6','Select one of the existing setups or define a new one under `Categories> Settings: Image Slider`',0,'Categories','{\"source\":\"group:2\",\"targetLocale\":\"\",\"limit\":\"1\",\"selectionLabel\":\"Setup ausw\\u00e4hlen\"}','2017-07-04 22:00:59','2017-07-05 19:59:30','1d649b24-8275-488b-ba99-0e3a45bb4713'),
	(29,4,'Category Select: Blog','categorySelectBlog','global','',1,'Categories','{\"source\":\"group:1\",\"targetLocale\":\"\",\"limit\":\"1\",\"selectionLabel\":\"\"}','2017-07-04 22:00:59','2017-07-04 22:15:29','2e9a1a7c-e5ca-4541-8cb2-ef8415725299'),
	(30,4,'Comment Switch','commentSwitch','global','To disable comments',0,'Lightswitch','{\"default\":\"\"}','2017-07-04 22:00:59','2017-07-04 22:00:59','f9bccd15-4cd0-467b-9d2d-6ddbd3fd59b7'),
	(31,6,'Copyright','copyright','global','Copyright Message',1,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2017-07-04 22:00:59','2017-07-04 22:14:33','b9953ff9-8323-401d-a80d-284db8eaaa8b'),
	(32,6,'Disqus Name','disqusName','global','Name of your disqus account',1,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2017-07-04 22:00:59','2017-07-04 22:14:43','ba7704f1-1d73-4d4d-8e17-91547a024a24'),
	(33,2,'Embed Content','objEmbedContent','global','To include external content such as videos, code snippets, or maps',0,'SuperTable','{\"columns\":{\"34\":{\"width\":\"\"},\"35\":{\"width\":\"\"},\"36\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":\"1\",\"minRows\":null}','2017-07-04 22:00:59','2017-07-05 19:46:26','2269539e-8895-47f2-9d4c-c927fe3b8965'),
	(34,NULL,'Embed URL','embedUrl','superTableBlockType:7','If it is a video of Youtube, Vimeo or Facebook, you can copy the URL into the field.',1,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2017-07-04 22:00:59','2017-07-05 19:46:26','4b4a85dd-6a8b-4510-9e0c-c1246568b9ba'),
	(35,NULL,'Embed Code','embed','superTableBlockType:7','Insert the corresponding IFrame code here. If the URL field is filled, the code is ignored.',1,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"1\"}','2017-07-04 22:00:59','2017-07-05 19:46:26','13f57dde-ca27-4e5d-aff1-d170c20265dd'),
	(36,NULL,'Caption','caption','superTableBlockType:7','Optional asset caption',1,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2017-07-04 22:00:59','2017-07-05 19:46:26','32c71120-eb68-46f3-af26-b8a1c920a345'),
	(37,3,'Embed Content Options','setEmbedContent','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"},\"new4\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-07-04 22:00:59','2017-07-04 22:00:59','45005ce5-af73-4151-ae0f-92e2d719610d'),
	(38,NULL,'Style','style','superTableBlockType:8','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":\"\"},{\"label\":\"Style 1\",\"value\":\"style1\",\"default\":\"\"}]}','2017-07-04 22:00:59','2017-07-04 22:00:59','70db2929-f9f7-48f6-89ab-295a181aebdd'),
	(39,NULL,'Responsive','responsive','superTableBlockType:8','Do you want to display the content responsive?',0,'Lightswitch','{\"default\":\"\"}','2017-07-04 22:00:59','2017-07-04 22:00:59','5d8190a1-ccc4-4130-a048-a4941070121d'),
	(40,NULL,'Ratio','ratio','superTableBlockType:8','Ratio of the iFrame',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-07-04 22:00:59','2017-07-04 22:00:59','623b6fa7-ff13-4e55-87a4-6ec39f9e7198'),
	(41,NULL,'Align','align','superTableBlockType:8','Alignment for content smaller than the page',0,'Dropdown','{\"options\":[{\"label\":\"Center\",\"value\":\"center\",\"default\":1},{\"label\":\"Left\",\"value\":\"left\",\"default\":\"\"},{\"label\":\"Right\",\"value\":\"right\",\"default\":\"\"}]}','2017-07-04 22:00:59','2017-07-04 22:00:59','c0e6c680-ff10-496c-9bd5-7e9b50ac45ad'),
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
	(53,3,'Gallery Options','setGallery','global','',0,'SuperTable','{\"columns\":{\"54\":{\"width\":\"\"},\"55\":{\"width\":\"\"},\"56\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":\"1\",\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-07-04 22:01:00','2017-07-05 20:01:59','eb6bdc36-65a2-4940-b55f-a1b93b94bf3a'),
	(54,NULL,'Layout Typ','layoutType','superTableBlockType:12','Smart for a thumbnail layout in Tumbler Styles (Photogrid), Simple for simple thumbnail matching',0,'Dropdown','{\"options\":[{\"label\":\"Simple\",\"value\":\"simple\",\"default\":\"\"},{\"label\":\"Smart\",\"value\":\"smart\",\"default\":\"\"}]}','2017-07-04 22:01:00','2017-07-05 20:01:59','4cb3cd33-820c-4139-b085-742d8fb6afe5'),
	(55,NULL,'Ratio','ratio','superTableBlockType:12','Image ratio of the thumbnails for the `simple layout` mode. Format \'1:1\'',0,'PlainText','{\"placeholder\":\"1:1\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2017-07-04 22:01:00','2017-07-05 20:01:59','a5a9923a-9188-4c26-bdfd-0e8d85acdddd'),
	(56,NULL,'Width','width','superTableBlockType:12','Thumbnail width for the Simple Layout. Regularly, the width of thumbnails depends on the number of images per row. If this is too big or too small, you can set the width yourself.',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2017-07-04 22:01:00','2017-07-05 20:01:59','e5d9e8c7-d0ed-4923-96ef-9710b746fdb0'),
	(57,2,'Headline','objHeadline','global','',1,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2017-07-04 22:01:00','2017-07-05 19:47:15','d5715b37-88b1-406a-8c7f-25b9694b5d98'),
	(58,3,'Headline Option','setHeadline','global','Size of the headline, the regular headline has a semantic size of a H2. The override controller can be used to readjust the size independent of its semantics.',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":1,\"minRows\":null}','2017-07-04 22:01:00','2017-07-04 22:01:00','a5541072-55ce-4475-b17d-9ccd24f99a0a'),
	(59,NULL,'Style','style','superTableBlockType:13','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":\"\"},{\"label\":\"Style 1\",\"value\":\"style1\",\"default\":\"\"}]}','2017-07-04 22:01:00','2017-07-04 22:01:00','22ce2ad8-4731-46ac-8346-9080b052255a'),
	(60,NULL,'Semantic Size','semantic','superTableBlockType:13','',0,'Dropdown','{\"options\":[{\"label\":\"H1\",\"value\":\"h1\",\"default\":\"\"},{\"label\":\"H2\",\"value\":\"h2\",\"default\":1},{\"label\":\"H3\",\"value\":\"h3\",\"default\":\"\"},{\"label\":\"H4\",\"value\":\"h4\",\"default\":\"\"},{\"label\":\"H5\",\"value\":\"h5\",\"default\":\"\"},{\"label\":\"H6\",\"value\":\"h6\",\"default\":\"\"}]}','2017-07-04 22:01:00','2017-07-04 22:01:00','4770c7a2-a0c6-4bf0-b4a4-15e95962d4ed'),
	(61,NULL,'Override','override','superTableBlockType:13','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1},{\"label\":\"H1\",\"value\":\"h1\",\"default\":\"\"},{\"label\":\"H2\",\"value\":\"h2\",\"default\":\"\"},{\"label\":\"H3\",\"value\":\"h3\",\"default\":\"\"},{\"label\":\"H4\",\"value\":\"h4\",\"default\":\"\"},{\"label\":\"H5\",\"value\":\"h5\",\"default\":\"\"},{\"label\":\"H6\",\"value\":\"h6\",\"default\":\"\"}]}','2017-07-04 22:01:00','2017-07-04 22:01:00','a9c2a3a7-2314-457f-bb0a-c5adca20394e'),
	(62,4,'Hero','hero','global','Hero Image for Homepages',0,'SuperTable','{\"columns\":{\"63\":{\"width\":\"\"},\"64\":{\"width\":\"\"},\"65\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-07-04 22:01:00','2017-07-04 22:16:21','df9bd73a-75a8-4658-9d2c-19bbd7a790fe'),
	(63,NULL,'Image','photo','superTableBlockType:14','',0,'Assets','{\"useSingleFolder\":\"\",\"sources\":\"*\",\"defaultUploadLocationSource\":\"1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"1\",\"allowedKinds\":[\"image\"],\"targetLocale\":\"\",\"limit\":\"1\",\"viewMode\":\"large\",\"selectionLabel\":\"\"}','2017-07-04 22:01:00','2017-07-04 22:16:21','8e323f9d-90ca-4ba3-888d-5108e27604d6'),
	(64,NULL,'Headline','headline','superTableBlockType:14','',1,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2017-07-04 22:01:00','2017-07-04 22:16:21','96327346-3e50-4b73-b865-3235d818eef5'),
	(65,NULL,'Linkit','linkit','superTableBlockType:14','',1,'FruitLinkIt','{\"types\":[\"custom\",\"entry\",\"category\"],\"defaultText\":\"Link\",\"allowCustomText\":\"1\",\"allowTarget\":\"1\",\"entrySources\":\"*\",\"entrySelectionLabel\":\"Select an entry\",\"assetSources\":\"*\",\"assetSelectionLabel\":\"Select an asset\",\"categorySources\":\"*\",\"categorySelectionLabel\":\"Select a category\"}','2017-07-04 22:01:00','2017-07-04 22:16:21','fb366d13-d8b6-4673-b7fd-cd45b2169281'),
	(66,2,'Horizontal Ruler','objHorizontalRuler','global','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1},{\"label\":\"Style 1\",\"value\":\"style1\",\"default\":\"\"}]}','2017-07-04 22:01:00','2017-07-04 22:01:00','25eab62e-9168-4fd0-9a8b-40574b0af85d'),
	(67,2,'Image Slider','objImageSlider','global','Slider Modul',1,'Assets','{\"useSingleFolder\":\"\",\"sources\":\"*\",\"defaultUploadLocationSource\":\"1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"1\",\"allowedKinds\":[\"image\"],\"targetLocale\":\"\",\"limit\":\"10\",\"viewMode\":\"large\",\"selectionLabel\":\"\"}','2017-07-04 22:01:00','2017-07-05 19:48:00','f8ef43fd-e5b7-4359-9e23-d13e8f107839'),
	(68,3,'Image Slider Options','setImageSlider','global','The ratio applies to all images, Craft will crops the pictures so they fit into the format (Default is 16:10). The Caption is optional and applies to the entire slider.',0,'SuperTable','{\"columns\":{\"69\":{\"width\":\"\"},\"70\":{\"width\":\"\"},\"71\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":\"1\",\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-07-04 22:01:00','2017-07-05 20:03:04','6e9da240-8c14-428e-97c7-0d66d7c182ed'),
	(69,NULL,'Style','style','superTableBlockType:15','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":\"\"},{\"label\":\"Style 1\",\"value\":\"style1\",\"default\":\"\"}]}','2017-07-04 22:01:00','2017-07-05 20:03:04','6718b8d0-6cc9-4abc-a70d-ca94cd310b1f'),
	(70,NULL,'Ratio','ratio','superTableBlockType:15','Image ratio for all slides',0,'PlainText','{\"placeholder\":\"16:10\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2017-07-04 22:01:00','2017-07-05 20:03:04','9defcbaa-a1e0-4227-815f-a44c77c5cd74'),
	(71,NULL,'Setup','setup','superTableBlockType:15','Select one of the existing setups or define a new one under `Categories> Settings: Image Slider`',0,'Categories','{\"source\":\"group:2\",\"targetLocale\":\"\",\"limit\":\"1\",\"selectionLabel\":\"Setup ausw\\u00e4hlen\"}','2017-07-04 22:01:00','2017-07-05 20:03:04','92fb2855-f6b7-49d1-bbee-62ebf0cb1a21'),
	(72,2,'Jumpnavigation','objJumpNavigation','global','Buttons for jump navigations',0,'SuperTable','{\"columns\":{\"73\":{\"width\":\"\"},\"74\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":null,\"selectionLabel\":\"Add a link\",\"maxRows\":null,\"minRows\":null}','2017-07-04 22:01:00','2017-07-05 19:48:20','955b4998-e5bc-4d79-828f-c34482693966'),
	(73,NULL,'Linkname','linkname','superTableBlockType:16','Name of the link',1,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2017-07-04 22:01:00','2017-07-05 19:48:20','4d70e179-d6d0-47e6-b733-6e37ee20d282'),
	(74,NULL,'Anchor','anchor','superTableBlockType:16','Name of the anchor without # (and no other no special character)',1,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2017-07-04 22:01:00','2017-07-05 19:48:20','10004309-9657-41f3-8b96-e08d5652bbae'),
	(75,3,'Jumpnavigation Options','setJumpNavigation','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-07-04 22:01:00','2017-07-04 22:01:00','4ef2a5e4-a49f-43ab-a739-b55fd0982e09'),
	(76,NULL,'Style','style','superTableBlockType:17','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1},{\"label\":\"Style 1\",\"value\":\"style1\",\"default\":\"\"}]}','2017-07-04 22:01:01','2017-07-04 22:01:01','cb3e1966-e916-4689-8eca-8539fa77d316'),
	(77,NULL,'Layout','layout','superTableBlockType:17','The default layout is a simple left-aligned string of the links, with the full width, the buttons are arranged in the full width (break at too small size but around which the buttons are interrelated). The buttons are arranged like a list.',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1},{\"label\":\"Full Width\",\"value\":\"fullwidth\",\"default\":\"\"},{\"label\":\"List\",\"value\":\"list\",\"default\":\"\"}]}','2017-07-04 22:01:01','2017-07-04 22:01:01','a3dc35bf-02dd-41ca-9223-3bb6e07a37ae'),
	(78,2,'List','objList','global','',1,'Table','{\"columns\":{\"col1\":{\"heading\":\"Eintrag\",\"handle\":\"entry\",\"width\":\"\",\"type\":\"singleline\"}},\"defaults\":[]}','2017-07-04 22:01:01','2017-07-05 19:48:32','5d0f8be1-3f54-4438-bd5f-2f19bf47b676'),
	(79,3,'List Options','setList','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-07-04 22:01:01','2017-07-04 22:01:01','2d7cc877-e477-40f9-8a2e-3179890112b0'),
	(80,NULL,'Typ','listtype','superTableBlockType:18','Listtype',0,'Dropdown','{\"options\":[{\"label\":\"Unsorted UL\",\"value\":\"ul\",\"default\":1},{\"label\":\"Sorted OL\",\"value\":\"ol\",\"default\":\"\"}]}','2017-07-04 22:01:01','2017-07-04 22:01:01','dd84d7cf-db0f-40ad-b791-024475b7eb4d'),
	(81,NULL,'Bullet','bullet','superTableBlockType:18','Style of Bullets on unsorted lists',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1},{\"label\":\"Circle\",\"value\":\"circle\",\"default\":\"\"},{\"label\":\"Square\",\"value\":\"square\",\"default\":\"\"},{\"label\":\"Custom\",\"value\":\"custom\",\"default\":\"\"}]}','2017-07-04 22:01:01','2017-07-04 22:01:01','bde380aa-71b3-4d5e-bad4-f37651e1a02f'),
	(82,2,'Markdown','objMarkdown','global','For contents in the Markdown format (http://markdown.de/)',1,'Doxter','{\"enableSoftTabs\":\"1\",\"tabSize\":\"2\",\"rows\":\"4\",\"toolbarPlacement\":\"bottom\"}','2017-07-04 22:01:01','2017-07-05 19:48:54','9f6f13d9-3526-4b6c-b147-e00028d5ff2d'),
	(83,3,'Markdown Options','setMarkdown','global','Markdown Optionen',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-07-04 22:01:01','2017-07-04 22:01:01','df8bc593-fa67-486e-a172-14c9d9d622fe'),
	(84,NULL,'Style','style','superTableBlockType:19','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":\"\"},{\"label\":\"Style1\",\"value\":\"style1\",\"default\":\"\"}]}','2017-07-04 22:01:01','2017-07-04 22:01:01','4fd2bb31-409d-4407-b3f3-35f98620a94e'),
	(85,NULL,'Add Anchor','addAnchor','superTableBlockType:19','Should the headings h1 - h3 be equipped with an anchor?',0,'Lightswitch','{\"default\":\"\"}','2017-07-04 22:01:01','2017-07-04 22:01:01','9bc68ccd-d0e9-4ed4-a4d0-7865848b6bfb'),
	(86,2,'Media Image','objMediaImage','global','This image takes the full content width and can be provided with a caption.',0,'SuperTable','{\"columns\":{\"87\":{\"width\":\"\"},\"88\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":\"1\",\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-07-04 22:01:01','2017-07-05 19:49:41','fe422a80-97a5-4c23-be7c-4d234b831353'),
	(87,NULL,'Image','photo','superTableBlockType:20','',0,'Assets','{\"useSingleFolder\":\"\",\"sources\":\"*\",\"defaultUploadLocationSource\":\"1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"1\",\"allowedKinds\":[\"image\"],\"targetLocale\":\"\",\"limit\":\"1\",\"viewMode\":\"large\",\"selectionLabel\":\"\"}','2017-07-04 22:01:01','2017-07-05 19:49:41','e1642a29-bb20-4e08-a062-db3596cc59cb'),
	(88,NULL,'Caption','caption','superTableBlockType:20','',1,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2017-07-04 22:01:01','2017-07-05 19:49:41','5a255c5f-02de-465b-b12c-b9b1496cba14'),
	(89,3,'Media Image Options','setMediaImage','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-07-04 22:01:01','2017-07-04 22:01:01','d69de1cc-aefa-4915-a5de-afbace2a3cbc'),
	(90,NULL,'Style','style','superTableBlockType:21','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":\"\"},{\"label\":\"Style 1\",\"value\":\"style1\",\"default\":\"\"}]}','2017-07-04 22:01:01','2017-07-04 22:01:01','1132c20d-49f1-4940-9ed4-435d7c1cad36'),
	(91,NULL,'Ratio','ratio','superTableBlockType:21','Size ratio of the image',0,'PlainText','{\"placeholder\":\"16:9\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-07-04 22:01:01','2017-07-04 22:01:01','2b393b5a-8c73-40d1-9f6d-8b7de15cde70'),
	(92,NULL,'Hight Restriction','heightrestriction','superTableBlockType:21','If it is a picture in the portrait format, it can be that it is longer than the viewport is high. The height limit limits the height to maximum viewport height - you no longer have to scroll around the entire image.',0,'Lightswitch','{\"default\":\"\"}','2017-07-04 22:01:01','2017-07-04 22:01:01','b3ec4560-93bf-454b-8a55-f42a8d540d2a'),
	(93,2,'Quote','objQuote','global','For quote blocks with Author',0,'SuperTable','{\"columns\":{\"94\":{\"width\":\"\"},\"95\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":\"1\",\"minRows\":null}','2017-07-04 22:01:01','2017-07-05 19:50:10','1e12e003-4cc9-4465-83af-43731f04fa1b'),
	(94,NULL,'Quote','copy','superTableBlockType:22','',1,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"1\",\"initialRows\":\"2\"}','2017-07-04 22:01:01','2017-07-05 19:50:10','dbc2e0df-6b95-4d75-a6e4-3063a778998d'),
	(95,NULL,'Source','source','superTableBlockType:22','',1,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2017-07-04 22:01:01','2017-07-05 19:50:10','766e9a15-5f02-4b47-87ec-81c44c4d8242'),
	(96,3,'Quote Options','setQuote','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-07-04 22:01:01','2017-07-04 22:01:01','cca620e4-854b-40f3-880f-b32355ffd0fe'),
	(97,NULL,'Style','style','superTableBlockType:23','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":\"\"},{\"label\":\"Style 1\",\"value\":\"style1\",\"default\":\"\"}]}','2017-07-04 22:01:01','2017-07-04 22:01:01','859e6121-cb53-4c1d-be0b-185c86add604'),
	(98,2,'Richtext','objRichtext','global','',1,'RichText','{\"configFile\":\"Standard.json\",\"availableAssetSources\":\"*\",\"availableTransforms\":\"*\",\"cleanupHtml\":\"1\",\"purifyHtml\":\"1\",\"purifierConfig\":\"\",\"columnType\":\"text\"}','2017-07-04 22:01:02','2017-07-05 19:50:23','9de9ab1e-82cf-475b-b827-d379cce24cc8'),
	(99,3,'Richtext Options','setRichtext','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-07-04 22:01:02','2017-07-04 22:01:02','cf91ade1-8ca0-46b2-9b83-55feb04b5170'),
	(100,NULL,'Style','style','superTableBlockType:24','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1},{\"label\":\"Lead\",\"value\":\"lead\",\"default\":\"\"},{\"label\":\"Center\",\"value\":\"center\",\"default\":\"\"}]}','2017-07-04 22:01:02','2017-07-04 22:01:02','6bf6ca55-12c4-4c8a-9b06-2867523c9a16'),
	(101,3,'Section Background','setSectionBackground','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"},\"new4\":{\"width\":\"\"},\"new5\":{\"width\":\"\"},\"new6\":{\"width\":\"\"},\"new7\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-07-04 22:01:02','2017-07-04 22:01:02','b48f7b82-c41b-49e0-9775-41e983d46538'),
	(102,NULL,'Image ','backgroundImage','superTableBlockType:25','',0,'Assets','{\"useSingleFolder\":\"\",\"sources\":\"*\",\"defaultUploadLocationSource\":\"1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":1,\"allowedKinds\":[\"image\"],\"limit\":1,\"viewMode\":\"large\",\"selectionLabel\":\"\"}','2017-07-04 22:01:02','2017-07-04 22:01:02','e4b76598-2d6c-41dc-a6b1-c0178c8e8911'),
	(103,NULL,'Adapt Container','adaptContainer','superTableBlockType:25','Do you want the background container to be as broad as the content container?\r\n',0,'Lightswitch','{\"default\":\"\"}','2017-07-04 22:01:02','2017-07-04 22:01:02','4740b3d5-70d9-484f-91ae-02057c45aabf'),
	(104,NULL,'Width','width','superTableBlockType:25','Width of the background image - default always full width',0,'Dropdown','{\"options\":[{\"label\":\"Full\",\"value\":\"default\",\"default\":\"\"},{\"label\":\"Half\",\"value\":\"half\",\"default\":\"\"}]}','2017-07-04 22:01:02','2017-07-04 22:01:02','2551407a-cd3b-4770-9113-08b286f62125'),
	(105,NULL,'Align','align','superTableBlockType:25','Orientation of the background - not applicable for full area',0,'Dropdown','{\"options\":[{\"label\":\"Left\",\"value\":\"default\",\"default\":1},{\"label\":\"Right\",\"value\":\"right\",\"default\":\"\"}]}','2017-07-04 22:01:02','2017-07-04 22:01:02','80c4ea30-03c8-4375-b31c-07022801fb59'),
	(106,NULL,'Behavior','behavior','superTableBlockType:25','Additional layout rules',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":\"\"},{\"label\":\"Behavior 1\",\"value\":\"behavior1\",\"default\":\"\"}]}','2017-07-04 22:01:02','2017-07-04 22:01:02','c17b3343-e2dc-42fb-a899-26874ebec3f4'),
	(107,NULL,'Position','position','superTableBlockType:25','Background Position of the image (css syntax)\r\n',0,'PlainText','{\"placeholder\":\"center center\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-07-04 22:01:02','2017-07-04 22:01:02','470227b9-5e8d-4b56-b2ac-3b347e9042c8'),
	(108,NULL,'Ratio','ratio','superTableBlockType:25','Ratio of the background image',0,'PlainText','{\"placeholder\":\"16:9\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-07-04 22:01:02','2017-07-04 22:01:02','f7f0d586-ed77-4a34-bc5e-5aaf6588335d'),
	(109,2,'Section Column','objSectionColumn','global','Column in a section',0,'SuperTable_Label','{\"value\":\"\"}','2017-07-04 22:01:02','2017-07-04 22:01:02','754df9af-4f8c-4625-9a1d-cbbc38c7080b'),
	(110,3,'Section Column Options','setSectionColumn','global','Spalte in einer Sektion',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-07-04 22:01:02','2017-07-04 22:01:02','806a2d81-5831-4bf4-b0b5-e7a5e9837443'),
	(111,NULL,'Style','style','superTableBlockType:26','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":\"\"},{\"label\":\"Style 1\",\"value\":\"style1\",\"default\":\"\"}]}','2017-07-04 22:01:02','2017-07-04 22:01:02','1da991e5-095b-4811-96bc-a75ec7c74115'),
	(112,NULL,'Align','align','superTableBlockType:26','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1},{\"label\":\"Left\",\"value\":\"left\",\"default\":\"\"},{\"label\":\"Center\",\"value\":\"center\",\"default\":\"\"},{\"label\":\"Right\",\"value\":\"right\",\"default\":\"\"}]}','2017-07-04 22:01:02','2017-07-04 22:01:02','254f0250-ea08-4f5c-8dd5-f2c5f853eba5'),
	(113,NULL,'Vertical Align','verticalAlign','superTableBlockType:26','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1},{\"label\":\"Top\",\"value\":\"top\",\"default\":\"\"},{\"label\":\"Middle\",\"value\":\"middle\",\"default\":\"\"},{\"label\":\"Bottom\",\"value\":\"bottom\",\"default\":\"\"}]}','2017-07-04 22:01:02','2017-07-04 22:01:02','4866df8d-8bc0-4ccb-9137-a7e1c548ba23'),
	(114,3,'Section Layout','setSectionLayout','global','Weighting of individual columns.',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-07-04 22:01:02','2017-07-04 22:01:02','e6f308c0-dbc6-443b-820e-b72ffb6345f1'),
	(115,NULL,'Two columns','twoColumns','superTableBlockType:27','Width ratio for two columns',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"1-1\",\"default\":\"\"},{\"label\":\"2-1\",\"value\":\"2-1\",\"default\":\"\"},{\"label\":\"1-2\",\"value\":\"1-2\",\"default\":\"\"},{\"label\":\"3-1\",\"value\":\"3-1\",\"default\":\"\"},{\"label\":\"1-3\",\"value\":\"1-3\",\"default\":\"\"}]}','2017-07-04 22:01:02','2017-07-04 22:01:02','03543bff-e6cc-4198-a216-bd5d45d12a4b'),
	(116,NULL,'Three Columns','threeColumns','superTableBlockType:27','Width ratio for three columns',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"1-1-1\",\"default\":\"\"},{\"label\":\"2-6-2\",\"value\":\"2-6-2\",\"default\":\"\"},{\"label\":\"3-5-2\",\"value\":\"3-5-2\",\"default\":\"\"},{\"label\":\"2-5-3\",\"value\":\"2-5-3\",\"default\":\"\"}]}','2017-07-04 22:01:02','2017-07-04 22:01:02','b69095bd-7c83-4767-bf86-ef0f601ccddc'),
	(117,NULL,'Four Columns','fourColumns','superTableBlockType:27','Width ratio for four columns',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"1-1-1-1\",\"default\":\"\"},{\"label\":\"2-3-3-2\",\"value\":\"2-3-3-2\",\"default\":\"\"},{\"label\":\"2-3-4-1\",\"value\":\"2-3-4-1\",\"default\":\"\"}]}','2017-07-04 22:01:02','2017-07-04 22:01:02','08902c0b-e264-425a-9ffb-be8daba56c77'),
	(118,3,'Section Options','setSection','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"},\"new4\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-07-04 22:01:02','2017-07-04 22:01:02','1323fd69-d917-4d1a-a542-cf40d58cf832'),
	(119,NULL,'Style','style','superTableBlockType:28','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1},{\"label\":\"Style 1\",\"value\":\"style1\",\"default\":\"\"}]}','2017-07-04 22:01:02','2017-07-04 22:01:02','27b2bb59-bfcc-417f-93d2-ed44dc5534d9'),
	(120,NULL,'Full height','fullheight','superTableBlockType:28','Should the section be extended to the full viewport height?',0,'Lightswitch','{\"default\":\"\"}','2017-07-04 22:01:02','2017-07-04 22:01:02','4ce267b7-d600-4bce-85f9-09580316166e'),
	(121,NULL,'Inner Container','innerContainer','superTableBlockType:28','Layout of the inner container',0,'Dropdown','{\"options\":[{\"label\":\"Default Page Width\",\"value\":\"default\",\"default\":1},{\"label\":\"Full Viewport\",\"value\":\"full\",\"default\":\"\"},{\"label\":\"Bigger 25%\",\"value\":\"bigger-25\",\"default\":\"\"},{\"label\":\"Bigger 45%\",\"value\":\"bigger-45\",\"default\":\"\"},{\"label\":\"Smaller 25%\",\"value\":\"smaller-25\",\"default\":\"\"},{\"label\":\"Smaller 50%\",\"value\":\"smaller-50\",\"default\":\"\"}]}','2017-07-04 22:01:02','2017-07-04 22:01:02','5bc45294-b689-4afb-a568-617f4bac1e0b'),
	(122,NULL,'Anchor','anchor','superTableBlockType:28','Optional anchor for jump navigation without # (and without special characters)',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-07-04 22:01:02','2017-07-04 22:01:02','68aadb04-d414-48da-94b6-5e57b120e61f'),
	(123,2,'Section Wrapper','objSection','global','Subsegment of a content module, when the page wrapper is removed the section can run over the full browser width.',0,'SuperTable_Label','{\"value\":\"\"}','2017-07-04 22:01:02','2017-07-04 22:01:02','70d3f103-37ba-484a-8595-769c9cef30a4'),
	(124,4,'SEO','seo','global','',1,'Seomatic_Meta','{\"assetSources\":\"*\",\"seoMainEntityCategory\":\"CreativeWork\",\"seoMainEntityOfPage\":\"Article\",\"seoTitleSource\":\"field\",\"seoTitleSourceField\":\"title\",\"seoTitle\":\"\",\"seoTitleSourceChangeable\":\"1\",\"seoDescriptionSource\":\"field\",\"seoDescriptionSourceField\":\"body\",\"seoDescription\":\"\",\"seoDescriptionSourceChangeable\":\"1\",\"seoKeywordsSource\":\"custom\",\"seoKeywordsSourceField\":\"title\",\"seoKeywords\":\"\",\"seoKeywordsSourceChangeable\":\"1\",\"seoImageIdSource\":\"field\",\"seoImageIdSourceField\":\"featuredImage\",\"seoImageIdSourceChangeable\":\"1\",\"seoImageTransform\":\"\",\"twitterCardType\":\"summary_large_image\",\"twitterCardTypeChangeable\":\"1\",\"seoTwitterImageIdSource\":\"field\",\"seoTwitterImageIdSourceField\":\"featuredImage\",\"seoTwitterImageIdSourceChangeable\":\"1\",\"seoTwitterImageTransform\":\"\",\"openGraphType\":\"article\",\"openGraphTypeChangeable\":\"1\",\"seoFacebookImageIdSource\":\"field\",\"seoFacebookImageIdSourceField\":\"featuredImage\",\"seoFacebookImageIdSourceChangeable\":\"1\",\"seoFacebookImageTransform\":\"\",\"robots\":\"all\",\"robotsChangeable\":\"1\"}','2017-07-04 22:01:03','2017-07-04 22:16:37','8140b5df-b85c-4e96-ae65-9b501356b848'),
	(125,2,'Slideout Box','objSlideOutBox','global','A content box that expands by click - intended to hide the user rather irrelevant content.',0,'SuperTable','{\"columns\":{\"126\":{\"width\":\"\"},\"127\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-07-04 22:01:03','2017-07-05 19:51:16','07b6b53f-6fce-4127-9ffb-98bf81fabc9c'),
	(126,NULL,'Trigger','trigger','superTableBlockType:29','Activation link to open the box',1,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2017-07-04 22:01:03','2017-07-05 19:51:16','ad154e39-da3a-4f5d-a4dd-931f3373b907'),
	(127,NULL,'Body','body','superTableBlockType:29','',1,'RichText','{\"configFile\":\"\",\"availableAssetSources\":\"*\",\"availableTransforms\":\"*\",\"cleanupHtml\":\"\",\"purifyHtml\":\"1\",\"purifierConfig\":\"\",\"columnType\":\"text\"}','2017-07-04 22:01:03','2017-07-05 19:51:16','e789c340-4efc-418f-8187-99559e44019c'),
	(128,3,'Slideout Box Options','setSlideOutBox','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-07-04 22:01:03','2017-07-04 22:01:03','21188a91-9cf3-4e88-af0f-db7e04cd7101'),
	(129,NULL,'Style','style','superTableBlockType:30','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":\"\"},{\"label\":\"Style 1\",\"value\":\"style1\",\"default\":\"\"}]}','2017-07-04 22:01:03','2017-07-04 22:01:03','2a350542-17ba-48e9-ab95-28076adab1fa'),
	(130,3,'Slider Setup','setSliderSetup','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"},\"new4\":{\"width\":\"\"},\"new5\":{\"width\":\"\"},\"new6\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-07-04 22:01:03','2017-07-04 22:01:03','398c809e-81cb-4d5b-b5ea-43e765025712'),
	(131,NULL,'Autoplay','autoplay','superTableBlockType:31','Speed of Autoplay mode',0,'Dropdown','{\"options\":[{\"label\":\"Deaktiviert\",\"value\":\"default\",\"default\":1},{\"label\":\"Slow\",\"value\":\"slow\",\"default\":\"\"},{\"label\":\"Medium\",\"value\":\"medium\",\"default\":\"\"},{\"label\":\"Fast\",\"value\":\"fast\",\"default\":\"\"}]}','2017-07-04 22:01:03','2017-07-04 22:01:03','2a92a1f1-6799-4048-8ef5-b466ed5b2de5'),
	(132,NULL,'Animation Speed','speed','superTableBlockType:31','Setting the animation speed',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":\"\"},{\"label\":\"Slow\",\"value\":\"slow\",\"default\":\"\"},{\"label\":\"Medium\",\"value\":\"medium\",\"default\":\"\"},{\"label\":\"Fast\",\"value\":\"fast\",\"default\":\"\"}]}','2017-07-04 22:01:03','2017-07-04 22:01:03','5e362677-1433-4858-a2d9-20f3164ccfc7'),
	(133,NULL,'Loop','loop','superTableBlockType:31','Should the slider run endlessly?',0,'Lightswitch','{\"default\":\"\"}','2017-07-04 22:01:03','2017-07-04 22:01:03','701f0935-d2a2-42df-bbb0-96c3e07862c4'),
	(134,NULL,'Hide Navigation','navigation','superTableBlockType:31','Should a navigation be hidden?',0,'Lightswitch','{\"default\":\"\"}','2017-07-04 22:01:03','2017-07-04 22:01:03','80420691-60e7-4839-a590-c335f6ee2f6b'),
	(135,NULL,'Hide Pagination','pagination','superTableBlockType:31','Should a pagination be hidden?',0,'Lightswitch','{\"default\":\"\"}','2017-07-04 22:01:03','2017-07-04 22:01:03','76abd0c2-f3ab-4e52-9f94-eb35bca5e519'),
	(136,NULL,'Autoheight','autoHeight','superTableBlockType:31','With Autoheight, the height of each Slides is Dynamic',0,'Lightswitch','{\"default\":\"\"}','2017-07-04 22:01:03','2017-07-04 22:01:03','749bb452-a204-4d67-b017-3707ed9439ec'),
	(137,3,'Slider Setup General','setSliderSetupGeneral','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"},\"new4\":{\"width\":\"\"},\"new5\":{\"width\":\"\"},\"new6\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-07-04 22:01:03','2017-07-04 22:01:03','53641b04-d761-4c15-8beb-e4d817f0f557'),
	(138,NULL,'Slide Position','position','superTableBlockType:32','Position of the slides',0,'Dropdown','{\"options\":[{\"label\":\"Center\",\"value\":\"center\",\"default\":1},{\"label\":\"Left\",\"value\":\"left\",\"default\":\"\"},{\"label\":\"Right\",\"value\":\"right\",\"default\":\"\"}]}','2017-07-04 22:01:03','2017-07-04 22:01:03','c4ecc618-4306-4025-90a4-4ce6e767e100'),
	(139,NULL,'Slides per View','slidesPerView','superTableBlockType:32','Number of visible slides',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1},{\"label\":\"Auto\",\"value\":\"auto\",\"default\":\"\"},{\"label\":2,\"value\":\"two\",\"default\":\"\"},{\"label\":3,\"value\":\"three\",\"default\":\"\"},{\"label\":4,\"value\":\"four\",\"default\":\"\"},{\"label\":5,\"value\":\"five\",\"default\":\"\"}]}','2017-07-04 22:01:03','2017-07-04 22:01:03','c933d90b-6426-4a50-852e-159324bceed4'),
	(140,NULL,'Space Between','spaceBetween','superTableBlockType:32','Distances between the slides',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-07-04 22:01:03','2017-07-04 22:01:03','fee6151c-08c0-4f53-8f32-8fb6a2895f1c'),
	(141,NULL,'Group Cell','groupCell','superTableBlockType:32','Slides can be grouped.',0,'Dropdown','{\"options\":[{\"label\":\"Nicht gruppiert\",\"value\":\"default\",\"default\":1},{\"label\":2,\"value\":\"\\\"2\\\"\",\"default\":\"\"},{\"label\":3,\"value\":\"\\\"3\\\"\",\"default\":\"\"},{\"label\":4,\"value\":\"\\\"4\\\"\",\"default\":\"\"},{\"label\":5,\"value\":\"\\\"5\\\"\",\"default\":\"\"},{\"label\":6,\"value\":\"\\\"6\\\"\",\"default\":\"\"}]}','2017-07-04 22:01:03','2017-07-04 22:01:03','8597e8bf-f91c-454f-b901-6a68b46a5725'),
	(142,NULL,'Freescroll','freescroll','superTableBlockType:32','With Freescroll, the slider can be moved freely',0,'Lightswitch','{\"default\":\"\"}','2017-07-04 22:01:03','2017-07-04 22:01:03','83ad7b77-a6d5-4f67-9684-5a9734b19b25'),
	(143,NULL,'Responsive','responsive','superTableBlockType:32','If multiple slides are displayed at the same time, you can reduce the number of columns by using Responsive with smaller viewport.',0,'Lightswitch','{\"default\":\"\"}','2017-07-04 22:01:03','2017-07-04 22:01:03','98b3818c-fb9f-42bb-b2cd-f2c03164b975'),
	(144,6,'Social Networks','socialNetworks','global','Links to the social networks',0,'SuperTable','{\"columns\":{\"145\":{\"width\":\"\"},\"146\":{\"width\":\"\"},\"147\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":null,\"selectionLabel\":\"Add Network\",\"maxRows\":null,\"minRows\":null}','2017-07-04 22:01:03','2017-07-04 22:15:14','14aef1f3-0b25-45ac-8c5d-a31d87e291de'),
	(145,NULL,'Icon','icon','superTableBlockType:33','Networktype',0,'Dropdown','{\"options\":[{\"label\":\"Facebook\",\"value\":\"facebook\",\"default\":\"\"},{\"label\":\"Twitter\",\"value\":\"twitter\",\"default\":\"\"},{\"label\":\"Googleplus\",\"value\":\"googleplus\",\"default\":\"\"},{\"label\":\"Pinterest\",\"value\":\"pinterest\",\"default\":\"\"},{\"label\":\"Instagram\",\"value\":\"instagram\",\"default\":\"\"},{\"label\":\"Vimeo\",\"value\":\"vimeo\",\"default\":\"\"},{\"label\":\"Youtube\",\"value\":\"youtube\",\"default\":\"\"}]}','2017-07-04 22:01:03','2017-07-04 22:15:15','7b06c10a-a312-4783-98e9-d0b5ee8eb473'),
	(146,NULL,'Link','linkit','superTableBlockType:33','',1,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2017-07-04 22:01:03','2017-07-04 22:15:15','e2501c7a-2c39-4361-a9d7-2ebd19c782a8'),
	(147,NULL,'Caption','caption','superTableBlockType:33','Caption of the popover',1,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2017-07-04 22:01:03','2017-07-04 22:15:15','9c1b3d35-2ae6-42fc-9137-6f3db749190f'),
	(148,2,'Spacer','objSpacer','global','Element to expand the distance. A spacer is 20px',0,'Dropdown','{\"options\":[{\"label\":\"0.25 Spacer\",\"value\":\"--025\",\"default\":\"\"},{\"label\":\"0.50 Spacer\",\"value\":\"--050\",\"default\":1},{\"label\":\"0.75 Spacer\",\"value\":\"--075\",\"default\":\"\"},{\"label\":\"1 Spacer\",\"value\":\"--1\",\"default\":\"\"},{\"label\":\"2 Spacer\",\"value\":\"--2\",\"default\":\"\"},{\"label\":\"3 Spacer\",\"value\":\"--3\",\"default\":\"\"},{\"label\":\"4 Spacer\",\"value\":\"--4\",\"default\":\"\"},{\"label\":\"5 Spacer\",\"value\":\"--5\",\"default\":\"\"},{\"label\":\"6 Spacer\",\"value\":\"--6\",\"default\":\"\"},{\"label\":\"7 Spacer\",\"value\":\"--7\",\"default\":\"\"},{\"label\":\"8 Spacer\",\"value\":\"--8\",\"default\":\"\"},{\"label\":\"9 Spacer\",\"value\":\"--9\",\"default\":\"\"},{\"label\":\"10 Spacer\",\"value\":\"--10\",\"default\":\"\"}]}','2017-07-04 22:01:04','2017-07-04 22:01:04','ae6bca75-ac1a-43bc-a940-7f11b80ebaae'),
	(149,2,'Tab','objTab','global','The individual tab, please enter the title of the tab',1,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2017-07-04 22:01:04','2017-07-05 19:51:34','441a062b-7717-419a-9665-d9cc3c180b91'),
	(150,2,'Tab Wrapper','objTabWrapper','global','Wrapper of the Tab group',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":1,\"selectionLabel\":\"Zeile hinzuf\\u00fcgen\",\"maxRows\":null,\"minRows\":null}','2017-07-04 22:01:04','2017-07-04 22:01:04','dbb35d0d-a08f-4da8-988d-c8623152a650'),
	(151,NULL,'Style','style','superTableBlockType:34','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":1},{\"label\":\"Style 1\",\"value\":\"style1\",\"default\":\"\"}]}','2017-07-04 22:01:04','2017-07-04 22:01:04','9dcba0c2-3169-400c-ab44-e1daf88c06af'),
	(152,5,'Content Builder','contentBuilder','global','',0,'Neo','{\"maxBlocks\":null}','2017-07-04 22:01:04','2017-07-04 22:01:04','376e2ccb-c620-4eb6-bed2-bfd8726dd46d');

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
	(6,'Main','main',77,'2017-07-04 22:01:04','2017-07-04 22:01:04','d3b07ddd-8e1b-465a-bcd0-65971b014ebf');

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
	(1,'2.6.2987','2.6.10',2,'kittn','http://ktest10.local','UTC',1,0,'2017-07-04 21:44:58','2017-07-14 20:39:19','93fc1702-dfe7-473a-a405-2d9d312ddd7d');

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
	(75,14,'m150512_105600_AmNav_addOptionalClass','2017-07-04 22:00:16','2017-07-04 22:00:16','2017-07-04 22:00:16','9ea4a7ca-63ef-41c0-8933-a9ca47f59734');

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
	(1,5,2,152,NULL,'2017-07-05 21:33:19','2017-07-05 21:33:19','1459c611-1bf7-4f6b-b4ac-0651495836ad'),
	(2,6,11,152,NULL,'2017-07-16 14:05:54','2017-07-16 14:05:54','bbaf9aa4-4c2d-4bb9-97e2-bb037c4da963');

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
	(1,152,47,'Headline','objHeadline',NULL,NULL,'',1,2,'2017-07-04 22:01:04','2017-07-04 22:01:04','f055bfc6-7e76-45b1-bde8-455d25b450ac'),
	(2,152,48,'Richtext','objRichtext',NULL,NULL,'',1,3,'2017-07-04 22:01:04','2017-07-04 22:01:04','864e6620-9da7-43de-8bbb-a6a52590de1b'),
	(3,152,49,'Markdown','objMarkdown',NULL,NULL,'',1,4,'2017-07-04 22:01:04','2017-07-04 22:01:04','b90d13dd-249d-40a6-ae80-41fb5cf10c4c'),
	(4,152,50,'Liste','objList',NULL,NULL,'',1,5,'2017-07-04 22:01:04','2017-07-04 22:01:04','624a6762-32cd-46ff-8d6e-5c3f70336598'),
	(5,152,51,'Zitat','objQuote',NULL,NULL,'',1,6,'2017-07-04 22:01:04','2017-07-04 22:01:04','9f474bf6-d89c-40aa-826f-c3d9062cee86'),
	(6,152,52,'Media Image','objMediaImage',NULL,NULL,'',1,8,'2017-07-04 22:01:04','2017-07-04 22:01:04','649e5448-3894-4d87-8879-2514de51db39'),
	(7,152,53,'Embed Content','objEmbedContent',NULL,NULL,'',1,9,'2017-07-04 22:01:04','2017-07-04 22:01:04','8fa6355a-5091-4a6f-bd58-36428f8f8acf'),
	(8,152,54,'Card','objCard',NULL,NULL,'',1,10,'2017-07-04 22:01:04','2017-07-04 22:01:04','ba30a8cd-ee6d-449a-9cdc-f42a48a6f8f6'),
	(9,152,55,'Galerie','objGallery',NULL,NULL,'',1,11,'2017-07-04 22:01:04','2017-07-04 22:01:04','c1247b4d-e62f-4137-abe8-67b4db67ba30'),
	(10,152,56,'Image Slider','objImageSlider',NULL,NULL,'',1,12,'2017-07-04 22:01:04','2017-07-04 22:01:04','5c002005-57dd-477b-80c8-2b2ccb13787c'),
	(11,152,57,'Card Slider','objCardSlider',NULL,NULL,'[\"objCard\"]',1,13,'2017-07-04 22:01:04','2017-07-04 22:01:04','2d3d3e22-d66f-4299-be00-38d169fa637b'),
	(12,152,58,'Button','objButton',NULL,NULL,'',1,15,'2017-07-04 22:01:04','2017-07-04 22:01:04','eba3c8b7-e364-49c6-bdc3-876561d406e6'),
	(13,152,59,'Slide Out Box','objSlideOutBox',NULL,NULL,'',1,16,'2017-07-04 22:01:04','2017-07-04 22:01:04','68d1330a-0deb-4364-9089-ec7e5c255216'),
	(14,152,60,'Sprungnavigation','objJumpNavigation',NULL,NULL,'',1,17,'2017-07-04 22:01:04','2017-07-04 22:01:04','2649b185-9815-4617-8333-c922647fcf14'),
	(15,152,61,'Anker','objAnchor',NULL,NULL,'',1,19,'2017-07-04 22:01:04','2017-07-04 22:01:04','95028e2c-fa1e-4ed6-9a6a-20c6c56d9c57'),
	(16,152,62,'Trennlinie','objHorizontalRuler',NULL,NULL,'',1,20,'2017-07-04 22:01:04','2017-07-04 22:01:04','e5b8aaf1-9d2d-469b-a9d9-b7fa9d30d39d'),
	(17,152,63,'Spacer','objSpacer',NULL,NULL,'',1,21,'2017-07-04 22:01:04','2017-07-04 22:01:04','dfd63527-b120-4624-aebb-2bf0410882b8'),
	(18,152,64,'Section Wrapper','objSection',NULL,4,'[\"objSectionColumn\"]',1,23,'2017-07-04 22:01:04','2017-07-04 22:01:04','3f8b574c-98d5-4ab2-9cb7-d30cb3d32ece'),
	(19,152,65,'Section Column','objSectionColumn',NULL,NULL,'[\"objHeadline\",\"objRichtext\",\"objMarkdown\",\"objList\",\"objQuote\",\"objMediaImage\",\"objEmbedContent\",\"objCard\",\"objGallery\",\"objImageSlider\",\"objCardSlider\",\"objButton\",\"objSlideOutBox\",\"objJumpNavigation\",\"objAnchor\",\"objHorizontalRuler\",\"objSpacer\",\"objAccordionWrapper\",\"objTabWrapper\"]',0,24,'2017-07-04 22:01:04','2017-07-04 22:01:04','8eb1e86a-7fda-4944-a3b6-f6c701d355a2'),
	(20,152,66,'Accordion Wrapper','objAccordionWrapper',NULL,NULL,'[\"objAccordion\"]',1,25,'2017-07-04 22:01:04','2017-07-04 22:01:04','c4677ae2-9e9a-43f8-86c6-292c6b17b0d9'),
	(21,152,67,'Accordion','objAccordion',NULL,NULL,'[\"objHeadline\",\"objRichtext\",\"objMarkdown\",\"objList\",\"objQuote\",\"objMediaImage\",\"objEmbedContent\",\"objGallery\",\"objImageSlider\",\"objCardSlider\",\"objButton\",\"objSlideOutBox\",\"objJumpNavigation\",\"objAnchor\",\"objHorizontalRuler\",\"objSpacer\"]',0,26,'2017-07-04 22:01:04','2017-07-04 22:01:04','e4de33bc-8df9-4525-8bf9-b5e0a093b403'),
	(22,152,68,'Tab Wrapper','objTabWrapper',NULL,NULL,'[\"objTab\"]',1,27,'2017-07-04 22:01:04','2017-07-04 22:01:04','7206c647-813b-427a-823f-dec23a58f927'),
	(23,152,69,'Tab','objTab',NULL,NULL,'[\"objHeadline\",\"objRichtext\",\"objMarkdown\",\"objList\",\"objQuote\",\"objMediaImage\",\"objEmbedContent\",\"objGallery\",\"objImageSlider\",\"objCardSlider\",\"objButton\",\"objSlideOutBox\",\"objJumpNavigation\",\"objAnchor\",\"objHorizontalRuler\",\"objSpacer\"]',0,28,'2017-07-04 22:01:04','2017-07-04 22:01:04','09d2f11f-de17-4648-932c-83417b833cd7');

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
	(1,152,'Textmodule',1,'2017-07-04 22:01:04','2017-07-04 22:01:04','327877bf-f6cd-4423-9e24-e4db23317937'),
	(2,152,'Mediamodule',7,'2017-07-04 22:01:04','2017-07-04 22:01:04','052b41a7-3e73-4dd8-b779-a349d3ff4fba'),
	(3,152,'Interaktiv',14,'2017-07-04 22:01:04','2017-07-04 22:01:04','0ea88f8d-7e40-4531-b676-a400d3c30893'),
	(4,152,'Layout',18,'2017-07-04 22:01:04','2017-07-04 22:01:04','4f8dbd2c-214b-4441-bd2d-6fdc9dee5452'),
	(5,152,'Wrapper',22,'2017-07-04 22:01:04','2017-07-04 22:01:04','270f7002-116a-4745-8028-1423bae5dfa2');

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
	(1,'VideoEmbedUtility','1.0.0',NULL,NULL,'unknown',1,NULL,'2017-07-04 21:59:41','2017-07-04 21:59:41','2017-07-16 14:06:51','31aff914-5d66-498e-8624-8db638cb587f'),
	(2,'TheArchitect','1.6.0','1.6.0',NULL,'unknown',1,NULL,'2017-07-04 21:59:45','2017-07-04 21:59:45','2017-07-16 14:06:51','b1ab5a65-4a91-44db-9a2f-d0345a21f36d'),
	(3,'SuperTable','1.0.5','1.0.0',NULL,'unknown',1,NULL,'2017-07-04 21:59:47','2017-07-04 21:59:47','2017-07-16 14:06:51','e6518585-e7b6-4b4c-9aec-d8e6828f015e'),
	(4,'Seomatic','1.1.47','1.1.25',NULL,'unknown',1,NULL,'2017-07-04 21:59:51','2017-07-04 21:59:51','2017-07-16 14:06:51','c4962d5a-4ee2-47be-8081-563112f7196a'),
	(5,'Neo','1.4.1','1.4.1',NULL,'unknown',1,NULL,'2017-07-04 21:59:59','2017-07-04 21:59:59','2017-07-16 14:06:51','8c41f74e-116e-458f-a3ed-9cc0d6f5ca36'),
	(6,'FruitLinkIt','2.3.1','2.3.0',NULL,'unknown',1,NULL,'2017-07-04 22:00:03','2017-07-04 22:00:03','2017-07-16 14:06:51','504294b1-8dd4-4248-8074-d11406edf511'),
	(7,'Kint','1.1.0','1.0.0',NULL,'unknown',1,NULL,'2017-07-04 22:00:05','2017-07-04 22:00:05','2017-07-16 14:06:51','f2f131a6-6f87-4af9-af71-9c2379379854'),
	(8,'Imager','1.5.3','1.0.0',NULL,'unknown',1,NULL,'2017-07-04 22:00:07','2017-07-04 22:00:07','2017-07-16 14:06:51','5e3e3de6-61e4-403d-88a6-b43453cd9c0d'),
	(9,'GitPlugins','0.1.0',NULL,NULL,'unknown',1,NULL,'2017-07-04 22:00:08','2017-07-04 22:00:08','2017-07-16 14:06:51','e2525eed-8362-4662-9443-b9c445e3e9b8'),
	(10,'FocalPointField','1.0.2',NULL,NULL,'unknown',1,NULL,'2017-07-04 22:00:10','2017-07-04 22:00:10','2017-07-16 14:06:51','ec35c904-1c8a-4949-8b8e-558f3fe71d26'),
	(11,'CpSortCols','1.1.1','1.0',NULL,'unknown',1,NULL,'2017-07-04 22:00:11','2017-07-04 22:00:11','2017-07-16 14:06:51','2cd4639c-0835-499e-8bad-2cba17990a53'),
	(12,'CpFieldLinks','1.2.2','1.0',NULL,'unknown',1,NULL,'2017-07-04 22:00:13','2017-07-04 22:00:13','2017-07-16 14:06:51','c3d42938-cfa6-4fda-9015-7ee0e1ef6028'),
	(13,'AmCommand','2.0.2','2.0.1',NULL,'unknown',1,NULL,'2017-07-04 22:00:14','2017-07-04 22:00:14','2017-07-16 14:06:51','3f58dc7b-4598-485d-90d0-06d1f8858913'),
	(14,'AmNav','1.7.1',NULL,NULL,'unknown',1,NULL,'2017-07-04 22:00:16','2017-07-04 22:00:16','2017-07-16 14:06:51','97e2ac50-e4f9-4ba4-830c-528e327cbcb3'),
	(15,'Doxter','1.3.0','1.0.0',NULL,'unknown',1,NULL,'2017-07-04 22:00:18','2017-07-04 22:00:18','2017-07-16 14:06:51','ae688b87-4326-4d79-a318-70e2c2341473'),
	(16,'CacheBuster','1.2.2',NULL,NULL,'unknown',1,NULL,'2017-07-16 10:44:47','2017-07-16 10:44:47','2017-07-16 14:06:51','4a1d2384-a561-4ba4-a3cb-e723bd5463ce'),
	(17,'Cookies','1.0.4','1.0.0',NULL,'unknown',1,NULL,'2017-07-16 10:44:50','2017-07-16 10:44:50','2017-07-16 14:06:51','16d937e0-3a99-49ad-86c7-5eec44be75a8');

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
	(8,'field',138,'de',' center '),
	(8,'field',139,'de',' three '),
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
	(2,'field',124,'de',' 1 0 de 1 0 template creativework article home home summary_large_image article all home home field title field title custom title field field field '),
	(4,'field',152,'de',''),
	(4,'field',42,'de',''),
	(4,'field',46,'de',''),
	(4,'field',43,'de',''),
	(5,'field',31,'en',''),
	(6,'field',144,'en',''),
	(6,'field',32,'en',''),
	(8,'field',140,'de',''),
	(8,'field',141,'de',' default '),
	(8,'field',142,'de',' 0 '),
	(8,'field',143,'de',' 0 '),
	(8,'slug',0,'de',''),
	(8,'field',138,'en',' center '),
	(8,'field',139,'en',' three '),
	(8,'field',140,'en',''),
	(8,'field',141,'en',' default '),
	(8,'field',142,'en',' 0 '),
	(8,'field',143,'en',' 0 '),
	(8,'slug',0,'en',''),
	(9,'field',131,'de',' default '),
	(9,'field',132,'de',' default '),
	(9,'field',133,'de',' 1 '),
	(9,'field',134,'de',' 0 '),
	(9,'field',135,'de',' 0 '),
	(9,'field',136,'de',' 0 '),
	(9,'slug',0,'de',''),
	(9,'field',131,'en',' default '),
	(9,'field',132,'en',' default '),
	(9,'field',133,'en',' 1 '),
	(9,'field',134,'en',' 0 '),
	(9,'field',135,'en',' 0 '),
	(9,'field',136,'en',' 0 '),
	(9,'slug',0,'en',''),
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
	(12,'slug',0,'en','');

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
	(1,NULL,NULL,NULL,NULL,NULL,'de','kittn','This is the default global title of the site pages.','|','after','This is the default global natural language description of the content on the site pages.','default,global,comma-separated,keywords','','','','summary','website','','# robots.txt for {{ siteUrl }}\n\nSitemap: {{ siteUrl |trim(\'/\') }}/sitemap.xml\n\n# Don\'t allow web crawlers to index Craft\n\nUser-agent: *\nDisallow: /craft/\n','','','','','','',1,0,0,0,0,0,0,'Organization','Corporation','','kittn','','','http://ktest10.local/','','','','','','','','','','','','','','','$$$','','','','','','','','','','','','','','','','','','','','','Organization','Corporation','','','','','','','','','','','','','','','','','','','','','','','','','','','/* TEAM */\n\n{% if seomaticCreator.name is defined and seomaticCreator.name %}\nCreator: {{ seomaticCreator.name }}\n{% endif %}\n{% if seomaticCreator.url is defined and seomaticCreator.url %}\nURL: {{ seomaticCreator.url }}\n{% endif %}\n{% if seomaticCreator.description is defined and seomaticCreator.description %}\nDescription: {{ seomaticCreator.description }}\n{% endif %}\n\n/* THANKS */\n\nPixel & Tonic - https://pixelandtonic.com\n\n/* SITE */\n\nStandards: HTML5, CSS3\nComponents: Craft CMS, Yii, PHP, Javascript, SEOmatic','2017-07-04 22:02:15','2017-07-04 22:02:15','7a983667-bc4a-48c6-8344-d80ce65282a1');

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
	(1,1,'ebc01587f551d1b40543c89d8e7fd7b0147d820dczozMjoiNXg1cXUzQVlsZnZYMTJSYlNmVWZCdk5sVHhfT2VGZ2EiOw==','2017-07-04 21:45:04','2017-07-04 21:45:04','24831109-32ac-49eb-81a4-3003b7fb6f30'),
	(2,1,'3afece416a28dc72aa034cb33770532a04c07a24czozMjoiVUhLa1Y1TktrN0ljWnU3UnNRT2VFT21PYWtYaW1TVU0iOw==','2017-07-05 07:22:24','2017-07-05 07:22:24','6b736c6e-94a1-4fd0-abe0-2bbef3b56d14'),
	(3,1,'a1a82a43780294ec70ed0471be2ca06b0a1faad8czozMjoiNXlOSmJCUGtCenVGV2ZDUEhHYjI2TWVRcVNxSkp2ZFAiOw==','2017-07-05 19:34:12','2017-07-05 19:34:12','03601ba0-3473-48f3-be12-b03e6156aeba'),
	(4,1,'726e3b309280cd986746a9bd0203b384177d14ffczozMjoiMEF3cU5MV3hCMGM3c1JWM0RXMG1lUWJveUR4Y0IwcWsiOw==','2017-07-05 21:25:33','2017-07-05 21:25:33','b156aa47-eed5-4ac4-a29c-780305f7127b'),
	(5,1,'d5bad67e6dcdc3c2c6b54e9e78caad94ccf0b846czozMjoiMFlOdFAwRzc4MFZvZVB1X0hoZ3NPcWFTd0tJcHVpZjMiOw==','2017-07-14 20:39:30','2017-07-14 20:39:30','b7d7b278-0f63-4547-8bd5-4a56ffe5b299'),
	(6,1,'d4ccf3155b209af2d53459d5a641f1fd37ef0f07czozMjoiMHZOb0dFY1pVbjdadVduRndMcVIyX250WWJDeUVGVlkiOw==','2017-07-16 10:44:30','2017-07-16 10:44:30','2d1137f5-ddfc-4d41-b147-00afbf84cabb'),
	(7,1,'7b5a03d0f3cd5d229e911f16f728dcfa640174c3czozMjoiMHk4Z1V2SWxscGNTaHRmdXZQSGNINnBraEJRRUNlZzYiOw==','2017-07-16 14:00:44','2017-07-16 14:00:44','5551eca2-6331-4bd2-8f41-b52dc8d580d6');

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
	(2,4,7,1,2,3,1,'2017-07-05 20:08:13','2017-07-05 20:08:13','bbc7071a-770a-4985-96cf-91bb9d82d745');

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
	(4,1,'2017-07-04 22:00:58','2017-07-04 22:01:04','981a5add-ed47-44a8-9dd4-a69c0b2b8901'),
	(5,NULL,'2017-07-05 21:33:19','2017-07-05 21:33:19','ac36a972-9856-4500-b251-7f2d6febda1b'),
	(6,NULL,'2017-07-16 14:05:54','2017-07-16 14:05:54','e4aecf6d-f90b-411f-a161-fdb38b9bc08d');

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
	(8,7,137,32,1,NULL,'2017-07-05 20:08:13','2017-07-05 20:08:13','578a121a-f99c-4780-99ac-80e025abb7e7'),
	(9,7,130,31,1,NULL,'2017-07-05 20:08:13','2017-07-05 20:08:13','ae17fa21-26e7-409f-8fcf-f01dc17d450a'),
	(10,2,62,14,1,NULL,'2017-07-05 21:33:19','2017-07-05 21:33:19','32cbc86d-b0cd-472a-9c06-b3f085a3c5a0'),
	(12,11,46,10,1,NULL,'2017-07-16 14:05:54','2017-07-16 14:05:54','31311697-2f49-4387-8d1f-2646250a1341');

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
	(1,4,13,'2017-07-04 22:00:58','2017-07-04 22:00:58','87087b86-9e31-45de-a7d8-36047a21dfcc'),
	(2,7,14,'2017-07-04 22:00:58','2017-07-04 22:00:58','0b38c886-08bb-483c-aa6d-6cd62acb239f'),
	(3,10,90,'2017-07-04 22:00:58','2017-07-05 19:58:39','c51c8c65-6308-4478-8c1d-1e9d5a18262f'),
	(4,15,83,'2017-07-04 22:00:58','2017-07-05 19:45:58','ad27d5ef-38e9-49da-a94c-878c0bde82f4'),
	(5,22,17,'2017-07-04 22:00:58','2017-07-04 22:00:59','1924c9de-f5a8-415b-877b-670ed00fa955'),
	(6,26,91,'2017-07-04 22:00:59','2017-07-05 19:59:30','e6bdfc8d-1552-473a-9645-4e8ca20a248a'),
	(7,33,84,'2017-07-04 22:00:59','2017-07-05 19:46:27','f0dbfeea-051d-48f8-8b64-4c847f3d3c3a'),
	(8,37,20,'2017-07-04 22:00:59','2017-07-04 22:00:59','441da27c-60b1-456a-9d64-6c1ce2751835'),
	(9,43,81,'2017-07-04 22:00:59','2017-07-04 22:15:50','638d9577-386e-4f66-b583-5ea3ca47375e'),
	(10,46,22,'2017-07-04 22:00:59','2017-07-04 22:00:59','864efaa4-6f60-404c-90df-691f667539c9'),
	(11,50,85,'2017-07-04 22:01:00','2017-07-05 19:47:03','1bf6c16f-edc4-4e69-af38-a3fa3e7783d2'),
	(12,53,92,'2017-07-04 22:01:00','2017-07-05 20:01:59','096cc3b9-6a2f-45f0-9c98-5d8836d6dd52'),
	(13,58,25,'2017-07-04 22:01:00','2017-07-04 22:01:00','22f299b9-398d-4e44-a04e-12475d6f9a4f'),
	(14,62,82,'2017-07-04 22:01:00','2017-07-04 22:16:21','1c871578-9766-4838-a980-999806c3a2f8'),
	(15,68,93,'2017-07-04 22:01:00','2017-07-05 20:03:04','5e77554c-0f7c-4114-b9a4-6871d47afdf6'),
	(16,72,86,'2017-07-04 22:01:00','2017-07-05 19:48:20','94e2ee42-07c1-4fa7-b727-78f0f0374d15'),
	(17,75,29,'2017-07-04 22:01:01','2017-07-04 22:01:01','d3660777-06a4-4c15-8426-d4e81bc80e2c'),
	(18,79,30,'2017-07-04 22:01:01','2017-07-04 22:01:01','7493a35c-fb7a-40d4-acc0-ae2ff7ad04b7'),
	(19,83,31,'2017-07-04 22:01:01','2017-07-04 22:01:01','59169428-077b-44b8-bf63-d94bd59a15f5'),
	(20,86,87,'2017-07-04 22:01:01','2017-07-05 19:49:41','a4cbb8ea-0bdc-4a47-a330-6fd873422380'),
	(21,89,33,'2017-07-04 22:01:01','2017-07-04 22:01:01','4f608dbc-ee28-4d4d-bf74-f43f1f3f32ad'),
	(22,93,88,'2017-07-04 22:01:01','2017-07-05 19:50:10','41f1eb64-1393-42e6-a6fa-a76ea602a4d7'),
	(23,96,35,'2017-07-04 22:01:01','2017-07-04 22:01:01','f8617e35-50d5-44f5-afc8-47d0b76a5855'),
	(24,99,36,'2017-07-04 22:01:02','2017-07-04 22:01:02','cc135771-c229-4d33-9203-91917c9045ff'),
	(25,101,37,'2017-07-04 22:01:02','2017-07-04 22:01:02','1199a16c-7dd9-4c80-a73d-dffb16a6c028'),
	(26,110,38,'2017-07-04 22:01:02','2017-07-04 22:01:02','543c6e52-a262-4a23-ab11-af1ac25356a4'),
	(27,114,39,'2017-07-04 22:01:02','2017-07-04 22:01:02','10635624-07a3-4b94-921b-e54ec4b095ca'),
	(28,118,40,'2017-07-04 22:01:02','2017-07-04 22:01:02','489841ab-1f50-4c7b-92ce-6434471ef571'),
	(29,125,89,'2017-07-04 22:01:03','2017-07-05 19:51:16','5fc55232-4504-4b2a-a17b-2392ac4ccfaf'),
	(30,128,42,'2017-07-04 22:01:03','2017-07-04 22:01:03','7d7c41f1-eafd-4de6-abe9-73fcf4d1eb2d'),
	(31,130,43,'2017-07-04 22:01:03','2017-07-04 22:01:03','476a42c7-b98d-43aa-b67d-b5ae7dc4a9f6'),
	(32,137,44,'2017-07-04 22:01:03','2017-07-04 22:01:03','ffdc1b66-edeb-4d0e-a030-1203d3ad9a97'),
	(33,144,80,'2017-07-04 22:01:03','2017-07-04 22:15:15','b6a7ee09-5280-4f6e-a96d-f5d37385c2d9'),
	(34,150,46,'2017-07-04 22:01:04','2017-07-04 22:01:04','15e40c0d-d083-4a76-b06a-11a96dc1974f');

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
	(1,10,'de','','','2017-07-05 21:33:19','2017-07-05 21:33:19','bd458b46-f3ef-4779-860e-4766f5982daf');

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

LOCK TABLES `craft_supertablecontent_setslidersetup` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_setslidersetup` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_setslidersetup` (`id`, `elementId`, `locale`, `field_autoplay`, `field_speed`, `field_loop`, `field_navigation`, `field_pagination`, `field_autoHeight`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,9,'de','default','default',1,0,0,0,'2017-07-05 20:08:13','2017-07-05 20:08:13','ba85d6da-7389-4801-a614-c817da7f7793'),
	(2,9,'en','default','default',1,0,0,0,'2017-07-05 20:08:13','2017-07-05 20:08:13','db74d5f3-1a98-463b-8f56-0364cb0b1333');

/*!40000 ALTER TABLE `craft_supertablecontent_setslidersetup` ENABLE KEYS */;
UNLOCK TABLES;


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

LOCK TABLES `craft_supertablecontent_setslidersetupgeneral` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_setslidersetupgeneral` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_setslidersetupgeneral` (`id`, `elementId`, `locale`, `field_position`, `field_slidesPerView`, `field_spaceBetween`, `field_groupCell`, `field_freescroll`, `field_responsive`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,8,'de','center','three','','default',0,0,'2017-07-05 20:08:13','2017-07-05 20:08:13','2dfa7d54-29c9-44c5-a2a5-be3cd728776a'),
	(2,8,'en','center','three','','default',0,0,'2017-07-05 20:08:13','2017-07-05 20:08:13','716e2a86-f76a-4a0f-8d71-8dc6761b0dcd');

/*!40000 ALTER TABLE `craft_supertablecontent_setslidersetupgeneral` ENABLE KEYS */;
UNLOCK TABLES;


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
	(60,'editlocale:en','2017-07-04 22:11:54','2017-07-04 22:11:54','0fa8d845-b630-4773-8c1a-a1bbfe9111c7');

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
	(68,58,2,'2017-07-04 22:11:54','2017-07-04 22:11:54','e0652c02-2e54-4d5f-97c5-532611901ae4');

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
	(1,'kittn',NULL,'','','hello@kittn.xyz','$2y$13$aEV9hEIztEmte9HtKEhP8OT0ZWQ3NCO7Y8AUVe8j7HWWMGChQF23G','de',1,1,0,0,0,0,0,'2017-07-16 14:00:44','::1',NULL,NULL,'2017-07-05 21:25:17',NULL,NULL,NULL,NULL,0,'2017-07-16 14:02:16','2017-07-04 21:45:00','2017-07-16 14:02:16','230071a9-e155-4c49-8381-8aca584cd137');

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
