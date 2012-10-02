-- MySQL dump 10.13  Distrib 5.1.63, for debian-linux-gnu (i486)
--
-- Host: localhost    Database: poundcake
-- ------------------------------------------------------
-- Server version	5.1.63-0ubuntu0.10.04.1

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `build_items`
--

LOCK TABLES `build_items` WRITE;
/*!40000 ALTER TABLE `build_items` DISABLE KEYS */;
INSERT INTO `build_items` VALUES (1,100,'RJ45, Indoor'),(2,100,'RJ45, Shielded, Toughconnector'),(3,25,'Ring Connectors'),(4,50,'Fork Connectors');
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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `change_logs`
--

LOCK TABLES `change_logs` WRITE;
/*!40000 ALTER TABLE `change_logs` DISABLE KEYS */;
INSERT INTO `change_logs` VALUES (1,'1.0','\r\n        Release Notes - Poundcake - Version 1.0\r\n        \r\n<h2>        Bug\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-20\'>PC-20</a>] -         Delete school does not delete associated files\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-23\'>PC-23</a>] -         School map should center on school&#39;s GPS coordiantes\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-26\'>PC-26</a>] -         Edit District\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-34\'>PC-34</a>] -         Cascade Ajax events on select of Catchment/Area/Region on add/edit District view\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-52\'>PC-52</a>] -         Formatting of school listing on the view TRC page\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-60\'>PC-60</a>] -         UI on final page of paginated results\r\n</li>\r\n</ul>\r\n    \r\n<h2>        Improvement\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-18\'>PC-18</a>] -         GPS data validation\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-84\'>PC-84</a>] -         Move location to separate lat/lon float fields, MySQL trigger to make slave column for spatial data storage\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-85\'>PC-85</a>] -         Power field\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-86\'>PC-86</a>] -         List Contact Type\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-90\'>PC-90</a>] -         Site States and icon colors for overview map\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-91\'>PC-91</a>] -         default state icon is orange\r\n</li>\r\n</ul>\r\n        \r\n<h2>        New Feature\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-1\'>PC-1</a>] -         District Contact Info\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-2\'>PC-2</a>] -         Create person contact type\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-3\'>PC-3</a>] -         Add access instructions to school detail page\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-4\'>PC-4</a>] -         Add install date field\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-6\'>PC-6</a>] -         Search nearby feature\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-7\'>PC-7</a>] -         &quot;install team&quot; object\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-8\'>PC-8</a>] -         School search\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-10\'>PC-10</a>] -         Ajax select for Area, District on create new school\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-11\'>PC-11</a>] -         Update Google Map Helper on School Detail page\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-12\'>PC-12</a>] -         Remove Rajib Ahmed&#39;s Google map helper\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-14\'>PC-14</a>] -         Hierarchy of organizational units\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-15\'>PC-15</a>] -         Need final Catchment/Area/District matrix\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-17\'>PC-17</a>] -         Apache configuration\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-19\'>PC-19</a>] -         Add/edit school field-level vlidation\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-25\'>PC-25</a>] -         TCs/TRCs in a District\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-29\'>PC-29</a>] -         Re: TC/TRC staff\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-30\'>PC-30</a>] -         look into MapBox\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-37\'>PC-37</a>] -         Add top-level menu item for TC/TRCs\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-38\'>PC-38</a>] -         Add top-level menu item for Contacts\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-39\'>PC-39</a>] -         Permissions layer\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-41\'>PC-41</a>] -         add email field to Contact model\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-48\'>PC-48</a>] -         escape &quot;/&quot; on school code search\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-50\'>PC-50</a>] -         Add nearby schools to map on school detail page\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-51\'>PC-51</a>] -         Redirect logged in users\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-54\'>PC-54</a>] -         User edit of user details\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-61\'>PC-61</a>] -         Use virtual fields for User, Contact\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-62\'>PC-62</a>] -         drop InstallationState in favor of SiteState\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-63\'>PC-63</a>] -         virtual fields + displayField\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-64\'>PC-64</a>] -         Sort of TRCs on Contact edit\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-65\'>PC-65</a>] -         Sort of Districts on Contact edit\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-82\'>PC-82</a>] -         Replace Catchment/Area/District with Zones\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-89\'>PC-89</a>] -         Add NetworkRouter type\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-92\'>PC-92</a>] -         switch/index - sort alphabetically\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-93\'>PC-93</a>] -         radio/index - sort alphabetically\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-94\'>PC-94</a>] -         router/index - sort alphabetically\r\n</li>\r\n</ul>\r\n    \r\n<h2>        Question\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-27\'>PC-27</a>] -         Remove View for simple objects on admin page\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-28\'>PC-28</a>] -         Policy regarding Users\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-36\'>PC-36</a>] -         Region\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-87\'>PC-87</a>] -         Jérémie Aéroport\r\n</li>\r\n</ul>\r\n        \r\n<h2>        Task\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-21\'>PC-21</a>] -         Customize Cake&#39;s default error messages for missing controllers, views, etc.\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-22\'>PC-22</a>] -         Need partner logos for UI\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-24\'>PC-24</a>] -         Style CSS for AjaxMultiUpload plugin\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-31\'>PC-31</a>] -         Add Ajax on Catchment, Area selects to Add/Edit of School\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-32\'>PC-32</a>] -         Add Catchment, Area selects to Add/Edit of Region + Ajax update\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-33\'>PC-33</a>] -         Add Ajax on Catchment, Area selects to Add/Edit of District\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-35\'>PC-35</a>] -         School contacts\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-40\'>PC-40</a>] -         Review School model from Andris&#39; spreadsheet\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-42\'>PC-42</a>] -         Style CSS for Jquery calendar\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-43\'>PC-43</a>] -         Add school code to School search\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-44\'>PC-44</a>] -         Add Contact search\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-45\'>PC-45</a>] -         Add TC/TRC search\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-46\'>PC-46</a>] -         GPS Radius Search\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-53\'>PC-53</a>] -         Re-skin UI with Matt&#39;s CSS\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-66\'>PC-66</a>] -         Add new frields to views for TC/TRC model\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-68\'>PC-68</a>] -         Move map display code (for School, TRC view pages) into common file\r\n</li>\r\n</ul>\r\n    \r\n<h2>        Sub-task\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-16\'>PC-16</a>] -         Need final Catchment/Area/District matrix\r\n</li>\r\n</ul>\r\n','2012-09-13 00:00:00'),(2,'1.1','\r\n        Release Notes - Poundcake - Version 1.1\r\n                    \r\n<h2>        New Feature\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-111\'>PC-111</a>] -         Dynamically add up to 10 Radios with valid AntennaTypes on Site add/edit\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-112\'>PC-112</a>] -         Dynamically add 1 Switch on Site add/edit\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-113\'>PC-113</a>] -         Dynamically add 1 Router on Site add/edit\r\n</li>\r\n</ul>\r\n                \r\n- Bugfixes','2012-09-18 00:00:00'),(3,'1.2','\r\n        Release Notes - Poundcake - Version 1.2\r\n        \r\n<h2>        Bug\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-121\'>PC-121</a>] -         Add label for Contact type on Contact add/edit\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-122\'>PC-122</a>] -         Allow punctuation in passwords\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-124\'>PC-124</a>] -         GPS lat/lon not displaying on Site Edit\r\n</li>\r\n</ul>\r\n    \r\n<h2>        Improvement\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-101\'>PC-101</a>] -         make towerdb aware of equipment lists\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-105\'>PC-105</a>] -         poundcake should know about installation teams\r\n</li>\r\n</ul>\r\n        \r\n<h2>        New Feature\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-125\'>PC-125</a>] -         Make radio on Site Add/Edit default to RocketM5\r\n</li>\r\n</ul>\r\n                ','2012-09-20 00:00:00'),(4,'1.3','\r\n        Release Notes - Poundcake - Version 1.3\r\n        \r\n<h2>        Bug\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-131\'>PC-131</a>] -         Revisit sort of SwitchType in SwitchType controller getSwitchTypes()\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-132\'>PC-132</a>] -         Datepicker CSS needs more visible &lt;&lt; and &gt;&gt; buttons\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-134\'>PC-134</a>] -         Rename Radio does not fully disconnect previous link\r\n</li>\r\n</ul>\r\n    \r\n<h2>        Improvement\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-117\'>PC-117</a>] -         Make frequency a select list\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-129\'>PC-129</a>] -         add &quot;switchport number&quot; field to radios\r\n</li>\r\n</ul>\r\n        \r\n<h2>        New Feature\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-115\'>PC-115</a>] -         can towerdb be aware of how a site is &quot;wired&quot;\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-119\'>PC-119</a>] -         Link Radios\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-126\'>PC-126</a>] -         flash messages on Site Save\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-130\'>PC-130</a>] -         Add SwitchType\r\n</li>\r\n</ul>\r\n                ','2012-09-24 00:00:00'),(5,'1.4','\r\n        Release Notes - Poundcake - Version 1.4\r\n            \r\n<h2>        Improvement\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-102\'>PC-102</a>] -         towerdb integration with addrpool\r\n</li>\r\n</ul>\r\n        \r\n<h2>        New Feature\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-136\'>PC-136</a>] -         Create custom validation rule on NetworkRadio to ensure name is unique\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-138\'>PC-138</a>] -         Override HTML Helper\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-139\'>PC-139</a>] -         Default radio to RocketM5\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-140\'>PC-140</a>] -         Pull name as well as IP address on addrpool integration\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-143\'>PC-143</a>] -         Add Search on Radios\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-145\'>PC-145</a>] -         New fields for Site object\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-146\'>PC-146</a>] -         Radio codes can be 5 or 6 characters\r\n</li>\r\n</ul>\r\n    \r\n<h2>        Question\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-118\'>PC-118</a>] -         Unit for link distance\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-135\'>PC-135</a>] -         Format validation on radio name?\r\n</li>\r\n</ul>\r\n            \r\n<h2>        Sub-task\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-106\'>PC-106</a>] -         true/magnetic azimuth calculation\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-120\'>PC-120</a>] -         Link Distance\r\n</li>\r\n</ul>\r\n','2012-09-27 00:00:00'),(6,'1.5','\r\n        Release Notes - Poundcake - Version 1.5\r\n        \r\n<h2>        Bug\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-152\'>PC-152</a>] -         See if ExcelwriterXML supports embedding images\r\n</li>\r\n</ul>\r\n    \r\n<h2>        Improvement\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-104\'>PC-104</a>] -         towerdb should know how to print workorders\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-150\'>PC-150</a>] -         Round Azimuths on Work Order\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-151\'>PC-151</a>] -         See if ExcelwriterXML supports page breaks for clean printing\r\n</li>\r\n</ul>\r\n        \r\n<h2>        New Feature\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-147\'>PC-147</a>] -         Radio - Station or Access Point\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-149\'>PC-149</a>] -         Add Projects\r\n</li>\r\n</ul>\r\n            \r\n<h2>        Task\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-144\'>PC-144</a>] -         Open up port to reach MySQL on BOUTL-RADIUS\r\n</li>\r\n</ul>\r\n    \r\n<h2>        Sub-task\r\n</h2>\r\n<ul>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-154\'>PC-154</a>] -         Add RouterType\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-155\'>PC-155</a>] -         Add Manufacturer, Model to SwitchType\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-156\'>PC-156</a>] -         Add minimum height to NetworkRadio\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-157\'>PC-157</a>] -         Create top-level Projects, with User HABTM Projects relationship\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-158\'>PC-158</a>] -         Create Site belongsTo Project relationship\r\n</li>\r\n<li>[<a href=\'https://tix.inveneo.org/browse/PC-159\'>PC-159</a>] -         Filter Site find results to just those Site that correspond to the Projects for a User\r\n</li>\r\n</ul>\r\n','2012-10-02 00:00:00');
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
  `mobile` varchar(255) NOT NULL,
  `skype` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `tower_owner_id` int(10) DEFAULT NULL,
  `install_team_id` int(10) DEFAULT NULL,
  `contact_type_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,'Clark','Ritchie','+1 (503) 936-2575','clarkritchie','critchie@inveneo.org',1,NULL,2),(2,'Andris','Bjornson','+1 (415) 205-7802','andris.bjornson','abjornson@inveneo.org',4,NULL,1),(3,'Jen','Overgaag','+1 (805) 440-9423','wyojeno','jovergaag@inveneo.org',1,NULL,2);
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
INSERT INTO `install_teams` VALUES (1,'Not Assigned'),(2,'Red Team'),(3,'Blue Team'),(4,'Green Team');
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
INSERT INTO `locations` VALUES (8,'\0\0\0\0\0\0\0\'�����2@�W�L�Q�'),(2,'\0\0\0\0\0\0\0�\r�e3@��ĬR�'),(12,'\0\0\0\0\0\0\0#�k$]2@u�<:R�'),(13,'\0\0\0\0\0\0\0�]���2@���;	R�'),(15,'\0\0\0\0\0\0\0�bg\n�2@$EdX�R�'),(16,'\0\0\0\0\0\0\0��(�2@гY��\"R�'),(17,'\0\0\0\0\0\0\0`��9Z2@�Z|\n�%R�'),(18,'\0\0\0\0\0\0\0�8�ߡ�3@\n�<IR�'),(19,'\0\0\0\0\0\0\0�w���3@���R�'),(20,'\0\0\0\0\0\0\0��+H33@`���-R�'),(21,'\0\0\0\0\0\0\0\n��ϛB3@�Y��!R�'),(22,'\0\0\0\0\0\0\0v28J^M3@�<�\'R�'),(23,'\0\0\0\0\0\0\0m�&3@�ڧ�1\'R�'),(24,'\0\0\0\0\0\0\0��N� 3@e���\"R�'),(25,'\0\0\0\0\0\0\0�$#ga3@4��ؙR�'),(26,'\0\0\0\0\0\0\0Zd;�O\r3@�j�R�'),(27,'\0\0\0\0\0\0\0͒\05�,3@\np	R�'),(28,'\0\0\0\0\0\0\0<1��PV3@HĔH�R�'),(29,'\0\0\0\0\0\0\0���a��2@��m���Q�'),(30,'\0\0\0\0\0\0\0�Բ��2@{Ic���Q�'),(31,'\0\0\0\0\0\0\05���#�3@3�f�#R�'),(32,'\0\0\0\0\0\0\0�M�#%3@�G�z\0R�'),(33,'\0\0\0\0\0\0\0Hm��~3@!v��yR�'),(34,'\0\0\0\0\0\0\0��&���2@;�O��R�'),(35,'\0\0\0\0\0\0\0�x\r��2@��K7	R�'),(36,'\0\0\0\0\0\0\0^h��H�2@{���R�'),(37,'\0\0\0\0\0\0\0fffff3@w�ӂR�'),(38,'\0\0\0\0\0\0\0���&�*3@,+MJAR�'),(39,'\0\0\0\0\0\0\0�eN��D2@�aۢ*R�'),(40,'\0\0\0\0\0\0\0��PN�;2@��|~R�'),(41,'\0\0\0\0\0\0\0����2@��\"�-%R�'),(42,'\0\0\0\0\0\0\0��鲘p2@��\\��R�'),(49,'\0\0\0\0\0\0\0C��f�2@�GG�\'R�'),(51,'\0\0\0\0\0\0\0uC���2@���R�'),(52,'\0\0\0\0\0\0\0�_�5�2@GZ*oGR�'),(53,'\0\0\0\0\0\0\0�u�Ӆ2@3�9A�%R�'),(54,'\0\0\0\0\0\0\0�{�P�2@�����R�'),(55,'\0\0\0\0\0\0\0�BB�2@m���\nR�'),(56,'\0\0\0\0\0\0\0�\"��~B3@L�$z!R�'),(57,'\0\0\0\0\0\0\0��bEm2@)�\'�$3R�'),(58,'\0\0\0\0\0\0\0M֨�h�3@�zNz�*R�'),(59,'\0\0\0\0\0\0\0`��9�2@V-\"R�'),(60,'\0\0\0\0\0\0\0��:�*3@;ŪAR�'),(61,'\0\0\0\0\0\0\0�&1�$3@I�f��\0R�'),(62,'\0\0\0\0\0\0\0$��S\0�3@��-s0R�'),(63,'\0\0\0\0\0\0\0A�,�$22@~}c�r$R�'),(64,'\0\0\0\0\0\0\0�wJ�2@���R�'),(169,'\0\0\0\0\0\0\0됛��3@�4c�t0R�'),(98,'\0\0\0\0\0\0\0�t��2@Y���Q�'),(99,'\0\0\0\0\0\0\0�Jw��D2@�ht�*R�'),(100,'\0\0\0\0\0\0\0)�\\��2@��r(R�'),(101,'\0\0\0\0\0\0\0Q�O�IZ2@���%R�'),(120,'\0\0\0\0\0\0\0�Hh˹L3@̗`\'R�'),(121,'\0\0\0\0\0\0\0c�=y 3@fk}��\"R�'),(122,'\0\0\0\0\0\0\0W�}W�3@�F ^�R�'),(123,'\0\0\0\0\0\0\0�+e�3@�|�͍R�'),(124,'\0\0\0\0\0\0\0jM�S<2@�j�R�'),(125,'\0\0\0\0\0\0\0��o_3@�H�}R�'),(126,'\0\0\0\0\0\0\0pܵƘ,3@,�T��R�'),(127,'\0\0\0\0\0\0\0>p|�o�2@��9��R�'),(128,'\0\0\0\0\0\0\0���Qp2@��:��R�'),(129,'\0\0\0\0\0\0\0B��U3@l����R�'),(130,'\0\0\0\0\0\0\0_)�Ǫ3@���e#R�'),(161,'\0\0\0\0\0\0\0�n��\\3@��v��R�'),(162,'\0\0\0\0\0\0\0�b(\'�%3@��kC\'R�'),(163,'\0\0\0\0\0\0\0oC���2@�U&�\rR�'),(164,'\0\0\0\0\0\0\0��ypw3@h��HK-R�'),(165,'\0\0\0\0\0\0\0vOj\r3@��.4�R�'),(166,'\0\0\0\0\0\0\0�[�hsC2@����R�'),(167,'\0\0\0\0\0\0\0p�n��3@ F�6R�');
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
  `site_id` int(10) DEFAULT NULL,
  `network_switch_id` int(10) DEFAULT NULL,
  `radio_type_id` int(10) DEFAULT NULL,
  `antenna_type_id` int(10) DEFAULT NULL,
  `elevation` smallint(6) DEFAULT NULL,
  `min_height` int(10) DEFAULT NULL,
  `frequency` int(10) DEFAULT NULL,
  `ssid` varchar(255) DEFAULT NULL,
  `switch_port` int(10) DEFAULT NULL,
  `link_id` int(10) DEFAULT NULL,
  `radio_mode_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `network_radios`
--

LOCK TABLES `network_radios` WRITE;
/*!40000 ALTER TABLE `network_radios` DISABLE KEYS */;
INSERT INTO `network_radios` VALUES (9,'BAYCT-BELDR',2,NULL,5,1,NULL,NULL,4920,'',NULL,13,3),(11,'BAYCT-CBRIT',2,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,37,NULL),(12,'BAYCT-HINCH',2,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,53,NULL),(13,'BELDR-BAYCT',8,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,9,NULL),(14,'BELVU-BARO',12,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,9,NULL),(15,'BELVU-BERNA',12,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,24,NULL),(16,'BELVU-BRACH',12,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,31,NULL),(17,'BELVU-GGOAV',12,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,41,NULL),(18,'BELVU-OBLEO',12,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,83,NULL),(19,'BCARE-BOSIO',13,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,26,NULL),(20,'BAYCT-020',2,NULL,5,1,NULL,NULL,4920,'',NULL,NULL,3),(21,'BAYCT-140',2,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,26,NULL),(24,'BERNA-BELVU',101,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,15,NULL),(25,'BERNA-JACML',101,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,58,NULL),(26,'BOSIO-BCARE',51,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,19,NULL),(27,'BOSIO-MIBAL',51,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,80,NULL),(28,'BOUTL-GRESS',52,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,43,NULL),(29,'BOUTL-OBLEO',52,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,84,NULL),(31,'BRACH-BELVU',53,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,16,NULL),(32,'BRACH-GRESS',53,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,44,NULL),(33,'BRACH-LEOGN',53,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,66,NULL),(34,'CARML-CBRIT',54,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,38,NULL),(35,'CARML-JANVI',54,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,62,NULL),(36,'CARML-MIBAL',54,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,81,NULL),(37,'CBRIT-BAYCT',55,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,11,NULL),(38,'CBRIT-CARML',55,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,34,NULL),(39,'CBRIT-OBLEO',55,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,85,NULL),(40,'DESAL-LESTR',56,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,67,NULL),(41,'GGOAV-BELVU',57,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,17,NULL),(42,'GMORN-HTPTN',58,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,56,NULL),(43,'GRESS-BOUTL',59,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,28,NULL),(44,'GRESS-BRACH',59,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,32,NULL),(45,'HILRE-HINCH',60,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,54,NULL),(46,'HILRE-JANVI',60,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,63,NULL),(47,'HILRE-LESTR',60,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,68,NULL),(48,'HILRE-MARML',60,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,74,NULL),(49,'HILRE-MASDE',60,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,79,NULL),(50,'HILRE-OBLEO',60,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,86,NULL),(51,'HILRE-PIGNO',60,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,88,NULL),(52,'HILRE-STMRC',60,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,93,NULL),(53,'HINCH-BAYCT',61,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,12,NULL),(54,'HINCH-HILRE',60,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,45,NULL),(55,'HINCH-MARML',61,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,75,NULL),(56,'HTPTN-GMORN',62,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,42,NULL),(57,'HTPTN-MARML',62,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,76,NULL),(58,'JACML-BERNA',63,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,25,NULL),(59,'JACML-MARIG',63,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,73,NULL),(60,'JACML-OBLEO',63,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,87,NULL),(61,'JACML-VERJN',63,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,95,NULL),(62,'JANVI-CARML',64,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,35,NULL),(63,'JANVI-HILRE',64,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,46,NULL),(64,'LASCB-BELDR',98,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,46,NULL),(65,'LAVLE-VERJN',99,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,96,NULL),(66,'LEOGN-BRACH',100,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,33,NULL),(67,'LESTR-DESAL',120,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,40,NULL),(68,'LESTR-HILRE',120,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,47,NULL),(69,'LIANC-HILRE',121,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,47,NULL),(70,'LIMB2-LIMBE',122,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,71,NULL),(71,'LIMBE-LIMB2',123,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,70,NULL),(72,'LIMBE-VERTI',123,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,97,NULL),(73,'MARIG-JACML',125,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,59,NULL),(74,'MARML-HILRE',125,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,48,NULL),(75,'MARML-HINCH',125,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,55,NULL),(76,'MARML-HTPTN',125,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,57,NULL),(77,'MARML-PILAT',125,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,89,NULL),(78,'MARML-VERTI',125,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,98,NULL),(79,'MASDE-HILRE',126,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,49,NULL),(80,'MIBAL-BOSIO',127,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,27,NULL),(81,'MIBAL-CARML',127,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,36,NULL),(82,'MIBAL-SODO',127,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,92,NULL),(83,'OBLEO-BELVU',128,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,18,NULL),(84,'OBLEO-BOUTL',128,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,29,NULL),(85,'OBLEO-CBRIT',128,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,39,NULL),(86,'OBLEO-HILRE',128,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,50,NULL),(87,'OBLEO-JACML',128,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,60,NULL),(88,'PIGNO-HILRE',129,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,51,NULL),(89,'PILAT-MARML',130,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,77,NULL),(90,'PRIVA-HILRE',161,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,77,NULL),(91,'PSOND-HILRE',162,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,77,NULL),(92,'SODO-MIBAL',163,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,82,NULL),(93,'STMRC-HILRE',164,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,52,NULL),(94,'VERET-HILRE',165,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,52,NULL),(95,'VERJN-JACML',166,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,61,NULL),(96,'VERJN-LAVLE',166,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,65,NULL),(97,'VERTI-LIMBE',167,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,72,NULL),(98,'VERTI-MARML',167,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(99,'WFPL-BRACH',49,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(100,'WFPL-STCRX',49,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(101,'BOSIO-070',51,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(102,'BOSIO-150',51,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(103,'BOSIO-320',51,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(104,'BRACH-040',53,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(105,'BRACH-160',53,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(106,'BRACH-280',53,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(107,'DESAL-070',56,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(108,'DESAL-130',56,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(109,'DESAL-250',56,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(110,'GGOAV-120',57,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(111,'GGOAV-240',57,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(112,'GMORN-000',58,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(113,'GMORN-120',58,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(114,'GMORN-240',58,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(115,'GRESS-000',59,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(116,'GRESS-120',59,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(117,'GRESS-240',59,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(118,'HILRE-270',60,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(119,'HINCH-090',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(120,'HINCH-210',61,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(121,'HINCH-330',61,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(122,'JANVI-052',64,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(123,'JANVI-172',64,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(124,'JANVI-292',64,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(125,'LASCB-000',98,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(126,'LASCB-120',98,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(127,'LASCB-240',98,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(128,'LAVLE-000',99,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(129,'LAVLE-120',99,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(130,'LAVLE-240',99,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(131,'LEOGN-000',100,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(132,'LEOGN-120',100,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(133,'LEOGN-240',100,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(134,'LESTR-110',120,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(135,'LESTR-230',120,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(136,'LESTR-350',120,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(137,'LIANC-040',121,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(138,'LIANC-160',121,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(139,'LIANC-280',121,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(140,'LIMB2-020',122,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(141,'LIMB2-140',122,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(142,'LIMB2-260',122,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(143,'LIMBE-080',123,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(144,'LIMBE-200',123,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(145,'LIMBE-320',123,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(146,'MARIG-000',124,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(147,'MARIG-120',124,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(148,'MARIG-240',124,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(149,'MASDE-070',126,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(150,'MASDE-293',126,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(151,'MIBAL-050',127,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(152,'MIBAL-170',127,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(153,'MIBAL-290',127,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(154,'PIGNO-080',129,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(155,'PIGNO-200',129,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(156,'PIGNO-320',129,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(157,'PILAT-000',130,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(158,'PILAT-120',130,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(159,'PILAT-240',130,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(160,'PRIVA-060',161,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(161,'PRIVA-200',161,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(162,'PRIVA-290',161,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(163,'PSOND-100',162,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(164,'PSOND-340',162,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(165,'SODO-095',163,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(166,'SODO-185',163,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(167,'STMRC-032',164,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(168,'VERET-020',165,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(169,'VERET-140',165,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(170,'VERET-260',165,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(171,'VERJN-000',166,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(172,'VERJN-120',166,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(173,'VERJN-240',166,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(174,'WFPL-090',49,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(175,'WFPL-270',49,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,78,NULL),(176,'FOO1Radio1',169,NULL,2,4,NULL,NULL,4500,'',NULL,78,NULL),(177,'HDO386-BOUTL',41,NULL,1,2,NULL,NULL,NULL,'',NULL,78,NULL),(178,'HDO386-BELVU',41,NULL,1,2,NULL,NULL,NULL,'',NULL,78,NULL),(179,'HDO386-WFPL',41,NULL,1,2,NULL,NULL,NULL,'',NULL,78,NULL),(180,'HDO386-LEOGN',41,NULL,1,2,NULL,NULL,NULL,'',NULL,78,NULL),(181,'FOO1',2,NULL,3,1,NULL,NULL,NULL,'',NULL,78,NULL);
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
  `router_type_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `network_routers`
--

LOCK TABLES `network_routers` WRITE;
/*!40000 ALTER TABLE `network_routers` DISABLE KEYS */;
INSERT INTO `network_routers` VALUES (2,'HDO386',1);
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
  `switch_type_id` int(10) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `network_switches`
--

LOCK TABLES `network_switches` WRITE;
/*!40000 ALTER TABLE `network_switches` DISABLE KEYS */;
INSERT INTO `network_switches` VALUES (10,'BAYCT-SW',1),(11,'BCARE-SW',1),(13,'BELVU-SW',1),(14,'BERNA-SW',1),(15,'BOUTL-SW',1),(16,'BRACH-SW',1),(17,'CARML-SW',1),(18,'DESAL-SW',1),(19,'GGOAV-SW',1),(20,'GMORN-SW',1),(21,'GRESS-SW',1),(22,'HILRE-SW',1),(23,'HINCH-SW',1),(24,'HTPTN-SW',1),(25,'JACML-SW',1),(26,'JANVI-SW',1),(27,'LASCB-SW',1),(28,'LAVLE-SW',1),(29,'LEOGN-SW',1),(30,'LESTR-SW',1),(31,'LIANC-SW',1),(32,'LIMB2-SW',1),(33,'LIMBE-SW',1),(34,'MARIG-SW',1),(35,'MARML-SW',1),(36,'MIBAL-SW',1),(37,'PILAT-SW',1),(38,'PRIVA-SW',1),(39,'PSOND-SW',1),(40,'SODO-SW',1),(41,'STMRC-SW',1),(42,'VERET-SW',1),(43,'VERJN-SW',1),(44,'VERTI-SW',1),(45,'WFPL-SW',1),(46,'HDO386-SW',1);
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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `power_types`
--

LOCK TABLES `power_types` WRITE;
/*!40000 ALTER TABLE `power_types` DISABLE KEYS */;
INSERT INTO `power_types` VALUES (6,'Other'),(2,'Solar'),(3,'120VAC'),(4,'220VAC'),(5,'-48VDC'),(7,'+24VDC');
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'Haiti (HRBN)');
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
INSERT INTO `projects_users` VALUES (1,1),(8,1),(11,1),(12,1),(13,1),(14,1),(15,1);
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
INSERT INTO `radio_modes` VALUES (1,'Station'),(2,'Station WDS'),(3,'Access Point'),(4,'Access Point WDS');
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `router_types`
--

LOCK TABLES `router_types` WRITE;
/*!40000 ALTER TABLE `router_types` DISABLE KEYS */;
INSERT INTO `router_types` VALUES (1,'Standard Router','Linksys','E2500');
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
  `img_name` varchar(255) DEFAULT NULL,
  `img_type` varchar(255) DEFAULT NULL,
  `img_size` varchar(255) DEFAULT NULL,
  `img_data` mediumblob,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_states`
--

LOCK TABLES `site_states` WRITE;
/*!40000 ALTER TABLE `site_states` DISABLE KEYS */;
INSERT INTO `site_states` VALUES (20,'Decommissioned','tower-r.png','image/png','1945','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0%\0\0\0#��G\0\0`IDATX���}lS��?����e��:pC�� ���B��H���DLF��\Z�5���Ĩ���ԄM���`\"Ƙ�΅����elS	�`CE�ڮ�����?z[����IN�m�����y�yn{۶hii�p9W�[k�L�\n��\0����w9\0�-�\0�7��pF�ByqP�\\5��Ё$s�f~��#������ϰ�Ph�sk���tuw�5����x�4�\n�N2������3�?N\Z�O��|hnw� V6K6�&m�����H �2����d��f2H���i^/����י(��u��|�9�m�&��b1ҢH6@���Ƶj�׋q�)Q�ex��QTu.ĵ��<�j/A�I��G��55h<������H��(˖a���}�1��a��N��.[���\"�e��\'�i�4c�F<���Qhh����q��b\'� ���L���6d�ך5�v�\"��Ε�~��x��r\0�V^��ۂ@����������۷�>{��o��ڵL��Mzx��;��q#��?b�:5G��ٲ�ɱ1L]���\0�R�D$Bڶ�ڷ���؇2�y3�ɓ��~��ӧqoقz�=x�mcb������R���Hw����%�Z���-�۲�_��w�N�u�<H��A�۶��u�s`\0y�b��G��E��+�|��e����#.o�DZ�qUT�L�\\\0g���I��I�sϑ�x��;� -Z������Q��������)��T:D�3ϐ!�?���q����XArbׂ%ʦ�H$p57#/]J��o���ާ�B��vb�K�￩7�\r����㏓>w���^B��I|�1\0�B��(���\0CC04Dzlך5�L��_�^<mm载$���O�>��������P��1��Pׯ\'����1۶=\0�W� x<H�\0���s+km-<��n��F2##\0Huud#l�B�4�?���,�$Id/_���qV,F6A^������݅g#;wb�bh�ߟ��O�`A�\"A�?��(?��v�}`�\'N��{/,Y���C:��=�|9V4������0ƩS�V��8y����[�UUɜ9C��y�\r, ��g�1Q�nE�r����={�z�mb{�BU��Q��X�$���K�.��IIB�4$Yf��a�@��#G��� �)�m�۵���:\0YfZH�Ro/��v�\r��a��.��zqoP�&�9�)s���G�etA@�m�--\0d\"����ߏa�SSǏc[�Çq�:��=�c���-\\�8=M������\"k\Z�hWk+�(2�(���a|�^j�}\0��O��_Hut����@�4��β�5P�����45��2��&U��S�ut��ES�X�vmn� �J$66�\Z\"�ЀVUu�Sp]\0���BQU&&&�-߃Po,GZ�\0��}L��������y��M+��s�6n,�H�u��J����@:�-��U���.�,w��?z�d2Ʌ+��9�v��O��\0��K��D��)2r)�9�i���sI�n*���|��с�J�t�f���ӧ�|�e�##T>�$����b�����4e��K:@2UE���1�2M2�F]O-��6���!�XǏ#�|L\'T9ox4���|t4-!\n�\0P�u\Z���MM����ճg\r�K�9��8��ɵK8MCqk&t��\'Qw�y}�3g\r����;_��kvk���4����]���\r?L`����?���ct�Bk�Y[�����kq�6аu+�U�f�2���t�B��U��\\P�=��9`\Z�:�9�\r�<B�)���~����*G<Ḟ*g7(����hx�Q\0F�ɯ<�<�o\Z�D���s� W\\7->/�Y�]ΐIn���7@D�(�G5�������J�^{\0\0\0\0IEND�B`�'),(19,'Equipment Recovered','tower-y.png','image/png','1873','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0%\0\0\0#��G\0\0IDATX����oW�?;��ٻ�^���ds��:i�ȊBڤB�Fj��6<V��u�d��C@��R� ��\0AjU�D!il�N�v|���sٹ�;\'�ul)���3�3s������9�����+W$@\0�f/�r�<�x���@���@\\�fS�\0�K��\0u�l�������r�xH4{��OL@*;x�6�{GGo��%?c�|�B���P.��5�ӣ�7�g�\"U_��i��K������\0�����S\"Um}��q]�v˲��$�8.��z����i��Ј|+���\\\rUUw���>��`�!P*%0����J�\r���bQ&���F5dy�;ki��@����ؔ�u��ln��4ST�G1���K*5�������?#۠���pX!\n��f��&�O��}�2��ڤT�0?�����:�/�NO���9��#�v�J%���%Ξ�%�3G&� \Z�u���3\0�b���LO�j�0��,�����H����iz{%&&�Q,r��O8u�wH�mdYCQ�PZW��&��33s�r�ǎ�����B��`a�]ߡ�k�d�1�/p�̯X^>������Ѵ%$i�C����c|ߧZ�bi�\"��I����-VW����wp]�dr�J15���I��������ȃ11�Ν�9��(��\0��\Z��2?���I6{�J0=�]dYgh��d2�@�3ܿ�_\'Y\'�cy�kln��V�C׫(J�-@��^,ˤR9�ad���m���.��E6{�p����u�ƮS��9s�:�����l[���[\0����4k�q�p��m�S.g�}�ht�	��2BW�$}}�aq���дM�����\\>F29@�4���Z���a��� V�\n���8Q\"���go���V���\"�5\0,+�,Wϓi��m�#�(���\0�f7�d �U���8aN��m��ӧ�(�lm\r��El;�r��{�\0���,\0�� ����=E�4H��Mw��m�뇐e�����\'$���T�\0��5�t�mco��!b�e4m���!l;«�~N29O4�̣Gg���av���<�g����a��<����`��5E��>�.\" \"������8Q���1}}��}/�(\0|_�Z��ˉ�X^>O�8DO�C���&�����j�����-4m�htQ0MA\0]?�����e��?��|�Q�tz�����x�@��tZ�m���q�)lo��t�H�\n��`.KK��@.�C�U��<��Ə��Q�x|����\r����� A&�� ���(Ȳ�m�\"�SS��\\n�O�zb�a�e�����ӓf``�H���^G��\0�X\rA����$A�����]G�+�v������#GN����wZ��tl����≖G�i�\Z�e0;�-\0l[�c����m��P�Fx�����ŋ?��g�E���y��=*�C$UR��9�\0Ύ�i��jt�ӂ\0��t�����py���r�bq��_��tz������J[GLs;�liJ<-�L\0]�\Z��짔�لBq�][g~�����ֽt�-$��DbA����M*5��x�9v�gS��r9�)�(L����G���e[[s\n_���,LրP\"`�(���agi&\0����d���/L���|.8���z�43o?�i�~t����e�����\n\'�ύ�lnu.N_P�}\0�y7�����s�\n7��sg�^��}y��5�T\ZykB��f�M:=�H��W��ܛM�Z���P\'{!@�X#W(�x^�\0��h�hB|	s^��\\�?�s��\Z��u\Z��\"~`�ARK5Xb����G��{��\0\0\0\0IEND�B`�'),(18,'Deactivated','tower-y.png','image/png','1873','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0%\0\0\0#��G\0\0IDATX����oW�?;��ٻ�^���ds��:i�ȊBڤB�Fj��6<V��u�d��C@��R� ��\0AjU�D!il�N�v|���sٹ�;\'�ul)���3�3s������9�����+W$@\0�f/�r�<�x���@���@\\�fS�\0�K��\0u�l�������r�xH4{��OL@*;x�6�{GGo��%?c�|�B���P.��5�ӣ�7�g�\"U_��i��K������\0�����S\"Um}��q]�v˲��$�8.��z����i��Ј|+���\\\rUUw���>��`�!P*%0����J�\r���bQ&���F5dy�;ki��@����ؔ�u��ln��4ST�G1���K*5�������?#۠���pX!\n��f��&�O��}�2��ڤT�0?�����:�/�NO���9��#�v�J%���%Ξ�%�3G&� \Z�u���3\0�b���LO�j�0��,�����H����iz{%&&�Q,r��O8u�wH�mdYCQ�PZW��&��33s�r�ǎ�����B��`a�]ߡ�k�d�1�/p�̯X^>������Ѵ%$i�C����c|ߧZ�bi�\"��I����-VW����wp]�dr�J15���I��������ȃ11�Ν�9��(��\0��\Z��2?���I6{�J0=�]dYgh��d2�@�3ܿ�_\'Y\'�cy�kln��V�C׫(J�-@��^,ˤR9�ad���m���.��E6{�p����u�ƮS��9s�:�����l[���[\0����4k�q�p��m�S.g�}�ht�	��2BW�$}}�aq���дM�����\\>F29@�4���Z���a��� V�\n���8Q\"���go���V���\"�5\0,+�,Wϓi��m�#�(���\0�f7�d �U���8aN��m��ӧ�(�lm\r��El;�r��{�\0���,\0�� ����=E�4H��Mw��m�뇐e�����\'$���T�\0��5�t�mco��!b�e4m���!l;«�~N29O4�̣Gg���av���<�g����a��<����`��5E��>�.\" \"������8Q���1}}��}/�(\0|_�Z��ˉ�X^>O�8DO�C���&�����j�����-4m�htQ0MA\0]?�����e��?��|�Q�tz�����x�@��tZ�m���q�)lo��t�H�\n��`.KK��@.�C�U��<��Ə��Q�x|����\r����� A&�� ���(Ȳ�m�\"�SS��\\n�O�zb�a�e�����ӓf``�H���^G��\0�X\rA����$A�����]G�+�v������#GN����wZ��tl����≖G�i�\Z�e0;�-\0l[�c����m��P�Fx�����ŋ?��g�E���y��=*�C$UR��9�\0Ύ�i��jt�ӂ\0��t�����py���r�bq��_��tz������J[GLs;�liJ<-�L\0]�\Z��짔�لBq�][g~�����ֽt�-$��DbA����M*5��x�9v�gS��r9�)�(L����G���e[[s\n_���,LրP\"`�(���agi&\0����d���/L���|.8���z�43o?�i�~t����e�����\n\'�ύ�lnu.N_P�}\0�y7�����s�\n7��sg�^��}y��5�T\ZykB��f�M:=�H��W��ܛM�Z���P\'{!@�X#W(�x^�\0��h�hB|	s^��\\�?�s��\Z��u\Z��\"~`�ARK5Xb����G��{��\0\0\0\0IEND�B`�'),(17,'HRBN Install Complete','tower-y.png','image/png','1873','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0%\0\0\0#��G\0\0IDATX����oW�?;��ٻ�^���ds��:i�ȊBڤB�Fj��6<V��u�d��C@��R� ��\0AjU�D!il�N�v|���sٹ�;\'�ul)���3�3s������9�����+W$@\0�f/�r�<�x���@���@\\�fS�\0�K��\0u�l�������r�xH4{��OL@*;x�6�{GGo��%?c�|�B���P.��5�ӣ�7�g�\"U_��i��K������\0�����S\"Um}��q]�v˲��$�8.��z����i��Ј|+���\\\rUUw���>��`�!P*%0����J�\r���bQ&���F5dy�;ki��@����ؔ�u��ln��4ST�G1���K*5�������?#۠���pX!\n��f��&�O��}�2��ڤT�0?�����:�/�NO���9��#�v�J%���%Ξ�%�3G&� \Z�u���3\0�b���LO�j�0��,�����H����iz{%&&�Q,r��O8u�wH�mdYCQ�PZW��&��33s�r�ǎ�����B��`a�]ߡ�k�d�1�/p�̯X^>������Ѵ%$i�C����c|ߧZ�bi�\"��I����-VW����wp]�dr�J15���I��������ȃ11�Ν�9��(��\0��\Z��2?���I6{�J0=�]dYgh��d2�@�3ܿ�_\'Y\'�cy�kln��V�C׫(J�-@��^,ˤR9�ad���m���.��E6{�p����u�ƮS��9s�:�����l[���[\0����4k�q�p��m�S.g�}�ht�	��2BW�$}}�aq���дM�����\\>F29@�4���Z���a��� V�\n���8Q\"���go���V���\"�5\0,+�,Wϓi��m�#�(���\0�f7�d �U���8aN��m��ӧ�(�lm\r��El;�r��{�\0���,\0�� ����=E�4H��Mw��m�뇐e�����\'$���T�\0��5�t�mco��!b�e4m���!l;«�~N29O4�̣Gg���av���<�g����a��<����`��5E��>�.\" \"������8Q���1}}��}/�(\0|_�Z��ˉ�X^>O�8DO�C���&�����j�����-4m�htQ0MA\0]?�����e��?��|�Q�tz�����x�@��tZ�m���q�)lo��t�H�\n��`.KK��@.�C�U��<��Ə��Q�x|����\r����� A&�� ���(Ȳ�m�\"�SS��\\n�O�zb�a�e�����ӓf``�H���^G��\0�X\rA����$A�����]G�+�v������#GN����wZ��tl����≖G�i�\Z�e0;�-\0l[�c����m��P�Fx�����ŋ?��g�E���y��=*�C$UR��9�\0Ύ�i��jt�ӂ\0��t�����py���r�bq��_��tz������J[GLs;�liJ<-�L\0]�\Z��짔�لBq�][g~�����ֽt�-$��DbA����M*5��x�9v�gS��r9�)�(L����G���e[[s\n_���,LրP\"`�(���agi&\0����d���/L���|.8���z�43o?�i�~t����e�����\n\'�ύ�lnu.N_P�}\0�y7�����s�\n7��sg�^��}y��5�T\ZykB��f�M:=�H��W��ܛM�Z���P\'{!@�X#W(�x^�\0��h�hB|	s^��\\�?�s��\Z��u\Z��\"~`�ARK5Xb����G��{��\0\0\0\0IEND�B`�'),(16,'Power Complete','tower-o.png','image/png','1983','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0%\0\0\0#��G\0\0�IDATX���{l���?����{;�Ж[��*�*�1��\0E2���0�͌�0Y��dfq���a������E\\`mI`0�U�����=�������s��=�&�I������{�����a\0�l�2S�(sg-��8�jllL\0�ad�M��qS@�C�@�2ollL^�7+n�����\'\Z�c<;K5#��i:q���Y�ǻ0s�CCo��i:1�ʍ�f�b5�Q�h$N$����D��[K&\rCO�:�y�S�	]G��H��Ր$IQH�	�.��$�,����A�e5[g�L:�Y�b����0�X�H0D��Fr��v��Z9��j#x|\Zf�D{A�y�$,�@N3{\'W�4�^�4�� 	�D���a���RR�Z^E�S����v���_��؁g�dL��w!�Y��n߸eZ(D�իȥ�x�lƵ�qR�(�$��\r{(X����z�<J�H�o���z��R7���|\0�P7i@2ɠχz���?�;,���/|N߁w�j 	�\\���c��w1��g.�����c���j�l�ּ\0���΃���)�)Ͼ��\\��t�y�Ѓ{���x���c�[N�$���\n������S�i��.�3��>�<�ț�0�|�|�}����6��wQ������D�J��4JI9���]�RY��^@�d�n�+�����%�cq�6��R�I�	�?x�������R4���n#���N���\0�˦3e�܏����vz��E�\r8�/G�r/���1;FAR$�X(��f治<�!zϷ?�&w��o��w1��������m�Ѯ��Y�2�����p-\\E�=7�\0���$.6�}��z�$�u� �v\n�MW~��(^�t�I�w�u���NL%�Xk��\0��s�	�5�0�t��=���YL����E�s�Z��b.�N��\0�����#�B0�d���,/�$	��\00y&�H�{1WT#�v.�~c���7~B2�1��4p�dW	�(���!��E!r�3\0�3c�\Z�/���.R�4��mB�u\0��$C�.^G��ᖓX��\0>wY��[�w�7�e.�����K�E�z�h{3���p.y��@Ji9���B�;�@�!�T<k�������(�B����ٌ$��|�Y̴_�%�܀ް�T2E��gp�������O�lE���q�R�\Z����X�ܸcȦ��]z�&��A�J+�$��2�%, >؇��g�淈�t��	6��J�w�]�DY��w,\0A1��QR�����\Z���Y5��q,zQ9�T��M��:&?�B:u;Z�9z�?K�C8\n�H�%7����{�@ie%�9����l���Q�Ħ4��8��| �H4�=e��qO�����*Y��:�2s�(*}݃�2.X����uJa)\0e�l��Ͽb��y\0�J,y��62&K^��.��^����iH6\'�X�	��H\Zy����P��,�H�9X��>\"�6��yb10�/nǳ�%�Մ(�V<��SY��G�X\\�oKfp	\\�d?�H$��������.�����Ļ�p�|\n��#�����Ӝ�̍vI���X\n\\�qu��a�u��ʨ}���3��Q\nJ��9�dq�(�g�p�Az�i͔��zM�(�����ߣ��уy���}C����>�4&=� �F@#�.�i\Z��f\"@ݑ���2���[�����~�(��w2���usk���iNs��u=M��V��]S3����:H��;�ᵕ�9�=���o�U�V�w�p�s�}�����,�y\n0z{~+ˀ���Ğ���z��gԦ�ϝ���}�{��2⡌kY�|6&@{]OSs������ٙ���m���@��9�.���M֌g��8��G�#>n�!٢�.����G�z��e��\0\0\0\0IEND�B`�'),(15,'Active','tower-g.png','image/png','2029','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0%\0\0\0#��G\0\0�IDATX���yl��?s��쬽��q\r6F@8�Q\nxihj(�&��\n9i@4�W��\n�Rh�TQs�4U)%AmԒƐ�%\'1`L�`s�X�����,6x1T���~;����~���F�yB4\Z`���2 f}���4 h���\0!\Z�\Z�f@�ݬ����C�����p�*`�G������c��R��ӫ���c�A�(���Հ�@�ժ�5�c�!�	�V��G�>\">Uej��зa`�)\0�͎l�\rD��苄��D�P��(�H�	-F����E�[wOV�\"��K��D��\rGQ�Ȃ4�%D�Po7�}�(��B�i�3O`�y*��v�����\"\Z��C$��c�A5V� ��>�p��\'��${!����L&[�dl��e�U��9�_�v�x�<Y�-*��E\r&��nLE�Q�~7N�eƪ�xr\\9�r���ce>i�fg��Y���$���ԩ��ašuk;IRZ����Ĥ���\r��ݝ��M.��-LJ����Z޺�7���7�fI�\"�\\�G���WK~���ټ?\'�>��+{��m(��5�a��S�ݽ��}\Z[�>�̴i�|�O,�x��_�x�ZN�}��Q0g��ڃ�9���kMO�ū%�ar�xڜ��b1�X�hT�����Ǭa���Ѱ�m\r��~�r���3���/���Q�x�d+��ט�<��G~�,H�=w�f�Ȃ��	P�Ļ��ߍ�f�u\\�^�����T�y~ʳt�\\l:�K*���0a4;��c���&^:�G֌��g/dB�8��N��w�f��Y0�{��:���|�\\���u+|�\\5��_���Jt���j\'iJ\n�T����&~2~=#Lv�<����o��v��K����c�z�x�R�:Y�9�:G�lcE�R>i��K��Â�bϼ>�w\\�^��s!G�df�4�u�\0`��Y�C�X�a	�FQ%+\0�@�d%ՒL��\0�r��2��\\p_ ۚIG�����\"Y@?򇲸I�5� ϖKo�M{��\"{	���ϟ���h�z�ne�����4%I�v� �L&�t~	����� ���F����R��)�p�\"{=a+�q���wgZ�d\0�� �?�㮈gZ\Zht_bA�\\R�#���.�=u�w�fը�8=��$g���Ml9�?=�+��$��S���q��\Z�b�s$�g2)����]�Z��=��|��)/��B��XW����l\0L���bO�����G�W�0c.�[��kE��bq�%`M1�$&���4y.��nD�dL��\"�������r���ߣ��hn>n�-���q.)�b��b��h�A&i$�F�j���u��H����%����v\Z��<V���`C�s�V;���e퉟�Q��s��V�8�x[�f�r��LdY�0�,\\�;��9���!�Y�%�������T�I��C�������Q�R,<�m K,�- ��I����H\0�����\'�2�����jό���	����f��͏e��	�\0<;q\0BD�#��1�q@�/����犝�|>J�}����!D�(�R���+�ȖOoo)�E�%�\"- �6��%)�II��ߔ�z�>��9�˰)vζ���c�9�����U�5��\'���27ڥ\0@��B�$�R=�c���Ր!\'1c���ڴ�Y�)�TvV�`��	{��5e��noA�˸蘚�p8�@0��4&�\'}���	Cjy�]j9CM��!����	�\0C�\0��z�0�5��[md\n��-xc�ij���(��O�usk\0�;iNc��Ue�/�������\Z�p�$�\'��QQ:����9�=7Ɓ�[�f|N� ���a�8*J��,�}H`���v�S诓��ɥ�k��;��k�����Stp��(�\rK �����N_����42�p�wL`v��q��s��u��wE�&�����_z�݀�5�$��4^U��\r8���\ZJU\0\0\0\0IEND�B`�'),(21,'Planned','tower-b.png','image/png','1813','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0%\0\0\0#��G\0\0�IDATX���lg�?�;��I׎��ͯ�i�Ȳh+K;��[�N�P�:6i��!��H�@�@��@��4���v�A0!��a�J۬YS��I��M��ul����?|��Y�4Sy�W�}�{���<���>6�0\0غu���l%nn�:�����,��0K��fu�\0�M�M�4��5��ӓ�uvvZ�n��le�?P�5۴e�l�W����,|]��h�ԁl���}F�����ۍ,�7UXUUE�o,��a;Ђ���\'���N.�#�� ��!�$��f)))!��!��Gޝ7�g��V]P�0��4�x��\Z\'�N�X�E2R�Պ�����%��ɏ�d4�`�9M+���l6���S峱�u��2-�%��2��n����C�����8���EƧ�8�Nl6[�i��h1MӈD\"ԇ�<y\r����tD�F��^��g�Q�hm(��{W�ԋ���S����,&�4@,v�\r�%|��F�k������\'xs`���e�m��f*��|����r~�6���!�Oa��q8 �H`r�ٵ���e�{c���~�@����[Ů�ռ;��pI�ѵ�=>���gY��MO$�!\n]��\0�a��y�s%��8�����|nc�o�\\��)20:Ke���v�g�J�j/����`c�3-�}���?8F&�)ꅢ\0�t\Z���\Z&��x��A��=��1���W����Pr��W[x|�j�]V�ş��yw�[4��r!�(\Z���Ѷ��ڐ�#Ǧ��Qy��jV�����1��\Z��ۘ�ކ�����8wY�+;j)uK�\0��� ���)��dhm(C�;�����^ɿ#��K<|O��������r��y*�2mk�85\Z�S�}�r����˙?�fbi\\N�r���i�mw����PJ]�Ź���P��H<���v듿,\0Q���P�I���̦i���v�|��sc���G<��ӟ�piF�_bGlD����\0v��#y7�7��et�}&ʝM�Ԇd���̍]S�f6�aG{�3���R_\n�;g�HR��^���t2<a|Ja�-~|���IN�%� �;VKf(��y��z~��<��e�!���Ԣh9��8�Ώ�Q�m�$�^;?�Z+Gc��h�\\N�K[�)���V�iM��D����pW�n����U.G5\\.��\0�^/�z.0>�b�bQQUA���|F�/���\'�4��b��`]7��D�\n�.��\0	\r�xq��\ZA�$R�l�o�������7x�{��h��pp�B���r�ޓ3�=%Bq�EDQ$��^�� ~��D\"���5��!��6�w���T�@ �;#Y��+�ey�]����n�ϵљ$I��e\0��۸���lϮ���=BMM��v/5���	Ea���랕�>������7�������@]�Q�q�wm`S�?��E�4d��s��x��\Zj+�D�I|>ߒSZ\0ق����A���G��i�~�4�T������D�|��C*�lYͫ}�>Js��K*��������K�����a���4�����$�?�At]���k�����m�����X$1������/h���D[��LL��k@��J>]�L\Z\nS3�o,��e퍈w��e>��k~j���$�sw�>#||1O�����U<9]\"=������B�m���:,��/VL0�|�xM�S�⭦x¬�%T�,	P�ky(�<�2�o`�R�8`�y�|pݰ��\0�A��jݵ��]�,G|�\0VPZ[��b���9\0��P��\0\0\0\0IEND�B`�');
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
INSERT INTO `sites` VALUES (2,'Baycite','BAYCT','19.05623000000000','-72.01707000000000','-9.94338000000000','Guard\'s name 555-5555-5555',3,'2012-09-28 00:00:00',2,15,1,1,1,1,1,7,NULL,9,NULL,'Transversal installed weather-tight enclosure for Inveneo router-switch board March 2012. Was cabinet.','Standard triangular Voila tower. Platform?','Beam clamps','Steep, rough dirt road. High clearance 4x4 required. Key no longer needed for access to Inveneo equipment on site.','Cyber-training center of George/Pierre in Hinche','L\'Hermitage Pandiassou hotel just outside of Hinche (call ahead)','(Old notes - done?) Need to move CBRIT dish to other side of tower. When you are up there, switch HINCH radio to sta to get a link up',1),(8,'Belladere','BELDR','18.85092000000000','-71.78593000000000',NULL,'',1,NULL,2,15,1,NULL,NULL,NULL,NULL,6,12,NULL,NULL,'','Standard triangular Voila tower with platform','Existing standoffs, plus 1 pole mounted with beam clamps just below the platform on the NW side. Pole is necessary to get away from a large grill dish (non-Viola) mounted on one of the standoffs.','Short, steep dirt road, 4x4 recommended','','Germain guest house','',1),(12,'Bellevue','BELVU','18.36383700000000','-72.90718000000000',NULL,'',1,NULL,9,15,1,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,'','Small, old, very crowded triangular tower','Numerous abandoned round standoffs. Beam clamps may not work due to the large number of other antennas already present. Custom standoffs may be needed.','Foot, donkey or helicopter (verified). Road destroyed in landslide past Chamer?','On site','Bring tent and water.','',1),(13,'Boucan Carré','BCARE','18.92106118000000','-72.14426114000000','-9.85128000000000','',1,NULL,2,15,1,1,1,1,NULL,5,11,NULL,NULL,'','','Beam clamps','','','','8-port H3C DC switch:\r\n- port 1 (vlan 11) - BCARE-BOSIO\r\n- port 2 (vlan 12) - BCARE-100\r\n- port 3 (vlan 12) - BCARE-340\r\n- port 9 - trunk to Mikrotik',1),(15,'HDC225','HDC225','18.95719000000000','-72.37142000000000',NULL,'',1,NULL,9,21,10,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,'','','','','','','',1),(16,'','DELPECHE','18.92640000000000','-72.54260000000000',NULL,NULL,1,NULL,0,21,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(17,'HDS007','HDS007','18.35244000000000','-72.58594000000000',NULL,'',1,NULL,9,21,1,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,'','','','','','','',1),(18,'HDN008','HDN008','19.72122000000000','-72.22322000000000',NULL,'',1,NULL,9,21,10,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,'','','','','','','',1),(19,'HDN208','HDN208','19.70678000000000','-72.40367000000000',NULL,'',1,NULL,9,21,1,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,'','','','','','','',1),(20,'HDC004','HDC004','19.08672000000000','-72.71794000000000',NULL,'',1,NULL,9,21,10,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,'','','','','','','',1),(21,'HDC260','HDC260','19.26019000000000','-72.51653000000000',NULL,'',1,NULL,9,21,10,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,'','','','','','','',1),(22,'HDC274','HDC274','19.30222000000000','-72.60956000000000',NULL,'',1,NULL,9,21,10,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,'','','','','','','',1),(23,'HDC263','HDC263','19.15114000000000','-72.61242000000000',NULL,'',1,NULL,9,21,10,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,'','','','','','','',1),(24,'HDC264','HDC264','19.12856000000000','-72.54686000000000',NULL,'',1,NULL,9,21,10,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,'','','','','','','',1),(25,'HDC280','HDC280','19.12258000000000','-72.47814000000000',NULL,'',1,NULL,9,21,10,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,'','','','','','','',1),(26,'HDC267','HDC267','19.05200000000000','-72.46558000000000',NULL,'',1,NULL,9,21,10,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,'','','','','','','',1),(27,'HDC220','HDC220','19.17464000000000','-72.14114000000000',NULL,'',1,NULL,9,21,10,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,'','','','','','','',1),(28,'','HDN216','19.33717000000000','-72.11928000000000',NULL,NULL,1,NULL,0,21,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(29,'HDC203','HDC203','18.83103000000000','-71.93286000000000',NULL,'',1,NULL,9,21,10,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,'','','','','','','',1),(30,'HDC318','HDC318','18.90121000000000','-71.85246000000000',NULL,'',1,NULL,9,21,10,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,'','','','','','','',1),(31,'HDN210','HDN210','19.66461000000000','-72.54856000000000',NULL,'',1,NULL,9,21,10,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,'','','','','','','',1),(32,'HDC200','HDC200','19.14508000000000','-72.00750000000000',NULL,'',1,NULL,9,21,10,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,'','','','','','','',1),(33,'SDH009','SDH009','19.49803000000000','-72.33556000000000',NULL,'',1,NULL,9,21,10,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,'','','','','','','',1),(34,'HDC212','HDC212','18.90519000000000','-72.07175000000000',NULL,'',1,NULL,9,21,10,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,'','','','','','','',1),(35,'HDC230','HDC230','18.92183000000000','-72.14400000000000',NULL,'',1,NULL,9,21,10,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,'','','','','','','',1),(36,'HDC201','HDC201','18.82533000000000','-72.10606000000000',NULL,'',1,'2012-09-13 00:00:00',9,21,10,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,'','','','','','','',1),(37,'SDH017','SDH017','19.05625000000000','-72.01706000000000',NULL,'',1,NULL,9,21,10,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,'','','','','','','',1),(38,'SDH010','SDH010','19.16614000000000','-72.36336000000000',NULL,'',1,NULL,9,21,10,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,'','','','','','','',1),(39,'HDS300','HDS300','18.26864000000000','-72.66619000000000',NULL,'',1,NULL,9,21,1,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,'','','','','','','',1),(40,'HDS017','HDS017','18.23322000000000','-72.38272000000000',NULL,'',1,NULL,9,21,1,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,'','','','','','','',1),(41,'HDO386','HDO386','18.54132000000000','-72.58091000000000','-9.54881000000000','',1,NULL,1,21,10,1,1,1,1,7,46,2,NULL,'','','','','','','',1),(42,'SDH011','SDH011','18.43983000000000','-72.29172000000000',NULL,'',1,NULL,9,21,1,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,'','','','','','','',1),(49,'World Food Program - Léogâne','WFPL','18.50937000000000','-72.61989000000000',NULL,'Karen Barsamian, WFPL 3785 7133, karen.barsamian@wfp.​org (in PauP) JeanSerge Seide, JeanSerge.Seide@wfp.org, +509 38 82 04 44 (on site in Leogane) At the front gate ask for Frederic. Also, Yves runs operations for WFP in Leogane.',1,NULL,1,15,9,NULL,NULL,NULL,NULL,6,NULL,9,NULL,'','~20m small freestanding angle-iron construction tower with outside foot pegs and diagonal 3/4\" round cross-supports (no horizontal supports anywhere on the tower). Inside equipment is in an air conditioned shipping container adjacent to the tower. Our equipment is along the back wall of the container, mostly attached to the wall via zip ties.','Nanobridge is mounted on a pole attached to one face of the tower with 2 stainless steel hose clamps. sectors are bolted directly to the L-shaped uprights.','In town. Inside the MINUSTAH Léogâne base near the WFP shelters and adjacent to a 2m satellite dish.','None','None','9 Jan 2012 UPDATE - Network equipment now plugged directly into AC of server-room UPS. (Fixed problem apparently caused by intermittent Phocos charge controller and possibly other components.)\r\n[NOW REMOVED: 110VAC with 12VDC battery backup system (15VDC power supply, 10A Phocos charge controller, (1) sealed 12V battery, and small inverter.]\r\n\r\nIn OpenNMS and on radios: WFPL-090 = leo-base-033, WFPL-270 = leo-base-240 Two 17db sectors',1),(51,'Bosiaux','BOSIO','18.89656891000000','-72.09365890000000',NULL,'Fedner 3697 3106 or 3443 8656',1,NULL,2,15,1,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,'Cabinet','','1 beam clamp for 25db Nanobridge, plus existing standoffs on top of platform','Very wet, muddy dirt road. 4x4 required.','','','- 25db link to MIBAL\r\n- 30db link to BCARE\r\n- Three 16db sectors',1),(52,'Boutilliers','BOUTL','18.50748000000000','-72.31686000000000',NULL,'Reggie Chauvet: tel:+509 37010044 (Digicel - preferred), tel:+509 34100044 (Voila), tel:+1 954-205-4606 (US), mailto:rchauvet@haicom.com, or Skype:papiepou',1,NULL,9,15,4,NULL,NULL,NULL,NULL,3,NULL,9,NULL,'The top Inveneo cabinet is Ruralnets / HRBN Network. The bottom Inveneo cabinet is HAICOM / PaP Net / NetHope Network.','Sturdy 60m freestanding triangular tower using round uprights','Rocket dishes and sectors can mount directly on these uprights.','\"Steep paved road (Laboule 12) from Route de Kenscoff at Delimart.\r\nHaicom tower is almost directly across from the scenic overlook site.\r\nLook for the blue gate on the opposite side from the overlook.\"','','','Extensive details in tower notes, see Zone 0 (tower notes) - http://10.0.2.1:8880/node/54.\r\n\r\nThere is an inverter and a UPS in the building.',1),(53,'Brache','BRACH','18.52276600000000','-72.58760100000000','-9.54115000000000','3443-8571 called on last Friday around 3 pm. 3765-0205 (not sure if this one is correct). (Eyleen, March 26, 2012)',1,NULL,1,15,1,1,1,1,NULL,3,NULL,NULL,NULL,'Enclosure','','','Site in the Leogane area (to the east of town immediately before the bridge)','','','110 VAC from shared -48v inverter',1),(54,'Morne Carmel (Mirebalais 2)','CARML','18.82545000000000','-72.10625000000000',NULL,'\"SonSon\" Lucener 3469 1921',1,NULL,2,15,1,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,'','','','Short steep dirt road from town, usually in decent condition. 4x4 recommended','','','',1),(55,'Cabrits','CBRIT','18.70804000000000','-72.17028000000000',NULL,'Larousse 3851 7638 (also arranges storage and transport of materials to the site)',1,NULL,2,15,2,NULL,NULL,NULL,NULL,2,NULL,9,NULL,'','Solar system designed and installed by:\r\n\r\nEnersa\r\nAlex \r\nalexgeorges@gmail.com\r\n372-755-76\r\n374-603-25\r\nInstaller\r\nJean  Ronel\r\njrnoel@enersahaiti.com\r\n','One existing standoff for JANVI and MIBAL links, pole with U-bolts for CBRIT link','Foot or donkey from Fond Cheval','Small shelter onsite, very limited space; larger space available at start of trail accommodation: bring tent','','\"16-port AC-powered switch:\r\n port1 = vlan11 = CBRIT\r\n port2 = vlan12 = JANVI\r\n port3 = vlan13 = MIBAL\r\nStatus:\r\n - 30db to CBRIT\r\n - 30db to JANVI\r\n - 22db to MIBAL\"',1),(56,'Dessalines','DESAL','19.25975000000000','-72.51718000000000',NULL,'Ask Jeffrey Carré (Transversal) for contact info.',1,NULL,6,15,1,NULL,NULL,NULL,NULL,5,NULL,9,NULL,'Independent enclosure board installed 4 April 2012.','Triangular with platform?','Standoffs were in use already?','In town. Independent enclosure board installed, so key from Voila not needed.','','','-25db dish to LESTR - Signal strength -56 to -57 dB (4 April 2012). Three 16db sectors.',1),(57,'Grand Goâve','GGOAV','18.42684000000000','-72.79913000000000',NULL,'',1,NULL,1,15,1,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,'Enclosure','','','','','','',1),(58,'Gros Morne','GMORN','19.67347000000000','-72.66989000000000',NULL,'',1,NULL,8,15,1,NULL,NULL,NULL,NULL,6,NULL,9,NULL,'','','','','','','',1),(59,'Gressier','GRESS','18.53994000000000','-72.53400000000000',NULL,NULL,1,NULL,1,15,1,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(60,'Hilaire','HILRE','19.16624800000000','-72.36338300000000',NULL,'24/7 on-site guards who have the shelter keys. No need to call ahead.',1,NULL,9,15,1,NULL,NULL,NULL,NULL,3,NULL,9,NULL,'','Two towers on-site. We are using the square tower.','Beam clamps to 4 poles','Very steep, rough road from Petite Riviere (1hr) - high clearance 4x4 required.','','Bring tent and lots of water to sleep on site. Le Gou-T Hotel in St Marc.','\"More details in tower notes, see Zone0 (tower notes) - http://10.0.2.1:8880/node/54.\r\n24-port AC-powered H3C switch:\r\n Port1 = vlan10 = HILRE-OBLEO\r\n Port2 = vlan11 = HILRE-270\r\n Port3 = vlan12 = HILRE-JANVI\r\n Port4 = vlan13 = HILRE-MASDE\r\n Port5 = vlan14 = HILRE-HINCH\r\n Port6 = vlan15 = HILRE-PIGNO\r\n Port7 = vlan16 = HILRE-STMRC (no cable run, may be replaced)\r\n Port8 = vlan17 = HILRE-GNAIV (no radio, no cable run)\r\n Port9 = vlan18 = HILRE-MARML (no IP configured)\r\n Port24 = vlan1 = administrative access port\r\n Port25 = trunk to Mikrotik\r\n Port26 = administrative trunk port\"',1),(61,'Hinche (Hinche2)','HINCH','19.14325000000000','-72.01257000000000',NULL,'Mezan 3443 8694 or 3494 4100',1,NULL,2,15,1,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,'Cabinet','Standard triangular Voila tower with platform','Standoffs on platform','In town','Cyber-training center of George/Pierre in Hinche,.5 or 6 poles still at the tower location (?).','L\'Hermitage Pandiassou Hotel just outside of Hinche (call ahead)','-48 VDC (use 24 VDC converter)\r\n- 30db link to HILRE\r\n- 30db link to BAYCT\r\n- (3) 16db sectors\r\nThis is Hinche2. Contact for Hinche1 (up on the hill) is Ezai 3480 6791 or 3443 8292.',1),(62,'Haut Piton','HTPTN','19.85938000000000','-72.75703000000000',NULL,'',1,NULL,8,15,1,NULL,NULL,NULL,NULL,6,NULL,9,NULL,'','','','','','','',1),(63,'Jacmel (Jacmel 1)','JACML','18.19587643000000','-72.56950340000000',NULL,'Michelle Joseph Fosten 3110 9756',1,NULL,7,15,1,NULL,NULL,NULL,NULL,5,NULL,9,NULL,'','Small square tower inside a tiny enclosure with a small adjacent shelter. The tower is extremely crowded with existing antennas. Using a rope on this tower will be very challenging. May want to anchor on the far edge of the roof of the adjacent shelter.','Probably beam clamps on horizontal beams near the top of the tower on the East face. There are some partially free standoffs near the bottom of the tower, but these are probably not appropriate for our use.','In the Bellevue neighborhood past Ça Titi in Jacmel commune. About 1 hour on well maintained dirt roads from Jacmel town. Getting there requires fording the Grande Rivière de Jacmel (up to 3 fordings) and the Petite Rivière de Jacmel (1 fording), both just outside of town. If you are not sure which way to go, ask anyone which way to \"Ça Titi\". Do not attempt crossing during or immediately after rain. 4x4 required.','Minimal storage in crowded shelter','Hotels in Jacmel town. Book 2 weeks ahead for weekend days.','-48VDC and 110VAC currently available. Need to check if the 110VAC is on the main battery stack.',1),(64,'Janvier','JANVI','18.96598000000000','-72.36761000000000',NULL,'Rosemonde 3632 9562',1,NULL,2,15,1,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,'Building','','','Rosemonde can be found the second left after the bridge if coming from the tower turnoff.','','','',1),(98,'Lascahobas','LASCB','18.83600000000000','-71.93621000000000',NULL,'Evanel Isalem 3924 1843, 3699 6881, 3755 2791',1,NULL,10,15,1,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,'','Standard triangular Voila tower','Several existing standoffs','Steep, dirt and rock path. High clearance 4x4 required.','','Not available','',1),(99,'La Vallée de Jacmel','LAVLE','18.26894900000000','-72.66705500000000',NULL,'',1,NULL,7,15,1,NULL,NULL,NULL,NULL,6,NULL,9,NULL,'','','','Undated note: did not visit as river was too high to cross at the time','','','',1),(100,'Léogâne','LEOGN','18.51003056000000','-72.63198889000000',NULL,'Site contact: Wesley 3769 7334 Power technician: Dukens 3636 3761',1,NULL,1,15,6,NULL,NULL,NULL,NULL,6,NULL,9,NULL,'','','','','','','',1),(101,'Bernard','BERNA','18.35269000000000','-72.58593000000000',NULL,'Denais 3443 8505',1,NULL,7,15,1,NULL,NULL,NULL,NULL,5,NULL,9,NULL,'Enclosure: combination lock 6-22-10','Standard triangular Voila tower with angle-iron construction and platform at top. The outer wall fell down in the earthquake and has no been replaced. The neighbors say that thieves are constantly visiting the site at night to attempt to steal things (diesel fuel perhaps?).','Lots of free standoffs on platform at top','Very short steep unpaved road off highway to Jacmel (towers clearly visible from the road). 4x4 recommended.','None','None','',1),(120,'L\'Estere','LESTR','19.29971000000000','-72.61129000000000',NULL,'Jean-Baptiste 3473 3279',1,NULL,6,15,1,NULL,NULL,NULL,NULL,5,NULL,9,NULL,'','Very wide, tall, square tower with a platform. Like LESTR but much shorter.','Beam clamps in corners at platform height','In town','','','- 30db dish to HILRE\r\n- 25db dish to DESAL\r\n- Three sectors',1),(121,'Liancourt','LIANC','19.12685000000000','-72.54398000000000',NULL,'Alfred 3443 8423. Alfred actually follows the rules, so call the Voila NOC in advance for authorization.',1,NULL,6,15,1,NULL,NULL,NULL,NULL,5,NULL,9,NULL,'','Nice large standard triangular tower with platform','Standoffs on platform','In town immediately on the main road','','','- use 24 VDC converter\r\n- 30db dish to HILRE\r\n- Three 16db sectors\"',1),(122,'Limbé 2','LIMB2','19.70446000000000','-72.40377000000000',NULL,'',1,NULL,8,15,1,NULL,NULL,NULL,NULL,6,NULL,9,NULL,'Enclosure','','','','','','',1),(123,'Limbé (Limbé 1)','LIMBE','19.69095000000000','-72.33678000000000',NULL,'',1,NULL,8,15,1,NULL,NULL,NULL,NULL,6,NULL,9,NULL,'','','','','','','',1),(124,'Marigot','MARIG','18.23565000000000','-72.30933000000000',NULL,'Fredo at 3443 8565.  Can also try Cristanne at 3443 8424 (not reached).',1,NULL,7,15,1,NULL,NULL,NULL,NULL,5,NULL,9,NULL,'','Standard triangular Voila tower of angle-irons with a top platform with standoffs','Free standoffs on platform','Short, steep, slightly overgrown road that leaves the main road at 18.23354,-72.31386. 4x4 required.','None','Possibly hotels in Marigot. Recommended hotel in Ti Mouillage is Hotel Kabic (3780 6850 - good Internet!). On weekends you may be stuck at the less comfortable but still clean Hotel l\'Amité (3888 9386).','',1),(125,'Marmelade','MARML','19.49755000000000','-72.33580000000000',NULL,'Molijen Jula 3427 7773',1,NULL,8,15,1,NULL,NULL,NULL,NULL,6,NULL,9,NULL,'','','','The site is approximately 600m from the town of Marmelade. From the welcome statue, veer right up the steep road at 19.517253,-72.362393. You will pass first the Access Haiti tower, then the Digicel tower, then finally you will come to the Voila towers—a small triangular tower like Janvier, and a medium sized square tower, like Hilaire. The site has perhaps the best view of any site in Haiti. You can see Cap Haïtien from the roof of the shelter, the central plateau, and even as far as Obleon.','','','',1),(126,'Maïssade','MASDE','19.17420618000000','-72.13999923000000',NULL,'',1,NULL,2,15,1,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,'','Standard triangular Voila tower with platform','Round standoffs on top platform','In town center','Save the Children','Save the Children guest house (5 minute drive)','- 30db link to HILRE\r\n- Two 17db sectors',1),(127,'Mirebalais (Mirebalais 1)','MIBAL','18.83373323000000','-72.10544377000000',NULL,'\"SonSon\" Lucener 3469 1921',1,NULL,2,15,1,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,'Cabinet','','Beam clamps on 3 sides, using one existing standoff at very top of tower for 2 sectors','In town center','Limited storage at WorldVision office in Mirebalais','Mirage Hotel in main town square (convenient) or Wozo Hotel on the road toward Hinche (nice)','16-port H3C AC-powered switch installed\r\n - port 1 (vlan 11) MIBAL-CARML\r\n - port 2 (vlan 12) MIBAL-BOSIO\r\n - port 3 (vlan 13) MIBAL-SODO\r\n - port 4 (vlan 14) MIBAL-050\r\n - port 5 (vlan 14) MIBAL-170\r\n - port 6 (vlan 14) MIBAL-290\r\n - port 18 - trunk to Mikrotik\r\nStatus:\r\n- links to CARML (22db), BOSIO (25db), SODO (30db)\r\n- Three 16db sectors',1),(128,'Obleon','OBLEO','18.43875000000000','-72.29069000000000',NULL,'Enoch 3441 0218',1,NULL,9,15,1,NULL,NULL,NULL,NULL,3,NULL,9,NULL,'','2 towers on site, one triangular tower with 2-3\" rounds and one new octagonal tower. We are using the old, flimsy triangular tower. There are foot pegs on the outside on one side of the tower.','Direct mounting on the tower rounds. Could use custom standoffs or U-bolts, but the tower is not compatible with beam clamps.','Steep paved road, 1 hour from Petionville. Take the road toward Furcy past Kenscoff and turn right at the first paved road after the Petit Freres et Soeurs sign (on the left). Follow this road until you reach the towers.','On site storage room next to main equipment room','','110VAC via -48v inverter for our use\r\n16-port AC-powered switch installed\r\nport1 - OBLEO-BOUTL\r\nport2 - OBLEO-HILRE \r\nport3 - OBLEO-JACML\r\nport4 - OBLEO-BELVU\r\nport5 - OBLEO-CBRIT',1),(129,'Pignon','PIGNO','19.33504552000000','-72.11776798000000',NULL,'',1,NULL,2,15,1,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,'','Standard triangular Voila tower with platform','Round standoffs on top platform','In town center','Haiti Outreach','Haiti Outreach guest house','-48 VDC in cabinet (use 24 VDC/VDC converter)\r\n- 30db link to HILRE\r\n- Three 16db sectors',1),(130,'Pilate','PILAT','19.66710000000000','-72.55308000000000',NULL,'Junior 3443 8896',1,NULL,8,15,1,NULL,NULL,NULL,NULL,6,NULL,9,NULL,'','','','The town of Pilate is accessible via a bumpy mud and rock road, 45 minutes from Gros Morne, and 1 hour from Plaissance. The site is in the main paved square of Pilate. The tower is a large triangular tower with upper platform. The grounding plate at the base of the tower is quite high off the ground, but otherwise the site is straightforward. The guard lives diagonally across the main square from the tower in the house with the large red gate.','','','',1),(161,'Petite Rivière de l\'Artibonite','PRIVA','19.12251000000000','-72.48166000000000',NULL,'Ask Jeffrey Carré (Transversal) for contact info.',1,NULL,6,15,1,NULL,NULL,NULL,NULL,5,NULL,9,NULL,'','Wide but short square tower with a platform. Like LESTR but much shorter.','Beam clamps in corners at platform height','In town','','','',1),(162,'Pont Sondé','PSOND','19.14786000000000','-72.61349000000000',NULL,'Eval 3443 8323',1,NULL,6,15,1,NULL,NULL,NULL,NULL,5,NULL,9,NULL,'','Standard triangular Voila tower with platform','Standoffs on platform','In town near the soccer field','','','-48 VDC (use 24 VDC converter)\r\nEquipment:\r\n- 30db dish to HILRE\r\n - Three 16db sectors\r\nOther:\r\nother:\r\n - 1.5\"\" EMT bars stored on site\r\n - Watch out for the killer bees.',1),(163,'Saut d\'Eau','SODO','18.82249378000000','-72.21422652000000',NULL,'Jiva 3443 8552',1,NULL,2,15,1,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,'','Standard triangular Voila tower with platform','Existing standoffs','Take the well-maintained gravel road from town towards the waterfalls and turn right once you are at the same height as the tower.','','Have not tried the $25/night hotel across from the police station.','-48 VDC (use 24 VDC converter)\r\n- 30db link to MIBAL\r\n- Two sectors',1),(164,'Saint Marc (St Marc xp)','STMRC','19.08776000000000','-72.70772000000000',NULL,'',1,NULL,6,15,1,NULL,NULL,NULL,NULL,3,NULL,9,NULL,'','Not a tower, but the roof of a Voila shelter that had a tower on it. Excellent 270 degree view of Saint Marc bay.','Tripod mounted on roof with a 5\' bar','Just above town. access from just north of La Colline hotel.','On-site storage','Le Gou-T hotel on the north end of town','110VAC via dedicated -48v inverter\r\n- put in a full 10\' bar to raise the antennas higher.\r\n- 30db dish to HILRE-270\r\n- One 17db sector',1),(165,'Verrettes','VERET','19.05240000000000','-72.46626000000000',NULL,'David 3737 8608',1,NULL,6,15,1,NULL,NULL,NULL,NULL,5,NULL,9,NULL,'','Very short square tower with a large tree growing into the tower on the west side','Beam clamps at the top of the tower','In town','','','-48 VDC (use 24 VDC converter)\r\n- Poor signal\r\n- 30db dish to HILRE\r\n- Three 16db sectors',1),(166,'Verjon','VERJN','18.26347976000000','-72.43249369000000',NULL,'',1,NULL,7,15,1,NULL,NULL,NULL,NULL,6,NULL,9,NULL,'','','','\"From the main east-west road, turn north on Route des Orangiers (immediately west of the airport), turn right at the \"\"T\"\", then fork right at the Station des Orangiers (18.2558,-72.508126). It is then about 11km to the turn off. The first part of the road after the fork is partially paved and generally a good road, but extremely steep. The last part of the road is a short overgrown dirt track which becomes very steep for the last 200m.\r\nSee: http://www.openstreetmap.org/?lat=18.2557&lon=-72.4765&zoom=14&layers=M\r\nPossible (unverified) option 2 is to turn north at 18.2558,-72.508126 at Ravine Meyer.\r\n4x4 required (with working low-4). Do not try to go via Cayes Jacmel. Even though marked as a proper road on some maps, this road becomes a shoulder-width footpath several km from the tower.\"','','','',1),(167,'Vertières','VERTI','19.72233000000000','-72.22208000000000',NULL,'',1,NULL,8,15,1,NULL,NULL,NULL,NULL,6,NULL,9,NULL,'','','','','','','',1),(169,'Foo','FOO','19.85948000000000','-72.75713000000000',NULL,'',3,NULL,1,18,1,NULL,NULL,NULL,NULL,5,NULL,1,NULL,'','','','','','','',1);
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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `switch_types`
--

LOCK TABLES `switch_types` WRITE;
/*!40000 ALTER TABLE `switch_types` DISABLE KEYS */;
INSERT INTO `switch_types` VALUES (1,8,'8-Port Switch',NULL,NULL),(2,16,'16-Port Switch',NULL,NULL),(3,24,'24-Port Switch',NULL,NULL);
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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tower_mounts`
--

LOCK TABLES `tower_mounts` WRITE;
/*!40000 ALTER TABLE `tower_mounts` DISABLE KEYS */;
INSERT INTO `tower_mounts` VALUES (1,'Existing Standoffs'),(2,'Beam Clamps');
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
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tower_owners`
--

LOCK TABLES `tower_owners` WRITE;
/*!40000 ALTER TABLE `tower_owners` DISABLE KEYS */;
INSERT INTO `tower_owners` VALUES (1,'Voila'),(2,'Multilink'),(4,'Haicom'),(6,'Access Haiti'),(9,'World Food Program'),(10,'Digicel'),(11,'None');
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
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','157f42bf0d97ffa44c078474279fcbe4f54c3409','1','2012-07-18 20:09:51','2012-10-02 14:59:28'),(3,'sue','ae1a12b6e634352e2a52bdc721da548b713f6cbb','2','2012-07-18 21:56:14','2012-07-18 21:56:14'),(8,'abjornson','d723527d3b223f111590647e6b1cee7464e4a340','1','2012-09-14 14:43:59','2012-09-14 14:43:59'),(11,'critchie','fe950edc4427c13187a635be707749a69405dc68','1','2012-09-18 17:16:53','2012-09-18 17:16:53'),(12,'mark','03a7394e040472cd0ef3eb58e5996257cf972afc','1','2012-09-21 16:10:35','2012-09-21 16:10:35'),(13,'rchauvet','b72882f892fb9c006ee1739fbd3e938e37c71cc1','11','2012-09-28 12:14:54','2012-09-28 12:14:54'),(14,'fj','b4bb357d20e1d57b57561cc14dad3167a9147ded','2','2012-09-28 12:15:26','2012-09-28 12:15:26'),(15,'sam','9deb69700bbba0952fae4e81154a1ad4669b0aad','11','2012-09-28 12:16:09','2012-09-28 12:16:09');
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

-- Dump completed on 2012-10-02 16:20:24
