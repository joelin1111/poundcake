-- MySQL dump 10.13  Distrib 5.5.25, for osx10.6 (i386)
--
-- Host: localhost    Database: poundcake
-- ------------------------------------------------------
-- Server version	5.5.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `antenna_types`
--

DROP TABLE IF EXISTS `antenna_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `antenna_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `antenna_types`
--

LOCK TABLES `antenna_types` WRITE;
/*!40000 ALTER TABLE `antenna_types` DISABLE KEYS */;
INSERT INTO `antenna_types` VALUES (1,'16 dBi AirMax Sector'),(2,'30 dBi RocketDish'),(3,'34 dBi RocketDish'),(4,'17 dBi AirMax Sector');
/*!40000 ALTER TABLE `antenna_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `build_items`
--

DROP TABLE IF EXISTS `build_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quantity` int(10) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `build_items`
--

LOCK TABLES `build_items` WRITE;
/*!40000 ALTER TABLE `build_items` DISABLE KEYS */;
INSERT INTO `build_items` VALUES (1,20,'RJ45, Indoor'),(2,50,'RJ45, Shielded, Toughconnector'),(3,20,'Ring Connectors, large, for tower lightning ground'),(4,5,'Fork Connectors, AWG 14, insulated'),(5,2,'meters, wire, AWG 14, red'),(6,5,'anderson connectors, red'),(7,5,'anderson connectors, blue'),(8,5,'anderson connectors, green'),(9,5,'anderson connectors, black'),(10,10,'anderson connector metal contacts'),(11,10,'Terminal rings, small, for lightning arrestors'),(12,2,'meters, wire, AWG 14, black'),(13,2,'meters, wire, AWG 14, blue'),(14,2,'meters, wire, AWG 14, green'),(15,4,'meters, wire, AWG 8, green, for lightning ground'),(16,2,'box, Toughcable Carrier, brown'),(17,4,'pipe, galvanized, 3m, 2\" outer diameter'),(18,16,'beam clamp assembly (beam clamp, bolt, nut, washer, lock washer)'),(19,7,'lightning arrestor, high voltage (AL-CAT5HPJW)'),(20,8,'pipe grabs, 2\", tight fitting to mounting pipe'),(21,3,'spare 3A fuse'),(22,3,'spare 5A fuse'),(23,100,'zip ties, 14\", UV stable, black'),(24,1,'sliicon bronze grounding bolt set (bolt + nut + washer)'),(25,8,'unistrut pre cut piece, ~10\"'),(26,1,'padlock for cabinet, preset to proper combination'),(27,1,'equipment needed for mounting lightning arrestors (starboard?)');
/*!40000 ALTER TABLE `build_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `change_logs`
--

DROP TABLE IF EXISTS `change_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `change_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `release_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `change_logs`
--

LOCK TABLES `change_logs` WRITE;
/*!40000 ALTER TABLE `change_logs` DISABLE KEYS */;
INSERT INTO `change_logs` VALUES (1,'1.0','\r\n        Release Notes - Poundcake - Version 1.0\r\n        \r\n<h2>        Bug\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-20\'>PC-20</a>] -         Delete school does not delete associated files\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-23\'>PC-23</a>] -         School map should center on school&#39;s GPS coordiantes\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-26\'>PC-26</a>] -         Edit District\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-34\'>PC-34</a>] -         Cascade Ajax events on select of Catchment/Area/Region on add/edit District view\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-52\'>PC-52</a>] -         Formatting of school listing on the view TRC page\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-60\'>PC-60</a>] -         UI on final page of paginated results\r\n</li>\r\n</ul>\r\n    \r\n<h2>        Improvement\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-18\'>PC-18</a>] -         GPS data validation\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-84\'>PC-84</a>] -         Move location to separate lat/lon float fields, MySQL trigger to make slave column for spatial data storage\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-85\'>PC-85</a>] -         Power field\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-86\'>PC-86</a>] -         List Contact Type\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-90\'>PC-90</a>] -         Site States and icon colors for overview map\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-91\'>PC-91</a>] -         default state icon is orange\r\n</li>\r\n</ul>\r\n        \r\n<h2>        New Feature\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-1\'>PC-1</a>] -         District Contact Info\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-2\'>PC-2</a>] -         Create person contact type\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-3\'>PC-3</a>] -         Add access instructions to school detail page\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-4\'>PC-4</a>] -         Add install date field\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-6\'>PC-6</a>] -         Search nearby feature\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-7\'>PC-7</a>] -         &quot;install team&quot; object\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-8\'>PC-8</a>] -         School search\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-10\'>PC-10</a>] -         Ajax select for Area, District on create new school\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-11\'>PC-11</a>] -         Update Google Map Helper on School Detail page\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-12\'>PC-12</a>] -         Remove Rajib Ahmed&#39;s Google map helper\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-14\'>PC-14</a>] -         Hierarchy of organizational units\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-15\'>PC-15</a>] -         Need final Catchment/Area/District matrix\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-17\'>PC-17</a>] -         Apache configuration\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-19\'>PC-19</a>] -         Add/edit school field-level vlidation\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-25\'>PC-25</a>] -         TCs/TRCs in a District\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-29\'>PC-29</a>] -         Re: TC/TRC staff\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-30\'>PC-30</a>] -         look into MapBox\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-37\'>PC-37</a>] -         Add top-level menu item for TC/TRCs\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-38\'>PC-38</a>] -         Add top-level menu item for Contacts\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-39\'>PC-39</a>] -         Permissions layer\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-41\'>PC-41</a>] -         add email field to Contact model\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-48\'>PC-48</a>] -         escape &quot;/&quot; on school code search\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-50\'>PC-50</a>] -         Add nearby schools to map on school detail page\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-51\'>PC-51</a>] -         Redirect logged in users\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-54\'>PC-54</a>] -         User edit of user details\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-61\'>PC-61</a>] -         Use virtual fields for User, Contact\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-62\'>PC-62</a>] -         drop InstallationState in favor of SiteState\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-63\'>PC-63</a>] -         virtual fields + displayField\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-64\'>PC-64</a>] -         Sort of TRCs on Contact edit\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-65\'>PC-65</a>] -         Sort of Districts on Contact edit\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-82\'>PC-82</a>] -         Replace Catchment/Area/District with Zones\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-89\'>PC-89</a>] -         Add NetworkRouter type\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-92\'>PC-92</a>] -         switch/index - sort alphabetically\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-93\'>PC-93</a>] -         radio/index - sort alphabetically\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-94\'>PC-94</a>] -         router/index - sort alphabetically\r\n</li>\r\n</ul>\r\n    \r\n<h2>        Question\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-27\'>PC-27</a>] -         Remove View for simple objects on admin page\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-28\'>PC-28</a>] -         Policy regarding Users\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-36\'>PC-36</a>] -         Region\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-87\'>PC-87</a>] -         J√©r√©mie A√©roport\r\n</li>\r\n</ul>\r\n        \r\n<h2>        Task\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-21\'>PC-21</a>] -         Customize Cake&#39;s default error messages for missing controllers, views, etc.\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-22\'>PC-22</a>] -         Need partner logos for UI\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-24\'>PC-24</a>] -         Style CSS for AjaxMultiUpload plugin\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-31\'>PC-31</a>] -         Add Ajax on Catchment, Area selects to Add/Edit of School\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-32\'>PC-32</a>] -         Add Catchment, Area selects to Add/Edit of Region + Ajax update\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-33\'>PC-33</a>] -         Add Ajax on Catchment, Area selects to Add/Edit of District\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-35\'>PC-35</a>] -         School contacts\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-40\'>PC-40</a>] -         Review School model from Andris&#39; spreadsheet\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-42\'>PC-42</a>] -         Style CSS for Jquery calendar\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-43\'>PC-43</a>] -         Add school code to School search\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-44\'>PC-44</a>] -         Add Contact search\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-45\'>PC-45</a>] -         Add TC/TRC search\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-46\'>PC-46</a>] -         GPS Radius Search\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-53\'>PC-53</a>] -         Re-skin UI with Matt&#39;s CSS\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-66\'>PC-66</a>] -         Add new frields to views for TC/TRC model\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-68\'>PC-68</a>] -         Move map display code (for School, TRC view pages) into common file\r\n</li>\r\n</ul>\r\n    \r\n<h2>        Sub-task\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-16\'>PC-16</a>] -         Need final Catchment/Area/District matrix\r\n</li>\r\n</ul>\r\n','2012-09-13 00:00:00'),(2,'1.1','\r\n        Release Notes - Poundcake - Version 1.1\r\n                    \r\n<h2>        New Feature\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-111\'>PC-111</a>] -         Dynamically add up to 10 Radios with valid AntennaTypes on Site add/edit\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-112\'>PC-112</a>] -         Dynamically add 1 Switch on Site add/edit\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-113\'>PC-113</a>] -         Dynamically add 1 Router on Site add/edit\r\n</li>\r\n</ul>\r\n                \r\n- Bugfixes','2012-09-18 00:00:00'),(3,'1.2','\r\n        Release Notes - Poundcake - Version 1.2\r\n        \r\n<h2>        Bug\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-121\'>PC-121</a>] -         Add label for Contact type on Contact add/edit\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-122\'>PC-122</a>] -         Allow punctuation in passwords\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-124\'>PC-124</a>] -         GPS lat/lon not displaying on Site Edit\r\n</li>\r\n</ul>\r\n    \r\n<h2>        Improvement\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-101\'>PC-101</a>] -         make towerdb aware of equipment lists\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-105\'>PC-105</a>] -         poundcake should know about installation teams\r\n</li>\r\n</ul>\r\n        \r\n<h2>        New Feature\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-125\'>PC-125</a>] -         Make radio on Site Add/Edit default to RocketM5\r\n</li>\r\n</ul>\r\n                ','2012-09-20 00:00:00'),(4,'1.3','\r\n        Release Notes - Poundcake - Version 1.3\r\n        \r\n<h2>        Bug\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-131\'>PC-131</a>] -         Revisit sort of SwitchType in SwitchType controller getSwitchTypes()\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-132\'>PC-132</a>] -         Datepicker CSS needs more visible &lt;&lt; and &gt;&gt; buttons\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-134\'>PC-134</a>] -         Rename Radio does not fully disconnect previous link\r\n</li>\r\n</ul>\r\n    \r\n<h2>        Improvement\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-117\'>PC-117</a>] -         Make frequency a select list\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-129\'>PC-129</a>] -         add &quot;switchport number&quot; field to radios\r\n</li>\r\n</ul>\r\n        \r\n<h2>        New Feature\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-115\'>PC-115</a>] -         can towerdb be aware of how a site is &quot;wired&quot;\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-119\'>PC-119</a>] -         Link Radios\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-126\'>PC-126</a>] -         flash messages on Site Save\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-130\'>PC-130</a>] -         Add SwitchType\r\n</li>\r\n</ul>\r\n                ','2012-09-24 00:00:00'),(5,'1.4','\r\n        Release Notes - Poundcake - Version 1.4\r\n            \r\n<h2>        Improvement\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-102\'>PC-102</a>] -         towerdb integration with addrpool\r\n</li>\r\n</ul>\r\n        \r\n<h2>        New Feature\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-136\'>PC-136</a>] -         Create custom validation rule on NetworkRadio to ensure name is unique\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-138\'>PC-138</a>] -         Override HTML Helper\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-139\'>PC-139</a>] -         Default radio to RocketM5\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-140\'>PC-140</a>] -         Pull name as well as IP address on addrpool integration\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-143\'>PC-143</a>] -         Add Search on Radios\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-145\'>PC-145</a>] -         New fields for Site object\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-146\'>PC-146</a>] -         Radio codes can be 5 or 6 characters\r\n</li>\r\n</ul>\r\n    \r\n<h2>        Question\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-118\'>PC-118</a>] -         Unit for link distance\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-135\'>PC-135</a>] -         Format validation on radio name?\r\n</li>\r\n</ul>\r\n            \r\n<h2>        Sub-task\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-106\'>PC-106</a>] -         true/magnetic azimuth calculation\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-120\'>PC-120</a>] -         Link Distance\r\n</li>\r\n</ul>\r\n','2012-09-27 00:00:00'),(6,'1.5','\r\n        Release Notes - Poundcake - Version 1.5\r\n        \r\n<h2>        Bug\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-152\'>PC-152</a>] -         See if ExcelwriterXML supports embedding images\r\n</li>\r\n</ul>\r\n    \r\n<h2>        Improvement\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-104\'>PC-104</a>] -         towerdb should know how to print workorders\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-150\'>PC-150</a>] -         Round Azimuths on Work Order\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-151\'>PC-151</a>] -         See if ExcelwriterXML supports page breaks for clean printing\r\n</li>\r\n</ul>\r\n        \r\n<h2>        New Feature\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-147\'>PC-147</a>] -         Radio - Station or Access Point\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-149\'>PC-149</a>] -         Add Projects\r\n</li>\r\n</ul>\r\n            \r\n<h2>        Task\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-144\'>PC-144</a>] -         Open up port to reach MySQL on BOUTL-RADIUS\r\n</li>\r\n</ul>\r\n    \r\n<h2>        Sub-task\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-154\'>PC-154</a>] -         Add RouterType\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-155\'>PC-155</a>] -         Add Manufacturer, Model to SwitchType\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-156\'>PC-156</a>] -         Add minimum height to NetworkRadio\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-157\'>PC-157</a>] -         Create top-level Projects, with User HABTM Projects relationship\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-158\'>PC-158</a>] -         Create Site belongsTo Project relationship\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-159\'>PC-159</a>] -         Filter Site find results to just those Site that correspond to the Projects for a User\r\n</li>\r\n</ul>\r\n','2012-10-02 00:00:00'),(7,'1.6','\r\n        Release Notes - Poundcake - Version 1.6\r\n        \r\n<h2>        Bug\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-169\'>PC-169</a>] -         switch view displays &quot;ports&quot; multiple times\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-172\'>PC-172</a>] -         print workorder on HDO386 Fails\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-173\'>PC-173</a>] -         towerdb is suggesting wrong board in equipment list for HDO386\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-176\'>PC-176</a>] -         Workorder prints all technical contacts in system rather than restricting by tower owner\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-179\'>PC-179</a>] -         Azimuths and other empty values in workorder\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-180\'>PC-180</a>] -         BOUTL addrpool data showing up for HDO386?\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-188\'>PC-188</a>] -         Not all contacts are on install teams\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-192\'>PC-192</a>] -         Cant associate an existing site with an existing switch or router\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-197\'>PC-197</a>] -         Workorder populates erroneous IP info when no addrpool data is found\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-199\'>PC-199</a>] -         Verify that all SD* and HD* sites are owned by digicel\r\n</li>\r\n</ul>\r\n    \r\n<h2>        Improvement\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-162\'>PC-162</a>] -         Edit user w/o modifying password\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-198\'>PC-198</a>] -         left justify remote management vlan field\r\n</li>\r\n</ul>\r\n        \r\n<h2>        New Feature\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-164\'>PC-164</a>] -         Find a radio&#39;s gateway from addrpool\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-177\'>PC-177</a>] -         Ordered list of technical contacts\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-183\'>PC-183</a>] -         Add distance between sites\r\n</li>\r\n</ul>\r\n                ','2012-10-16 00:00:00');
/*!40000 ALTER TABLE `change_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connectivity_types`
--

DROP TABLE IF EXISTS `connectivity_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `connectivity_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connectivity_types`
--

LOCK TABLES `connectivity_types` WRITE;
/*!40000 ALTER TABLE `connectivity_types` DISABLE KEYS */;
INSERT INTO `connectivity_types` VALUES (1,'V - Vsat'),(2,'G - GSM'),(3,'P - P2P Wireless'),(4,'C - CDMA ');
/*!40000 ALTER TABLE `connectivity_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_types`
--

DROP TABLE IF EXISTS `contact_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_types`
--

LOCK TABLES `contact_types` WRITE;
/*!40000 ALTER TABLE `contact_types` DISABLE KEYS */;
INSERT INTO `contact_types` VALUES (1,'Commercial Contact'),(2,'Technical Contact'),(3,'Installer');
/*!40000 ALTER TABLE `contact_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `skype` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `priority` int(10) DEFAULT '1',
  `tower_owner_id` int(10) DEFAULT NULL,
  `install_team_id` int(10) DEFAULT NULL,
  `contact_type_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,'Clark','Ritchie',NULL,'+1 (503) 936-2575','clarkritchie','critchie@inveneo.org',2,12,1,2),(2,'Andris','Bjornson',NULL,'+1 (415) 205-7802','andris.bjornson','abjornson@inveneo.org',3,12,1,2),(3,'Jen','Overgaag',NULL,'+1 (805) 440-9423','wyojeno','jovergaag@inveneo.org',2,12,1,2),(4,'Voila','NOC',NULL,'+509 3401-5550','','noc@voila.ht',1,1,NULL,2),(5,'Access Haiti','NOC',NULL,'+509 2812-6000 ext 270','','empty@accesshaiti.ht',1,6,1,2),(6,'Multilink','NOC',NULL,'+509 2813 0931','','noc@multilink.ht',1,2,NULL,2),(7,'Digicel','NOC',NULL,'+(509) 3700-7600, +(509)3703-2764, +(509)3877-6328, +(509)3777-7599, +(509) 3777-7718, +(509)3777-7411, +(509)3777-7492, +(509)3777-7459, +(509) 3777-7458','','haiti.noc@digicelgroup.com',1,10,1,2),(8,'Fred Samuel','Bourdeau (NOC Team Lead)',NULL,'+50937007718','','fredsamuel.bourdeau@digicelgroup.com',2,10,NULL,2),(9,'Mackenzy','Boursiquot (NOC Manager)',NULL,'+509 3700 7480','','mackenzy.boursiquot@digicelgroup.com',3,10,NULL,2),(10,'Hernando','Reynales (Head of O&M)',NULL,'+509 3700 7532','','hernando.reynales@digicelgroup.com',4,10,1,2),(11,'Inveneo','NOC',NULL,'x','','noc@inveneo.org',1,12,NULL,2),(12,'Lens ','Bien ‚ÄìAime',NULL,'(509)3441-0324','','lbien-aime@voila.ht',2,1,NULL,2),(14,'Roudy ','Jeune',NULL,'(509)3441-0340','','rjeune@voila.ht',4,NULL,NULL,2),(15,'Daniel','Bernadel',NULL,'dbernadel@voila.ht','','dbernadel@voila.ht',5,1,NULL,2),(16,'Chris L','Watness',NULL,'(509)3441-0667','','clwatness@voila.ht',6,1,NULL,2);
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment_spaces`
--

DROP TABLE IF EXISTS `equipment_spaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipment_spaces` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment_spaces`
--

LOCK TABLES `equipment_spaces` WRITE;
/*!40000 ALTER TABLE `equipment_spaces` DISABLE KEYS */;
INSERT INTO `equipment_spaces` VALUES (1,'Cabinet'),(2,'Equipment Room');
/*!40000 ALTER TABLE `equipment_spaces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `install_teams`
--

DROP TABLE IF EXISTS `install_teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `install_teams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `install_teams`
--

LOCK TABLES `install_teams` WRITE;
/*!40000 ALTER TABLE `install_teams` DISABLE KEYS */;
INSERT INTO `install_teams` VALUES (1,'HAICOM 20'),(2,'TIC Club'),(3,'HAICOM 57');
/*!40000 ALTER TABLE `install_teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `installation_states`
--

DROP TABLE IF EXISTS `installation_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `installation_states` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `installation_states`
--

LOCK TABLES `installation_states` WRITE;
/*!40000 ALTER TABLE `installation_states` DISABLE KEYS */;
INSERT INTO `installation_states` VALUES (1,'Install Need Identified'),(2,'Prerequisites Verified'),(3,'ISP Installation Complete'),(4,'Work Order Created'),(5,'Installation Scheduled/Team Assigned'),(6,'Team Pulls Equipment from Regional Hub'),(7,'Install in Progress'),(8,'Install Complete'),(9,'Spot-check by Inveneo'),(10,'School Accepted'),(11,'Site Complete'),(12,'Open Support Issue'),(13,'Third Tier Support From ICT IPs');
/*!40000 ALTER TABLE `installation_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `location` point NOT NULL,
  PRIMARY KEY (`id`),
  SPATIAL KEY `location` (`location`)
) ENGINE=MyISAM AUTO_INCREMENT=170 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (8,'\0\0\0\0\0\0\0\'É£‰’Ÿ2@ºW≠LÚQ¿'),(2,'\0\0\0\0\0\0\0ÿ\r€e3@âÔƒ¨R¿'),(12,'\0\0\0\0\0\0\0#k$]2@uÂ≥<:R¿'),(13,'\0\0\0\0\0\0\0∑]™ Î2@éòì;	R¿'),(15,'\0\0\0\0\0\0\0Èbg\nı2@$EdX≈R¿'),(16,'\0\0\0\0\0\0\0∞Áå(Ì2@–≥Yıπ\"R¿'),(17,'\0\0\0\0\0\0\0`ÕÇ9Z2@ƒZ|\nÄ%R¿'),(18,'\0\0\0\0\0\0\0õ8πﬂ°∏3@\nÙâ<IR¿'),(19,'\0\0\0\0\0\0\0ÖwπàÔ¥3@≤∫’R¿'),(20,'\0\0\0\0\0\0\0ºË+H33@`ù∫Ú-R¿'),(21,'\0\0\0\0\0\0\0\nø‘œõB3@…Yÿ”!R¿'),(22,'\0\0\0\0\0\0\0v28J^M3@…<Ú\'R¿'),(23,'\0\0\0\0\0\0\0m±&3@•⁄ß„1\'R¿'),(24,'\0\0\0\0\0\0\0‚í„NÈ 3@eﬂ¡ˇ\"R¿'),(25,'\0\0\0\0\0\0\0»$#ga3@4∫ÉÿôR¿'),(26,'\0\0\0\0\0\0\0Zd;ﬂO\r3@˝jÃR¿'),(27,'\0\0\0\0\0\0\0Õí\05µ,3@\np	R¿'),(28,'\0\0\0\0\0\0\0<1Î≈PV3@HƒîH¢R¿'),(29,'\0\0\0\0\0\0\0∞˛œaæ‘2@»Ôm˙≥˚Q¿'),(30,'\0\0\0\0\0\0\0‘‘≤µÊ2@{Ic¥éˆQ¿'),(31,'\0\0\0\0\0\0\05òÜ·#™3@3˘fõ#R¿'),(32,'\0\0\0\0\0\0\0æMˆ#%3@ÆG·z\0R¿'),(33,'\0\0\0\0\0\0\0Hm‚‰~3@!v¶–yR¿'),(34,'\0\0\0\0\0\0\0è™&à∫Á2@;ﬂOçóR¿'),(35,'\0\0\0\0\0\0\0¿x\r˝Î2@ß∆K7	R¿'),(36,'\0\0\0\0\0\0\0^hÆ”H”2@{⁄·Ø…R¿'),(37,'\0\0\0\0\0\0\0fffff3@wÑ”ÇR¿'),(38,'\0\0\0\0\0\0\0¥é™&à*3@,+MJAR¿'),(39,'\0\0\0\0\0\0\0øeNó≈D2@ªa€¢*R¿'),(40,'\0\0\0\0\0\0\0Î≈PN¥;2@ú·|~R¿'),(41,'\0\0\0\0\0\0\0¥´êÚìä2@◊˙\"°-%R¿'),(42,'\0\0\0\0\0\0\0∏ÃÈ≤òp2@¥Â\\ä´R¿'),(49,'\0\0\0\0\0\0\0CêÉfÇ2@ÑGG¨\'R¿'),(51,'\0\0\0\0\0\0\0uCäÖÂ2@≠ÊÅ˛R¿'),(52,'\0\0\0\0\0\0\0ƒ_ì5ÍÅ2@GZ*oGR¿'),(53,'\0\0\0\0\0\0\0Ûu˛”Ö2@3Ü9Aõ%R¿'),(54,'\0\0\0\0\0\0\0≥{Ú∞P”2@ÕÃÃÃÃR¿'),(55,'\0\0\0\0\0\0\0ÖBBµ2@m ﬁÂ\nR¿'),(56,'\0\0\0\0\0\0\0—\"€˘~B3@Lâ$z!R¿'),(57,'\0\0\0\0\0\0\0Ëü‡bEm2@)–\'Ú$3R¿'),(58,'\0\0\0\0\0\0\0M÷®áh¨3@∑zNzﬂ*R¿'),(59,'\0\0\0\0\0\0\0`ÕÇ9ä2@V-\"R¿'),(60,'\0\0\0\0\0\0\0Åõ:è*3@;≈™AR¿'),(61,'\0\0\0\0\0\0\0È&1¨$3@I∫fÚÕ\0R¿'),(62,'\0\0\0\0\0\0\0$÷‚S\0‹3@—ı-s0R¿'),(63,'\0\0\0\0\0\0\0AË,ı$22@~}cær$R¿'),(64,'\0\0\0\0\0\0\0ówJ˜2@ØÎÏÜR¿'),(169,'\0\0\0\0\0\0\0Îêõ·‹3@É4c—t0R¿'),(98,'\0\0\0\0\0\0\0ºtì÷2@Y›Í˚Q¿'),(99,'\0\0\0\0\0\0\0∫Jw◊ŸD2@àht±*R¿'),(100,'\0\0\0\0\0\0\0)ﬂ\\ëÇ2@áÅr(R¿'),(101,'\0\0\0\0\0\0\0Q†O‰IZ2@≥Ôä‡%R¿'),(120,'\0\0\0\0\0\0\0øHhÀπL3@Ãó`\'R¿'),(121,'\0\0\0\0\0\0\0cŸ=y 3@fk}ë–\"R¿'),(122,'\0\0\0\0\0\0\0Wï}W¥3@«F ^◊R¿'),(123,'\0\0\0\0\0\0\0‘+e‚∞3@ö|≥ÕçR¿'),(124,'\0\0\0\0\0\0\0jMÛéS<2@˝jÃR¿'),(125,'\0\0\0\0\0\0\0Û“o_3@ÃHø}R¿'),(126,'\0\0\0\0\0\0\0p‹µ∆ò,3@,îTøıR¿'),(127,'\0\0\0\0\0\0\0>p|äo’2@‚Ì9óøR¿'),(128,'\0\0\0\0\0\0\0∏ÖÎQp2@ç—:™öR¿'),(129,'\0\0\0\0\0\0\0Bã≈U3@lßµÇâR¿'),(130,'\0\0\0\0\0\0\0_)À«™3@ñ®©e#R¿'),(161,'\0\0\0\0\0\0\0÷nª–\\3@¶ÚvÑ”R¿'),(162,'\0\0\0\0\0\0\0ˆb(\'⁄%3@õèkC\'R¿'),(163,'\0\0\0\0\0\0\0oCŒÛé“2@ÄU&„µ\rR¿'),(164,'\0\0\0\0\0\0\0üÂypw3@hÆ”HK-R¿'),(165,'\0\0\0\0\0\0\0vOj\r3@∂€.4◊R¿'),(166,'\0\0\0\0\0\0\0°[ÿhsC2@∞ë˙≠R¿'),(167,'\0\0\0\0\0\0\0pÎnûÍ∏3@ Fè6R¿');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `network_links`
--

DROP TABLE IF EXISTS `network_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `network_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `radio_src_id` int(10) DEFAULT NULL,
  `radio_dest_id` int(10) DEFAULT NULL,
  `s1` varchar(20) DEFAULT NULL,
  `s2` varchar(20) DEFAULT NULL,
  `s3` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `network_links`
--

LOCK TABLES `network_links` WRITE;
/*!40000 ALTER TABLE `network_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `network_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `network_radios`
--

DROP TABLE IF EXISTS `network_radios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `network_radios` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `site_id` int(10) DEFAULT NULL,
  `network_switch_id` int(10) DEFAULT NULL,
  `radio_type_id` int(10) DEFAULT NULL,
  `antenna_type_id` int(10) DEFAULT NULL,
  `elevation` decimal(3,2) DEFAULT NULL,
  `min_height` int(10) DEFAULT NULL,
  `frequency` int(10) DEFAULT NULL,
  `ssid` varchar(255) DEFAULT NULL,
  `switch_port` int(10) DEFAULT NULL,
  `link_id` int(10) DEFAULT NULL,
  `radio_mode_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `network_radios`
--

LOCK TABLES `network_radios` WRITE;
/*!40000 ALTER TABLE `network_radios` DISABLE KEYS */;
INSERT INTO `network_radios` VALUES (9,'BAYCT-BELDR',NULL,2,NULL,5,1,NULL,NULL,4920,'',NULL,13,3),(11,'BAYCT-CBRIT',NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,37,NULL),(12,'BAYCT-HINCH',NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,53,NULL),(13,'BELDR-BAYCT',NULL,8,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,9,NULL),(14,'BELVU-BARO',NULL,12,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,9,NULL),(15,'BELVU-BERNA',NULL,12,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,24,NULL),(16,'BELVU-HDO386',NULL,12,NULL,1,2,NULL,NULL,4920,'',NULL,178,4),(17,'BELVU-GGOAV',NULL,12,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,41,NULL),(18,'BELVU-OBLEO',NULL,12,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,83,NULL),(19,'BCARE-BOSIO',NULL,13,NULL,1,1,NULL,NULL,4920,'',NULL,26,3),(20,'BAYCT-020',NULL,2,NULL,5,1,NULL,NULL,4920,'',NULL,NULL,3),(21,'BAYCT-140',NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,26,NULL),(24,'BERNA-BELVU',NULL,101,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,15,NULL),(25,'BERNA-JACML',NULL,101,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,58,NULL),(26,'BOSIO-BCARE',NULL,51,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,19,NULL),(27,'BOSIO-MIBAL',NULL,51,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,80,NULL),(28,'BOUTL-GRESS',NULL,52,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,43,NULL),(29,'BOUTL-SDH011',NULL,52,NULL,1,2,NULL,NULL,5375,'',NULL,191,4),(31,'BRACH-BELVU',NULL,53,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,16,NULL),(32,'BRACH-GRESS',NULL,53,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,44,NULL),(33,'BRACH-LEOGN',NULL,53,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,66,NULL),(34,'CARML-CBRIT',NULL,54,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,38,NULL),(35,'CARML-JANVI',NULL,54,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,62,NULL),(36,'CARML-MIBAL',NULL,54,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,81,NULL),(37,'CBRIT-BAYCT',NULL,55,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,11,NULL),(38,'CBRIT-CARML',NULL,55,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,34,NULL),(39,'CBRIT-SDH011',NULL,55,NULL,1,2,NULL,NULL,5580,'SDH011-CBRIT',NULL,193,2),(40,'DESAL-LESTR',NULL,56,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,67,NULL),(41,'GGOAV-BELVU',NULL,57,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,17,NULL),(42,'GMORN-HTPTN',NULL,58,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,56,NULL),(43,'GRESS-BOUTL',NULL,59,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,28,NULL),(44,'GRESS-BRACH',NULL,59,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,32,NULL),(45,'HILRE-HINCH',NULL,60,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,54,NULL),(46,'HILRE-JANVI',NULL,60,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,63,NULL),(47,'HILRE-LESTR',NULL,60,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,68,NULL),(48,'HILRE-MARML',NULL,60,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,74,NULL),(49,'HILRE-MASDE',NULL,60,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,79,NULL),(50,'HILRE-OBLEO',NULL,60,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,86,NULL),(51,'HILRE-PIGNO',NULL,60,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,88,NULL),(52,'HILRE-STMRC',NULL,60,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,93,NULL),(53,'HINCH-BAYCT',NULL,61,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,12,NULL),(54,'HINCH-HILRE',NULL,60,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,45,NULL),(55,'HINCH-MARML',NULL,61,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,75,NULL),(56,'HTPTN-GMORN',NULL,62,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,42,NULL),(57,'HTPTN-MARML',NULL,62,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,76,NULL),(58,'JACML-BERNA',NULL,63,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,25,NULL),(59,'JACML-MARIG',NULL,63,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,73,NULL),(60,'JACML-SDH011',NULL,63,NULL,1,2,NULL,NULL,5180,'SDH011-JACML',NULL,192,2),(61,'JACML-VERJN',NULL,63,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,95,NULL),(62,'JANVI-CARML',NULL,64,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,35,NULL),(63,'JANVI-HILRE',NULL,64,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,46,NULL),(64,'LASCB-BELDR',NULL,98,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,46,NULL),(65,'LAVLE-VERJN',NULL,99,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,96,NULL),(66,'LEOGN-HDO386',NULL,100,NULL,5,1,NULL,NULL,4920,'',NULL,180,4),(67,'LESTR-DESAL',NULL,120,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,40,NULL),(68,'LESTR-HILRE',NULL,120,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,47,NULL),(69,'LIANC-HILRE',NULL,121,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,47,NULL),(70,'LIMB2-LIMBE',NULL,122,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,71,NULL),(71,'LIMBE-LIMB2',NULL,123,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,70,NULL),(72,'LIMBE-VERTI',NULL,123,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,97,NULL),(73,'MARIG-JACML',NULL,125,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,59,NULL),(74,'MARML-HILRE',NULL,125,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,48,NULL),(75,'MARML-HINCH',NULL,125,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,55,NULL),(76,'MARML-HTPTN',NULL,125,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,57,NULL),(77,'MARML-PILAT',NULL,125,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,89,NULL),(78,'MARML-VERTI',NULL,125,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,98,NULL),(79,'MASDE-HILRE',NULL,126,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,49,NULL),(80,'MIBAL-BOSIO',NULL,127,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,27,NULL),(81,'MIBAL-CARML',NULL,127,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,36,NULL),(82,'MIBAL-SODO',NULL,127,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,92,NULL),(83,'OBLEO-BELVU',NULL,128,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,18,NULL),(84,'OBLEO-BOUTL',NULL,128,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,29,NULL),(85,'OBLEO-CBRIT',NULL,128,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,39,NULL),(86,'OBLEO-HILRE',NULL,128,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,50,NULL),(87,'OBLEO-JACML',NULL,128,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,60,NULL),(88,'PIGNO-HILRE',NULL,129,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,51,NULL),(89,'PILAT-MARML',NULL,130,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,77,NULL),(90,'PRIVA-HILRE',NULL,161,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,77,NULL),(91,'PSOND-HILRE',NULL,162,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,77,NULL),(92,'SODO-MIBAL',NULL,163,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,82,NULL),(93,'STMRC-HILRE',NULL,164,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,52,NULL),(94,'VERET-HILRE',NULL,165,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,52,NULL),(95,'VERJN-JACML',NULL,166,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,61,NULL),(96,'VERJN-LAVLE',NULL,166,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,65,NULL),(97,'VERTI-LIMBE',NULL,167,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,72,NULL),(98,'VERTI-MARML',NULL,167,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(99,'WFPL-HDO386',NULL,49,45,1,2,NULL,20,4920,'',1,179,2),(100,'WFPL-STCRX',NULL,49,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(101,'BOSIO-070',NULL,51,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(102,'BOSIO-150',NULL,51,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(103,'BOSIO-320',NULL,51,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(104,'BRACH-040',NULL,53,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(105,'BRACH-160',NULL,53,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(106,'BRACH-280',NULL,53,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(107,'DESAL-070',NULL,56,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(108,'DESAL-130',NULL,56,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(109,'DESAL-250',NULL,56,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(110,'GGOAV-120',NULL,57,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(111,'GGOAV-240',NULL,57,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(112,'GMORN-000',NULL,58,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(113,'GMORN-120',NULL,58,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(114,'GMORN-240',NULL,58,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(115,'GRESS-000',NULL,59,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(116,'GRESS-120',NULL,59,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(117,'GRESS-240',NULL,59,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(118,'HILRE-270',NULL,60,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(119,'HINCH-090',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(120,'HINCH-210',NULL,61,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(121,'HINCH-330',NULL,61,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(122,'JANVI-052',NULL,64,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(123,'JANVI-172',NULL,64,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(124,'JANVI-292',NULL,64,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(125,'LASCB-000',NULL,98,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(126,'LASCB-120',NULL,98,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(127,'LASCB-240',NULL,98,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(128,'LAVLE-000',NULL,99,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(129,'LAVLE-120',NULL,99,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(130,'LAVLE-240',NULL,99,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(131,'LEOGN-000',NULL,100,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(132,'LEOGN-120',NULL,100,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(133,'LEOGN-240',NULL,100,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(134,'LESTR-110',NULL,120,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(135,'LESTR-230',NULL,120,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(136,'LESTR-350',NULL,120,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(137,'LIANC-040',NULL,121,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(138,'LIANC-160',NULL,121,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(139,'LIANC-280',NULL,121,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(140,'LIMB2-020',NULL,122,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(141,'LIMB2-140',NULL,122,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(142,'LIMB2-260',NULL,122,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(143,'LIMBE-080',NULL,123,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(144,'LIMBE-200',NULL,123,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(145,'LIMBE-320',NULL,123,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(146,'MARIG-000',NULL,124,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(147,'MARIG-120',NULL,124,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(148,'MARIG-240',NULL,124,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(149,'MASDE-070',NULL,126,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(150,'MASDE-293',NULL,126,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(151,'MIBAL-050',NULL,127,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(152,'MIBAL-170',NULL,127,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(153,'MIBAL-290',NULL,127,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(154,'PIGNO-080',NULL,129,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(155,'PIGNO-200',NULL,129,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(156,'PIGNO-320',NULL,129,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(157,'PILAT-000',NULL,130,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(158,'PILAT-120',NULL,130,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(159,'PILAT-240',NULL,130,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(160,'PRIVA-060',NULL,161,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(161,'PRIVA-200',NULL,161,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(162,'PRIVA-290',NULL,161,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(163,'PSOND-100',NULL,162,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(164,'PSOND-340',NULL,162,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(165,'SODO-095',NULL,163,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(166,'SODO-185',NULL,163,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(167,'STMRC-032',NULL,164,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(168,'VERET-020',NULL,165,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(169,'VERET-140',NULL,165,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(170,'VERET-260',NULL,165,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(171,'VERJN-000',NULL,166,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(172,'VERJN-120',NULL,166,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(173,'VERJN-240',NULL,166,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(174,'WFPL-090',NULL,49,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(175,'WFPL-270',NULL,49,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(176,'FOO1Radio1',NULL,169,NULL,2,4,NULL,NULL,4500,'',NULL,78,NULL),(177,'HDO386-BOUTL',NULL,41,46,1,2,2.00,20,5700,'BOUTL-HDO386',1,186,2),(178,'HDO386-BELVU',NULL,41,46,1,2,2.00,20,5260,'BELVU-HDO386',2,16,2),(179,'HDO386-WFPL',NULL,41,46,1,2,0.00,25,5660,'HDO386-WFPL',3,99,4),(180,'HDO386-LEOGN',NULL,41,46,1,2,0.00,25,5600,'HDO386-LEOGN',4,66,4),(181,'FOO1',NULL,2,NULL,3,1,NULL,NULL,NULL,'',NULL,78,NULL),(186,'BOUTL-HDO386',NULL,52,NULL,1,2,-2.00,20,4920,'BOUTL-HDO386',NULL,177,3),(187,'HDO386-000',NULL,41,46,1,1,0.00,35,5500,'HDO386-000',5,NULL,4),(188,'HDO386-120',NULL,41,46,1,1,0.00,35,5540,'HDO386-120',6,NULL,4),(189,'HDO386-240',NULL,41,46,1,1,0.00,35,5320,'HDO386-240',7,NULL,4),(190,'BOUTL-DLPCH',NULL,52,48,1,3,NULL,25,5200,'BOUTL-DLPCH',1,195,3),(191,'SDH011-BOUTL',NULL,42,49,1,2,NULL,20,5375,'BOUTL-SDH011',1,29,2),(192,'SDH011-JACML',NULL,42,49,1,2,NULL,30,5180,'SDH011-JACML',3,60,4),(193,'SDH011-CBRIT',NULL,42,49,1,2,NULL,20,5580,'SDH011-CBRIT',5,39,4),(194,'DLPCH-SDH010','',16,50,1,2,-1.00,15,5700,'DLPCH-SDH010',2,196,4),(195,'DLPCH-BOUTL',NULL,16,50,1,3,-1.00,15,5550,'BOUTL-DLPCH',1,190,4),(196,'SDH010-DLPCH',NULL,38,NULL,1,2,NULL,NULL,NULL,NULL,NULL,194,NULL);
/*!40000 ALTER TABLE `network_radios` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER network_radio_insert
BEFORE INSERT ON network_radios
FOR EACH ROW
BEGIN
	
	
	
	
	
	
	 
	SELECT SUBSTRING_INDEX(NEW.name,'-',-1) INTO @dest;
	
	SELECT SUBSTRING_INDEX(NEW.name,'-',+1) INTO @src;
	
	SELECT CONCAT(@dest, '-', @src) INTO @dest_name;

	
	SELECT id INTO @dest_radio_id
	FROM network_radios
	WHERE name = @dest_name;
	
	IF ( @dest_radio_id > 0 ) THEN
		SET NEW.link_id = @dest_radio_id;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER network_radio_update
BEFORE UPDATE ON network_radios
FOR EACH ROW
BEGIN
	
	SELECT SUBSTRING_INDEX(NEW.name,'-',-1) INTO @dest;
	SELECT SUBSTRING_INDEX(NEW.name,'-',+1) INTO @src;
	SELECT CONCAT(@dest, '-', @src) INTO @dest_name;
	
	
	SELECT id INTO @dest_radio_id
	FROM network_radios
	WHERE name = @dest_name;
	
	IF ( @dest_radio_id > 0 ) THEN
		SET NEW.link_id = @dest_radio_id;
	ELSE
		SET NEW.link_id = NULL;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `network_routers`
--

DROP TABLE IF EXISTS `network_routers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `network_routers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `router_type_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `network_routers`
--

LOCK TABLES `network_routers` WRITE;
/*!40000 ALTER TABLE `network_routers` DISABLE KEYS */;
INSERT INTO `network_routers` VALUES (2,'HDO386',NULL,1),(4,'BOUTL',NULL,NULL),(5,'SDH011',NULL,NULL),(6,'DLPCH',NULL,NULL);
/*!40000 ALTER TABLE `network_routers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `network_switches`
--

DROP TABLE IF EXISTS `network_switches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `network_switches` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `switch_type_id` int(10) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `network_switches`
--

LOCK TABLES `network_switches` WRITE;
/*!40000 ALTER TABLE `network_switches` DISABLE KEYS */;
INSERT INTO `network_switches` VALUES (10,'BAYCT-SW',NULL,1),(11,'BCARE-SW',NULL,1),(13,'BELVU-SW',NULL,1),(14,'BERNA-SW',NULL,1),(49,'SDH011-SW',NULL,1),(16,'BRACH-SW',NULL,1),(17,'CARML-SW',NULL,1),(18,'DESAL-SW',NULL,1),(19,'GGOAV-SW',NULL,1),(20,'GMORN-SW',NULL,1),(21,'GRESS-SW',NULL,1),(22,'HILRE-SW',NULL,1),(23,'HINCH-SW',NULL,1),(24,'HTPTN-SW',NULL,1),(25,'JACML-SW',NULL,1),(26,'JANVI-SW',NULL,1),(27,'LASCB-SW',NULL,1),(28,'LAVLE-SW',NULL,1),(29,'LEOGN-SW',NULL,1),(30,'LESTR-SW',NULL,1),(31,'LIANC-SW',NULL,1),(32,'LIMB2-SW',NULL,1),(33,'LIMBE-SW',NULL,1),(34,'MARIG-SW',NULL,1),(35,'MARML-SW',NULL,1),(36,'MIBAL-SW',NULL,1),(37,'PILAT-SW',NULL,1),(38,'PRIVA-SW',NULL,1),(39,'PSOND-SW',NULL,1),(40,'SODO-SW',NULL,1),(41,'STMRC-SW',NULL,1),(42,'VERET-SW',NULL,1),(43,'VERJN-SW',NULL,1),(44,'VERTI-SW',NULL,1),(45,'WFPL-SW',NULL,1),(46,'HDO386-SW',NULL,1),(48,'BOUTL-SW',NULL,6),(50,'DLPCH-SW',NULL,1);
/*!40000 ALTER TABLE `network_switches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `power_types`
--

DROP TABLE IF EXISTS `power_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `power_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `volts` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `power_types`
--

LOCK TABLES `power_types` WRITE;
/*!40000 ALTER TABLE `power_types` DISABLE KEYS */;
INSERT INTO `power_types` VALUES (6,'Other',0),(2,'Solar',0),(3,'120VAC',120),(4,'220VAC',220),(5,'-48VDC',-48),(7,'+24VDC',24);
/*!40000 ALTER TABLE `power_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'Haiti (HRBN)'),(2,'Project Foo (Testing)');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_users`
--

DROP TABLE IF EXISTS `projects_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_users` (
  `user_id` int(10) NOT NULL,
  `project_id` int(10) NOT NULL,
  PRIMARY KEY (`user_id`,`project_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_users`
--

LOCK TABLES `projects_users` WRITE;
/*!40000 ALTER TABLE `projects_users` DISABLE KEYS */;
INSERT INTO `projects_users` VALUES (1,1),(3,1),(8,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1);
/*!40000 ALTER TABLE `projects_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radio_modes`
--

DROP TABLE IF EXISTS `radio_modes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radio_modes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radio_modes`
--

LOCK TABLES `radio_modes` WRITE;
/*!40000 ALTER TABLE `radio_modes` DISABLE KEYS */;
INSERT INTO `radio_modes` VALUES (2,'Station WDS'),(4,'Access Point WDS');
/*!40000 ALTER TABLE `radio_modes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radio_types`
--

DROP TABLE IF EXISTS `radio_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radio_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radio_types`
--

LOCK TABLES `radio_types` WRITE;
/*!40000 ALTER TABLE `radio_types` DISABLE KEYS */;
INSERT INTO `radio_types` VALUES (1,'RocketM5'),(2,'NanoBridgeM5'),(3,'NanoStationM5'),(4,'NanoStationM2'),(5,'NanoBridgeM2'),(6,'RocketM2'),(7,'RocketM5 Titanium'),(8,'RocketM2 Titanium');
/*!40000 ALTER TABLE `radio_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radios_radios`
--

DROP TABLE IF EXISTS `radios_radios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radios_radios` (
  `src_radio_id` int(10) NOT NULL,
  `dest_radio_id` int(10) NOT NULL,
  PRIMARY KEY (`src_radio_id`,`dest_radio_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radios_radios`
--

LOCK TABLES `radios_radios` WRITE;
/*!40000 ALTER TABLE `radios_radios` DISABLE KEYS */;
/*!40000 ALTER TABLE `radios_radios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `rolealias` varchar(50) DEFAULT 'edit',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','admin'),(2,'View Only User','view'),(11,'Editor','edit');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `router_types`
--

DROP TABLE IF EXISTS `router_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `router_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `manufacturer` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `router_types`
--

LOCK TABLES `router_types` WRITE;
/*!40000 ALTER TABLE `router_types` DISABLE KEYS */;
INSERT INTO `router_types` VALUES (1,'Mikrotik RB750GL','Mikrotik','RB750GL'),(2,'Mikrotik RB750G','Mikrotik','RB750G'),(3,'Mikrotik RB493AH','Mikrotik','RB493AH');
/*!40000 ALTER TABLE `router_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_states`
--

DROP TABLE IF EXISTS `site_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_states` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sequence` int(10) DEFAULT NULL,
  `img_name` varchar(255) DEFAULT NULL,
  `img_type` varchar(255) DEFAULT NULL,
  `img_size` varchar(255) DEFAULT NULL,
  `img_data` mediumblob,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_states`
--

LOCK TABLES `site_states` WRITE;
/*!40000 ALTER TABLE `site_states` DISABLE KEYS */;
INSERT INTO `site_states` VALUES (20,'Decommissioned',7,'tower-r.png','image/png','1945','âPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0%\0\0\0#∑ÎG\0\0`IDATXÖµó}lSÂ«?˜≠˜ˆeÎË:pCó¡ ˚â¸BêåH–°”DLFÇæ\Z—5∆»–ƒ®¸∑ƒ‘ÑMçòò`\"∆òòŒÖëêÖòelS	 `CEÎ⁄ÆΩ˜∂Ω◊?z[∫≠ñ‡INÓmü˚úÔÁyŒyn{€∂hiiëp9Wô[k¿L¿\ná√\0¡∂Ìº∏–w9\0‚-∑\0–7√·pFÖByqPÈ\\5˛õ–Å$sÆf~ïö#æ∞´ªªÔœ∞ŒPhùskô‚≠˜tuw˜5‘◊„Òx–4Ìñ\nÎ∫N2ô§´ªªØ3˙?N\ZäO¯|hnw… V6K6ù&möàíÑëH  2≤¢ê…d®»f2HÚ‹Ïi^/àÖí ◊ô(ìÀuﬁ—|æ9ìm€&≠Î§b1“¢H6@®©¡∆µj¢◊ãqÏ)Qƒex´´QTu.ƒµÿÕ<Íµj/AüI•àG£ò55h<Ä´∂◊Í’Hµµ(ÀñaÙı·}Ï1Ã·aíüN‚∑ﬂ.[ÜÍı\"àeíò\'ôií4cÂF<Œ’—Qhh†Ú˘Áq∑∂b\'ì ÀΩΩLÒû∂6dø◊ö5¯vÌ\"“ﬁŒï˛~µµxÉ¡r\0≥V^ºé€Ç@ÙØøêöõ©˛‰º€∑ì>{ñËõoÚœ⁄µLÏﬁMzxòâ;∏ºq#˙è?bÎ:5Gè‚Ÿ≤Ö…±1L]üÛ∆\0äRD$B⁄∂©⁄∑µπôÿá2æy3∆…ì¯û~ö⁄”ßqoŸÇzœ=x∂mcb«¢ØΩÜçRı˛˚Hw›≈’∞%ÈZ‹ŸÎ-ó€≤à_∫ÑwÁN‘uÎà<H‚‡Aº€∂·˝uès`\0yÒbºÔΩGÊ‚Eîï+ô|·êeÇá¯Ë#.o⁄DZ◊qUTîL¡\\\0gõÃ…I≤¶I≈sœëπxëÿ;Ô -ZÑˇ≠∑∞¢Q¢ØºÇ˛˝˜π)ççT:D≈3œê!æ?©Ì€q∑¥†¨XArb◊Ç% ¶¿H$p57#/]JÍ€o…˛ÒﬁßûBæ˝vbÔæKˆÔø©7Í\r±∫ö»„èì>wéäó^B˚I|¸1\0ÓáBüò(õÇπ\0CC04Dzl◊ö5≤L˙◊_º^<mmËΩΩ$ø¸ﬂO¶>¯ÄÏÿÒêÎÍPõõ1˚˚P◊Ø\'è‚ﬁ¿1€∂=\0≤WÆ x<HÅ\0ôÛÁs+km-<Î∫˚n‰∆F2##\0Huud#lÀB–4Ú?˘•¨,Ä$Id/_Œ›ﬂqV,F6A^æ¡ÎÂÍÓ›Ög#;wb≈bh˜ﬂü˛ÛO§`A±\"Aò?Ä¢(?˝Ävﬂ}`ò\'N†›{/,YÇﬁ”C:ùŒ=ª|9V4äß≠çÙ0∆©S∏VØ¿8yπƒ˘œ[ŸUU…ú9C˙¸y‘\r, ˛Ÿg§1Q∑nEør•Æé ={òz˚mb{˜BUÇ¶QÒ‚ãX…$˙â∏K¸.îﬂIIB—4$Yf˙a§@ÄÍ#G»ˆÙ ˙)ñm„€µãä∫:\0YfZH˜Ro/ûˆv¥\r–√a≤ó.·ˆzqoPÙ&Ù9«)s·ôﬂGíetA@¥m¸--\0d\"¶¶¶ÓﬂèaàSS«èc[â√áqÈ:≤€=èc®™˜-\\à8=MºΩù¯´Ø\"k\Z©hWk+¢(2™(ú©©a|Ô^jû}\0óﬂO˙ó_Hut†ˇÅ@Ó4Â„Œ≤π5PÙê§™‘45°»2æ¶&UÂÏ©S‘ut‰ËESíX≤vmnÇ êJ$66‚\Z\"ÿ–ÄVUu›Sp]\0†«BQU&&&ê-ﬂÉPo,GZ∏\0ˇæ}LΩÒıÎ◊‡πÌ∂≤¬yõõM+Î…sÁê6n,¨H◊uƒ J√»ÏŸ@:õ-ßÄU¯∆Ì.Èñ,wª©?zîd2…Ö+˜˚9ÁvÛèﬂO¸¿\0Ñ•KôéD ∆)2r)»9∫i¢˘˝sI›n*ÖÀﬂ|ÉŸ—ÅëJ±tÛføü…”ßô|˘e≤##T>˘$ûææŸbπõö ﬂ4eÆµK:@2UE´™ö1Ÿ2M2öF]O-‚õ6∆Î÷!ÉX«è#¯|L\'T9o¬Çx4öãÌ|t4-!\nπ\0P≈u\ZìÜñMM•ÜÊÿ’≥g\ráKé9ç…8˘–…µK8MCqk&tÖ√\'Qwﬁy}Ò3g\ráÈÖ÷;_ÂÎkvk¶÷Õ4ßÖˇ]››˝\r?L`Â “‚?ˇÃË±ctÜBkòY[Âõ”¥Á˘kq˚6–∞u+ÅU´fä2˙ı◊tÜB´ùUÊÛ\\P∫=øû9`\Zπ:Ò9É\rè<B¿)¥´å~ıù°–*G<·∏û*g7(·ÎÍÓhxÙQ\0Fè…Ø<¡<ƒo\Z†D•—‰sû W\\7->/ÄY«]ŒêInÎìÛü7@Dæ(ÛG5ƒÃ˘à¸ï≠JŸ^{\0\0\0\0IENDÆB`Ç'),(23,'Ready for Decomissioning',NULL,'wifi (1).png','image/png','2021','âPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0%\0\0\0#∑ÎG\0\0¨IDATXÖµóylT◊∆Ûﬁõ7´gºÖ	6`cÉY\r#≥/„î≈•àö\"E	I”H“øZ‘R—¢&äD\Z\Z%U⁄4j”6à,L±(q¬Êò›ºb„1Ò2ˆÃxˆ◊?f±çg0HÙHGwÙﬁΩÁ˚Ó9ﬂ}wéJQ\0äãã%@\0‰(ÒhÕ/,//˜®EâÄÀÄ6ÏròÄà¿Éa^¿voyyπ_eµZ#‡z¿µ¸2‡\\@_xÙFv©\rÉè±U‰û~ƒ¿√Ãb≠+\nˇ˛°©◊€*rOO“gc\rËE›#vpú‘Wp⁄b≠õA∏CÖß0…	Ë•ÿ‡A%à/‡√!>7¢J@-™Ò¸$ÈÃ¯É$A±6A2 ˙ÖP‚u&HÑjqåZ˝à≈ä¢‡Ò{È˜8@£êê.c~\\K√ï^≤Á¶£5™©¸¨¸¯˚uf4í<\"éQä∆ébFÑUª(çæ€Á¡Ó≥ìê©aﬁ™lR”LLö3ñ‘¥“\'•pÌõVûx6üÜÀ6é∏H„≠2S∆°ìµ™∏Ià0˛TR\r€π√Ì¢≠´KÆô\r;Ê≥`›d<.¢Z‡‚…&˛˚ÒEñnöÜ¡¨aÚ‹4÷nù√Ø7˛ã∫™v,ÜTíåÊx¢©fC3∞ı›eÚ¢4^˙]1Ÿ3,\\?◊FÈ´8¸Æ>Ö´r®<\\KW{?€øÜYK2ÿs‰iﬁ˝ÈQN˝Û*zùΩ&æ†Gê‰Awª∫™Él}√J^·8˛˛ÊW¸ı7ßH\Zc‡˚/∞ÍπŸ\\©l°ÊL+¢$∞wÀAñ?=ù˜ZŸ˛ﬁjöÆw“z„yôYqK£B4˝∂Ón÷¸8üi∆s¯Á8¸˛9V¸p:œÏZäVß¶æ∫É‘t€ﬁ]ç≠ŸŒƒˆ˝§Qÿ˘∑çº˛~	Ø-;Ä«Ô√†ãùÖ%i†œ·¬ß¯Yøm>∂Ê^>}´í‰«ç<øgé7˚_-„Li\0i9…Ï¸xÎ^ûG€Õn˛˝Œ7oô≈ºÔÂê1ı1z:ÏòFû.àÒ≠ódIq∫]‰¶ìñùDÂ·Z:[ÏîºX¿c„Ã¸„≠J∫⁄˚9°ÏÊÑ≤s™ûﬂn˛å∂˙.ûzΩC¢ñœ?8@QI.vá#\ZwT\rÁÔ“p˛.-ΩLûõÜ(â4◊t¢5 ,Ÿ8ïã\'©¯‰2´ûõ]ÛÍ˛µÿöz9¥ˇ,©È&Ú\n”πQ’¿åE8Óh‹Q	DLAA£W–”ÈD´WcJ—”ﬁ–¿Çuì£ss“HÀI¶Ìf7\0)i	ÿøsëµ\nJ<ò¯DïHwá\0À3Œ>ˆªN∆Â¶†5 ºΩıHtÓﬁg‚ÍÛ0{E\0wo˜aN’#àˆÔ\\®P≈ƒ∏/5jjœµ0sI&>∑üKßöôπ8É¥úD™+\Z¢s«Á¶‚Ëu≥t”T\Z.Ÿ®9sõ‹9c∏RŸåtüõ=ÓçJCsÕ⁄ouìø,ìÑde©¶æ∫Éó€xbK>éûåI:6ˇ|vù‡√üïcL’ k%6ΩVÑ€ÈÂ‚©&4h<Ç®BUh$ë≤è™1•ËŸıÈS\\(k‚¯€◊¨y~∆§–Ÿ’\"ŸÕÈCı\\>rÎÊ‰/üH’Ò[tµ˜£ı—∏£êd!ÍfŸƒÁTqß°á÷∫.DAƒßˆ\" P∞<ÄæÆ–˝∫cﬂZ<äWèèÍçÉ\nG?™∆ﬂ£†’»—ò£ñ@≠|î*\'—ÿ€¬Óµi¨ªÉQ6‡∏Xæa&\0ÀTø¢ü~^ŸY¬oX˘ï/H–hº⁄ æ-eú;vì4Ω≠ZF•\nÔﬁ1*Å¡èÖ\Zë,y\ZáL÷ò	h$ô≥∑/∞˛Â¬p˙ºxõïÄJP·:…HNß˘À^∆õ∆b“¡cÿ}	ÑHË¢„ß\r	âÇ‚l\0N(ªÈ±9H≤xaœJ˛¥≥ÇÇúi°Í„GlDQdΩ◊m∂nÆ…6ﬂ`\ZT¯Ê_,  ˙„∆àóÅ`‰Å&∆$\0ø?ÄG?¿/?Ÿõˆ5}x†¥l€∑ö\'∑œgln\"›˝v≤íå£m>!‡‚(ò\r#Àà$´9[Qœõ?˙éÄìïÛ1Íu‘÷7Ûﬁé£t‘ŸY˝l7J;ëı#/ª3™¿(¶ƒ`ª‰ËÛ:PÎDç	√˚|~mê™?∑b#≥¶†(˙nV~â).kBgêpzô2%cÿ˙^G?}ﬁ(w3®≤Z≠2`πOc≤|˛\\&eLàùÃ{¨æπÖìg´bæ7&ù@/‡àd¿M®]\"‹4mÕÄì|-©r≥2Fju\rÕú<[Ö≈Z∑0¸(¢Ø{[37|êÊ4˙ﬁVë˚ÌÍïE‰M å	~Ωæâ≤/Nc±÷0\\[Òõ”Q⁄Û»8¥}ªP≤j!”¶L~≠∂ë“c_c±÷ÕÔ2RÁ°b∑Á˜≥01-!ù√$.˝†d1”ßÜÓˇ´5\r)˝\nãµnV‹vw(ûçJ 	£≠\"˜¬ìÎó\0pËóëù;x&ÉÑ)L‚[ Rs!q=0¯C∏áÑ>Ïë‘K(ıÆáhCHDD9™ë#Ê}pÄˇLgˇ[&ç¸\0\0\0\0IENDÆB`Ç'),(18,'Deactivated',5,'tower-y.png','image/png','1873','âPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0%\0\0\0#∑ÎG\0\0IDATXÖµó€oW«?;∑ùŸª◊^ßµ„ds±Í:i⁄»äB⁄§BÕFjÄó6<V¿‚uˇdÒäƒC@ÇáRƒ äÏ\0AjU‘D!ilÀNºv|øÌ’sŸπÒ∞;\'ﬁul)¸§£3ª3sæüﬂÔ¸Œ9Û˘æ¿ï+W$@\0îf/ÒrÕ<†x„„„@»˜˝@\\‘fSö\0¬K˜ö\0u¿l∂˙¯¯∏ ÂrÅxH4{ïˇOL@*Õæx©6≈{GGo˛˚%?c˘|ÓBÛ“úP.óã5≈”££7Ôg≥\"U_™∞i∫Ë∫K°†ìœÁﬁ\0∂Ä ŒƒS\"Um}œÛq]€vÀ≤Ñí$‚8.Ò∏ÜÎzà‚Ó‘iåÈ–à|+œâ∆\\\rUUwΩÏ˚>∂Ì`Ü!P*%0Õ—ËïJ◊\r”ﬂábQ&ë∞âF5dy∑;kiˇÏ@ﬁ˝¢„ÿîÀu÷÷lnû∆4ST´G1ÕÜ—K*5√““‚Ò˙˚?#€†ßßõpX!\nµçf†Ÿ&÷OˇÚ}À2Ÿ⁄⁄§T 0?ôıı∑Ñ:æ/íNO“◊˜9´´#ÿvÑJ%À¬¬%Œû˝%é3G&ì \ZçuË‡Ó3\0≈bÖµµLOüjı0…‰,áˇãÓÓáHí¡∆∆iz{Ô¢™%&&ÆQ,rÁŒO8uÍwH“mdYCQ¬PZWµ⁄&Ü·33sïr˘«é˝ç„«ˇBΩû`a·]ﬂ°´ködÚ1æ/pÊÃØX^>«ÙÙ˜¯Í´—¥%$iÉCá≤ß¢c|ﬂßZ›biÈ\"•“I˛…¿¿-VWœÒË—wp]ÖdrÀJ15ı™∫I≠÷œ«¯æ»É11ÒŒù˚9∂Ì†(⁄¡\0Íı\Z∂Ì2?ˇ™∫I6{ÀJ0=˝]dYghË˜d2ˇ@◊3‹øˇ_\'Y\'õcy˘klnû¢VÎC◊´(Jº-@õΩ^,À§R9ÜadËÌΩã¶m±∏¯.ñ’E6{Ép∏ƒÿÿu∆∆ÆSØ«9sÊ:ö∂∆‹‹l[„·[\0¨Øü¡4k≠q˜p∏çmœS.gÒ}ëht«	≥≤2BW◊$}}ˇaqÒù÷◊–¥Mé˘ñï¢\\>F29@©4àÎ÷Z„Ó†aæÆ€ Vî\nÆ´‡8Q\"ëç¶go∂û≠Vè¢Î\"ë5\0,+Ö,Wœìiû¯m≠#Ä(ÜáÀ\0òf7íd ÀU∂∑·8aNù˙mÎŸ”ßç(ölm\r†™El;»rïŒ{—\0≤…‰,\0≈‚ ¢Ë–›=E©4H•“Mw˜∂m†Îáêeù’’‚Ò\'$ìè©Té\0–’5ÛtømcoÖ√!b±e4mù≠≠!l;¬´Ø~N29O4∫Ã£GgÒ˝êavˆõú<˘gÜáˇÄaƒ<ôππÇ`—’5E∏Û>‘.\" \"À¢˝˝ü‚8QÓ›˚1}}√˜}/¢(\0|_§ZÈÔøÀâ˜X^>O±8DOœC¬·ö&∂∆›Ä“j±ò¬¿¿-4mùhtQ0MA\0]?›¿´îÀe¶ß?¿≤|¢QÉtzËÔˇîx‹@í¬tZÜm¶‡Èqã)loó∏tÈH“\ní§`.KK√Ç@.˜C™Uòú<«∆∆èÄèQçx|â∑ﬂ˛\rë»í…Ç A&÷ˆ äê…(»≤Äm˜\"ÀSS¨¨\\nÑOÄzb±a e˝Ü·—”ìf``√H°™⁄^GÚﬁ\0–X\rAøππç$Aπ¸°åç]Gñ+ÿvÄôô´˛ë#GNâ¥ﬂˇwZõàtl∫æ ‚‚âñG¶i‚∫\Zñe0;˚-\0l[‹cúˆûÿmûÁP≠Fx¸¯ßË∫Œ≈ã?£ßgÀEÅ……yÚ‰=*ïC$UR©Æ9Ô\0ŒéÜi˙®jt◊”Ç\0öítõ˜ﬂˇ√pyÂïÛ»rÑbqö◊_ˇÑtzÉ’’ºˆ⁄J[GLs;∏liJ<-óL\0]Ø\Z™˙ÏßîÁŸÑBqÆ][g~æó°°ë÷Ωt˙-$©õDbAà≤ΩΩM*5Ùúx≠9v„gS”Âr9à)ˆ(L≤ŸÛ§”G€›⁄e[[s\n_¥Ω◊,L÷ÄP\"`“(óÇ¢agi&\0åéﬁ¸d“È„/L°˘|.8ØÉ¸zæ43o?≈iÎ~tÙÊóŸÏe“È¡‚”\n\'üœçlnu.N_Pû}\0Ωy7õ˝ÈÙ–s‚ì\n7»Ásgõ^Ûº†}yæó5¡T\ZykB‹ÀføM:=‹H°WÚ˘‹õMÒZ≥ôÅP\'{!@àX#W(˛x^„\0‚˚hëhB|	s^£ë\\˚?¿s¡æ\ZúØu\Z°◊\"~`ÄARK5XbıÉà¸G∑ÿ{ã∆\0\0\0\0IENDÆB`Ç'),(16,'Power Complete',2,'tower-o.png','image/png','1983','âPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0%\0\0\0#∑ÎG\0\0ÜIDATXÖµó{lïı«?ÔÌú˜‹{;ß–ñ[•’*π*Ã1–√\0E2ÑπÖ0„Õå»0Yì±dfq®ô›a»èÈ¬ñÖ≈E\\`mI`0ÖU∂µÅñ”=˜˜ú˜úÛÓès°•=î&ÏIûº˜ﬂ˜Û{ûÁóﬂ˚Üa\0∞lŸ2SÊ(sg-§Ä8êjllL\0Üad≈MÄöqS@ºC‚©@–2ollL^Ø7+núô£ ˇ\'\Zôc<;K5#Ó©Îi:qáÖáYΩ«ª0söCCo≠Îi:1µ ç’f¬b5›Q·h$N$ßÆ≠ÈDΩ«[K&\rCO∞:≠y≈S©	]GèÎH¢à’ê$IQHÍ	Ö.íâ$í,ç¯÷‚êA e5[g¢L:◊Y«b∑é¯ÿ0ÙXåH0D√·Frπâvú≈Z9üîj#x|\Zf‰D{Aäy‰$,ˆ@N3{\'WÌÇ4í^◊4Ç˛ 	«DúÛó£óa≠öÉRRÜZ^EË´S¸˝ßàvú°ˇ_Ô∫ÿÅgÍdL¢òw!âYíõnﬂ∏eZ(Dˇ’´»•ïx÷l∆µËqR±(Ç$¸‚\r{(Xº…Ê¬z˜<J€H«o÷“€zö¬R7ˆ¬¬|\0πP7i@2…†œáz˜Éî?ˇ;,ïµÑ/|NﬂÅwúj 	‡\\∞Ç¡c¢˜w1È•ÿg.¶Ú∑˚π≤cü˛≈j√lô÷º\0Ç¨‰ŒÉΩΩË)ë)œæÜÌû\\˚˚tÔyπ–É{’Û≠xöŸcÑ[NÇ$”˘˙\nó˛ò≤çØS±i—Œ.∑3±Ê>Ñ<©»õ√0¯|Ø|˚}ãË›ˇ6Ω˚wQ¯èò∏·D’J¥Ì4JI9õ∂˜]¬RYÀÂ∑^@êd¶n˝+ì∂Ï¢ÌÂ%ƒcqÃ6˚¯R¯IÍ	‹?xë∏Ô◊ˆæâR4Å≤ün#∫ŒÂ∑N‡‰«\0òÀ¶3eÎ‹èˇåÿ’vzﬁˇEﬁ\r8Á/Gùr/ëÎ◊1;FAR$ÖX(Ñ≠fÊ≤ª<˛!zœ∑?ˆ&wæΩo¢˜w1Á∞¡ú√≤´ÑŒmÎ—Æ∂·Y˜2í≠Äﬁªp-\\E‘=7Óò\0âãÕ$.6Û}ãµzÇ$£u∂ ™v\nØMW~”ﬂ(^˛tÓõIõw˜u“˚¡NL%ÂXk˘˙\0ˆës„é	ê5√0’tıÍÉ=à™ŸYL¨ªÄÇE´sÔZ´Áb.õN¨´\0•∏åÑø#ïB0©d∑¸—,/Ä$	Ë◊\00y&ìH¯{1WT#™v.˝~cÓ›Œ7~B2¿1˚·4pÔdW	Ç(í˜!¬¯E!r·3\0Ï3cË\Z°/è‚®˝.RÈ4ÇˇmB◊u\0Ã’$CÉ.^G¥„·ñìX´Á\0>wYŒˇ[ëwœ7õe.µÎ˙«˝KêEÙzèh{3·ˆØp.yíË@Ji9÷ˇíÓøºB◊;ø@¥!òT<k∑ê“¬ø¯Û(˚B˛ààäŸå$âÙ|ŸYÃ¥_Ô%⁄‹Äﬁ∞ãT2E… gpññÈïâôü‹OÚlEè¨«qˇRß\Z–˚ª∞X’‹∏c»¶ú€]zÏ&÷›AÏJ+í$£È2¢%, >ÿáﬂÔgÚÊ∑à≈tà¯	6ÇëJ—w]‰DYµ‹w,\0A1Á‹QRå†∏˙Í\Z∫ˇ¥Y5çÑq,zQ9µT‡∏◊MÁÓ:&?˘B:u;ZÁ9z∂?K‡≥C8\núH™%7Êà˘éê{®@ie%ä9Ö≠≤≈l‚¸ŒQÛƒ¶4ΩÒ8îœ| Û±H4≈=eÚ•œqOöà’ÈºÂ*YÑä:¸2s≠(*}›É»2.X¿ú√˙uJa)\0eœl£ÎœøbÍ‹y\0ÿJ,yÖ≥62&K^è¯.¢Œ^íõë¶iH6\'±XÄ	Î∑êH\Zy«»Å‘PÄ—,ïHå9X¯⁄>\"ë6Œﬂyb10´/n«≥Ê%‰â’Ñ(öV<÷‰SYÄƒG”X\\éoKfp	\\˘d?‹H$î§˙ë•òÏ˙.úÂ ŒÕƒª⁄pØ|\n˘Î#Êëâ˙ÉŸ”ú¶ÃçvI¢†®X\n\\√quùÑa«u·üÿ ®}Ù°‹3˜¨Q\nJâü9ådqç(æg÷pÒAzÏ¥iÕî‡ızMÄ(‡ç…Ù•ﬂ£§ÍÆ—Éyìıµ}C˚ë££>À4&=¿  F@#›.ëi\ZÜ∂f\"@›ë¶„»2ÓÍÍ[ä˜∂∂“~‰(ıÔw2∑≤ıusk¶©€iNsˇu=Mß´V¨ƒ]S3∫¯˘Û¥:HΩ«;ó·µïø9£=œá∂oÕU´V„æw∆pÒñs¥}¸ıÔÏÃ,≥y\n0z{~+ÀÄ©§ÎƒûÅ¯≤zı∏g‘¶≈œù•ı£}‘{º≥2‚°åkY°|6&@{]OSsıö–˙¡˚Ÿôáá¯må·Ã@ú≤9ë.Æ€¿M÷åg˜◊8È–G∆#>nÄ!Ÿ¢Ã.’ÏãèG‡z∂Œe˛Á\0\0\0\0IENDÆB`Ç'),(15,'Active',4,'tower-g.png','image/png','2029','âPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0%\0\0\0#∑ÎG\0\0¥IDATXÖµóyl˜«?sÏÓÏ¨Ω∆æq\r6F@8 Q\nxihj(î&Å–\n9i@4§Wîê\nµRhõTQs“4U)%Am‘í∆êõ%\'1`L¿`s˚XüÎΩœˆœ,6x1TÙ≠û~;øﬂÃ˚~ﬂ˜˜FøyB4\Z`Ò‚≈2 f}îπ∑4 hïïï\0!\Zç\Z‡f@—›¨Ô∏¶›Cïïï¡·p‡*`◊GÖˇè¿ÙÍc»»R—¡”´ ‘‹c‡AÊ®(ù≠ˇ’Ä»@È’™≤5âc∆!´	»VıûG¸>\">Uej•ì–∑a`·)\0äÕélµ\rD”˙ËãÑÈáDâP¿ã(…H≤	-Fµß†ıE•[wOVâ\"Ó˛K£ŒD£⁄\rGQÌ»Ç4»%D¥Po7∏}‰Ñ(ééBıiÃ3O`±y*ÓÓvËË¡ÁÍ\"\Zâ‹C$’„c∏A5VÌ≤ ›¬>ˆp˜ê\'§±${!Ÿ÷¶•L&[Õdl‚∑eÌòUúÍ9√_õv”xÌ<Yò-*¢˜E\r&É•nLE£Q¸~7NÁe∆™£xr\\9ÀrÔ«Òce>i´fg”ﬂYô∑î$ìùí‘©î¨a≈°uk;IRZââ©Òƒ§∏â¿\r˙¥›ùÕÃM.ÊÖ‚-LJû¿ëéZﬁ∫7ˆ∑§7ÏfI÷\"ˆ\\›G≥øïWK~À¸ÙŸº?\'è>√Ó+{∞öm( –5ìa†ôSÃ›Ωù»}\Z[ß>«Ã¥iº|ˆO,˘xáú_x·ZNó}∆ÚQ0g‰˙⁄É¨9ºûßkMO»≈´%øar“x⁄úëêb1ÔXÅhT£≥ªô««¨aŒ»º—∞ùm\r€˘~˛r∂‹˜3¨≤ï/ªÎ»Q≥x•d+óΩ◊òî<ÅıG~Å,Hº=w€fº»Ç™Ô	Pïƒª€∑ﬂç÷f„∏u\\ˆ^„≈˙◊»T“y~ ≥tá\\l:˛K*ÆÔ†0a4;Áº¡c¿Öﬁ&^:˚G÷å˛˜g/dB“8úûNÏ÷w∂f¡ÑY0{òô:çÇÑ|ˆ\\›«ﬂu+|î\\5õÎ_£Ÿ◊JtµìËj\'iJ\nèTˇàÛÓ&~2~=#Lvﬁ<øÄ≤úo·ˆv«‚K‡òßûcûzÆxØRí:Yî9„:GÇlcEﬁR>i´ÊùKÔÒ√Çábœº>„w\\Ú^Âıs!GÕdf⁄4éuù\0`ﬁ»Y∏CÓX‹a	çFQ%+\0Œ@™d%’íLì˚\0ÀróƒÓùû2Ö¬Ñ—\\p_ €öIG†ãæ®Ü\"Y@?Úá≤∏I¢5‡ œñKoÿM{†ì\"{	≤çÚœüä›˚hız√neŒ‡öØô4%IÈvÅ ¸L&ét~	¿¸ÙŸ¥ ùá˘F˙◊≠‰R’˙)·pÄ\"{=a+Ûñq≤ÁüwgZÚd\0µÅ «?Ÿ„ÆàgZ\Zht_bA∆\\RÃ#ÿ—¯.µ=u‘wùf’®Â8=Ì‰$gÛÃƒMl9ı?=Ò+“‰$…¬S„ü¿Òq∞≠\Z—bπs$˝g2)íÃˆ∆]§ZíŸ=Ôœ|‘˛)/µÏB”˙XW∏öú‰l\0L¢åŸbOÀ¯†ßöGÚW∞0c.˚[“ÏkE∂⁄bqá%`M1∑$&ÒÊ˘4y.”‡nDîdL°à\"ãÛ–·ÔƒÂrÒÚÃﬂ£ÉÙhn>n˝-™±Ωq.)àb∂∆bªähæA&i$ûF j÷—–uãöHÿÁÂÅÏ%à¢àv\Z∏›<V¥Å∑`C›s®V;ßØüeÌâüÛQÛ”s∞»VÑ8Öx[àf≤räòLdYã0ô,\\¨;Ã∆9Â˙∫!ôY˘%∫úüáÙÃ—TÎI…»Cµçàá¿‡ÇQÙR,<Ìm K,…- ∫⁄IõøùÎH\0ûü∫ôÕ\'∂2æ®ˇ≥œjœåÀÒÊ	´®ƒıf◊§Õèe∞õ	É\0<;q\0BDã#ûö1°q@§/åÍ’¯Áäù¯|>Jˆ}ìØÇó!D∞(ºR≤ïè+ß»ñOoo)ÈE√%Ø\"- ¡6ƒ…%)»IIºÓﬂîüzö>üõ9ìÀ∞)vŒ∂ú‚…cõ9ÎΩ»⁄¬á˘–U∫5è∑\'ñè·27⁄•\0@–ÎBÕ$⁄R=Óc’˛°’ê!\'1cˆ™ÿ⁄¥‹Y§)©TvVì`≤·	{ôê5e–ÛnoAØÀ∏Ëòö‡p8Ã@0Ç€4&≥\'}á¸¨	Cjy≥]j9CM›ﬁ!◊Ù∆ƒ	Ù\0CÅ\0˝Ìz”0∞5™ÿ[md\n≤Ôª-xcÛijÍˆ‚®(ù´Oıusk\0¥;iNcﬂUeé/û≤í¢ú¡Ú\Z÷p˝$ï\'ﬂ√QQ:ù¡µø9¶=7∆ÅÌ[Ì∑ãf|NÒ ØÆ◊ÚaÌª8*Jãı,ç}H`Ëˆ¸v¶SËØìùƒ…•≈kòò;Ä˙k«˘†ˆ•StpèÓ(û\rK âÑ™≤µN_¿øéÔ42˜p‡wL`vùƒq¿ÿs˝≈u«‡wE‡&™Ó∆…¢_zﬂ›Äﬂ5Å$å¢4^U„›\r8¿äµ\ZJU\0\0\0\0IENDÆB`Ç'),(21,'Planned',1,'tower-b.png','image/png','1813','âPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0%\0\0\0#∑ÎG\0\0‹IDATXÖµólg«?æ;€ÁI◊éì¶ÕØ∂i¬»≤h+K;ñµ[⁄N∆PŸ:6iï∑!§±HÄ@’@Äÿ@ùÑ4§µÇvÎA0!Ñ•a´J€¨YSí•Iõ¥M⁄ÿulüÔ¸„é?|óπYú4Sy•WØ}Ô{Ô˜Û<ÔÛæ˜>6√0\0ÿ∫u´Ä√l%nn…:êÙûûû,ÄÕ0K‹»fuò\0¬M◊MÄ4†ö5›””ìµuvvZ‚n†‘le˛?Pò5€¥e•läWÙ·˛õ,|]È∞ÿh˛‘Ål°Î›}F∏øÆÆ∑€ç,À7UXUUE°o,‹ﬂa;–ÇπÖÅ\'ãäÎ∫N.ó#ì… ö¶!í$ëÕf)))!óÀ!ä‚Gﬁù7ßgÇÌV]P‹0“È4Òxúå\Z\'‡N”XëE2R¥’ä¥Øòùù%ùú…è…d4†`Ó9M+–çˆl6ãíåSÂ≥±•uïÂ2-ı%Ñ¸2ıïnéùΩ∆C˜¨‰˝Ò8ø˚ÁE∆ß¶8ùNl6[±iã§h1M”àD\"‘áú<y\r€Ôí“tD—Fˇ˚^Ôª»gÔQÊëhm(Â—{WÒ‘ãßù¡S‚√„Ò,&±4@,vç\rç%|Á—FökºúâÒ⁄ﬂ\'xs`Ü∏íeÀméõf*¢Ú|∏ôˆÊr~Î6æ˝Î!˜Oa∑€q8 ëH`rÏŸµé∂µeÏ{cîü¸~î@©É«Ó[≈ÆÕ’º;Â¯pI¥—µˇ=>ø©ígY«√MO$æ!\n]ä¢\0Üaè«yºs%÷˚8¯óÛºÚ◊|ncàoÏ\\ÉÀ)20:KeπìÁvØgÚ™J”j/œ˛Í¢`cﬂ3-Ï}≤ôù?8F&ì)ÍÖ¢\0Èt\Zùˆ\Z&Æ¶x˘Aüì=ª÷1õÃΩWÜ¯€ÆPrÒ“W[x|ÎjŒ]V¯≈ü«Ÿywõ[4ÆÚr!™(\Z˝ö¶—∂∂î⁄êã#«¶ôúQyÏﬁjVÆê˘È·1¶¢\Zì›€òÏﬁÜø‘¡”˚8wY·+;j)uKÍô\0†Ûˆ ™™ì)ê…dhm(C˛;ëƒÌŸ—^…ø#¸·≠K<|Oı‹ÿÖõô∏¢r‡»y*˝2mkÀ85\Z‡SÎ}‰rπÂÜÅÀô?—fbi\\NërØùÒiÄmwÁ∆ﬁ⁄PJ]»≈πÀ˘æPπìH<ÉÆ»vÎìø,\0Qôæ¶PêI§≤ÃÃ¶i®Ú‡vä|ÛÁÉscªˆøG<ï„”üÙpiF≈_bGlD‚ô≈£‚\0vªù#y7∂7ó£et˛}& ùMÂ‘ÜdéûéÃç]SÂf6ôaG{à3Áé—R_\n¿;g£HRÒ›^¥«Èt2<a|Ja„-~|âÓﬁINè%¯  ;VKf(ÛÿyÊ¡z~¸˙<ˇ⁄eŸ!Âœ‘¢h9˙£8ùŒèÁQ˘mÔ$Â^;?˚Z+Gc¸Êhå\\NÁK[™)ÛÿÛVàiM°ÁDÑ∑áæpWõnÒÛÊ¿U.G5\\.◊Ú\0º^/áz.0>ùbÙbQQUA∏˚÷|F˘/ﬂﬁ\'–4çòb÷`]7ËÓùDÕ\nã.¡í\0	\rûxqêÔ\ZAí$R©l o¡™áè∞˙°7x°{òßh¿·ppˆBÇØˇrÑﬁì3∏=%BqôEDQ$¢Ë^Ç¡ ~øüD\"¡ÓÌ5˘ó!ù¶6îw±Õ©Tä@ ¿;#Y ˝+êey—]∞‰≈”n∑œµ—ô$I¢£e\0ì›€∏”ñÂÉlœÆµº–=BMM–Ìv/5˝ÚÆ›	Ea˚Ü Îûï∏>¥°Î¡Ä¢7¢Öäı∂æ‘@]◊Q‚qˆwm`S◊?øíE”4dŸ…sªõx‚˛\Zj+úDìI|>ﬂíSZ\0ŸÇä™™ﬁA†¢¬GÔ…iû~È4©TäÜÜÜ¸“D£|˜‡C*èlYÕ´}…>Jsö¶K*Ä¢‰œÛ˘∫ÆK§Ÿ˚«Üa–‘‘4◊Á˜˚ë$â?ΩAt]ˇà¨kπı◊‘‘mùùù¿¯X$1©´´√Ô˜/hŸ¸âD[∞œLL¶Åk@¬ÚÄJ>]¬L\Z\nS3†o,¸∂eÌçàwÿ‹e>≤‚k~j¶˙ç$ßsw¯>#||1OàﬂŒı±U<9]\"=∑⁄¬ÙÌƒB‚m¶ï÷:,úû/VL0ô|úxMàSÖ‚≠¶x¬¨™%T¨,	P¬ky(¥<¡2ƒo`àR‚8`≠yÇ|p›∞¯≤\0ÊA∏Õj›µ”‰]Ø,G|Ÿ\0VPZ[’⁄bÈÂà¸9\0ÜÁPÇØ\0\0\0\0IENDÆB`Ç');
/*!40000 ALTER TABLE `site_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_name` varchar(50) NOT NULL,
  `site_code` varchar(10) NOT NULL,
  `lat` decimal(17,14) DEFAULT NULL,
  `lon` decimal(17,14) DEFAULT NULL,
  `declination` decimal(17,14) DEFAULT NULL,
  `tower_guard` varchar(255) DEFAULT NULL,
  `install_team_id` int(10) DEFAULT '1',
  `install_date` datetime DEFAULT NULL,
  `zone_id` int(10) NOT NULL,
  `site_state_id` int(10) NOT NULL,
  `tower_owner_id` int(10) NOT NULL,
  `tower_type_id` int(10) DEFAULT NULL,
  `tower_member_id` int(10) DEFAULT NULL,
  `tower_mount_id` int(10) DEFAULT NULL,
  `equipment_space_id` int(10) DEFAULT NULL,
  `power_type_id` int(10) NOT NULL,
  `network_switch_id` int(10) DEFAULT NULL,
  `network_router_id` int(10) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `structure_type` text,
  `description` text,
  `mounting` text,
  `access` text,
  `storage` text,
  `accommodations` text,
  `notes` text,
  `project_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
INSERT INTO `sites` VALUES (2,'Baycite','BAYCT',19.05623000000000,-72.01707000000000,-9.94338000000000,'Guard\'s name 555-5555-5555',3,'2012-09-28 00:00:00',2,15,1,1,1,1,1,7,10,9,NULL,'Transversal installed weather-tight enclosure for Inveneo router-switch board March 2012. Was cabinet.','Standard triangular Voila tower. Platform?','Beam clamps','Steep, rough dirt road. High clearance 4x4 required. Key no longer needed for access to Inveneo equipment on site.','Cyber-training center of George/Pierre in Hinche','L\'Hermitage Pandiassou hotel just outside of Hinche (call ahead)','(Old notes - done?) Need to move CBRIT dish to other side of tower. When you are up there, switch HINCH radio to sta to get a link up',1),(8,'Belladere','BELDR',18.85092000000000,-71.78593000000000,NULL,'',1,NULL,2,15,1,NULL,NULL,NULL,NULL,6,12,NULL,NULL,'','Standard triangular Voila tower with platform','Existing standoffs, plus 1 pole mounted with beam clamps just below the platform on the NW side. Pole is necessary to get away from a large grill dish (non-Viola) mounted on one of the standoffs.','Short, steep dirt road, 4x4 recommended','','Germain guest house','',1),(12,'Bellevue','BELVU',18.36383700000000,-72.90718000000000,-9.33903000000000,'',1,NULL,9,15,1,1,1,1,1,5,13,NULL,NULL,'','Small, old, very crowded triangular tower','Numerous abandoned round standoffs. Beam clamps may not work due to the large number of other antennas already present. Custom standoffs may be needed.','Foot, donkey or helicopter (verified). Road destroyed in landslide past Chamer?','On site','Bring tent and water.','',1),(13,'Boucan Carr√©','BCARE',18.92106118000000,-72.14426114000000,-9.85128000000000,'',1,NULL,2,15,1,1,1,1,NULL,5,11,NULL,NULL,'','','Beam clamps','','','','8-port H3C DC switch:\r\n- port 1 (vlan 11) - BCARE-BOSIO\r\n- port 2 (vlan 12) - BCARE-100\r\n- port 3 (vlan 12) - BCARE-340\r\n- port 9 - trunk to Mikrotik',1),(15,'Morne_Herve','HDC225',18.95719000000000,-72.37142000000000,NULL,'',1,NULL,9,21,10,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,'','','','','','','RBS Type =  2106I',1),(16,'Delpech','DLPCH',18.92640000000000,-72.54260000000000,-9.63186000000000,NULL,1,NULL,9,16,6,2,1,1,1,5,50,6,NULL,NULL,NULL,'Three side mounts ',NULL,NULL,NULL,NULL,1),(17,'Vandal','HDS007',18.35244000000000,-72.58594000000000,NULL,'',1,NULL,9,21,10,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,'','','','','','','RBS Type =  2106I',1),(18,'Belle Plaine','HDN008',19.72122000000000,-72.22322000000000,NULL,'',1,NULL,9,21,10,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,'','','','','','','RBS Type = 2106',1),(19,'Limbe','HDN208',19.70678000000000,-72.40367000000000,NULL,'',1,NULL,9,21,10,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,'','','','','','','RBS Type =  2106I',1),(20,'Frecyneau','HDC004',19.08672000000000,-72.71794000000000,NULL,'',1,NULL,9,21,10,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,'','','','','','','RBS Type = 2106',1),(21,'Dessalines','HDC260',19.26019000000000,-72.51653000000000,NULL,'',1,NULL,9,21,10,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,'','','','','','','RBS Type = 2106',1),(22,'Estere','HDC274',19.30222000000000,-72.60956000000000,NULL,'',1,NULL,9,21,10,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,'','','','','','','RBS Type =  2106I',1),(23,'Pont Sonde','HDC263',19.15114000000000,-72.61242000000000,NULL,'',1,NULL,9,21,10,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,'','','','','','','RBS Type =  2106I',1),(24,'Liancourt','HDC264',19.12856000000000,-72.54686000000000,NULL,'',1,NULL,9,21,10,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,'','','','','','','RBS Type =  2106',1),(25,'Pont Vincent','HDC280',19.12258000000000,-72.47814000000000,NULL,'',1,NULL,9,21,10,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,'','','','','','','RBS Type =  2116_V2   ',1),(26,'Verrettes','HDC267',19.05200000000000,-72.46558000000000,NULL,'',1,NULL,9,21,10,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,'','','','','','','RBS Type =  2106',1),(27,'Maissade','HDC220',19.17464000000000,-72.14114000000000,NULL,'',1,NULL,9,21,10,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,'','','','','','','RBS Type =  2106I',1),(28,'Pignon','HDN216',19.33717000000000,-72.11928000000000,NULL,NULL,1,NULL,0,21,10,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'RBS Type = 2106',1),(29,'Lascahobas','HDC203',18.83103000000000,-71.93286000000000,NULL,'',1,NULL,9,21,10,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,'','','','','','','RBS Type =  2106I',1),(30,'Roy Cannot','HDC318',18.90121000000000,-71.85246000000000,NULL,'',1,NULL,9,21,10,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,'','','','','','','RBS Type = 6102',1),(31,'Pilate','HDN210',19.66461000000000,-72.54856000000000,NULL,'',1,NULL,9,21,10,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,'','','','','','','RBS Type = 2106',1),(32,'Hinche Resoly','HDC200',19.14508000000000,-72.00750000000000,NULL,'',1,NULL,9,21,10,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,'','','','','','','RBS Type = 2106',1),(33,'Bellevue','SDH009',19.49803000000000,-72.33556000000000,NULL,'',1,NULL,9,21,10,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,'','','','','','','',1),(34,'Domond','HDC212',18.90519000000000,-72.07175000000000,NULL,'',1,NULL,9,21,10,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,'','','','','','','RBS Type =  2106I',1),(35,'Boucan Carre','HDC230',18.92183000000000,-72.14400000000000,NULL,'',1,NULL,9,21,10,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,'','','','','','','RBS Type =  2106I',1),(36,'Mont Carmel','HDC201',18.82533000000000,-72.10606000000000,NULL,'',1,'2012-09-13 00:00:00',9,21,10,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,'','','','','','','RBS Type = 6102',1),(37,'Marmond','SDH017',19.05625000000000,-72.01706000000000,NULL,'',1,NULL,9,21,10,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,'','','','','','','',1),(38,'Hilaire','SDH010',19.16614000000000,-72.36336000000000,-9.76884000000000,'',1,NULL,9,21,10,1,1,1,1,5,NULL,NULL,NULL,'','','','','','','',1),(39,'Valle De Jacmel','HDS300',18.26864000000000,-72.66619000000000,NULL,'',1,NULL,9,21,10,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,'','','','','','','RBS Type =  2106I',1),(40,'Timouillage','HDS017',18.23322000000000,-72.38272000000000,NULL,'',1,NULL,9,21,10,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,'','','','','','','RBS Type = 6102',1),(41,'Leogane Rue Bire','HDO386',18.54132000000000,-72.58091000000000,-9.55268000000000,'+509 5667 1540 (name Unknown)',1,'2012-10-15 00:00:00',1,15,10,1,1,1,1,5,46,2,NULL,'This site has experienced flooding in the past, and Digicel lifted the RBS/BTS cabinet onto a metal frame.  For this reason we have a non-standard tall i-mount here instead of the standard short design.  Small walled compound with barbed wire.','','This site is particularly good for mounting.  Most of the L-bars face out making it easy to attach beam clamps.','Off the north side of Rte National 2 from Port-au-Prince to Leogane.  Right turn just after the Brache bridge, and follow GPS to a small dirt track on the left.','','','RBS Type = 2116',1),(42,'Obleon','SDH011',18.43983000000000,-72.29172000000000,-9.70221000000000,' Charles Metellus: 3757 0689 / Blancha Metellus (Charles\'s Son): 3761 0127',1,'2012-10-18 00:00:00',9,15,10,1,2,3,1,5,49,5,NULL,'','','','','','','',1),(49,'World Food Program - L√©og√¢ne','WFPL',18.50937000000000,-72.61989000000000,NULL,'Karen Barsamian, WFPL 3785 7133, karen.barsamian@wfp.‚Äãorg (in PauP) JeanSerge Seide, JeanSerge.Seide@wfp.org, +509 38 82 04 44 (on site in Leogane) At the front gate ask for Frederic. Also, Yves runs operations for WFP in Leogane.',1,NULL,1,15,9,NULL,NULL,NULL,NULL,6,45,9,NULL,'','~20m small freestanding angle-iron construction tower with outside foot pegs and diagonal 3/4\" round cross-supports (no horizontal supports anywhere on the tower). Inside equipment is in an air conditioned shipping container adjacent to the tower. Our equipment is along the back wall of the container, mostly attached to the wall via zip ties.','Nanobridge is mounted on a pole attached to one face of the tower with 2 stainless steel hose clamps. sectors are bolted directly to the L-shaped uprights.','In town. Inside the MINUSTAH L√©og√¢ne base near the WFP shelters and adjacent to a 2m satellite dish.','None','None','9 Jan 2012 UPDATE - Network equipment now plugged directly into AC of server-room UPS. (Fixed problem apparently caused by intermittent Phocos charge controller and possibly other components.)\r\n[NOW REMOVED: 110VAC with 12VDC battery backup system (15VDC power supply, 10A Phocos charge controller, (1) sealed 12V battery, and small inverter.]\r\n\r\nIn OpenNMS and on radios: WFPL-090 = leo-base-033, WFPL-270 = leo-base-240 Two 17db sectors',1),(51,'Bosiaux','BOSIO',18.89656891000000,-72.09365890000000,NULL,'Fedner 3697 3106 or 3443 8656',1,NULL,2,15,1,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,'Cabinet','','1 beam clamp for 25db Nanobridge, plus existing standoffs on top of platform','Very wet, muddy dirt road. 4x4 required.','','','- 25db link to MIBAL\r\n- 30db link to BCARE\r\n- Three 16db sectors',1),(52,'Boutilliers','BOUTL',18.50748000000000,-72.31686000000000,-9.69680000000000,'Reggie Chauvet: tel:+509 37010044 (Digicel - preferred), tel:+509 34100044 (Voila), tel:+1 954-205-4606 (US), mailto:rchauvet@haicom.com, or Skype:papiepou',1,NULL,9,15,4,1,1,2,1,3,48,4,NULL,'The top Inveneo cabinet is Ruralnets / HRBN Network. The bottom Inveneo cabinet is HAICOM / PaP Net / NetHope Network.','Sturdy 60m freestanding triangular tower using round uprights','Rocket dishes and sectors can mount directly on these uprights.','\"Steep paved road (Laboule 12) from Route de Kenscoff at Delimart.\r\nHaicom tower is almost directly across from the scenic overlook site.\r\nLook for the blue gate on the opposite side from the overlook.\"','','','Extensive details in tower notes, see Zone 0 (tower notes) - http://10.0.2.1:8880/node/54.\r\n\r\nThere is an inverter and a UPS in the building.',1),(53,'Brache','BRACH',18.52276600000000,-72.58760100000000,-9.54115000000000,'3443-8571 called on last Friday around 3 pm. 3765-0205 (not sure if this one is correct). (Eyleen, March 26, 2012)',1,NULL,1,15,1,1,1,1,NULL,3,16,NULL,NULL,'Enclosure','','','Site in the Leogane area (to the east of town immediately before the bridge)','','','110 VAC from shared -48v inverter',1),(54,'Morne Carmel (Mirebalais 2)','CARML',18.82545000000000,-72.10625000000000,NULL,'\"SonSon\" Lucener 3469 1921',1,NULL,2,15,1,NULL,NULL,NULL,NULL,6,17,NULL,NULL,'','','','Short steep dirt road from town, usually in decent condition. 4x4 recommended','','','',1),(55,'Cabrits','CBRIT',18.70804000000000,-72.17028000000000,NULL,'Larousse 3851 7638 (also arranges storage and transport of materials to the site)',1,NULL,2,15,2,NULL,NULL,NULL,NULL,2,NULL,9,NULL,'','Solar system designed and installed by:\r\n\r\nEnersa\r\nAlex \r\nalexgeorges@gmail.com\r\n372-755-76\r\n374-603-25\r\nInstaller\r\nJean  Ronel\r\njrnoel@enersahaiti.com\r\n','One existing standoff for JANVI and MIBAL links, pole with U-bolts for CBRIT link','Foot or donkey from Fond Cheval','Small shelter onsite, very limited space; larger space available at start of trail accommodation: bring tent','','\"16-port AC-powered switch:\r\n port1 = vlan11 = CBRIT\r\n port2 = vlan12 = JANVI\r\n port3 = vlan13 = MIBAL\r\nStatus:\r\n - 30db to CBRIT\r\n - 30db to JANVI\r\n - 22db to MIBAL\"',1),(56,'Dessalines','DESAL',19.25975000000000,-72.51718000000000,NULL,'Ask Jeffrey Carr√© (Transversal) for contact info.',1,NULL,6,15,1,NULL,NULL,NULL,NULL,5,18,9,NULL,'Independent enclosure board installed 4 April 2012.','Triangular with platform?','Standoffs were in use already?','In town. Independent enclosure board installed, so key from Voila not needed.','','','-25db dish to LESTR - Signal strength -56 to -57 dB (4 April 2012). Three 16db sectors.',1),(57,'Grand Go√¢ve','GGOAV',18.42684000000000,-72.79913000000000,NULL,'',1,NULL,1,15,1,NULL,NULL,NULL,NULL,6,19,NULL,NULL,'Enclosure','','','','','','',1),(58,'Gros Morne','GMORN',19.67347000000000,-72.66989000000000,-9.67210000000000,'',1,NULL,8,15,1,1,1,1,1,6,20,9,NULL,'','','','','','','',1),(59,'Gressier','GRESS',18.53994000000000,-72.53400000000000,NULL,NULL,1,NULL,1,15,1,NULL,NULL,NULL,NULL,0,21,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(60,'Hilaire','HILRE',19.16624800000000,-72.36338300000000,NULL,'24/7 on-site guards who have the shelter keys. No need to call ahead.',1,NULL,9,15,1,NULL,NULL,NULL,NULL,3,22,9,NULL,'','Two towers on-site. We are using the square tower.','Beam clamps to 4 poles','Very steep, rough road from Petite Riviere (1hr) - high clearance 4x4 required.','','Bring tent and lots of water to sleep on site. Le Gou-T Hotel in St Marc.','\"More details in tower notes, see Zone0 (tower notes) - http://10.0.2.1:8880/node/54.\r\n24-port AC-powered H3C switch:\r\n Port1 = vlan10 = HILRE-OBLEO\r\n Port2 = vlan11 = HILRE-270\r\n Port3 = vlan12 = HILRE-JANVI\r\n Port4 = vlan13 = HILRE-MASDE\r\n Port5 = vlan14 = HILRE-HINCH\r\n Port6 = vlan15 = HILRE-PIGNO\r\n Port7 = vlan16 = HILRE-STMRC (no cable run, may be replaced)\r\n Port8 = vlan17 = HILRE-GNAIV (no radio, no cable run)\r\n Port9 = vlan18 = HILRE-MARML (no IP configured)\r\n Port24 = vlan1 = administrative access port\r\n Port25 = trunk to Mikrotik\r\n Port26 = administrative trunk port\"',1),(61,'Hinche (Hinche2)','HINCH',19.14325000000000,-72.01257000000000,NULL,'Mezan 3443 8694 or 3494 4100',1,NULL,2,15,1,NULL,NULL,NULL,NULL,5,23,NULL,NULL,'Cabinet','Standard triangular Voila tower with platform','Standoffs on platform','In town','Cyber-training center of George/Pierre in Hinche,.5 or 6 poles still at the tower location (?).','L\'Hermitage Pandiassou Hotel just outside of Hinche (call ahead)','-48 VDC (use 24 VDC converter)\r\n- 30db link to HILRE\r\n- 30db link to BAYCT\r\n- (3) 16db sectors\r\nThis is Hinche2. Contact for Hinche1 (up on the hill) is Ezai 3480 6791 or 3443 8292.',1),(62,'Haut Piton','HTPTN',19.85938000000000,-72.75703000000000,NULL,'',1,NULL,8,15,1,NULL,NULL,NULL,NULL,6,24,9,NULL,'','','','','','','',1),(63,'Jacmel (Jacmel 1)','JACML',18.19587643000000,-72.56950340000000,NULL,'Michelle Joseph Fosten 3110 9756',1,NULL,7,15,1,NULL,NULL,NULL,NULL,5,25,9,NULL,'','Small square tower inside a tiny enclosure with a small adjacent shelter. The tower is extremely crowded with existing antennas. Using a rope on this tower will be very challenging. May want to anchor on the far edge of the roof of the adjacent shelter.','Probably beam clamps on horizontal beams near the top of the tower on the East face. There are some partially free standoffs near the bottom of the tower, but these are probably not appropriate for our use.','In the Bellevue neighborhood past √áa Titi in Jacmel commune. About 1 hour on well maintained dirt roads from Jacmel town. Getting there requires fording the Grande Rivi√®re de Jacmel (up to 3 fordings) and the Petite Rivi√®re de Jacmel (1 fording), both just outside of town. If you are not sure which way to go, ask anyone which way to \"√áa Titi\". Do not attempt crossing during or immediately after rain. 4x4 required.','Minimal storage in crowded shelter','Hotels in Jacmel town. Book 2 weeks ahead for weekend days.','-48VDC and 110VAC currently available. Need to check if the 110VAC is on the main battery stack.',1),(64,'Janvier','JANVI',18.96598000000000,-72.36761000000000,NULL,'Rosemonde 3632 9562',1,NULL,2,15,1,NULL,NULL,NULL,NULL,5,26,NULL,NULL,'Building','','','Rosemonde can be found the second left after the bridge if coming from the tower turnoff.','','','',1),(98,'Lascahobas','LASCB',18.83600000000000,-71.93621000000000,NULL,'Evanel Isalem 3924 1843, 3699 6881, 3755 2791',1,NULL,10,15,1,NULL,NULL,NULL,NULL,5,27,NULL,NULL,'','Standard triangular Voila tower','Several existing standoffs','Steep, dirt and rock path. High clearance 4x4 required.','','Not available','',1),(99,'La Vall√©e de Jacmel','LAVLE',18.26894900000000,-72.66705500000000,-9.46083000000000,'',1,NULL,7,20,1,1,1,1,1,6,28,9,NULL,'','','','Undated note: did not visit as river was too high to cross at the time','','','',1),(100,'L√©og√¢ne','LEOGN',18.51003056000000,-72.63198889000000,NULL,'Site contact: Wesley 3769 7334 Power technician: Dukens 3636 3761',1,NULL,1,15,6,NULL,NULL,NULL,NULL,6,29,9,NULL,'','','','','','','',1),(101,'Bernard','BERNA',18.35269000000000,-72.58593000000000,NULL,'Denais 3443 8505',1,NULL,7,15,1,NULL,NULL,NULL,NULL,5,14,9,NULL,'Enclosure: combination lock 6-22-10','Standard triangular Voila tower with angle-iron construction and platform at top. The outer wall fell down in the earthquake and has no been replaced. The neighbors say that thieves are constantly visiting the site at night to attempt to steal things (diesel fuel perhaps?).','Lots of free standoffs on platform at top','Very short steep unpaved road off highway to Jacmel (towers clearly visible from the road). 4x4 recommended.','None','None','',1),(120,'L\'Estere','LESTR',19.29971000000000,-72.61129000000000,NULL,'Jean-Baptiste 3473 3279',1,NULL,6,15,1,NULL,NULL,NULL,NULL,5,30,9,NULL,'','Very wide, tall, square tower with a platform. Like LESTR but much shorter.','Beam clamps in corners at platform height','In town','','','- 30db dish to HILRE\r\n- 25db dish to DESAL\r\n- Three sectors',1),(121,'Liancourt','LIANC',19.12685000000000,-72.54398000000000,NULL,'Alfred 3443 8423. Alfred actually follows the rules, so call the Voila NOC in advance for authorization.',1,NULL,6,15,1,NULL,NULL,NULL,NULL,5,31,9,NULL,'','Nice large standard triangular tower with platform','Standoffs on platform','In town immediately on the main road','','','- use 24 VDC converter\r\n- 30db dish to HILRE\r\n- Three 16db sectors\"',1),(122,'Limb√© 2','LIMB2',19.70446000000000,-72.40377000000000,-9.82638000000000,'',1,NULL,8,20,1,1,1,1,1,6,32,9,NULL,'Enclosure','','','','','','',1),(123,'Limb√© (Limb√© 1)','LIMBE',19.69095000000000,-72.33678000000000,NULL,'',1,NULL,8,15,1,NULL,NULL,NULL,NULL,6,33,9,NULL,'','','','','','','',1),(124,'Marigot','MARIG',18.23565000000000,-72.30933000000000,-9.66036000000000,'Fredo at 3443 8565.  Can also try Cristanne at 3443 8424 (not reached).',1,NULL,7,20,1,1,1,1,1,5,34,9,NULL,'','Standard triangular Voila tower of angle-irons with a top platform with standoffs','Free standoffs on platform','Short, steep, slightly overgrown road that leaves the main road at 18.23354,-72.31386. 4x4 required.','None','Possibly hotels in Marigot. Recommended hotel in Ti Mouillage is Hotel Kabic (3780 6850 - good Internet!). On weekends you may be stuck at the less comfortable but still clean Hotel l\'Amit√© (3888 9386).','',1),(125,'Marmelade','MARML',19.49755000000000,-72.33580000000000,NULL,'Molijen Jula 3427 7773',1,NULL,8,15,1,NULL,NULL,NULL,NULL,6,35,9,NULL,'','','','The site is approximately 600m from the town of Marmelade. From the welcome statue, veer right up the steep road at 19.517253,-72.362393. You will pass first the Access Haiti tower, then the Digicel tower, then finally you will come to the Voila towers‚Äîa small triangular tower like Janvier, and a medium sized square tower, like Hilaire. The site has perhaps the best view of any site in Haiti. You can see Cap Ha√Øtien from the roof of the shelter, the central plateau, and even as far as Obleon.','','','',1),(126,'Ma√Øssade','MASDE',19.17420618000000,-72.13999923000000,NULL,'',1,NULL,2,15,1,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,'','Standard triangular Voila tower with platform','Round standoffs on top platform','In town center','Save the Children','Save the Children guest house (5 minute drive)','- 30db link to HILRE\r\n- Two 17db sectors',1),(127,'Mirebalais (Mirebalais 1)','MIBAL',18.83373323000000,-72.10544377000000,NULL,'\"SonSon\" Lucener 3469 1921',1,NULL,2,15,1,NULL,NULL,NULL,NULL,3,36,NULL,NULL,'Cabinet','','Beam clamps on 3 sides, using one existing standoff at very top of tower for 2 sectors','In town center','Limited storage at WorldVision office in Mirebalais','Mirage Hotel in main town square (convenient) or Wozo Hotel on the road toward Hinche (nice)','16-port H3C AC-powered switch installed\r\n - port 1 (vlan 11) MIBAL-CARML\r\n - port 2 (vlan 12) MIBAL-BOSIO\r\n - port 3 (vlan 13) MIBAL-SODO\r\n - port 4 (vlan 14) MIBAL-050\r\n - port 5 (vlan 14) MIBAL-170\r\n - port 6 (vlan 14) MIBAL-290\r\n - port 18 - trunk to Mikrotik\r\nStatus:\r\n- links to CARML (22db), BOSIO (25db), SODO (30db)\r\n- Three 16db sectors',1),(128,'Obleon','OBLEO',18.43875000000000,-72.29069000000000,-9.70263000000000,'Enoch 3441 0218',1,'2012-10-18 00:00:00',9,18,1,1,1,1,1,3,NULL,9,NULL,'','2 towers on site, one triangular tower with 2-3\" rounds and one new octagonal tower. We are using the old, flimsy triangular tower. There are foot pegs on the outside on one side of the tower.','Direct mounting on the tower rounds. Could use custom standoffs or U-bolts, but the tower is not compatible with beam clamps.','Steep paved road, 1 hour from Petionville. Take the road toward Furcy past Kenscoff and turn right at the first paved road after the Petit Freres et Soeurs sign (on the left). Follow this road until you reach the towers.','On site storage room next to main equipment room','','110VAC via -48v inverter for our use\r\n16-port AC-powered switch installed\r\nport1 - OBLEO-BOUTL\r\nport2 - OBLEO-HILRE \r\nport3 - OBLEO-JACML\r\nport4 - OBLEO-BELVU\r\nport5 - OBLEO-CBRIT',1),(129,'Pignon','PIGNO',19.33504552000000,-72.11776798000000,NULL,'',1,NULL,2,15,1,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,'','Standard triangular Voila tower with platform','Round standoffs on top platform','In town center','Haiti Outreach','Haiti Outreach guest house','-48 VDC in cabinet (use 24 VDC/VDC converter)\r\n- 30db link to HILRE\r\n- Three 16db sectors',1),(130,'Pilate','PILAT',19.66710000000000,-72.55308000000000,NULL,'Junior 3443 8896',1,NULL,8,15,1,NULL,NULL,NULL,NULL,6,37,9,NULL,'','','','The town of Pilate is accessible via a bumpy mud and rock road, 45 minutes from Gros Morne, and 1 hour from Plaissance. The site is in the main paved square of Pilate. The tower is a large triangular tower with upper platform. The grounding plate at the base of the tower is quite high off the ground, but otherwise the site is straightforward. The guard lives diagonally across the main square from the tower in the house with the large red gate.','','','',1),(161,'Petite Rivi√®re de l\'Artibonite','PRIVA',19.12251000000000,-72.48166000000000,NULL,'Ask Jeffrey Carr√© (Transversal) for contact info.',1,NULL,6,15,1,NULL,NULL,NULL,NULL,5,38,9,NULL,'','Wide but short square tower with a platform. Like LESTR but much shorter.','Beam clamps in corners at platform height','In town','','','',1),(162,'Pont Sond√©','PSOND',19.14786000000000,-72.61349000000000,NULL,'Eval 3443 8323',1,NULL,6,15,1,NULL,NULL,NULL,NULL,5,39,9,NULL,'','Standard triangular Voila tower with platform','Standoffs on platform','In town near the soccer field','','','-48 VDC (use 24 VDC converter)\r\nEquipment:\r\n- 30db dish to HILRE\r\n - Three 16db sectors\r\nOther:\r\nother:\r\n - 1.5\"\" EMT bars stored on site\r\n - Watch out for the killer bees.',1),(163,'Saut d\'Eau','SODO',18.82249378000000,-72.21422652000000,NULL,'Jiva 3443 8552',1,NULL,2,15,1,NULL,NULL,NULL,NULL,5,40,NULL,NULL,'','Standard triangular Voila tower with platform','Existing standoffs','Take the well-maintained gravel road from town towards the waterfalls and turn right once you are at the same height as the tower.','','Have not tried the $25/night hotel across from the police station.','-48 VDC (use 24 VDC converter)\r\n- 30db link to MIBAL\r\n- Two sectors',1),(164,'Saint Marc (St Marc xp)','STMRC',19.08776000000000,-72.70772000000000,NULL,'',1,NULL,6,15,1,NULL,NULL,NULL,NULL,3,41,9,NULL,'','Not a tower, but the roof of a Voila shelter that had a tower on it. Excellent 270 degree view of Saint Marc bay.','Tripod mounted on roof with a 5\' bar','Just above town. access from just north of La Colline hotel.','On-site storage','Le Gou-T hotel on the north end of town','110VAC via dedicated -48v inverter\r\n- put in a full 10\' bar to raise the antennas higher.\r\n- 30db dish to HILRE-270\r\n- One 17db sector',1),(165,'Verrettes','VERET',19.05240000000000,-72.46626000000000,NULL,'David 3737 8608',1,NULL,6,15,1,NULL,NULL,NULL,NULL,5,42,9,NULL,'','Very short square tower with a large tree growing into the tower on the west side','Beam clamps at the top of the tower','In town','','','-48 VDC (use 24 VDC converter)\r\n- Poor signal\r\n- 30db dish to HILRE\r\n- Three 16db sectors',1),(166,'Verjon','VERJN',18.26347976000000,-72.43249369000000,NULL,'',1,NULL,7,15,1,NULL,NULL,NULL,NULL,6,43,9,NULL,'','','','\"From the main east-west road, turn north on Route des Orangiers (immediately west of the airport), turn right at the \"\"T\"\", then fork right at the Station des Orangiers (18.2558,-72.508126). It is then about 11km to the turn off. The first part of the road after the fork is partially paved and generally a good road, but extremely steep. The last part of the road is a short overgrown dirt track which becomes very steep for the last 200m.\r\nSee: http://www.openstreetmap.org/?lat=18.2557&lon=-72.4765&zoom=14&layers=M\r\nPossible (unverified) option 2 is to turn north at 18.2558,-72.508126 at Ravine Meyer.\r\n4x4 required (with working low-4). Do not try to go via Cayes Jacmel. Even though marked as a proper road on some maps, this road becomes a shoulder-width footpath several km from the tower.\"','','','',1),(167,'Verti√®res','VERTI',19.72233000000000,-72.22208000000000,NULL,'',1,NULL,8,15,1,NULL,NULL,NULL,NULL,6,44,9,NULL,'','','','','','','',1),(169,'Foo','FOO',19.85948000000000,-72.75713000000000,NULL,'',3,NULL,1,18,1,NULL,NULL,NULL,NULL,5,NULL,1,NULL,'','','','','','','',1);
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER location_insert

AFTER INSERT ON sites
FOR EACH ROW
BEGIN
	
	IF ( (NULLIF(NEW.id,'')) AND (NULLIF(NEW.lat,'')) AND (NULLIF(NEW.lon,'')) )
	THEN 
		INSERT INTO locations(id, location)
		VALUES ( NEW.id, POINT(NEW.lat, NEW.lon) );
  	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER location_update
AFTER UPDATE ON sites
FOR EACH ROW
BEGIN
	IF ( (NULLIF(NEW.id,'')) AND (NULLIF(NEW.lat,'')) AND (NULLIF(NEW.lon,'')) )
	THEN
		
		IF ( SELECT EXISTS(SELECT 1 FROM locations WHERE id = NEW.id) ) THEN
			UPDATE locations
			SET location = POINT(NEW.lat, NEW.lon)
			WHERE id = NEW.id;
		ELSE
			INSERT INTO locations(id, location)
			VALUES ( NEW.id, POINT(NEW.lat, NEW.lon) );
		END IF;
  	END IF;	
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER location_delete
BEFORE DELETE ON sites
FOR EACH ROW
BEGIN
	DELETE FROM locations
	WHERE id = OLD.id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `switch_types`
--

DROP TABLE IF EXISTS `switch_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `switch_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ports` int(10) DEFAULT '8',
  `name` varchar(255) NOT NULL,
  `manufacturer` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `switch_types`
--

LOCK TABLES `switch_types` WRITE;
/*!40000 ALTER TABLE `switch_types` DISABLE KEYS */;
INSERT INTO `switch_types` VALUES (1,8,'8-Port DC Switch','H3C','JD316A'),(2,16,'16-Port DC Switch','H3C','JD314A'),(3,24,'24-Port DC Switch','H3C','JD315A'),(4,8,'8-Port AC Switch','H3C','JD318A'),(5,16,'16-Port AC Switch','H3C','JD319A'),(6,24,'24-Port AC Switch','H3C','JD320A');
/*!40000 ALTER TABLE `switch_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tower_members`
--

DROP TABLE IF EXISTS `tower_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tower_members` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tower_members`
--

LOCK TABLES `tower_members` WRITE;
/*!40000 ALTER TABLE `tower_members` DISABLE KEYS */;
INSERT INTO `tower_members` VALUES (1,'L-Bar'),(2,'Round Bar');
/*!40000 ALTER TABLE `tower_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tower_mounts`
--

DROP TABLE IF EXISTS `tower_mounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tower_mounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tower_mounts`
--

LOCK TABLES `tower_mounts` WRITE;
/*!40000 ALTER TABLE `tower_mounts` DISABLE KEYS */;
INSERT INTO `tower_mounts` VALUES (1,'Existing Standoffs'),(2,'Beam Clamps'),(3,'Custom Standoffs');
/*!40000 ALTER TABLE `tower_mounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tower_owners`
--

DROP TABLE IF EXISTS `tower_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tower_owners` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tower_owners`
--

LOCK TABLES `tower_owners` WRITE;
/*!40000 ALTER TABLE `tower_owners` DISABLE KEYS */;
INSERT INTO `tower_owners` VALUES (1,'Voila'),(2,'Multilink'),(4,'Haicom'),(6,'Access Haiti'),(9,'World Food Program'),(10,'Digicel'),(11,'None'),(12,'Inveneo');
/*!40000 ALTER TABLE `tower_owners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tower_types`
--

DROP TABLE IF EXISTS `tower_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tower_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tower_types`
--

LOCK TABLES `tower_types` WRITE;
/*!40000 ALTER TABLE `tower_types` DISABLE KEYS */;
INSERT INTO `tower_types` VALUES (1,'Freestanding'),(2,'Guyed');
/*!40000 ALTER TABLE `tower_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_to_projects`
--

DROP TABLE IF EXISTS `user_to_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_to_projects` (
  `user_id` int(10) NOT NULL,
  `project_id` int(10) NOT NULL,
  PRIMARY KEY (`user_id`,`project_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_to_projects`
--

LOCK TABLES `user_to_projects` WRITE;
/*!40000 ALTER TABLE `user_to_projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_to_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `role_id` varchar(20) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','157f42bf0d97ffa44c078474279fcbe4f54c3409','1','2012-07-18 20:09:51','2012-10-02 14:59:28'),(17,'thomas','ec4c5328e8870376d07f17e15c39135a51efc46d','11','2012-10-13 07:11:24','2012-10-19 13:09:07'),(3,'sue','ae1a12b6e634352e2a52bdc721da548b713f6cbb','2','2012-07-18 21:56:14','2012-10-05 14:58:57'),(16,'dukens','b174b7fe111c63386c7b88086ddaf41f8096f7a7','11','2012-10-13 07:10:20','2012-10-13 07:31:15'),(8,'abjornson','8cbde73a8299a5bbea32c5677be71b2c3150bc15','1','2012-09-14 14:43:59','2012-10-05 14:57:56'),(11,'critchie','fe950edc4427c13187a635be707749a69405dc68','1','2012-09-18 17:16:53','2012-10-05 14:59:03'),(12,'mark','03a7394e040472cd0ef3eb58e5996257cf972afc','1','2012-09-21 16:10:35','2012-10-05 14:58:52'),(13,'rchauvet','b72882f892fb9c006ee1739fbd3e938e37c71cc1','1','2012-09-28 12:14:54','2012-10-13 07:15:12'),(14,'fj','b4bb357d20e1d57b57561cc14dad3167a9147ded','2','2012-09-28 12:15:26','2012-10-05 14:59:06'),(15,'sam','9deb69700bbba0952fae4e81154a1ad4669b0aad','11','2012-09-28 12:16:09','2012-10-05 14:59:10');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `v`
--

DROP TABLE IF EXISTS `v`;
/*!50001 DROP VIEW IF EXISTS `v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v` (
  `id` int(10) unsigned,
  `name` varchar(255),
  `radio_src_id` int(10),
  `radio_dest_id` int(10)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `zones`
--

DROP TABLE IF EXISTS `zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zones` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zones`
--

LOCK TABLES `zones` WRITE;
/*!40000 ALTER TABLE `zones` DISABLE KEYS */;
INSERT INTO `zones` VALUES (1,'Zone 1'),(2,'Zone 2'),(6,'Zone 3'),(7,'Zone 4'),(8,'Zone 5'),(9,'Zone 0'),(10,'Zone 6');
/*!40000 ALTER TABLE `zones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `v`
--

/*!50001 DROP TABLE IF EXISTS `v`*/;
/*!50001 DROP VIEW IF EXISTS `v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v` AS select `network_radios`.`id` AS `id`,`network_radios`.`name` AS `name`,`network_links`.`radio_src_id` AS `radio_src_id`,`network_links`.`radio_dest_id` AS `radio_dest_id` from (`network_radios` join `network_links`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-10-23  9:54:35
