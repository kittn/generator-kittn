-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL,
  `sessionId` varchar(36) NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `assets`
--

DROP TABLE IF EXISTS `assets`;
CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `assettransformindex`
--

DROP TABLE IF EXISTS `assettransformindex`;
CREATE TABLE `assettransformindex` (
  `id` int(11) NOT NULL,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `assettransforms`
--

DROP TABLE IF EXISTS `assettransforms`;
CREATE TABLE `assettransforms` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `content`
--

DROP TABLE IF EXISTS `content`;
CREATE TABLE `content` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_body` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `content`
--

INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_body`) VALUES
(1, 1, 1, NULL, '2018-05-04 12:00:03', '2018-05-09 08:09:33', '8fef8f09-8b25-48bf-880e-271bc557c346', NULL),
(2, 2, 1, 'We just installed Craft!', '2018-05-09 06:19:39', '2018-05-09 06:42:17', '2afa7f2e-46a4-44ad-9ba6-0df4ba4a1c95', '<p>Craft is the CMS that’s powering Kittn. It’s beautiful, powerful, flexible, and easy-to-use, and it’s made by Pixel &amp; Tonic. We can’t wait to dive in and see what it’s capable of!</p><p>This is even more captivating content, which you couldn’t see on the News index page because it was entered after a Page Break, and the News index template only likes to show the content on the first page.</p><p>Craft: a nice alternative to Word, if you’re making a website.</p>'),
(3, 3, 1, 'Welcome to Kittn!', '2018-05-09 06:39:27', '2018-05-09 06:54:35', '6f507618-92a6-48ff-9ff3-6047ff251d8b', '<p>It’s true, this site doesn’t have a whole lot of content yet, but don’t worry. Our web developers have just installed the CMS, and they’re setting things up for the content editors this very moment. Soon Kittn will be an oasis of fresh perspectives, sharp analyses, and astute opinions that will keep you coming back again and again.</p>');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint(6) UNSIGNED DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `traces` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `elementindexsettings`
--

DROP TABLE IF EXISTS `elementindexsettings`;
CREATE TABLE `elementindexsettings` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `elements`
--

DROP TABLE IF EXISTS `elements`;
CREATE TABLE `elements` (
  `id` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `elements`
--

INSERT INTO `elements` (`id`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, 'craft\\elements\\User', 1, 0, '2018-05-04 12:00:03', '2018-05-09 08:09:33', '308ae331-27ba-4255-bd2e-8b7ae2ef5b3f'),
(2, 1, 'craft\\elements\\Entry', 1, 0, '2018-05-09 06:19:39', '2018-05-09 06:42:17', '0e210c8b-8be5-45c8-bc1c-e5119ddf1f5a'),
(3, 2, 'craft\\elements\\Entry', 1, 0, '2018-05-09 06:39:27', '2018-05-09 06:54:35', '1a66f714-a6ec-465c-94cf-75778368a119');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `elements_sites`
--

INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, NULL, NULL, 1, '2018-05-04 12:00:03', '2018-05-09 08:09:33', '0bca2984-f4e7-4bec-938c-01695a9d2881'),
(2, 2, 1, 'testnews', 'news/testnews', 1, '2018-05-09 06:19:39', '2018-05-09 06:42:17', '9eb119ac-795f-4e66-96dd-a0a8d924cd5d'),
(3, 3, 1, 'homepage', '__home__', 1, '2018-05-09 06:39:27', '2018-05-09 06:54:35', '51c0237a-e49e-4edc-a1c7-c7659495162d');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `entries`
--

DROP TABLE IF EXISTS `entries`;
CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `entries`
--

INSERT INTO `entries` (`id`, `sectionId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(2, 1, 1, 1, '2018-05-09 06:19:00', NULL, '2018-05-09 06:19:39', '2018-05-09 06:42:17', '1533ef2c-7da5-4eba-82e9-f48600e3655a'),
(3, 2, 2, NULL, '2018-05-09 06:39:26', NULL, '2018-05-09 06:39:27', '2018-05-09 06:54:35', '747602e1-b14e-4a2e-9270-ff21dca03136');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `entrydrafts`
--

DROP TABLE IF EXISTS `entrydrafts`;
CREATE TABLE `entrydrafts` (
  `id` int(11) NOT NULL,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `notes` text,
  `data` mediumtext NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleLabel` varchar(255) DEFAULT 'Title',
  `titleFormat` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `entrytypes`
--

INSERT INTO `entrytypes` (`id`, `sectionId`, `fieldLayoutId`, `name`, `handle`, `hasTitleField`, `titleLabel`, `titleFormat`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, 'News', 'news', 1, 'Titel', NULL, 1, '2018-05-09 06:17:39', '2018-05-09 06:40:23', '4d4fcc15-400b-45fa-95c7-56ed509d4944'),
(2, 2, 2, 'Homepage', 'homepage', 1, 'Title', NULL, 1, '2018-05-09 06:39:26', '2018-05-09 06:54:35', '25a1be39-08a5-4aba-b993-3c56ace8f27f');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `entryversions`
--

DROP TABLE IF EXISTS `entryversions`;
CREATE TABLE `entryversions` (
  `id` int(11) NOT NULL,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `siteId` int(11) NOT NULL,
  `num` smallint(6) UNSIGNED NOT NULL,
  `notes` text,
  `data` mediumtext NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `entryversions`
--

INSERT INTO `entryversions` (`id`, `entryId`, `sectionId`, `creatorId`, `siteId`, `num`, `notes`, `data`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 2, 1, 1, 1, 1, '', '{\"typeId\":\"1\",\"authorId\":\"1\",\"title\":\"Testnews\",\"slug\":\"testnews\",\"postDate\":1525846779,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"2\":\"Toller Main content\"}}', '2018-05-09 06:19:39', '2018-05-09 06:19:39', '3ba06c7d-45bb-4650-9223-f0c99a661217'),
(2, 2, 1, 1, 1, 2, '', '{\"typeId\":\"1\",\"authorId\":\"1\",\"title\":\"Testnews\",\"slug\":\"testnews\",\"postDate\":1525846740,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"2\":\"Toller Main content\"}}', '2018-05-09 06:20:41', '2018-05-09 06:20:41', '4caeb41f-e492-48b3-bad4-abd036d4cd73'),
(3, 2, 1, 1, 1, 3, '', '{\"typeId\":\"1\",\"authorId\":\"1\",\"title\":\"We just installed Craft!\",\"slug\":\"testnews\",\"postDate\":1525846740,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"2\":\"<p>Craft is the CMS that’s powering Ktest10.local. It’s beautiful, powerful, flexible, and easy-to-use, and it’s made by Pixel &amp; Tonic. We can’t wait to dive in and see what it’s capable of!</p><p>This is even more captivating content, which you couldn’t see on the News index page because it was entered after a Page Break, and the News index template only likes to show the content on the first page.</p><p>Craft: a nice alternative to Word, if you’re making a website.</p>\"}}', '2018-05-09 06:38:55', '2018-05-09 06:38:55', '5998b301-b72d-48a0-aac3-d54a15126765'),
(5, 2, 1, 1, 1, 4, '', '{\"typeId\":\"1\",\"authorId\":\"1\",\"title\":\"We just installed Craft!\",\"slug\":\"testnews\",\"postDate\":1525846740,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"2\":\"<p>Craft is the CMS that’s powering Kittn. It’s beautiful, powerful, flexible, and easy-to-use, and it’s made by Pixel &amp; Tonic. We can’t wait to dive in and see what it’s capable of!</p><p>This is even more captivating content, which you couldn’t see on the News index page because it was entered after a Page Break, and the News index template only likes to show the content on the first page.</p><p>Craft: a nice alternative to Word, if you’re making a website.</p>\",\"3\":[]}}', '2018-05-09 06:42:17', '2018-05-09 06:42:17', 'dbc02351-593d-40d6-af81-1af63b6f839b'),
(6, 3, 2, 1, 1, 1, 'Revision from 9.5.2018, 08:40:06', '{\"typeId\":\"2\",\"authorId\":null,\"title\":\"Homepage\",\"slug\":\"homepage\",\"postDate\":1525847966,\"expiryDate\":null,\"enabled\":\"1\",\"newParentId\":null,\"fields\":[]}', '2018-05-09 06:43:04', '2018-05-09 06:43:04', '734b826e-ef52-4895-bb15-01bae34325de'),
(7, 3, 2, 1, 1, 2, '', '{\"typeId\":\"2\",\"authorId\":null,\"title\":\"Welcome to Kittn!\",\"slug\":\"homepage\",\"postDate\":1525847966,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"2\":\"<p>It’s true, this site doesn’t have a whole lot of content yet, but don’t worry. Our web developers have just installed the CMS, and they’re setting things up for the content editors this very moment. Soon Kittn will be an oasis of fresh perspectives, sharp analyses, and astute opinions that will keep you coming back again and again.</p>\"}}', '2018-05-09 06:43:05', '2018-05-09 06:43:05', '1cdb3884-aadd-475f-9ba0-de9c2b9f6eee');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `fieldgroups`
--

DROP TABLE IF EXISTS `fieldgroups`;
CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `fieldgroups`
--

INSERT INTO `fieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Common', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '1e4619e1-5e51-4a27-8568-5401add9c14b');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `fieldlayoutfields`
--

DROP TABLE IF EXISTS `fieldlayoutfields`;
CREATE TABLE `fieldlayoutfields` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `fieldlayoutfields`
--

INSERT INTO `fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(6, 1, 5, 2, 1, 1, '2018-05-09 06:40:23', '2018-05-09 06:40:23', 'd602a3ed-e810-41ef-95ab-fd2bdb7f7b81'),
(7, 1, 5, 3, 0, 2, '2018-05-09 06:40:23', '2018-05-09 06:40:23', '35fb4af6-b228-4245-84bb-b1d4dbac30f3'),
(8, 2, 6, 2, 1, 1, '2018-05-09 06:54:35', '2018-05-09 06:54:35', '7e2bed97-2eb6-4759-ac4f-ec2293e22fb8');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `fieldlayouts`
--

INSERT INTO `fieldlayouts` (`id`, `type`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'craft\\elements\\Entry', '2018-05-09 06:17:39', '2018-05-09 06:40:23', '3a55138a-eff5-4d29-9601-cab573963eb9'),
(2, 'craft\\elements\\Entry', '2018-05-09 06:39:26', '2018-05-09 06:54:35', '80ce97ec-b5cb-49c6-999e-adb98f4c4727'),
(3, 'craft\\elements\\Tag', '2018-05-09 06:41:17', '2018-05-09 06:41:17', '414e3ff1-b69e-47b0-8d9a-e3f269a9466c');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `fieldlayouttabs`
--

DROP TABLE IF EXISTS `fieldlayouttabs`;
CREATE TABLE `fieldlayouttabs` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `fieldlayouttabs`
--

INSERT INTO `fieldlayouttabs` (`id`, `layoutId`, `name`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(5, 1, 'Main', 1, '2018-05-09 06:40:23', '2018-05-09 06:40:23', 'dd0f5330-c30a-4a54-a4b1-7ae39a72aea1'),
(6, 2, 'Content', 1, '2018-05-09 06:54:35', '2018-05-09 06:54:35', '99dacfe4-59e6-4206-b7ee-08f5dd8782d3');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `fields`
--

DROP TABLE IF EXISTS `fields`;
CREATE TABLE `fields` (
  `id` int(11) NOT NULL,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `instructions` text,
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `fields`
--

INSERT INTO `fields` (`id`, `groupId`, `name`, `handle`, `context`, `instructions`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(2, 1, 'Body', 'body', 'global', '', 'none', NULL, 'craft\\redactor\\Field', '{\"redactorConfig\":\"\",\"purifierConfig\":\"\",\"cleanupHtml\":\"1\",\"purifyHtml\":\"1\",\"columnType\":\"text\",\"availableVolumes\":\"*\",\"availableTransforms\":\"*\"}', '2018-05-09 06:19:02', '2018-05-09 08:13:45', '2479e13e-5d2d-4218-8711-dc5b002fc543'),
(3, 1, 'Tags', 'tags', 'global', '', 'site', NULL, 'craft\\fields\\Tags', '{\"sources\":\"*\",\"source\":\"taggroup:1\",\"targetSiteId\":null,\"viewMode\":null,\"limit\":null,\"selectionLabel\":\"\",\"localizeRelations\":false}', '2018-05-09 06:34:28', '2018-05-09 06:41:26', '6817cf5c-3584-4279-af6d-b1e71912f43f');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `info`
--

DROP TABLE IF EXISTS `info`;
CREATE TABLE `info` (
  `id` int(11) NOT NULL,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `edition` tinyint(3) UNSIGNED NOT NULL,
  `timezone` varchar(30) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `on` tinyint(1) NOT NULL DEFAULT '0',
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `info`
--

INSERT INTO `info` (`id`, `version`, `schemaVersion`, `edition`, `timezone`, `name`, `on`, `maintenance`, `fieldVersion`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, '3.0.6', '3.0.91', 0, 'Europe/Berlin', '<%= projectname %>', 1, 0, 'zhsTGUhnvbNX', '2018-05-04 12:00:03', '2018-05-09 08:13:45', 'bc083169-5ffc-4374-8088-4591c0162a15');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `matrixblocks`
--

DROP TABLE IF EXISTS `matrixblocks`;
CREATE TABLE `matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `ownerSiteId` int(11) DEFAULT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `matrixblocktypes`
--

DROP TABLE IF EXISTS `matrixblocktypes`;
CREATE TABLE `matrixblocktypes` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `type` enum('app','plugin','content') NOT NULL DEFAULT 'app',
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `migrations`
--

INSERT INTO `migrations` (`id`, `pluginId`, `type`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, 'app', 'Install', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '00cce117-f980-4d86-88d3-8ff8baa5f9fb'),
(2, NULL, 'app', 'm150403_183908_migrations_table_changes', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', 'd80bc6d4-5844-4f2d-bb1a-b639621dc913'),
(3, NULL, 'app', 'm150403_184247_plugins_table_changes', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '3d27aa23-6331-43d9-b149-e7193d2ab94f'),
(4, NULL, 'app', 'm150403_184533_field_version', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '40185e50-ed3b-4428-a1ee-5a1106afdb15'),
(5, NULL, 'app', 'm150403_184729_type_columns', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '9be8a6e7-850a-4c6c-8da7-82303ba74e95'),
(6, NULL, 'app', 'm150403_185142_volumes', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', 'e0198eb6-e8e7-403a-b65c-e43b5448511b'),
(7, NULL, 'app', 'm150428_231346_userpreferences', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '0746bd48-0953-4362-90ad-7c89f9b78d09'),
(8, NULL, 'app', 'm150519_150900_fieldversion_conversion', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '26c71031-f5fb-4c23-bd01-a96c6a5a8998'),
(9, NULL, 'app', 'm150617_213829_update_email_settings', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '0d3dd52e-cbba-4c49-a523-528ca2b1dd95'),
(10, NULL, 'app', 'm150721_124739_templatecachequeries', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', 'f263b5a5-76a1-47dc-9e6c-3ace10a90400'),
(11, NULL, 'app', 'm150724_140822_adjust_quality_settings', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '149d9374-eba3-4475-bc88-89b858149201'),
(12, NULL, 'app', 'm150815_133521_last_login_attempt_ip', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2abb6e51-5035-4005-a833-17973ae7456b'),
(13, NULL, 'app', 'm151002_095935_volume_cache_settings', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '22f751af-8b1d-40ab-8817-eaf8c3b0eb1e'),
(14, NULL, 'app', 'm151005_142750_volume_s3_storage_settings', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '5af67a51-815e-4a3c-a21b-e4b45bab2ae7'),
(15, NULL, 'app', 'm151016_133600_delete_asset_thumbnails', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '887b6e74-1c83-472c-a8dc-48786de8a562'),
(16, NULL, 'app', 'm151209_000000_move_logo', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '77fa9c9d-b2af-4f73-99b5-9cfe11cb5042'),
(17, NULL, 'app', 'm151211_000000_rename_fileId_to_assetId', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '5eeb1531-9bbf-4b56-9759-e32ea6bf3768'),
(18, NULL, 'app', 'm151215_000000_rename_asset_permissions', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', 'b3a6e2d1-9d30-4455-8eea-cd36bea23130'),
(19, NULL, 'app', 'm160707_000001_rename_richtext_assetsource_setting', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '60eeba31-ae10-4e12-bda7-8651f2b493e2'),
(20, NULL, 'app', 'm160708_185142_volume_hasUrls_setting', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', 'd6f90446-2ece-42eb-b0f0-3b4c53e316e2'),
(21, NULL, 'app', 'm160714_000000_increase_max_asset_filesize', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '7ca0c248-35d7-4fe9-98e4-157371bf799a'),
(22, NULL, 'app', 'm160727_194637_column_cleanup', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '527584e5-64a7-474d-8391-b21f306c6a02'),
(23, NULL, 'app', 'm160804_110002_userphotos_to_assets', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '45c5130d-6d81-4085-ab3b-380f0eedc020'),
(24, NULL, 'app', 'm160807_144858_sites', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '9480b76e-27a2-4f9a-96ff-0a506ed37574'),
(25, NULL, 'app', 'm160829_000000_pending_user_content_cleanup', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '4ae583ca-0d53-498c-b78d-1ec6e19657d7'),
(26, NULL, 'app', 'm160830_000000_asset_index_uri_increase', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', 'eecff418-5d2e-4824-b027-89229a663170'),
(27, NULL, 'app', 'm160912_230520_require_entry_type_id', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '0406e5e6-e287-4237-975c-a64ecfd03f6f'),
(28, NULL, 'app', 'm160913_134730_require_matrix_block_type_id', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '553d5e59-8eb3-4e07-b36b-ab662a1d04de'),
(29, NULL, 'app', 'm160920_174553_matrixblocks_owner_site_id_nullable', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '058ce1d1-98e6-4d53-a88b-cc5d0b4301cc'),
(30, NULL, 'app', 'm160920_231045_usergroup_handle_title_unique', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '6f8fe43d-da9a-482e-8c1b-6c061af8c3ed'),
(31, NULL, 'app', 'm160925_113941_route_uri_parts', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', 'd1994ff6-d087-4a27-8b4f-c9273e5d2283'),
(32, NULL, 'app', 'm161006_205918_schemaVersion_not_null', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '66df63ff-7692-4d99-9533-dafbca326731'),
(33, NULL, 'app', 'm161007_130653_update_email_settings', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '1fc6c9f7-a43e-422b-b728-ccf65d0aae9f'),
(34, NULL, 'app', 'm161013_175052_newParentId', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', 'dab16dc6-87ce-44f4-b651-0982c4ab2242'),
(35, NULL, 'app', 'm161021_102916_fix_recent_entries_widgets', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', 'f591410e-a4ac-4820-9da1-2e3bdf575a51'),
(36, NULL, 'app', 'm161021_182140_rename_get_help_widget', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '3bc4624c-add1-4744-89d5-85d45713e987'),
(37, NULL, 'app', 'm161025_000000_fix_char_columns', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', 'e42e6d82-1b2c-42ab-8c90-6ec38e00a505'),
(38, NULL, 'app', 'm161029_124145_email_message_languages', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '04d16c3e-2f7e-4611-95b7-8e23e1b75714'),
(39, NULL, 'app', 'm161108_000000_new_version_format', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', 'a13ae018-96bd-42dc-bdfd-caa04707f93f'),
(40, NULL, 'app', 'm161109_000000_index_shuffle', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', 'f741ef9f-5fd3-4c88-8ffb-57f7462b0024'),
(41, NULL, 'app', 'm161122_185500_no_craft_app', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '1b0ace89-dd88-4530-ae4d-292422741ce5'),
(42, NULL, 'app', 'm161125_150752_clear_urlmanager_cache', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '448d0866-57a8-4307-a3dd-b6a1d89fd715'),
(43, NULL, 'app', 'm161220_000000_volumes_hasurl_notnull', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '1867938d-2114-472e-8956-45563e4cb7d2'),
(44, NULL, 'app', 'm170114_161144_udates_permission', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '4aa9920d-3fd8-4515-a1ea-a25c83047908'),
(45, NULL, 'app', 'm170120_000000_schema_cleanup', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '76fd994e-f6ba-4ef2-ba0c-d7dec9682c0b'),
(46, NULL, 'app', 'm170126_000000_assets_focal_point', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', 'd7baba1d-1744-46d4-bed6-c2710f56c103'),
(47, NULL, 'app', 'm170206_142126_system_name', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '5ad7741f-a587-470c-9073-5f56f62eca2f'),
(48, NULL, 'app', 'm170217_044740_category_branch_limits', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', 'd7b6d51a-e871-47d3-be89-65f1dc67cb79'),
(49, NULL, 'app', 'm170217_120224_asset_indexing_columns', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '0cc77be7-13a3-4440-ae7c-e1e7dc28d500'),
(50, NULL, 'app', 'm170223_224012_plain_text_settings', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '4f717179-3c44-4c11-9dfb-16c99f6f4b50'),
(51, NULL, 'app', 'm170227_120814_focal_point_percentage', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', 'e2750503-17ae-4bc5-80ca-1f5f0b32b2ab'),
(52, NULL, 'app', 'm170228_171113_system_messages', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '10788112-48b3-4156-ac0b-5ea7c8d9654f'),
(53, NULL, 'app', 'm170303_140500_asset_field_source_settings', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '0c1734f4-9429-40ba-80be-c25336b26c2b'),
(54, NULL, 'app', 'm170306_150500_asset_temporary_uploads', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '4606d895-901f-4164-b0b6-26e953f42316'),
(55, NULL, 'app', 'm170414_162429_rich_text_config_setting', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '6d86d1e1-984d-4e44-957e-6e6efe2b5e37'),
(56, NULL, 'app', 'm170523_190652_element_field_layout_ids', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '4a0c4991-e305-449d-b9e9-9930b0e60781'),
(57, NULL, 'app', 'm170612_000000_route_index_shuffle', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', 'e253cedb-07fb-45cf-9c1f-b43000357b67'),
(58, NULL, 'app', 'm170621_195237_format_plugin_handles', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', 'b737dd13-f1c6-4b89-bc05-13e912ee7b13'),
(59, NULL, 'app', 'm170630_161028_deprecation_changes', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '53026eb1-da60-4cc6-9029-c4b7c2df3411'),
(60, NULL, 'app', 'm170703_181539_plugins_table_tweaks', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', 'ad05537d-0c4c-4802-8ed7-6056f366a070'),
(61, NULL, 'app', 'm170704_134916_sites_tables', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '66e275ef-0823-4668-8d88-71e76d231b80'),
(62, NULL, 'app', 'm170706_183216_rename_sequences', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '399f4ef2-8517-4661-adbe-d3e6d2f626f5'),
(63, NULL, 'app', 'm170707_094758_delete_compiled_traits', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '6c578456-e877-4f88-8bba-81898337489f'),
(64, NULL, 'app', 'm170731_190138_drop_asset_packagist', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '81802551-0173-46fa-bddd-6c0d113eb3f6'),
(65, NULL, 'app', 'm170810_201318_create_queue_table', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '7547fb0e-febc-4dce-a06a-4e87caf96c86'),
(66, NULL, 'app', 'm170816_133741_delete_compiled_behaviors', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '50a1c8e4-af89-4610-93d2-f844cd4ce039'),
(67, NULL, 'app', 'm170821_180624_deprecation_line_nullable', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '6753bcdc-e8f6-4670-8f88-4a99b97e6903'),
(68, NULL, 'app', 'm170903_192801_longblob_for_queue_jobs', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '79245aa4-25fc-4313-8ef6-3fc37d8300d9'),
(69, NULL, 'app', 'm170914_204621_asset_cache_shuffle', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', 'fc77ca8d-87fa-4100-ad92-61dab73dab21'),
(70, NULL, 'app', 'm171011_214115_site_groups', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', 'e0db379e-b20c-4d9e-b265-557f113765ed'),
(71, NULL, 'app', 'm171012_151440_primary_site', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', 'f10f7866-e74a-41c1-95eb-57fdf789ded5'),
(72, NULL, 'app', 'm171013_142500_transform_interlace', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', 'ddaf26f3-c935-4b59-b647-3e9ef858da7b'),
(73, NULL, 'app', 'm171016_092553_drop_position_select', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', 'd7cb9e2d-2b9a-4f48-9323-59d3f910e601'),
(74, NULL, 'app', 'm171016_221244_less_strict_translation_method', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '5e3b1bf2-4949-4875-a5a5-dc1414c3728a'),
(75, NULL, 'app', 'm171107_000000_assign_group_permissions', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '780bc5f0-75a3-47a4-ad5a-9865bbe2be84'),
(76, NULL, 'app', 'm171117_000001_templatecache_index_tune', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '4f4bd3b3-3448-4ab1-aefd-488b3a2f1d20'),
(77, NULL, 'app', 'm171126_105927_disabled_plugins', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '08daba56-589d-4a43-a920-46a1a5e9eec4'),
(78, NULL, 'app', 'm171130_214407_craftidtokens_table', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '9484d05b-5e4c-4891-a79d-95f2338e58b6'),
(79, NULL, 'app', 'm171202_004225_update_email_settings', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '777eb658-c328-4a9d-979f-e9aee8c68d9a'),
(80, NULL, 'app', 'm171204_000001_templatecache_index_tune_deux', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '63db6a67-9b93-4d9c-848c-08a861bb449a'),
(81, NULL, 'app', 'm171205_130908_remove_craftidtokens_refreshtoken_column', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', 'c426e6eb-5d94-4e6a-839b-d144f35b64ee'),
(82, NULL, 'app', 'm171218_143135_longtext_query_column', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '1f967c9f-4ca4-4589-b247-00cdd2104737'),
(83, NULL, 'app', 'm171231_055546_environment_variables_to_aliases', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '7ab3d747-9b6d-4669-93e5-702f434ae349'),
(84, NULL, 'app', 'm180113_153740_drop_users_archived_column', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', 'b5f7a270-1129-46f1-9d7f-f32f9fcd72a3'),
(85, NULL, 'app', 'm180122_213433_propagate_entries_setting', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2fbdf7b6-b35e-4577-9cb6-39d3bb57bbf2'),
(86, NULL, 'app', 'm180124_230459_fix_propagate_entries_values', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '4eff6bc7-c7d3-48b7-9da0-d27cdc867128'),
(87, NULL, 'app', 'm180128_235202_set_tag_slugs', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '0248e770-f717-4f78-8d48-f386871bd395'),
(88, NULL, 'app', 'm180202_185551_fix_focal_points', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '8d090992-a4e3-402c-812e-2e3d09f3975f'),
(89, NULL, 'app', 'm180217_172123_tiny_ints', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '666d0f45-3107-4f77-90bf-4e89af363de9'),
(90, NULL, 'app', 'm180321_233505_small_ints', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '3b25ac2c-6fda-495f-bac7-58f4a087adb4'),
(91, NULL, 'app', 'm180328_115523_new_license_key_statuses', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '8f7471fd-b3cd-463c-8113-e14f15ea2034'),
(92, NULL, 'app', 'm180404_182320_edition_changes', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', 'bc3c7230-89c4-4b0e-ae04-442b7bd7a232'),
(93, NULL, 'app', 'm180411_102218_fix_db_routes', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', 'a06ada78-f7a6-45e5-8376-7b06d8be4f94'),
(94, NULL, 'app', 'm180416_205628_resourcepaths_table', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '23b6dad8-fd60-4502-9d64-820816599165'),
(95, NULL, 'app', 'm180418_205713_widget_cleanup', '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-04 12:00:03', 'd152c4b2-26a3-4846-917b-9bed9a887d10'),
(96, 2, 'plugin', 'm180430_204710_remove_old_plugins', '2018-05-09 08:09:57', '2018-05-09 08:09:57', '2018-05-09 08:09:57', '960a40c8-53b9-4998-a09a-61a114563288'),
(97, 2, 'plugin', 'Install', '2018-05-09 08:09:57', '2018-05-09 08:09:57', '2018-05-09 08:09:57', '3ef126d3-2f35-479c-8cf1-55c52a663899'),
(98, 9, 'plugin', 'Install', '2018-05-09 08:13:15', '2018-05-09 08:13:15', '2018-05-09 08:13:15', 'c63ca456-1ae0-4fb0-9f83-7e335d1ab74c'),
(99, 10, 'plugin', 'Install', '2018-05-09 08:13:23', '2018-05-09 08:13:23', '2018-05-09 08:13:23', '80546e70-cdc8-4596-be8e-c4ac8a6f006a'),
(100, 10, 'plugin', 'm180210_000000_migrate_content_tables', '2018-05-09 08:13:23', '2018-05-09 08:13:23', '2018-05-09 08:13:23', '9bb5aa71-2a52-4023-9bc7-c9410606e824'),
(101, 10, 'plugin', 'm180211_000000_type_columns', '2018-05-09 08:13:23', '2018-05-09 08:13:23', '2018-05-09 08:13:23', '16989749-edcc-4b83-8338-e1928e1a6c9c'),
(102, 10, 'plugin', 'm180219_000000_sites', '2018-05-09 08:13:23', '2018-05-09 08:13:23', '2018-05-09 08:13:23', 'acfaaf56-d01c-4340-bd6e-f8e61d197b47'),
(103, 10, 'plugin', 'm180220_000000_fix_context', '2018-05-09 08:13:23', '2018-05-09 08:13:23', '2018-05-09 08:13:23', 'c9b751ff-ce89-464b-bc9f-f1b9980e8e7c');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `plugins`
--

DROP TABLE IF EXISTS `plugins`;
CREATE TABLE `plugins` (
  `id` int(11) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `licenseKey` char(24) DEFAULT NULL,
  `licenseKeyStatus` enum('valid','invalid','mismatched','astray','unknown') NOT NULL DEFAULT 'unknown',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `settings` text,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `plugins`
--

INSERT INTO `plugins` (`id`, `handle`, `version`, `schemaVersion`, `licenseKey`, `licenseKeyStatus`, `enabled`, `settings`, `installDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'ckeditor', '1.0.0-beta.2', '1.0.0', NULL, 'unknown', 1, NULL, '2018-05-09 06:37:53', '2018-05-09 06:37:53', '2018-05-09 07:01:33', 'db2e9e63-a15d-4849-849d-1c4ed6dba314'),
(2, 'redactor', '2.0.1', '2.0.0', NULL, 'unknown', 1, NULL, '2018-05-09 08:09:57', '2018-05-09 08:09:57', '2018-05-09 08:13:28', 'c00618ed-b50e-4bd4-8185-82f9f1c98840'),
(3, 'http2-server-push', '1.0.0', '1.0.0', NULL, 'unknown', 1, NULL, '2018-05-09 08:11:24', '2018-05-09 08:11:24', '2018-05-09 08:13:28', '3223c2cd-b414-4dbe-8377-36f67a1d8b77'),
(4, 'image-optimize', '1.4.31', '1.0.0', NULL, 'invalid', 0, NULL, '2018-05-09 08:11:29', '2018-05-09 08:11:29', '2018-05-09 08:11:56', 'd29b58c3-512b-44d0-a4d4-c1c39298d8a2'),
(5, 'imager', 'v2.0.0', '2.0.0', NULL, 'unknown', 1, NULL, '2018-05-09 08:12:20', '2018-05-09 08:12:20', '2018-05-09 08:13:28', 'f67c6d58-2027-42b0-84cc-f56e2823a3c6'),
(6, 'logs', '3.0.0', '3.0.0', NULL, 'unknown', 1, NULL, '2018-05-09 08:12:23', '2018-05-09 08:12:23', '2018-05-09 08:13:28', 'd15e2b71-9270-4247-9291-d86f9a514576'),
(7, 'minify', '1.2.8', '1.0.0', NULL, 'unknown', 1, NULL, '2018-05-09 08:12:53', '2018-05-09 08:12:53', '2018-05-09 08:13:28', 'ab7bc171-d596-4466-b289-bd82a51a0dc6'),
(8, 'environment-label', '3.1.3', '1.0.0', NULL, 'unknown', 1, NULL, '2018-05-09 08:13:00', '2018-05-09 08:13:00', '2018-05-09 08:13:28', 'cd789a1b-d533-4cf3-9fa3-7e50f10aaaec'),
(9, 'snitch', '2.0.1', '1.0.0', NULL, 'unknown', 1, NULL, '2018-05-09 08:13:15', '2018-05-09 08:13:15', '2018-05-09 08:13:28', '01add4db-4d03-4391-82d3-f840d78b4767'),
(10, 'super-table', '2.0.7', '2.0.4', NULL, 'unknown', 1, NULL, '2018-05-09 08:13:22', '2018-05-09 08:13:22', '2018-05-09 08:13:28', '5ac68ec1-a086-4597-a6b7-a1258ebe42fa'),
(11, 'typedlinkfield', '1.0.8', '1.0.0', NULL, 'unknown', 1, NULL, '2018-05-09 08:13:26', '2018-05-09 08:13:26', '2018-05-09 08:13:28', 'ef526c17-996a-469d-bf04-717416056a65');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `queue`
--

DROP TABLE IF EXISTS `queue`;
CREATE TABLE `queue` (
  `id` int(11) NOT NULL,
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) UNSIGNED NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT '0',
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `relations`
--

DROP TABLE IF EXISTS `relations`;
CREATE TABLE `relations` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `resourcepaths`
--

INSERT INTO `resourcepaths` (`hash`, `path`) VALUES
('12c8aadf', '@craft/web/assets/cp/dist'),
('14e78f96', '@lib/selectize'),
('198a5993', '@lib/garnishjs'),
('1992715', '@craft/web/assets/generalsettings/dist'),
('1bb39aa2', '@craft/web/assets/pluginstore/dist'),
('1e8bcb1c', '@lib/xregexp'),
('1edfe44f', '@craft/web/assets'),
('21749369', '@lib/timepicker'),
('23365286', '@lib/jquery-touch-events'),
('241bf635', '@craft/web/assets/tablesettings/dist'),
('24926e44', '@lib/picturefill'),
('26163385', '@verbb/supertable/resources/dist'),
('297e572d', '@app/web/assets/plugins/dist'),
('2a374e15', '@lib/d3'),
('2b4df3e3', '@nystudio107/imageoptimize/assetbundles/imageoptimize/dist'),
('2c315e43', '@craft/web/assets/utilities/dist'),
('2f181468', '@app/web/assets/editentry/dist'),
('32e9cc60', '@craft/web/assets/sites/dist'),
('360c3120', '@craft/web/assets/recententries/dist'),
('3c7a6fba', '@lib/fileupload'),
('40103a63', '@craft/web/assets/tablesettings/dist'),
('4099a212', '@lib/picturefill'),
('457f5f3f', '@lib/timepicker'),
('473d9ed0', '@lib/jquery-touch-events'),
('483a9215', '@craft/web/assets/utilities/dist'),
('4d759b7b', '@app/web/assets/plugins/dist'),
('4e3c8243', '@lib/d3'),
('5207fd76', '@craft/web/assets/recententries/dist'),
('5871a3ec', '@lib/fileupload'),
('5c2e37d6', '@app/web/assets/clearcaches/dist'),
('6592eb43', '@craft/web/assets/generalsettings/dist'),
('68028816', '@craft/web/assets/fields/dist'),
('68c741fb', '@lib/fabric'),
('694fe4dc', '@lib/datepicker-i18n'),
('6c37c08e', '@craft/ckeditor/assets/field/dist'),
('6cbdbf18', '@craft/web/assets/updateswidget/dist'),
('70ec43c0', '@lib/selectize'),
('76c36689', '@craft/web/assets/cp/dist'),
('7a80074a', '@lib/xregexp'),
('7ad42819', '@craft/web/assets'),
('7d8195c5', '@lib/garnishjs'),
('7fb856f4', '@craft/web/assets/pluginstore/dist'),
('846287f5', '@app/web/assets/matrixsettings/dist'),
('87a8f936', '@lib/element-resize-detector'),
('8b6734e', '@craft/web/assets/updateswidget/dist'),
('8d47529e', '@craft/web/assets/dashboard/dist'),
('8d9f826', '@app/web/assets/fields/dist'),
('8dab43fc', '@craft/web/assets/plugins/dist'),
('900fb803', '@craft/web/assets/feed/dist'),
('9012933b', '@lib'),
('928db1f2', '@craft/web/assets/matrixsettings/dist'),
('9315f24d', '@lib/jquery-ui'),
('964051ed', '@craft/web/assets/edituser/dist'),
('a5900a56', '@lib/jquery.payment'),
('a7e2b4ea', '@app/web/assets/tablesettings/dist'),
('a83852c3', '@bower/jquery/dist'),
('a8b85472', '@app/web/assets/cp/dist'),
('ade1909e', '@craft/web/assets/editentry/dist'),
('aec8dab5', '@app/web/assets/utilities/dist'),
('af1a8547', '@craft/web/assets/craftsupport/dist'),
('b2c4bc62', '@craft/web/assets/deprecationerrors/dist'),
('b9b7a5be', '@lib/velocity'),
('c094440', '@craft/web/assets/fields/dist'),
('c19bc600', '@lib/jquery.payment'),
('c317fedc', '@craft/web/assets/login/dist'),
('cb114911', '@craft/web/assets/craftsupport/dist'),
('cc339e95', '@bower/jquery/dist'),
('ccb39824', '@app/web/assets/cp/dist'),
('ccc8dad', '@lib/fabric'),
('d0254871', '@vendor/craftcms/ckeditor/lib/ckeditor/dist'),
('d10c57e5', '@marionnewlevant/snitch/assetbundles/snitch/dist'),
('d44288a', '@lib/datepicker-i18n'),
('d78bd50f', '@app/web/assets/pluginstore/dist'),
('ddbc69e8', '@lib/velocity'),
('e22c46d', '@app/web/assets/deprecationerrors/dist'),
('e3a33560', '@lib/element-resize-detector'),
('e94c9ec8', '@craft/web/assets/dashboard/dist'),
('e9a08faa', '@craft/web/assets/plugins/dist'),
('f24b9dbb', '@craft/web/assets/edituser/dist'),
('f4047455', '@craft/web/assets/feed/dist'),
('f4195f6d', '@lib'),
('f6867da4', '@craft/web/assets/matrixsettings/dist'),
('f71e3e1b', '@lib/jquery-ui');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `routes`
--

DROP TABLE IF EXISTS `routes`;
CREATE TABLE `routes` (
  `id` int(11) NOT NULL,
  `siteId` int(11) DEFAULT NULL,
  `uriParts` varchar(255) NOT NULL,
  `uriPattern` varchar(255) NOT NULL,
  `template` varchar(500) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `searchindex`
--

INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES
(1, 'username', 0, 1, ' kittn '),
(1, 'firstname', 0, 1, ''),
(1, 'lastname', 0, 1, ''),
(1, 'fullname', 0, 1, ''),
(1, 'email', 0, 1, ' foo bar com '),
(1, 'slug', 0, 1, ''),
(2, 'field', 1, 1, ''),
(2, 'field', 2, 1, ' craft is the cms that s powering kittn it s beautiful powerful flexible and easy to use and it s made by pixel tonic we can t wait to dive in and see what it s capable of this is even more captivating content which you couldn t see on the news index page because it was entered after a page break and the news index template only likes to show the content on the first page craft a nice alternative to word if you re making a website '),
(2, 'slug', 0, 1, ' testnews '),
(2, 'title', 0, 1, ' we just installed craft '),
(3, 'slug', 0, 1, ' homepage '),
(3, 'title', 0, 1, ' welcome to kittn '),
(3, 'field', 2, 1, ' it s true this site doesn t have a whole lot of content yet but don t worry our web developers have just installed the cms and they re setting things up for the content editors this very moment soon kittn will be an oasis of fresh perspectives sharp analyses and astute opinions that will keep you coming back again and again '),
(2, 'field', 3, 1, '');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sections`
--

DROP TABLE IF EXISTS `sections`;
CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagateEntries` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `sections`
--

INSERT INTO `sections` (`id`, `structureId`, `name`, `handle`, `type`, `enableVersioning`, `propagateEntries`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, 'News', 'news', 'channel', 1, 1, '2018-05-09 06:17:38', '2018-05-09 06:17:38', '46962fb1-47df-49be-ade6-9184abcc911e'),
(2, NULL, 'Homepage', 'homepage', 'single', 1, 1, '2018-05-09 06:39:26', '2018-05-09 06:54:34', 'fa87fb43-5046-4722-805d-026b4405366a');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `sections_sites`
--

INSERT INTO `sections_sites` (`id`, `sectionId`, `siteId`, `hasUrls`, `uriFormat`, `template`, `enabledByDefault`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, 1, 'news/{slug}', 'news/_entry', 1, '2018-05-09 06:17:39', '2018-05-09 06:17:39', '2b9606dd-7b5a-4c7f-86f0-f75ba321c3c4'),
(2, 2, 1, 1, '__home__', 'index', 1, '2018-05-09 06:39:26', '2018-05-09 06:54:34', 'f448e5ee-b3d0-47aa-adda-e395af222cdb');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `sessions`
--

INSERT INTO `sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'BWYQiOAK1nVyVmILk2kBb0cWKO_DG6jJgjCDLCzpSf-qviQr4kdns-OI20i8y_Vb2zhmTFm7AswFk0DfYYD3t-vlKHN3x1KxJlp9', '2018-05-09 06:11:03', '2018-05-09 07:14:45', '5694b5b4-cff0-43c7-b313-a23ab176f847');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `sitegroups`
--

INSERT INTO `sitegroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, '<%= projectname %>', '2018-05-04 12:00:03', '2018-05-04 12:00:03', 'f1b9914c-1047-4aa5-b826-460cf5b64483');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sites`
--

DROP TABLE IF EXISTS `sites`;
CREATE TABLE `sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `sites`
--

INSERT INTO `sites` (`id`, `groupId`, `primary`, `name`, `handle`, `language`, `hasUrls`, `baseUrl`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, '<%= projectname %>', 'default', 'de', 1, '@web/', 1, '2018-05-04 12:00:03', '2018-05-04 12:00:03', '39228968-d2da-4dbe-b6dd-97c161e7265e');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `snitch_collisions`
--

DROP TABLE IF EXISTS `snitch_collisions`;
CREATE TABLE `snitch_collisions` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `whenEntered` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) UNSIGNED DEFAULT NULL,
  `lft` int(11) UNSIGNED NOT NULL,
  `rgt` int(11) UNSIGNED NOT NULL,
  `level` smallint(6) UNSIGNED NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `structures`
--

DROP TABLE IF EXISTS `structures`;
CREATE TABLE `structures` (
  `id` int(11) NOT NULL,
  `maxLevels` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `supertableblocks`
--

DROP TABLE IF EXISTS `supertableblocks`;
CREATE TABLE `supertableblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `ownerSiteId` int(11) DEFAULT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `supertableblocktypes`
--

DROP TABLE IF EXISTS `supertableblocktypes`;
CREATE TABLE `supertableblocktypes` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `systemsettings`
--

DROP TABLE IF EXISTS `systemsettings`;
CREATE TABLE `systemsettings` (
  `id` int(11) NOT NULL,
  `category` varchar(15) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `systemsettings`
--

INSERT INTO `systemsettings` (`id`, `category`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'email', '{\"fromEmail\":\"<% if (projectmail) { %><%= projectmail %><% } else { %>foo@bar.com<% } %>\",\"fromName\":\"<%= projectname %>\",\"template\":null,\"transportType\":\"craft\\\\mail\\\\transportadapters\\\\Sendmail\",\"transportSettings\":null}', '2018-05-04 12:00:03', '2018-05-09 08:08:48', 'e2a8b2f6-a5d0-4a3f-a044-8009cbbf8175');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `taggroups`
--

INSERT INTO `taggroups` (`id`, `name`, `handle`, `fieldLayoutId`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Default', 'default', 3, '2018-05-09 06:41:17', '2018-05-09 06:41:17', '817db188-4872-4b69-a0b1-b9fd3f100ac2');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tags`
--

DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `templatecacheelements`
--

DROP TABLE IF EXISTS `templatecacheelements`;
CREATE TABLE `templatecacheelements` (
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `templatecachequeries`
--

DROP TABLE IF EXISTS `templatecachequeries`;
CREATE TABLE `templatecachequeries` (
  `id` int(11) NOT NULL,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `query` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `templatecaches`
--

DROP TABLE IF EXISTS `templatecaches`;
CREATE TABLE `templatecaches` (
  `id` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tokens`
--

DROP TABLE IF EXISTS `tokens`;
CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint(3) UNSIGNED DEFAULT NULL,
  `usageCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL,
  `preferences` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `userpreferences`
--

INSERT INTO `userpreferences` (`userId`, `preferences`) VALUES
(1, '{\"language\":\"de\",\"weekStartDay\":\"1\",\"enableDebugToolbarForSite\":false,\"enableDebugToolbarForCp\":false}');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `users`
--

INSERT INTO `users` (`id`, `username`, `photoId`, `firstName`, `lastName`, `email`, `password`, `admin`, `locked`, `suspended`, `pending`, `lastLoginDate`, `lastLoginAttemptIp`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `hasDashboard`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'kittn', NULL, '', '', '<% if (projectmail) { %><%= projectmail %><% } else { %>foo@bar.com<% } %>', '$2y$13$sSVfCmnBQpwveTpaA4ImNu1JeeIJJ8UrT/VCd1xigaRiR9CFKfEae', 1, 0, 0, 0, '2018-05-09 06:11:03', '::1', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, '2018-05-04 12:00:03', '2018-05-04 12:00:03', '2018-05-09 08:09:33', 'f2acd50c-6006-4baa-afa6-2edacf6d02e7');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `volumefolders`
--

INSERT INTO `volumefolders` (`id`, `parentId`, `volumeId`, `name`, `path`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, NULL, 'Temporäre Quelle', NULL, '2018-05-09 08:13:40', '2018-05-09 08:13:40', '7b1df645-f2a0-408d-bb5e-6f5dacdc0145'),
(2, 1, NULL, 'user_1', 'user_1/', '2018-05-09 08:13:40', '2018-05-09 08:13:40', '53676987-6472-4030-a60a-13d21515cc02');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `volumes`
--

DROP TABLE IF EXISTS `volumes`;
CREATE TABLE `volumes` (
  `id` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `url` varchar(255) DEFAULT NULL,
  `settings` text,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `widgets`
--

DROP TABLE IF EXISTS `widgets`;
CREATE TABLE `widgets` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `colspan` tinyint(1) NOT NULL DEFAULT '0',
  `settings` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `widgets`
--

INSERT INTO `widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'craft\\widgets\\RecentEntries', 1, 0, '{\"section\":\"*\",\"siteId\":\"1\",\"limit\":10}', 1, '2018-05-04 12:32:28', '2018-05-04 12:32:28', 'b47c5a24-6fd1-41b8-8df0-f417ec4a48f6'),
(2, 1, 'craft\\widgets\\CraftSupport', 2, 0, '[]', 1, '2018-05-04 12:32:28', '2018-05-04 12:32:28', '7e49a861-c675-4852-b27f-4e726bdfc061'),
(3, 1, 'craft\\widgets\\Updates', 3, 0, '[]', 1, '2018-05-04 12:32:28', '2018-05-04 12:32:28', '4fd4e139-db33-4269-a546-cf6127680cc9'),
(4, 1, 'craft\\widgets\\Feed', 4, 0, '{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}', 1, '2018-05-04 12:32:28', '2018-05-04 12:32:28', '33c71d1e-f629-4782-b642-d9086dd6b65c');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `assetindexdata`
--
ALTER TABLE `assetindexdata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assetindexdata_sessionId_volumeId_idx` (`sessionId`,`volumeId`),
  ADD KEY `assetindexdata_volumeId_idx` (`volumeId`);

--
-- Indizes für die Tabelle `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `assets_filename_folderId_unq_idx` (`filename`,`folderId`),
  ADD KEY `assets_folderId_idx` (`folderId`),
  ADD KEY `assets_volumeId_idx` (`volumeId`);

--
-- Indizes für die Tabelle `assettransformindex`
--
ALTER TABLE `assettransformindex`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assettransformindex_volumeId_assetId_location_idx` (`volumeId`,`assetId`,`location`);

--
-- Indizes für die Tabelle `assettransforms`
--
ALTER TABLE `assettransforms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `assettransforms_name_unq_idx` (`name`),
  ADD UNIQUE KEY `assettransforms_handle_unq_idx` (`handle`);

--
-- Indizes für die Tabelle `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_groupId_idx` (`groupId`);

--
-- Indizes für die Tabelle `categorygroups`
--
ALTER TABLE `categorygroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categorygroups_name_unq_idx` (`name`),
  ADD UNIQUE KEY `categorygroups_handle_unq_idx` (`handle`),
  ADD KEY `categorygroups_structureId_idx` (`structureId`),
  ADD KEY `categorygroups_fieldLayoutId_idx` (`fieldLayoutId`);

--
-- Indizes für die Tabelle `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categorygroups_sites_groupId_siteId_unq_idx` (`groupId`,`siteId`),
  ADD KEY `categorygroups_sites_siteId_idx` (`siteId`);

--
-- Indizes für die Tabelle `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `content_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `content_siteId_idx` (`siteId`),
  ADD KEY `content_title_idx` (`title`);

--
-- Indizes für die Tabelle `craftidtokens`
--
ALTER TABLE `craftidtokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craftidtokens_userId_fk` (`userId`);

--
-- Indizes für die Tabelle `deprecationerrors`
--
ALTER TABLE `deprecationerrors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `deprecationerrors_key_fingerprint_unq_idx` (`key`,`fingerprint`);

--
-- Indizes für die Tabelle `elementindexsettings`
--
ALTER TABLE `elementindexsettings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `elementindexsettings_type_unq_idx` (`type`);

--
-- Indizes für die Tabelle `elements`
--
ALTER TABLE `elements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `elements_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `elements_type_idx` (`type`),
  ADD KEY `elements_enabled_idx` (`enabled`),
  ADD KEY `elements_archived_dateCreated_idx` (`archived`,`dateCreated`);

--
-- Indizes für die Tabelle `elements_sites`
--
ALTER TABLE `elements_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `elements_sites_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD UNIQUE KEY `elements_sites_uri_siteId_unq_idx` (`uri`,`siteId`),
  ADD KEY `elements_sites_siteId_idx` (`siteId`),
  ADD KEY `elements_sites_slug_siteId_idx` (`slug`,`siteId`),
  ADD KEY `elements_sites_enabled_idx` (`enabled`);

--
-- Indizes für die Tabelle `entries`
--
ALTER TABLE `entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entries_postDate_idx` (`postDate`),
  ADD KEY `entries_expiryDate_idx` (`expiryDate`),
  ADD KEY `entries_authorId_idx` (`authorId`),
  ADD KEY `entries_sectionId_idx` (`sectionId`),
  ADD KEY `entries_typeId_idx` (`typeId`);

--
-- Indizes für die Tabelle `entrydrafts`
--
ALTER TABLE `entrydrafts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entrydrafts_sectionId_idx` (`sectionId`),
  ADD KEY `entrydrafts_entryId_siteId_idx` (`entryId`,`siteId`),
  ADD KEY `entrydrafts_siteId_idx` (`siteId`),
  ADD KEY `entrydrafts_creatorId_idx` (`creatorId`);

--
-- Indizes für die Tabelle `entrytypes`
--
ALTER TABLE `entrytypes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `entrytypes_name_sectionId_unq_idx` (`name`,`sectionId`),
  ADD UNIQUE KEY `entrytypes_handle_sectionId_unq_idx` (`handle`,`sectionId`),
  ADD KEY `entrytypes_sectionId_idx` (`sectionId`),
  ADD KEY `entrytypes_fieldLayoutId_idx` (`fieldLayoutId`);

--
-- Indizes für die Tabelle `entryversions`
--
ALTER TABLE `entryversions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entryversions_sectionId_idx` (`sectionId`),
  ADD KEY `entryversions_entryId_siteId_idx` (`entryId`,`siteId`),
  ADD KEY `entryversions_siteId_idx` (`siteId`),
  ADD KEY `entryversions_creatorId_idx` (`creatorId`);

--
-- Indizes für die Tabelle `fieldgroups`
--
ALTER TABLE `fieldgroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fieldgroups_name_unq_idx` (`name`);

--
-- Indizes für die Tabelle `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fieldlayoutfields_layoutId_fieldId_unq_idx` (`layoutId`,`fieldId`),
  ADD KEY `fieldlayoutfields_sortOrder_idx` (`sortOrder`),
  ADD KEY `fieldlayoutfields_tabId_idx` (`tabId`),
  ADD KEY `fieldlayoutfields_fieldId_idx` (`fieldId`);

--
-- Indizes für die Tabelle `fieldlayouts`
--
ALTER TABLE `fieldlayouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fieldlayouts_type_idx` (`type`);

--
-- Indizes für die Tabelle `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fieldlayouttabs_sortOrder_idx` (`sortOrder`),
  ADD KEY `fieldlayouttabs_layoutId_idx` (`layoutId`);

--
-- Indizes für die Tabelle `fields`
--
ALTER TABLE `fields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fields_handle_context_unq_idx` (`handle`,`context`),
  ADD KEY `fields_groupId_idx` (`groupId`),
  ADD KEY `fields_context_idx` (`context`);

--
-- Indizes für die Tabelle `globalsets`
--
ALTER TABLE `globalsets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `globalsets_name_unq_idx` (`name`),
  ADD UNIQUE KEY `globalsets_handle_unq_idx` (`handle`),
  ADD KEY `globalsets_fieldLayoutId_idx` (`fieldLayoutId`);

--
-- Indizes für die Tabelle `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `matrixblocks`
--
ALTER TABLE `matrixblocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `matrixblocks_ownerId_idx` (`ownerId`),
  ADD KEY `matrixblocks_fieldId_idx` (`fieldId`),
  ADD KEY `matrixblocks_typeId_idx` (`typeId`),
  ADD KEY `matrixblocks_sortOrder_idx` (`sortOrder`),
  ADD KEY `matrixblocks_ownerSiteId_idx` (`ownerSiteId`);

--
-- Indizes für die Tabelle `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `matrixblocktypes_name_fieldId_unq_idx` (`name`,`fieldId`),
  ADD UNIQUE KEY `matrixblocktypes_handle_fieldId_unq_idx` (`handle`,`fieldId`),
  ADD KEY `matrixblocktypes_fieldId_idx` (`fieldId`),
  ADD KEY `matrixblocktypes_fieldLayoutId_idx` (`fieldLayoutId`);

--
-- Indizes für die Tabelle `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `migrations_pluginId_idx` (`pluginId`),
  ADD KEY `migrations_type_pluginId_idx` (`type`,`pluginId`);

--
-- Indizes für die Tabelle `plugins`
--
ALTER TABLE `plugins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plugins_handle_unq_idx` (`handle`),
  ADD KEY `plugins_enabled_idx` (`enabled`);

--
-- Indizes für die Tabelle `queue`
--
ALTER TABLE `queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `queue_fail_timeUpdated_timePushed_idx` (`fail`,`timeUpdated`,`timePushed`),
  ADD KEY `queue_fail_timeUpdated_delay_idx` (`fail`,`timeUpdated`,`delay`);

--
-- Indizes für die Tabelle `relations`
--
ALTER TABLE `relations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `relations_fieldId_sourceId_sourceSiteId_targetId_unq_idx` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  ADD KEY `relations_sourceId_idx` (`sourceId`),
  ADD KEY `relations_targetId_idx` (`targetId`),
  ADD KEY `relations_sourceSiteId_idx` (`sourceSiteId`);

--
-- Indizes für die Tabelle `resourcepaths`
--
ALTER TABLE `resourcepaths`
  ADD PRIMARY KEY (`hash`);

--
-- Indizes für die Tabelle `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `routes_uriPattern_idx` (`uriPattern`),
  ADD KEY `routes_siteId_idx` (`siteId`);

--
-- Indizes für die Tabelle `searchindex`
--
ALTER TABLE `searchindex`
  ADD PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`);
ALTER TABLE `searchindex` ADD FULLTEXT KEY `searchindex_keywords_idx` (`keywords`);

--
-- Indizes für die Tabelle `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sections_handle_unq_idx` (`handle`),
  ADD UNIQUE KEY `sections_name_unq_idx` (`name`),
  ADD KEY `sections_structureId_idx` (`structureId`);

--
-- Indizes für die Tabelle `sections_sites`
--
ALTER TABLE `sections_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sections_sites_sectionId_siteId_unq_idx` (`sectionId`,`siteId`),
  ADD KEY `sections_sites_siteId_idx` (`siteId`);

--
-- Indizes für die Tabelle `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_uid_idx` (`uid`),
  ADD KEY `sessions_token_idx` (`token`),
  ADD KEY `sessions_dateUpdated_idx` (`dateUpdated`),
  ADD KEY `sessions_userId_idx` (`userId`);

--
-- Indizes für die Tabelle `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shunnedmessages_userId_message_unq_idx` (`userId`,`message`);

--
-- Indizes für die Tabelle `sitegroups`
--
ALTER TABLE `sitegroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sitegroups_name_unq_idx` (`name`);

--
-- Indizes für die Tabelle `sites`
--
ALTER TABLE `sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sites_handle_unq_idx` (`handle`),
  ADD KEY `sites_sortOrder_idx` (`sortOrder`),
  ADD KEY `sites_groupId_fk` (`groupId`);

--
-- Indizes für die Tabelle `snitch_collisions`
--
ALTER TABLE `snitch_collisions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `snitch_collisions_userId_fk` (`userId`),
  ADD KEY `snitch_collisions_elementId_fk` (`elementId`);

--
-- Indizes für die Tabelle `structureelements`
--
ALTER TABLE `structureelements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `structureelements_structureId_elementId_unq_idx` (`structureId`,`elementId`),
  ADD KEY `structureelements_root_idx` (`root`),
  ADD KEY `structureelements_lft_idx` (`lft`),
  ADD KEY `structureelements_rgt_idx` (`rgt`),
  ADD KEY `structureelements_level_idx` (`level`),
  ADD KEY `structureelements_elementId_idx` (`elementId`);

--
-- Indizes für die Tabelle `structures`
--
ALTER TABLE `structures`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `supertableblocks`
--
ALTER TABLE `supertableblocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supertableblocks_ownerId_idx` (`ownerId`),
  ADD KEY `supertableblocks_fieldId_idx` (`fieldId`),
  ADD KEY `supertableblocks_typeId_idx` (`typeId`),
  ADD KEY `supertableblocks_ownerSiteId_idx` (`ownerSiteId`);

--
-- Indizes für die Tabelle `supertableblocktypes`
--
ALTER TABLE `supertableblocktypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supertableblocktypes_fieldId_idx` (`fieldId`),
  ADD KEY `supertableblocktypes_fieldLayoutId_idx` (`fieldLayoutId`);

--
-- Indizes für die Tabelle `systemmessages`
--
ALTER TABLE `systemmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `systemmessages_key_language_unq_idx` (`key`,`language`),
  ADD KEY `systemmessages_language_idx` (`language`);

--
-- Indizes für die Tabelle `systemsettings`
--
ALTER TABLE `systemsettings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `systemsettings_category_unq_idx` (`category`);

--
-- Indizes für die Tabelle `taggroups`
--
ALTER TABLE `taggroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `taggroups_name_unq_idx` (`name`),
  ADD UNIQUE KEY `taggroups_handle_unq_idx` (`handle`),
  ADD KEY `taggroups_fieldLayoutId_fk` (`fieldLayoutId`);

--
-- Indizes für die Tabelle `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tags_groupId_idx` (`groupId`);

--
-- Indizes für die Tabelle `templatecacheelements`
--
ALTER TABLE `templatecacheelements`
  ADD KEY `templatecacheelements_cacheId_idx` (`cacheId`),
  ADD KEY `templatecacheelements_elementId_idx` (`elementId`);

--
-- Indizes für die Tabelle `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `templatecachequeries_cacheId_idx` (`cacheId`),
  ADD KEY `templatecachequeries_type_idx` (`type`);

--
-- Indizes für die Tabelle `templatecaches`
--
ALTER TABLE `templatecaches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `templatecaches_cacheKey_siteId_expiryDate_path_idx` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  ADD KEY `templatecaches_cacheKey_siteId_expiryDate_idx` (`cacheKey`,`siteId`,`expiryDate`),
  ADD KEY `templatecaches_siteId_idx` (`siteId`);

--
-- Indizes für die Tabelle `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tokens_token_unq_idx` (`token`),
  ADD KEY `tokens_expiryDate_idx` (`expiryDate`);

--
-- Indizes für die Tabelle `usergroups`
--
ALTER TABLE `usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usergroups_handle_unq_idx` (`handle`),
  ADD UNIQUE KEY `usergroups_name_unq_idx` (`name`);

--
-- Indizes für die Tabelle `usergroups_users`
--
ALTER TABLE `usergroups_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usergroups_users_groupId_userId_unq_idx` (`groupId`,`userId`),
  ADD KEY `usergroups_users_userId_idx` (`userId`);

--
-- Indizes für die Tabelle `userpermissions`
--
ALTER TABLE `userpermissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userpermissions_name_unq_idx` (`name`);

--
-- Indizes für die Tabelle `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userpermissions_usergroups_permissionId_groupId_unq_idx` (`permissionId`,`groupId`),
  ADD KEY `userpermissions_usergroups_groupId_idx` (`groupId`);

--
-- Indizes für die Tabelle `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userpermissions_users_permissionId_userId_unq_idx` (`permissionId`,`userId`),
  ADD KEY `userpermissions_users_userId_idx` (`userId`);

--
-- Indizes für die Tabelle `userpreferences`
--
ALTER TABLE `userpreferences`
  ADD PRIMARY KEY (`userId`);

--
-- Indizes für die Tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unq_idx` (`username`),
  ADD UNIQUE KEY `users_email_unq_idx` (`email`),
  ADD KEY `users_uid_idx` (`uid`),
  ADD KEY `users_verificationCode_idx` (`verificationCode`),
  ADD KEY `users_photoId_fk` (`photoId`);

--
-- Indizes für die Tabelle `volumefolders`
--
ALTER TABLE `volumefolders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `volumefolders_name_parentId_volumeId_unq_idx` (`name`,`parentId`,`volumeId`),
  ADD KEY `volumefolders_parentId_idx` (`parentId`),
  ADD KEY `volumefolders_volumeId_idx` (`volumeId`);

--
-- Indizes für die Tabelle `volumes`
--
ALTER TABLE `volumes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `volumes_name_unq_idx` (`name`),
  ADD UNIQUE KEY `volumes_handle_unq_idx` (`handle`),
  ADD KEY `volumes_fieldLayoutId_idx` (`fieldLayoutId`);

--
-- Indizes für die Tabelle `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `widgets_userId_idx` (`userId`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `assetindexdata`
--
ALTER TABLE `assetindexdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `assettransformindex`
--
ALTER TABLE `assettransformindex`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `assettransforms`
--
ALTER TABLE `assettransforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `categorygroups`
--
ALTER TABLE `categorygroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `content`
--
ALTER TABLE `content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT für Tabelle `craftidtokens`
--
ALTER TABLE `craftidtokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `deprecationerrors`
--
ALTER TABLE `deprecationerrors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=617;
--
-- AUTO_INCREMENT für Tabelle `elementindexsettings`
--
ALTER TABLE `elementindexsettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `elements`
--
ALTER TABLE `elements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT für Tabelle `elements_sites`
--
ALTER TABLE `elements_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT für Tabelle `entrydrafts`
--
ALTER TABLE `entrydrafts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `entrytypes`
--
ALTER TABLE `entrytypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT für Tabelle `entryversions`
--
ALTER TABLE `entryversions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT für Tabelle `fieldgroups`
--
ALTER TABLE `fieldgroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT für Tabelle `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT für Tabelle `fieldlayouts`
--
ALTER TABLE `fieldlayouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT für Tabelle `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT für Tabelle `fields`
--
ALTER TABLE `fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT für Tabelle `globalsets`
--
ALTER TABLE `globalsets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `info`
--
ALTER TABLE `info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT für Tabelle `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;
--
-- AUTO_INCREMENT für Tabelle `plugins`
--
ALTER TABLE `plugins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT für Tabelle `queue`
--
ALTER TABLE `queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT für Tabelle `relations`
--
ALTER TABLE `relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `routes`
--
ALTER TABLE `routes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT für Tabelle `sections_sites`
--
ALTER TABLE `sections_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT für Tabelle `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT für Tabelle `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `sitegroups`
--
ALTER TABLE `sitegroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT für Tabelle `sites`
--
ALTER TABLE `sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT für Tabelle `snitch_collisions`
--
ALTER TABLE `snitch_collisions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `structureelements`
--
ALTER TABLE `structureelements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `structures`
--
ALTER TABLE `structures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `supertableblocktypes`
--
ALTER TABLE `supertableblocktypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `systemmessages`
--
ALTER TABLE `systemmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `systemsettings`
--
ALTER TABLE `systemsettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT für Tabelle `taggroups`
--
ALTER TABLE `taggroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT für Tabelle `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `templatecaches`
--
ALTER TABLE `templatecaches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `usergroups`
--
ALTER TABLE `usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `usergroups_users`
--
ALTER TABLE `usergroups_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `userpermissions`
--
ALTER TABLE `userpermissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `userpreferences`
--
ALTER TABLE `userpreferences`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT für Tabelle `volumefolders`
--
ALTER TABLE `volumefolders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT für Tabelle `volumes`
--
ALTER TABLE `volumes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `widgets`
--
ALTER TABLE `widgets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `assetindexdata`
--
ALTER TABLE `assetindexdata`
  ADD CONSTRAINT `assetindexdata_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `assets`
--
ALTER TABLE `assets`
  ADD CONSTRAINT `assets_folderId_fk` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assets_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assets_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `categorygroups`
--
ALTER TABLE `categorygroups`
  ADD CONSTRAINT `categorygroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `categorygroups_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  ADD CONSTRAINT `categorygroups_sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categorygroups_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `content`
--
ALTER TABLE `content`
  ADD CONSTRAINT `content_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `content_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `craftidtokens`
--
ALTER TABLE `craftidtokens`
  ADD CONSTRAINT `craftidtokens_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `elements`
--
ALTER TABLE `elements`
  ADD CONSTRAINT `elements_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints der Tabelle `elements_sites`
--
ALTER TABLE `elements_sites`
  ADD CONSTRAINT `elements_sites_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `elements_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `entries`
--
ALTER TABLE `entries`
  ADD CONSTRAINT `entries_authorId_fk` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entries_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entries_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entries_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `entrydrafts`
--
ALTER TABLE `entrydrafts`
  ADD CONSTRAINT `entrydrafts_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entrydrafts_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `entries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entrydrafts_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entrydrafts_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `entrytypes`
--
ALTER TABLE `entrytypes`
  ADD CONSTRAINT `entrytypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `entrytypes_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `entryversions`
--
ALTER TABLE `entryversions`
  ADD CONSTRAINT `entryversions_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `entryversions_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `entries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entryversions_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entryversions_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  ADD CONSTRAINT `fieldlayoutfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fieldlayoutfields_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fieldlayoutfields_tabId_fk` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  ADD CONSTRAINT `fieldlayouttabs_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `fields`
--
ALTER TABLE `fields`
  ADD CONSTRAINT `fields_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `globalsets`
--
ALTER TABLE `globalsets`
  ADD CONSTRAINT `globalsets_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `globalsets_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `matrixblocks`
--
ALTER TABLE `matrixblocks`
  ADD CONSTRAINT `matrixblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixblocks_ownerSiteId_fk` FOREIGN KEY (`ownerSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `matrixblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  ADD CONSTRAINT `matrixblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints der Tabelle `migrations`
--
ALTER TABLE `migrations`
  ADD CONSTRAINT `migrations_pluginId_fk` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `relations`
--
ALTER TABLE `relations`
  ADD CONSTRAINT `relations_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `relations_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `relations_sourceSiteId_fk` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `relations_targetId_fk` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `routes`
--
ALTER TABLE `routes`
  ADD CONSTRAINT `routes_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `sections_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL;

--
-- Constraints der Tabelle `sections_sites`
--
ALTER TABLE `sections_sites`
  ADD CONSTRAINT `sections_sites_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sections_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  ADD CONSTRAINT `shunnedmessages_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `sites`
--
ALTER TABLE `sites`
  ADD CONSTRAINT `sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `snitch_collisions`
--
ALTER TABLE `snitch_collisions`
  ADD CONSTRAINT `snitch_collisions_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `snitch_collisions_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `structureelements`
--
ALTER TABLE `structureelements`
  ADD CONSTRAINT `structureelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `structureelements_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `supertableblocks`
--
ALTER TABLE `supertableblocks`
  ADD CONSTRAINT `supertableblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `supertableblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `supertableblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `supertableblocks_ownerSiteId_fk` FOREIGN KEY (`ownerSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `supertableblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `supertableblocktypes` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `supertableblocktypes`
--
ALTER TABLE `supertableblocktypes`
  ADD CONSTRAINT `supertableblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `supertableblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints der Tabelle `taggroups`
--
ALTER TABLE `taggroups`
  ADD CONSTRAINT `taggroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints der Tabelle `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `tags_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tags_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `templatecacheelements`
--
ALTER TABLE `templatecacheelements`
  ADD CONSTRAINT `templatecacheelements_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `templatecacheelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  ADD CONSTRAINT `templatecachequeries_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `templatecaches`
--
ALTER TABLE `templatecaches`
  ADD CONSTRAINT `templatecaches_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `usergroups_users`
--
ALTER TABLE `usergroups_users`
  ADD CONSTRAINT `usergroups_users_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `usergroups_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  ADD CONSTRAINT `userpermissions_usergroups_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `userpermissions_usergroups_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  ADD CONSTRAINT `userpermissions_users_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `userpermissions_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `userpreferences`
--
ALTER TABLE `userpreferences`
  ADD CONSTRAINT `userpreferences_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_photoId_fk` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL;

--
-- Constraints der Tabelle `volumefolders`
--
ALTER TABLE `volumefolders`
  ADD CONSTRAINT `volumefolders_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `volumefolders_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `volumes`
--
ALTER TABLE `volumes`
  ADD CONSTRAINT `volumes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints der Tabelle `widgets`
--
ALTER TABLE `widgets`
  ADD CONSTRAINT `widgets_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;
SET FOREIGN_KEY_CHECKS=1;
