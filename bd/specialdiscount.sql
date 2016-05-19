-- --------------------------------------------------------
-- Host:                         mnddevdb.ckqsu4xn3xb3.us-east-1.rds.amazonaws.com
-- Server version:               5.6.23 - MySQL Community Server (GPL)
-- Server OS:                    Linux
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table devmeraevent.accesstype
CREATE TABLE IF NOT EXISTS `accesstype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL,
  `modifiedby` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.activity
CREATE TABLE IF NOT EXISTS `activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `mappingpath` varchar(500) NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `activitygroupid` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.activityaccess
CREATE TABLE IF NOT EXISTS `activityaccess` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleid` int(11) NOT NULL,
  `activityid` int(11) NOT NULL,
  `accesstypeid` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL,
  `modifiedby` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.activitygroup
CREATE TABLE IF NOT EXISTS `activitygroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.alert
CREATE TABLE IF NOT EXISTS `alert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `type` enum('incomplete','dailytransaction','ticketregistration','dailysuccesstransaction') NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL,
  `modifiedby` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `type` (`type`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.attendee
CREATE TABLE IF NOT EXISTS `attendee` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `eventsignupid` bigint(20) NOT NULL,
  `ticketid` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL DEFAULT '0',
  `order` smallint(3) NOT NULL DEFAULT '1',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attendee_esid_idx` (`eventsignupid`),
  KEY `ticketid` (`ticketid`),
  KEY `primarykey` (`primary`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.attendeedetail
CREATE TABLE IF NOT EXISTS `attendeedetail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customfieldid` bigint(20) NOT NULL,
  `value` varchar(255) NOT NULL,
  `attendeeid` bigint(20) NOT NULL,
  `commonfieldid` tinyint(2) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attendeedetail_attendeeid_idx` (`attendeeid`),
  KEY `commonfieldid` (`commonfieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.banner
CREATE TABLE IF NOT EXISTS `banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) NOT NULL,
  `eventid` int(11) NOT NULL,
  `startdatetime` datetime NOT NULL,
  `enddatetime` datetime NOT NULL,
  `imagefileid` int(11) NOT NULL,
  `url` varchar(1000) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 - not active, 1- active',
  `order` int(11) NOT NULL,
  `type` tinyint(2) NOT NULL COMMENT '1 is for Top banner, 2 is for Bottom or side banner, 3 is for New-year banner & 4 is for Holi banner',
  `timezoneid` smallint(3) NOT NULL DEFAULT '1',
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `eventid` (`eventid`),
  KEY `startdatetime` (`startdatetime`),
  KEY `enddatetime` (`enddatetime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.bannermapping
CREATE TABLE IF NOT EXISTS `bannermapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bannerid` int(11) NOT NULL,
  `title` varchar(500) NOT NULL,
  `eventid` int(11) NOT NULL,
  `startdatetime` datetime NOT NULL,
  `enddatetime` datetime NOT NULL,
  `imagefileid` int(11) NOT NULL,
  `url` varchar(1000) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `order` int(11) NOT NULL,
  `timezoneid` smallint(3) NOT NULL DEFAULT '1',
  `countryid` smallint(3) NOT NULL DEFAULT '14',
  `stateid` int(11) DEFAULT NULL,
  `cityid` int(11) DEFAULT NULL,
  `categoryid` smallint(3) DEFAULT NULL,
  `allcategories` tinyint(1) DEFAULT NULL,
  `othercities` tinyint(1) DEFAULT NULL,
  `allcities` tinyint(1) DEFAULT NULL,
  `type` tinyint(2) NOT NULL COMMENT '1 is for top banner & 2 is for bottom or side banner',
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 - not deleted, 1 - deleted',
  PRIMARY KEY (`id`),
  KEY `startdatetime` (`startdatetime`),
  KEY `enddatetime` (`enddatetime`),
  KEY `cityid` (`cityid`),
  KEY `categoryid` (`categoryid`),
  KEY `allcategories` (`allcategories`),
  KEY `allcities` (`allcities`),
  KEY `deleted` (`deleted`),
  KEY `bannerid` (`bannerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.bluebook
CREATE TABLE IF NOT EXISTS `bluebook` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(200) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `suggestion` tinytext NOT NULL,
  `cts` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.bookmark
CREATE TABLE IF NOT EXISTS `bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `eventid` int(11) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL,
  `modifiedby` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `eventid` (`eventid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.category
CREATE TABLE IF NOT EXISTS `category` (
  `id` smallint(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(300) NOT NULL,
  `value` varchar(300) NOT NULL,
  `order` smallint(3) NOT NULL,
  `imagefileid` int(11) NOT NULL,
  `categorydefaultbannerid` int(11) NOT NULL,
  `categorydefaultthumbnailid` int(11) NOT NULL,
  `themecolor` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 - not activated, 1 -activated',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `ticketsetting` enum('single','multiple') NOT NULL DEFAULT 'multiple',
  `blogfeedurl` varchar(2000) DEFAULT NULL COMMENT 'ME blog feed url ',
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 - not deleted, 1 - deleted',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.chequepayments
CREATE TABLE IF NOT EXISTS `chequepayments` (
  `id` int(11) NOT NULL,
  `eventsignupid` bigint(20) NOT NULL,
  `chequenumber` varchar(45) DEFAULT NULL,
  `chequedate` datetime DEFAULT NULL,
  `chequebank` varchar(100) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `eventsignupid` (`eventsignupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.city
CREATE TABLE IF NOT EXISTS `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(300) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '1',
  `countryid` smallint(3) NOT NULL DEFAULT '14',
  `splcitystateid` int(11) NOT NULL DEFAULT '0',
  `aliascityid` varchar(255) DEFAULT NULL,
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  `tmp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`(255)),
  KEY `status` (`status`),
  KEY `countryid` (`countryid`),
  KEY `featured` (`featured`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.codstatus
CREATE TABLE IF NOT EXISTS `codstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventsignupid` bigint(20) NOT NULL,
  `gharpayid` varchar(100) DEFAULT NULL,
  `status` enum('Pending','Delivered','Canceled','Refunded') NOT NULL DEFAULT 'Pending',
  `transactionstatus` enum('Pending','InProcess','Delivered','Canceled') NOT NULL DEFAULT 'Pending',
  `createdby` int(11) DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.collaborator
CREATE TABLE IF NOT EXISTS `collaborator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL,
  `modifiedby` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `eventid` (`eventid`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='event collaborator mapping detail table';

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.collaboratoraccess
CREATE TABLE IF NOT EXISTS `collaboratoraccess` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collaboratorid` int(11) NOT NULL,
  `module` enum('manage','promote','report') NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL,
  `modifiedby` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `collaboratorid` (`collaboratorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='collaborator corresponding module accessing mapping table';

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.comment
CREATE TABLE IF NOT EXISTS `comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `eventsignupid` bigint(20) DEFAULT NULL,
  `eventid` int(11) DEFAULT NULL,
  `comment` varchar(500) NOT NULL,
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `type` enum('accounts','incomplete') NOT NULL COMMENT 'accounts, incomplete',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `eventid` (`eventid`),
  KEY `eventsignupid` (`eventsignupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.commission
CREATE TABLE IF NOT EXISTS `commission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `global` tinyint(1) DEFAULT NULL COMMENT '1-global, 0-nonglobal(event based)',
  `type` smallint(4) DEFAULT NULL COMMENT 'paymentgatewayid',
  `value` float DEFAULT NULL,
  `countryid` smallint(3) DEFAULT NULL,
  `eventid` int(11) DEFAULT NULL COMMENT 'NULL:if it is global',
  `contractdocument` bigint(20) DEFAULT NULL COMMENT 'NULL:if it is global',
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `createdby` int(11) NOT NULL,
  `modifiedby` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `countryid` (`countryid`),
  KEY `eventid` (`eventid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.commonfield
CREATE TABLE IF NOT EXISTS `commonfield` (
  `id` tinyint(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` enum('textarea','textbox','dropdown','checkbox','radio','date','file') NOT NULL,
  `order` tinyint(2) NOT NULL DEFAULT '1',
  `displaystatus` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 - show, 0 -hide',
  `fieldmandatory` tinyint(1) NOT NULL DEFAULT '1',
  `displayonticket` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL,
  `modifiedby` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.country
CREATE TABLE IF NOT EXISTS `country` (
  `id` smallint(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `shortname` varchar(200) NOT NULL,
  `code` varchar(5) DEFAULT NULL,
  `logofileid` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1-active,0-inactive',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `order` smallint(3) NOT NULL DEFAULT '1',
  `defaultcurrencyid` smallint(3) NOT NULL DEFAULT '1',
  `timezoneid` smallint(3) NOT NULL DEFAULT '1',
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `status` (`status`),
  KEY `featured` (`featured`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.currency
CREATE TABLE IF NOT EXISTS `currency` (
  `id` smallint(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `code` varchar(100) NOT NULL,
  `symbol` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.customfield
CREATE TABLE IF NOT EXISTS `customfield` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `eventid` int(11) NOT NULL,
  `fieldname` varchar(255) NOT NULL,
  `fieldtype` enum('textarea','radio','checkbox','textbox','dropdown','date','file') NOT NULL DEFAULT 'textbox',
  `commonfieldid` tinyint(2) NOT NULL DEFAULT '0',
  `fieldmandatory` tinyint(1) NOT NULL DEFAULT '0',
  `order` smallint(6) NOT NULL DEFAULT '1',
  `displayonticket` tinyint(1) NOT NULL DEFAULT '0',
  `displaystatus` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1-show, 0-hide',
  `fieldlevel` enum('event','ticket') NOT NULL DEFAULT 'event',
  `ticketid` int(11) DEFAULT NULL,
  `customvalidation` varchar(100) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL,
  `modifiedby` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `eventid` (`eventid`),
  KEY `commonfieldid` (`commonfieldid`),
  KEY `displaystatus` (`displaystatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.customfieldvalue
CREATE TABLE IF NOT EXISTS `customfieldvalue` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customfieldid` bigint(20) NOT NULL,
  `value` varchar(255) NOT NULL,
  `isdefault` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL,
  `modifiedby` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customfieldid` (`customfieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.discount
CREATE TABLE IF NOT EXISTS `discount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) NOT NULL,
  `eventid` int(11) NOT NULL,
  `type` enum('normal','bulk') DEFAULT NULL,
  `calculationmode` enum('flat','percentage') DEFAULT NULL,
  `value` double NOT NULL,
  `startdatetime` datetime NOT NULL,
  `enddatetime` datetime NOT NULL,
  `minticketstobuy` smallint(3) NOT NULL,
  `maxticketstobuy` smallint(3) NOT NULL,
  `usagelimit` int(11) NOT NULL,
  `code` varchar(300) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `totalused` int(11) NOT NULL,
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `eventid` (`eventid`),
  KEY `startdatetime` (`startdatetime`),
  KEY `enddatetime` (`enddatetime`),
  KEY `type` (`type`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.ebspaymentdetail
CREATE TABLE IF NOT EXISTS `ebspaymentdetail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `eventsignupid` bigint(20) NOT NULL,
  `paymentid` bigint(20) NOT NULL,
  `transactionid` bigint(20) NOT NULL,
  `statuscode` tinyint(4) NOT NULL,
  `statusmessage` varchar(255) NOT NULL,
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL,
  `createdby` int(11) DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `eventsignupid` (`eventsignupid`),
  KEY `paymentid` (`paymentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.event
CREATE TABLE IF NOT EXISTS `event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ownerid` int(11) NOT NULL,
  `startdatetime` datetime NOT NULL,
  `enddatetime` datetime NOT NULL,
  `timezoneid` smallint(3) NOT NULL DEFAULT '1',
  `title` varchar(1000) NOT NULL,
  `description` mediumtext NOT NULL,
  `countryid` smallint(3) DEFAULT '14',
  `stateid` int(11) DEFAULT NULL,
  `cityid` int(11) DEFAULT NULL,
  `localityid` int(11) NOT NULL,
  `venuename` varchar(1000) NOT NULL,
  `venueaddress1` varchar(1000) NOT NULL,
  `venueaddress2` varchar(1000) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `pincode` varchar(30) NOT NULL,
  `thumbnailfileid` int(11) DEFAULT NULL,
  `url` varchar(1000) NOT NULL,
  `registrationtype` tinyint(2) NOT NULL COMMENT '1 for free, 2 for paid',
  `registrationdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 for published, 2 for unpublished, 3 for cancelled',
  `eventmode` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-no value, 1 for webinar',
  `categoryid` smallint(3) NOT NULL,
  `subcategoryid` int(11) DEFAULT NULL,
  `bannerfileid` int(11) DEFAULT NULL,
  `private` tinyint(1) NOT NULL DEFAULT '0',
  `ticketsoldout` tinyint(1) NOT NULL DEFAULT '0',
  `popularity` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 for high-priority, 2 for medium-priority, 3 for low-priority',
  `ipaddress` varchar(300) NOT NULL,
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `deleterequest` tinyint(1) DEFAULT '0' COMMENT '1- Requseted, 0- Not requested',
  PRIMARY KEY (`id`),
  KEY `ownerid` (`ownerid`),
  KEY `countryid` (`countryid`),
  KEY `stateid` (`stateid`),
  KEY `cityid` (`cityid`),
  KEY `categoryid` (`categoryid`),
  KEY `bannerfileid` (`bannerfileid`),
  KEY `event_ibfk_9` (`subcategoryid`),
  KEY `startdatetime` (`startdatetime`),
  KEY `enddatetime` (`enddatetime`),
  KEY `thumbnailfileid` (`thumbnailfileid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.eventcustomvalidator
CREATE TABLE IF NOT EXISTS `eventcustomvalidator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `eventid` int(11) DEFAULT NULL,
  `ticketid` int(11) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `cts` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `eventid` (`eventid`),
  KEY `membershipid` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.eventdetail
CREATE TABLE IF NOT EXISTS `eventdetail` (
  `eventid` int(11) NOT NULL,
  `contactdisplay` tinyint(1) DEFAULT '0',
  `contactdetails` varchar(1000) DEFAULT NULL,
  `extrareportingemails` varchar(1000) DEFAULT NULL,
  `extratxnreportingemails` varchar(1000) DEFAULT NULL,
  `facebooklink` varchar(1000) DEFAULT NULL,
  `googlelink` varchar(1000) DEFAULT NULL,
  `twitterlink` varchar(1000) DEFAULT NULL,
  `salespersonid` int(11) DEFAULT NULL COMMENT 'salespersonid',
  `organizertnc` text,
  `meraeventstnc` text,
  `tnctype` enum('organizer','meraevents') NOT NULL DEFAULT 'organizer',
  `useoriginalimage` tinyint(1) NOT NULL,
  `contactwebsiteurl` varchar(1000) DEFAULT NULL,
  `passrequired` tinyint(1) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `limitsingletickettype` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 -single ticket, 0-multiple ticket',
  `discountaftertax` tinyint(1) NOT NULL DEFAULT '1',
  `booknowbuttonvalue` varchar(30) NOT NULL,
  `seotitle` varchar(1000) DEFAULT NULL,
  `seokeywords` mediumtext,
  `seodescription` mediumtext,
  `conanicalurl` varchar(1000) DEFAULT NULL,
  `seoschema` text,
  `externalurl` varchar(1000) DEFAULT NULL,
  `googleanalyticsscripts` varchar(2000) DEFAULT NULL,
  `confirmationpagescripts` varchar(2000) DEFAULT NULL,
  `customvalidationflag` tinyint(1) DEFAULT NULL,
  `customvalidationfunction` varchar(100) DEFAULT NULL,
  `viewcount` int(11) NOT NULL DEFAULT '0' COMMENT 'event view count',
  `promotionaltext` tinytext NOT NULL COMMENT 'event specific right side text',
  `seatingenabled` tinyint(1) DEFAULT '0',
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL COMMENT 'userid',
  `modifiedby` int(11) NOT NULL COMMENT 'userid',
  `totalsoldtickets` int(11) NOT NULL DEFAULT '0' COMMENT 'Will give all tickets sold with eventsgnup as ''Success''',
  UNIQUE KEY `eventid` (`eventid`),
  KEY `salespersonid` (`salespersonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.eventextracharge
CREATE TABLE IF NOT EXISTS `eventextracharge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventid` int(11) NOT NULL,
  `label` varchar(300) NOT NULL,
  `value` double NOT NULL,
  `currencyid` smallint(3) NOT NULL DEFAULT '1' COMMENT '1 for INR',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 for "Percentage", 2 for "Flat" ',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL COMMENT 'userid',
  `modifiedby` int(11) NOT NULL COMMENT 'userid',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `eventid` (`eventid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.eventpaymentgateway
CREATE TABLE IF NOT EXISTS `eventpaymentgateway` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `eventid` int(11) NOT NULL,
  `paymentgatewayid` tinyint(2) NOT NULL,
  `gatewaytext` text,
  `extraparams` text,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `isdefault` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `eventid` (`eventid`),
  KEY `paymentgatewayid` (`paymentgatewayid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.eventpromocodes
CREATE TABLE IF NOT EXISTS `eventpromocodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventid` int(11) NOT NULL,
  `promocode` varchar(20) NOT NULL,
  `soldquantity` int(11) NOT NULL DEFAULT '0',
  `totalquantity` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL,
  `modifiedby` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.eventqualitycomment
CREATE TABLE IF NOT EXISTS `eventqualitycomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventid` int(11) NOT NULL,
  `qpid` int(11) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  `cts` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `eventid` (`eventid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.eventsalespersonmapping
CREATE TABLE IF NOT EXISTS `eventsalespersonmapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventid` int(11) NOT NULL,
  `salesid` int(11) NOT NULL,
  `eventtype` enum('large','small','medium') NOT NULL,
  `ticketwidget` tinyint(1) NOT NULL DEFAULT '0',
  `paymenttype` enum('partial','complete') NOT NULL DEFAULT 'complete',
  `paymentinterval` tinyint(2) DEFAULT NULL,
  `description` mediumtext,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `eventid` (`eventid`),
  KEY `salesid` (`salesid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.eventsetting
CREATE TABLE IF NOT EXISTS `eventsetting` (
  `eventid` int(11) NOT NULL,
  `webhookurl` varchar(1000) DEFAULT NULL,
  `eticketmessage` varchar(1000) NOT NULL,
  `registrationemailtext` text NOT NULL,
  `displayticketwidget` tinyint(1) NOT NULL DEFAULT '0',
  `displayamountonticket` tinyint(1) NOT NULL DEFAULT '1',
  `nonormalwhenbulk` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-both bulk discount and normal discount applicable on ticket,1-normal discount is not applicable on bulk discounted ticket',
  `sendubermails` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'whether to send the Uber mails to the delegate',
  `sendfeedbackemails` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Whether to send feedback email or not',
  `qualitycheck` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Admin review',
  `eventlistingfee` float NOT NULL,
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `nodates` tinyint(1) NOT NULL,
  `notmore` tinyint(1) NOT NULL,
  `needvol` tinyint(1) NOT NULL,
  `qpid` int(11) NOT NULL,
  `qdate` datetime NOT NULL,
  `calculationmode` enum('ontaxedprice','onbaseprice') NOT NULL DEFAULT 'ontaxedprice',
  `percentage` float NOT NULL,
  `commentpercentage` text NOT NULL,
  `paidbit` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 for "yes", 0 for "No"',
  `compiorg` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 for "yes", 0 for "No"',
  `leftforpayment` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 for "yes", 0 for "No"',
  `exception` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 for "yes", 0 for "No"',
  `nodiscount` tinyint(1) NOT NULL DEFAULT '0',
  `nofbcomments` tinyint(1) NOT NULL DEFAULT '0',
  `collectmultipleattendeeinfo` tinyint(1) DEFAULT NULL,
  `customemail` tinyint(1) NOT NULL DEFAULT '0',
  `geolocalitydisplay` tinyint(1) DEFAULT '1',
  `mobileapi` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 for inactive, 1 for active',
  `standardapi` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 for inactive, 1 for active',
  `eventpromocodeenable` tinyint(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `eventid` (`eventid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.eventsignup
CREATE TABLE IF NOT EXISTS `eventsignup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `eventid` int(11) NOT NULL,
  `signupdate` datetime DEFAULT NULL,
  `quantity` smallint(5) NOT NULL,
  `discountamount` double NOT NULL,
  `referraldiscountamount` double NOT NULL,
  `fromcurrencyid` int(11) NOT NULL DEFAULT '1',
  `tocurrencyid` int(11) NOT NULL DEFAULT '1',
  `attendeeid` int(11) NOT NULL,
  `discount` varchar(50) NOT NULL,
  `discountcodeid` int(11) NOT NULL,
  `paymentmodeid` tinyint(1) NOT NULL COMMENT '1-card,2-COD,3-cheque,4-offline, 5- spot',
  `paymenttransactionid` varchar(50) NOT NULL DEFAULT 'A1',
  `supportstatus` enum('Open','Closed') NOT NULL,
  `transactiontickettype` varchar(100) NOT NULL,
  `transactionticketids` varchar(500) NOT NULL,
  `transactionstatus` enum('success','pending','failed') NOT NULL DEFAULT 'pending',
  `transactionresponse` varchar(2000) DEFAULT NULL,
  `paymentgatewayid` smallint(3) DEFAULT NULL,
  `paymentstatus` enum('Verified','Captured','NotVerified','Refunded','Canceled','PartialRefund') NOT NULL DEFAULT 'NotVerified',
  `settlementdate` datetime NOT NULL,
  `ticketwidgettransaction` tinyint(1) NOT NULL DEFAULT '0',
  `depositdate` datetime NOT NULL,
  `paymentsourceid` smallint(6) NOT NULL DEFAULT '1',
  `useragent` varchar(300) DEFAULT NULL,
  `userpointid` varchar(30) NOT NULL,
  `referralcode` varchar(25) NOT NULL,
  `promotercode` varchar(25) NOT NULL,
  `conversionrate` double NOT NULL DEFAULT '1',
  `barcodenumber` varchar(25) NOT NULL,
  `totalamount` double NOT NULL,
  `convertedamount` double DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  `eventextrachargeamount` double DEFAULT NULL,
  `eventextrachargeid` varchar(60) DEFAULT NULL,
  `extrafield` varchar(255) DEFAULT NULL,
  `extrainfo` enum('transactionGrouping') DEFAULT NULL,
  `gatewaycommission` decimal(10,4) DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  KEY `attendeeid` (`attendeeid`),
  KEY `eventid` (`eventid`),
  KEY `userid` (`userid`),
  KEY `transactionstatus` (`transactionstatus`),
  KEY `paymentstatus` (`paymentstatus`),
  KEY `signupdate` (`signupdate`),
  KEY `paymentmodeid` (`paymentmodeid`),
  KEY `paymentgatewayid` (`paymentgatewayid`),
  KEY `referralcode` (`referralcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.eventsignuptax
CREATE TABLE IF NOT EXISTS `eventsignuptax` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventsignupid` bigint(20) NOT NULL,
  `ticketid` int(11) NOT NULL,
  `taxmappingid` int(11) NOT NULL,
  `taxamount` float NOT NULL,
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL,
  `modifiedby` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `eventsignupid` (`eventsignupid`),
  KEY `ticketid` (`ticketid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='eventsignup  tax amounts of transaction level & ticket level details will be saved';

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.eventsignupticketdetail
CREATE TABLE IF NOT EXISTS `eventsignupticketdetail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `eventsignupid` bigint(20) NOT NULL,
  `ticketid` int(11) NOT NULL,
  `ticketquantity` smallint(6) NOT NULL,
  `amount` double NOT NULL,
  `totalamount` double NOT NULL DEFAULT '0' COMMENT 'amount-discount+taxes',
  `totaltaxamount` double NOT NULL DEFAULT '0',
  `discountcode` varchar(50) NOT NULL,
  `discountcodeid` int(11) NOT NULL,
  `discountamount` double NOT NULL,
  `bulkdiscountamount` double NOT NULL,
  `referraldiscountamount` double NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `estd_esid_idx` (`eventsignupid`),
  KEY `ticketid` (`ticketid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.eventtag
CREATE TABLE IF NOT EXISTS `eventtag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `eventid` int(11) NOT NULL,
  `tagid` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 - not deleted, 1- deleted',
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `temp_name` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `eventid` (`eventid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.EventViewCount
CREATE TABLE IF NOT EXISTS `EventViewCount` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `eventId` int(11) NOT NULL,
  `viewCount` int(11) NOT NULL,
  `cts` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` datetime NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `evtvcnt_eid_idx` (`eventId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.file
CREATE TABLE IF NOT EXISTS `file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `path` varchar(1000) NOT NULL,
  `temp_path` varchar(1000) DEFAULT NULL,
  `type` enum('userprofile','banner','thumbnail','countrythumb','categorythumb','eventthumbnail','eventbanner','topbanner','bottombanner','categoryicon','settlementpaymentadvice','settlementcheque','settlementcyberreciept','customfield','eventgallery','commissioncontractdoc','organizerlogo','organizationlogo','organizationbanner','eventgallerythumbnail','defaultbanner','defaultthumbnail','appimage','eventdescription') DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  `eventid_temp` int(11) DEFAULT NULL,
  `userid_temp` int(11) DEFAULT NULL,
  `temp_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.gallery
CREATE TABLE IF NOT EXISTS `gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventid` int(11) NOT NULL,
  `imagefileid` int(11) NOT NULL,
  `thumbnailfileid` int(11) NOT NULL,
  `caption` varchar(500) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `order` smallint(3) NOT NULL DEFAULT '1',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL COMMENT 'userid',
  `modifiedby` int(11) NOT NULL COMMENT 'userid',
  PRIMARY KEY (`id`),
  KEY `eventid` (`eventid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.locality
CREATE TABLE IF NOT EXISTS `locality` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(300) NOT NULL,
  `cityid` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cityid` (`cityid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.messagetemplate
CREATE TABLE IF NOT EXISTS `messagetemplate` (
  `id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `template` mediumtext NOT NULL,
  `type` varchar(50) NOT NULL,
  `mode` enum('email','sms') NOT NULL DEFAULT 'email',
  `eventid` int(11) DEFAULT NULL,
  `fromemailid` varchar(50) NOT NULL,
  `params` varchar(500) DEFAULT NULL,
  `countryid` tinyint(3) DEFAULT NULL,
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mode` (`mode`),
  KEY `type` (`type`),
  KEY `countryid` (`countryid`),
  KEY `eventid` (`eventid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.oauth_access_tokens
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `access_token` varchar(40) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`access_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.oauth_authorization_codes
CREATE TABLE IF NOT EXISTS `oauth_authorization_codes` (
  `authorization_code` varchar(40) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `redirect_uri` varchar(2000) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`authorization_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.oauth_clients
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `client_id` int(10) NOT NULL,
  `client_secret` varchar(40) NOT NULL,
  `redirect_uri` varchar(100) NOT NULL,
  `grant_type` varchar(100) NOT NULL,
  `user_id` bigint(50) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `app_name` varchar(100) NOT NULL,
  `app_image` varchar(500) NOT NULL,
  `access_level` tinyint(1) NOT NULL DEFAULT '1' COMMENT '"0-read","1-write"',
  `createdby` int(11) NOT NULL,
  `modifiedby` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.oauth_jwt
CREATE TABLE IF NOT EXISTS `oauth_jwt` (
  `client_id` varchar(80) NOT NULL,
  `subject` varchar(80) DEFAULT NULL,
  `public_key` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.oauth_refresh_tokens
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `refresh_token` varchar(40) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`refresh_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.oauth_scopes
CREATE TABLE IF NOT EXISTS `oauth_scopes` (
  `scope` text,
  `is_default` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.offlinepromoterdiscounts
CREATE TABLE IF NOT EXISTS `offlinepromoterdiscounts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `promoterid` bigint(20) NOT NULL,
  `eventid` int(11) NOT NULL,
  `ticketid` int(11) NOT NULL,
  `discountid` int(11) NOT NULL COMMENT 'discount id',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `cts` timestamp NOT NULL,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL,
  `modifiedby` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `promoterid` (`promoterid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.offlinepromoterticketmapping
CREATE TABLE IF NOT EXISTS `offlinepromoterticketmapping` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `promoterid` bigint(20) NOT NULL,
  `eventid` int(11) NOT NULL,
  `ticketid` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL,
  `modifiedby` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `promoterid` (`promoterid`),
  KEY `eventid` (`eventid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.orderlog
CREATE TABLE IF NOT EXISTS `orderlog` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(30) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `eventsignup` bigint(20) NOT NULL,
  `data` text,
  `userip` varchar(20) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `createdby` int(11) DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orderid` (`orderid`),
  KEY `eventsignup` (`eventsignup`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.organization
CREATE TABLE IF NOT EXISTS `organization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `information` text,
  `about` text,
  `intendedfor` text,
  `logopathid` int(11) DEFAULT NULL,
  `bannerpathid` int(11) DEFAULT NULL,
  `sequencenumber` int(4) DEFAULT NULL,
  `eventsnumber` int(3) DEFAULT NULL,
  `viewcount` int(11) DEFAULT NULL,
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This is a group of organizers';

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.organizationuser
CREATE TABLE IF NOT EXISTS `organizationuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organizationid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `userid_ix_orgt` (`userid`),
  KEY `organizationid_ix_orgt` (`organizationid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='users of organization';

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.organizer
CREATE TABLE IF NOT EXISTS `organizer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `description` mediumtext,
  `companyname` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `countryid` smallint(3) NOT NULL,
  `stateid` int(11) NOT NULL,
  `cityid` int(11) NOT NULL,
  `pincode` int(11) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `fax` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `url` varchar(500) NOT NULL,
  `logofileid` varchar(200) NOT NULL,
  `facebooklink` varchar(500) NOT NULL,
  `twitterlink` varchar(500) NOT NULL,
  `linkedinlink` varchar(500) NOT NULL,
  `googlepluslink` varchar(500) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL,
  `modifiedby` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.organizerbankdetail
CREATE TABLE IF NOT EXISTS `organizerbankdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `accountname` varchar(255) NOT NULL,
  `bankname` varchar(255) NOT NULL,
  `accountnumber` varchar(50) NOT NULL,
  `accounttype` enum('Current','Savings') NOT NULL,
  `branch` varchar(50) NOT NULL,
  `ifsccode` varchar(50) NOT NULL,
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL,
  `modifiedby` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.partialeventsignup
CREATE TABLE IF NOT EXISTS `partialeventsignup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `eventsignupid` bigint(20) NOT NULL DEFAULT '0',
  `userid` int(11) DEFAULT NULL,
  `eventid` int(11) NOT NULL,
  `signupdate` datetime DEFAULT NULL,
  `quantity` smallint(5) NOT NULL,
  `discountamount` double NOT NULL,
  `referraldiscountamount` double NOT NULL,
  `fromcurrencyid` int(11) NOT NULL DEFAULT '1',
  `tocurrencyid` int(11) NOT NULL DEFAULT '1',
  `attendeeid` int(11) NOT NULL,
  `discount` varchar(50) NOT NULL,
  `discountcodeid` int(11) NOT NULL,
  `paymentmodeid` tinyint(1) NOT NULL COMMENT '1-card,2-COD,3-cheque,4-offline',
  `paymenttransactionid` varchar(50) NOT NULL DEFAULT 'A1',
  `supportstatus` enum('Open','Closed') NOT NULL,
  `transactiontickettype` varchar(100) NOT NULL,
  `transactionticketids` varchar(500) NOT NULL,
  `transactionstatus` enum('success','pending','failed') NOT NULL DEFAULT 'pending',
  `transactionresponse` varchar(2000) DEFAULT NULL,
  `paymentgatewayid` smallint(3) DEFAULT NULL,
  `paymentstatus` enum('Verified','Captured','NotVerified','Refunded','Canceled','PartialRefund') NOT NULL DEFAULT 'NotVerified',
  `settlementdate` datetime NOT NULL,
  `ticketwidgettransaction` tinyint(1) NOT NULL DEFAULT '0',
  `depositdate` datetime NOT NULL,
  `paymentsourceid` smallint(6) NOT NULL DEFAULT '1',
  `useragent` varchar(300) DEFAULT NULL,
  `userpointid` varchar(30) NOT NULL,
  `referralcode` varchar(25) NOT NULL,
  `promotercode` varchar(25) NOT NULL,
  `conversionrate` double NOT NULL DEFAULT '1',
  `barcodenumber` varchar(25) NOT NULL,
  `totalamount` double NOT NULL,
  `convertedamount` double DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  `eventextrachargeamount` double DEFAULT NULL,
  `eventextrachargeid` int(11) DEFAULT NULL,
  `extrafield` varchar(255) DEFAULT NULL,
  `extrainfo` enum('transactionGrouping') DEFAULT NULL,
  `gatewaycommission` decimal(10,4) DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  KEY `attendeeid` (`attendeeid`),
  KEY `eventid` (`eventid`),
  KEY `userid` (`userid`),
  KEY `transactionstatus` (`transactionstatus`),
  KEY `paymentstatus` (`paymentstatus`),
  KEY `signupdate` (`signupdate`),
  KEY `paymentmodeid` (`paymentmodeid`),
  KEY `paymentgatewayid` (`paymentgatewayid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.paymentgateway
CREATE TABLE IF NOT EXISTS `paymentgateway` (
  `id` tinyint(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `merchantid` varchar(50) NOT NULL,
  `hashkey` varchar(255) NOT NULL,
  `returnurl` varchar(500) NOT NULL,
  `posturl` varchar(500) NOT NULL,
  `extraparams` varchar(500) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `gatewaytext` text,
  `type` enum('gateway','commission') NOT NULL DEFAULT 'gateway',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL,
  `modifiedby` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.paymentgateway_prod
CREATE TABLE IF NOT EXISTS `paymentgateway_prod` (
  `id` tinyint(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `merchantid` varchar(50) NOT NULL,
  `hashkey` varchar(255) NOT NULL,
  `returnurl` varchar(500) NOT NULL,
  `posturl` varchar(500) NOT NULL,
  `extraparams` varchar(500) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `gatewaytext` text,
  `type` enum('gateway','commission') NOT NULL DEFAULT 'gateway',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL,
  `modifiedby` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.paymentsource
CREATE TABLE IF NOT EXISTS `paymentsource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `eventid` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 - not activated, 1 -activated',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 - not deleted, 1 - deleted',
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL,
  `modifiedby` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.promoter
CREATE TABLE IF NOT EXISTS `promoter` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `userid` int(11) NOT NULL,
  `eventid` int(11) NOT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `ticketslimit` smallint(5) DEFAULT NULL,
  `code` varchar(40) NOT NULL,
  `orgpromoteurl` varchar(1000) NOT NULL COMMENT 'Organizer Site URL for promotions',
  `type` enum('affliate','offline') NOT NULL DEFAULT 'affliate',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL,
  `modifiedby` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `eventid` (`eventid`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.refund
CREATE TABLE IF NOT EXISTS `refund` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `eventsignupid` bigint(20) NOT NULL,
  `amount` double NOT NULL,
  `initiateddate` datetime NOT NULL,
  `refunddate` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL,
  `modifiedby` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `eventsignupid` (`eventsignupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.role
CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `isctrlaccessable` tinyint(1) NOT NULL DEFAULT '1',
  `description` varchar(500) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL,
  `modifiedby` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.salesperson
CREATE TABLE IF NOT EXISTS `salesperson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `signature` varchar(500) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `mobile` (`mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.sentmessage
CREATE TABLE IF NOT EXISTS `sentmessage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `messageid` tinyint(3) DEFAULT NULL,
  `eventsignupid` bigint(20) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 - success, 0 -failure',
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `eventsignupid` (`eventsignupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.sentmessagearchive
CREATE TABLE IF NOT EXISTS `sentmessagearchive` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `messageid` tinyint(3) DEFAULT NULL,
  `eventsignupid` bigint(20) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 - success, 0 -failure',
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `eventsignupid` (`eventsignupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.seodata
CREATE TABLE IF NOT EXISTS `seodata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seotitle` varchar(150) DEFAULT NULL,
  `seokeywords` text,
  `seodescription` text,
  `canonicalurl` varchar(1000) DEFAULT NULL,
  `url` varchar(2000) NOT NULL,
  `pagedescription` text,
  `gascript` varchar(255) DEFAULT NULL,
  `mappingurl` varchar(2000) DEFAULT NULL,
  `pagetype` enum('home','microsite') DEFAULT NULL,
  `mappingtype` enum('include','redirect') NOT NULL DEFAULT 'redirect',
  `params` varchar(2000) DEFAULT NULL,
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.sessionlock
CREATE TABLE IF NOT EXISTS `sessionlock` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(50) NOT NULL,
  `ticketid` int(11) NOT NULL,
  `quantity` smallint(4) NOT NULL,
  `starttime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `endtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `orderid` (`orderid`),
  KEY `ticketid` (`ticketid`),
  KEY `deleted` (`deleted`),
  KEY `endtime` (`endtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.settlement
CREATE TABLE IF NOT EXISTS `settlement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventid` int(11) NOT NULL,
  `paymentadvicefileid` int(11) DEFAULT NULL,
  `chequefileid` int(11) DEFAULT NULL,
  `cyberrecieptfileid` int(11) DEFAULT NULL COMMENT 'Cyber Reciept document id',
  `note` mediumtext,
  `netamount` float DEFAULT NULL,
  `amountpaid` float DEFAULT NULL,
  `paymentdate` datetime NOT NULL COMMENT 'Payment Date',
  `paymenttype` enum('Partial Payment','Done','EventCanceled') NOT NULL COMMENT 'Payment type either partial or done or canceled',
  `currencyid` smallint(3) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL COMMENT '1 indicates Active record and 0 indicates Inactive',
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL,
  `modifiedby` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `eventid` (`eventid`),
  KEY `paymentdate` (`paymentdate`),
  KEY `paymenttype` (`paymenttype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.specialdiscount
CREATE TABLE IF NOT EXISTS `specialdiscount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('newyear','holi','dandiya') DEFAULT 'newyear' COMMENT 'specifies, discount type',
  `title` varchar(500) DEFAULT NULL COMMENT 'discount code related text',
  `promocode` varchar(15) DEFAULT NULL,
  `eventid` int(11) DEFAULT NULL COMMENT 'event id',
  `cityid` int(11) NOT NULL DEFAULT '0' COMMENT 'all cities -0, rest cityid',
  `cts` datetime DEFAULT CURRENT_TIMESTAMP,
  `mts` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '1 (default) Active, 0 Inactive',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.stadiumregion
CREATE TABLE IF NOT EXISTS `stadiumregion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `venueid` int(11) NOT NULL,
  `eventid` int(11) NOT NULL,
  `ticketid` int(11) NOT NULL,
  `regionid` varchar(45) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `noofrows` int(11) NOT NULL,
  `noofcols` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `cts` datetime NOT NULL,
  `mts` datetime DEFAULT NULL,
  `createdby` int(11) NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `regioncolstart` varchar(10) DEFAULT NULL,
  `regionrowstart` varchar(10) DEFAULT NULL,
  `rowname` varchar(45) DEFAULT NULL,
  `colname` varchar(45) DEFAULT NULL,
  `regionorder` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vs_eventid_idx` (`eventid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.state
CREATE TABLE IF NOT EXISTS `state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `shortname` varchar(200) DEFAULT NULL,
  `countryid` smallint(3) NOT NULL DEFAULT '14',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `countryid` (`countryid`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.statecity
CREATE TABLE IF NOT EXISTS `statecity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stateid` int(11) NOT NULL,
  `cityid` int(11) NOT NULL,
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stateid` (`stateid`,`cityid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.subcategory
CREATE TABLE IF NOT EXISTS `subcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryid` smallint(3) NOT NULL,
  `name` varchar(300) NOT NULL,
  `value` varchar(300) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 - active, 0- inactive, 2- review',
  `order` int(11) NOT NULL DEFAULT '0',
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `categoryid` (`categoryid`),
  KEY `name` (`name`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.tag
CREATE TABLE IF NOT EXISTS `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL,
  `modifiedby` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.tax
CREATE TABLE IF NOT EXISTS `tax` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 - disabled, 1 - enabled',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 -not deleted, 1 - deleted',
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL,
  `modifiedby` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.taxmapping
CREATE TABLE IF NOT EXISTS `taxmapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taxid` int(11) NOT NULL,
  `value` float NOT NULL,
  `countryid` smallint(3) NOT NULL,
  `stateid` int(11) NOT NULL DEFAULT '0',
  `cityid` int(11) NOT NULL DEFAULT '0',
  `type` enum('country','state','city') NOT NULL DEFAULT 'country',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL,
  `modifiedby` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `stateid` (`stateid`),
  KEY `cityid` (`cityid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax mapping to country, state, city values';

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.theatervenue
CREATE TABLE IF NOT EXISTS `theatervenue` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Venue` varchar(255) NOT NULL,
  `Template` varchar(255) NOT NULL,
  `stadiumhtml` blob,
  `eventId` int(11) DEFAULT NULL,
  `venuetype` tinyint(1) DEFAULT '1',
  `cts` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` tinyint(1) DEFAULT '0',
  `createdby` int(11) DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.thirdpartypayment
CREATE TABLE IF NOT EXISTS `thirdpartypayment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `referenceid` varchar(20) COLLATE utf8_bin NOT NULL,
  `transactionid` varchar(30) COLLATE utf8_bin NOT NULL,
  `data` text COLLATE utf8_bin NOT NULL,
  `status` enum('0','1','2') COLLATE utf8_bin NOT NULL,
  `paymentsourceid` smallint(3) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `paymentgatewayid` smallint(3) NOT NULL DEFAULT '1',
  `createdby` int(11) DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.ticket
CREATE TABLE IF NOT EXISTS `ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(300) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `eventid` int(11) NOT NULL,
  `price` double NOT NULL DEFAULT '0',
  `quantity` int(11) NOT NULL DEFAULT '0',
  `minorderquantity` smallint(3) NOT NULL,
  `maxorderquantity` smallint(3) NOT NULL,
  `startdatetime` datetime NOT NULL,
  `enddatetime` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 - inactive, 1- active, 2- soldout',
  `totalsoldtickets` int(11) NOT NULL DEFAULT '0',
  `type` enum('paid','free','donation','addon') DEFAULT NULL,
  `order` smallint(3) NOT NULL,
  `displaystatus` tinyint(1) NOT NULL DEFAULT '1',
  `currencyid` smallint(3) NOT NULL,
  `compticket` tinyint(1) NOT NULL DEFAULT '0',
  `numberofentries` smallint(2) NOT NULL,
  `cts` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL COMMENT 'userid',
  `modifiedby` int(11) NOT NULL COMMENT 'userid',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `soldout` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `eventid` (`eventid`),
  KEY `startdatetime` (`startdatetime`),
  KEY `enddatetime` (`enddatetime`),
  KEY `displaystatus` (`displaystatus`),
  KEY `soldout` (`soldout`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.ticketdiscount
CREATE TABLE IF NOT EXISTS `ticketdiscount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discountid` int(11) NOT NULL,
  `ticketid` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL COMMENT 'userid',
  `modifiedby` int(11) NOT NULL COMMENT 'userid',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `discountid` (`discountid`),
  KEY `ticketid` (`ticketid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.tickettax
CREATE TABLE IF NOT EXISTS `tickettax` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticketid` int(11) NOT NULL,
  `taxmappingid` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL,
  `modifiedby` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ticketid` (`ticketid`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.timezone
CREATE TABLE IF NOT EXISTS `timezone` (
  `id` smallint(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `zone` varchar(500) NOT NULL,
  `timezone` varchar(500) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL,
  `modifiedby` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(1000) NOT NULL,
  `password` varchar(500) NOT NULL,
  `email` varchar(255) NOT NULL,
  `company` varchar(500) NOT NULL,
  `name` varchar(500) NOT NULL,
  `profileimagefileid` int(11) DEFAULT NULL,
  `signupdate` datetime NOT NULL,
  `address` varchar(1000) NOT NULL,
  `countryid` smallint(3) NOT NULL,
  `stateid` int(11) NOT NULL,
  `cityid` int(11) NOT NULL,
  `pincode` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-notverified,1-active,2-inactive',
  `timezoneid` smallint(3) NOT NULL DEFAULT '1',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `verificationstring` varchar(500) NOT NULL,
  `facebookid` varchar(200) NOT NULL,
  `twitterid` varchar(200) NOT NULL,
  `googleid` varchar(200) NOT NULL,
  `ipaddress` varchar(100) NOT NULL,
  `totalcredits` double NOT NULL,
  `isattendee` tinyint(1) NOT NULL DEFAULT '0',
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  `usertype` enum('admin','superadmin','user') NOT NULL DEFAULT 'user',
  PRIMARY KEY (`id`),
  KEY `username` (`username`(255)),
  KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.userdevicedetail
CREATE TABLE IF NOT EXISTS `userdevicedetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `name` enum('deviceid','devicetype') NOT NULL,
  `value` varchar(255) NOT NULL,
  `parentid` int(11) NOT NULL DEFAULT '0',
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  `deviceid` varchar(100) DEFAULT NULL,
  `devicetype` enum('IOS','Android') DEFAULT NULL,
  `devicetoken` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='stores the deviceid & device type like ios, android..etc';

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.userpoint
CREATE TABLE IF NOT EXISTS `userpoint` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `eventsignupid` bigint(20) DEFAULT NULL,
  `points` float NOT NULL,
  `type` enum('viral') NOT NULL DEFAULT 'viral',
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL,
  `modifiedby` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `eventsignupid` (`eventsignupid`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='points earned by every user saving table';

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.venueseat
CREATE TABLE IF NOT EXISTS `venueseat` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `VenueId` int(11) NOT NULL,
  `GridPosition` varchar(50) NOT NULL,
  `Seatno` int(11) NOT NULL,
  `Price` int(11) NOT NULL,
  `Type` varchar(255) NOT NULL,
  `Status` enum('Booked','Reserved','Available','InProcess','otherarea') NOT NULL DEFAULT 'Available',
  `EventId` int(11) NOT NULL,
  `EventSIgnupId` int(11) NOT NULL,
  `BDate` datetime NOT NULL,
  `ticketid` int(11) NOT NULL,
  `regionid` int(11) NOT NULL,
  `group` int(11) NOT NULL,
  `processexpirydate` datetime DEFAULT NULL,
  `usersessionid` varchar(45) DEFAULT NULL,
  `createdby` int(11) NOT NULL,
  `seatrowstart` varchar(45) DEFAULT NULL,
  `seatcolstart` varchar(45) DEFAULT NULL,
  `modifiedby` int(11) NOT NULL,
  `cts` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `vs_eventid_idx` (`EventId`),
  KEY `idx_venueseat_EventSIgnupId` (`EventSIgnupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.verificationtoken
CREATE TABLE IF NOT EXISTS `verificationtoken` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `type` enum('useractivation','password','payment') NOT NULL,
  `expirationdate` datetime NOT NULL,
  `used` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 - not used, 1 - used',
  `userid` int(11) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `createdby` int(11) DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `token` (`token`),
  KEY `expirationdate` (`expirationdate`),
  KEY `used` (`used`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores all verification tockens data ';

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.viralticketsale
CREATE TABLE IF NOT EXISTS `viralticketsale` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `referreruserid` int(11) NOT NULL,
  `eventsignupticketdetailid` bigint(20) NOT NULL,
  `viralticketsettingid` int(11) NOT NULL,
  `referreruserpointid` int(11) NOT NULL,
  `referralcode` varchar(100) NOT NULL,
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL,
  `modifiedby` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `eventsignupticketdetailid` (`eventsignupticketdetailid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Viral tikcet sale storing table';

-- Data exporting was unselected.


-- Dumping structure for table devmeraevent.viralticketsetting
CREATE TABLE IF NOT EXISTS `viralticketsetting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventid` int(11) NOT NULL,
  `ticketid` int(11) NOT NULL,
  `type` enum('flat','percentage') NOT NULL DEFAULT 'flat',
  `referrercommission` double NOT NULL,
  `receivercommission` double NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `cts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdby` int(11) NOT NULL,
  `modifiedby` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ticketid_UNIQUE` (`ticketid`),
  KEY `eventid` (`eventid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='event & vita ticket settings mapping table';

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
