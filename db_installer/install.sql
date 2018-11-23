-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: mysql.s3platform.eu
-- Generation Time: Nov 20, 2018 at 02:45 AM
-- Server version: 5.6.34-log
-- PHP Version: 7.1.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `assetsmapping`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cat_id` varchar(10) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cat_id`, `description`) VALUES
('bus', 'Business Characteristics'),
('dem', 'Business Demographics'),
('eco', 'Economy and Labour'),
('geo', 'Geography'),
('ino', 'Innovation System'),
('sec', 'Structural Business Statistics');

-- --------------------------------------------------------

--
-- Table structure for table `cell_data`
--

CREATE TABLE `cell_data` (
  `col_id` bigint(20) NOT NULL,
  `row_id` bigint(20) NOT NULL,
  `val` text,
  `type` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `col_head`
--

CREATE TABLE `col_head` (
  `col_id` bigint(20) NOT NULL,
  `tbl_id` bigint(20) NOT NULL,
  `col_label` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `country_id` varchar(2) NOT NULL,
  `description` varchar(255) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `co_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`country_id`, `description`, `sort_order`, `co_order`) VALUES
('AT', 'ÖSTERREICH', 20, 1259),
('BE', 'BELGIQUE-BELGIË', 1, 1),
('BG', 'БЪЛГАРИЯ (BULGARIA)', 2, 63),
('CY', 'ΚΥΠΡΟΣ (KÝPROS)', 13, 1115),
('CZ', 'ČESKÁ REPUBLIKA', 3, 103),
('DE', 'DEUTSCHLAND', 5, 151),
('DK', 'DANMARK', 4, 130),
('EE', 'EESTI', 6, 621),
('EL', 'ΕΛΛΑΔΑ (ELLADA)', 8, 647),
('ES', 'ESPAÑA', 9, 719),
('FI', 'SUOMI / FINLAND', 26, 1540),
('FR', 'FRANCE', 10, 808),
('HR', 'HRVATSKA', 11, 947),
('HU', 'MAGYARORSZÁG', 17, 1157),
('IE', 'IRELAND', 7, 632),
('IT', 'ITALIA ', 12, 975),
('LT', 'LIETUVA', 15, 1134),
('LU', 'LUXEMBOURG', 16, 1150),
('LV', 'LATVIJA', 14, 1122),
('MT', 'MALTA', 18, 1191),
('NL', 'NEDERLAND ', 19, 1199),
('PL', 'POLSKA', 21, 1310),
('PT', 'PORTUGAL', 22, 1402),
('RO', 'ROMÂNIA', 23, 1446),
('SE', 'SVERIGE', 27, 1570),
('SI', 'SLOVENIJA', 23, 1504),
('SK', 'SLOVENSKO', 25, 1523),
('UK', 'UNITED KINGDOM', 28, 1606);

-- --------------------------------------------------------

--
-- Table structure for table `in_data`
--

CREATE TABLE `in_data` (
  `var_id` varchar(255) NOT NULL,
  `reg_id` varchar(255) NOT NULL,
  `year_id` varchar(255) NOT NULL,
  `unit` varchar(255) NOT NULL,
  `val` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `region`
--

CREATE TABLE `region` (
  `reg_id` varchar(4) NOT NULL,
  `label` varchar(255) NOT NULL,
  `ind` smallint(6) NOT NULL,
  `nuts_label` varchar(255) NOT NULL,
  `nuts_level` int(11) NOT NULL,
  `country_id` varchar(2) NOT NULL,
  `rg_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `region`
--

INSERT INTO `region` (`reg_id`, `label`, `ind`, `nuts_label`, `nuts_level`, `country_id`, `rg_order`) VALUES
('AT11', 'Burgenland (A)', 0, 'Burgenland (AT)', 2, 'AT', 1261),
('AT12', 'Niederösterreich', 0, 'Niederösterreich', 2, 'AT', 1265),
('AT13', 'Wien', 0, 'Wien', 2, 'AT', 1273),
('AT21', 'Kärnten', 0, 'Kärnten', 2, 'AT', 1276),
('AT22', 'Steiermark', 0, 'Steiermark', 2, 'AT', 1280),
('AT31', 'Oberösterreich', 0, 'Oberösterreich', 2, 'AT', 1288),
('AT32', 'Salzburg', 0, 'Salzburg', 2, 'AT', 1294),
('AT33', 'Tirol', 0, 'Tirol', 2, 'AT', 1298),
('AT34', 'Vorarlberg', 0, 'Vorarlberg', 2, 'AT', 1304),
('BE10', 'Région de Bruxelles-Capitale / Brussels Hoofdstedelijk Gewest', 0, 'Région de Bruxelles-Capitale/Brussels Hoofdstedelijk Gewest', 2, 'BE', 3),
('BE21', 'Prov. Antwerpen', 0, 'Prov. Antwerpen', 2, 'BE', 6),
('BE22', 'Prov.Limburg (B)', 0, 'Prov. Limburg (BE)', 2, 'BE', 10),
('BE23', 'Prov. Oost-Vlaanderen', 0, 'Prov. Oost-Vlaanderen', 2, 'BE', 14),
('BE24', 'Prov. Vlaams-Brabant', 0, 'Prov. Vlaams-Brabant', 2, 'BE', 21),
('BE25', 'Prov. West-Vlaanderen', 0, 'Prov. West-Vlaanderen', 2, 'BE', 24),
('BE31', 'Prov. Brabant Wallon', 0, 'Prov. Brabant Wallon', 2, 'BE', 34),
('BE32', 'Prov. Hainaut', 0, 'Prov. Hainaut', 2, 'BE', 36),
('BE33', 'Prov.Liège', 0, 'Prov. Liège', 2, 'BE', 44),
('BE34', 'Prov.Luxembourg (B)', 0, 'Prov. Luxembourg (BE)', 2, 'BE', 50),
('BE35', 'Prov. Namur', 0, 'Prov. Namur', 2, 'BE', 56),
('BG31', 'Severozapaden', 0, 'Северозападен (Severozapaden)', 2, 'BG', 65),
('BG32', 'Severen tsentralen', 0, 'Северен централен (Severen tsentralen)', 2, 'BG', 71),
('BG33', 'Severoiztochen', 0, 'Североизточен (Severoiztochen)', 2, 'BG', 77),
('BG34', 'Yugoiztochen', 0, 'Югоизточен (Yugoiztochen)', 2, 'BG', 82),
('BG41', 'Yugozapaden', 0, 'Югозападен (Yugozapaden)', 2, 'BG', 88),
('BG42', 'Yuzhen tsentralen', 0, 'Южен централен (Yuzhen tsentralen)', 2, 'BG', 94),
('CY00', 'Kypros / Kibris', 0, 'Κύπρος (Kýpros)', 2, 'CY', 1117),
('CZ01', 'Praha', 0, 'Praha', 2, 'CZ', 105),
('CZ02', 'Stredni Cechy', 0, 'Střední Čechy', 2, 'CZ', 107),
('CZ03', 'Jihozapad', 0, 'Jihozápad', 2, 'CZ', 109),
('CZ04', 'Severozapad', 0, 'Severozápad', 2, 'CZ', 112),
('CZ05', 'Severovychod', 0, 'Severovýchod', 2, 'CZ', 115),
('CZ06', 'Jihovychod', 0, 'Jihovýchod', 2, 'CZ', 119),
('CZ07', 'Stredni Morava', 0, 'Střední Morava', 2, 'CZ', 122),
('CZ08', 'Moravskoslezsko', 0, 'Moravskoslezsko', 2, 'CZ', 125),
('DE11', 'Stuttgart', 0, 'Stuttgart', 2, 'DE', 153),
('DE12', 'Karlsruhe', 0, 'Karlsruhe', 2, 'DE', 167),
('DE13', 'Freiburg', 0, 'Freiburg', 2, 'DE', 180),
('DE14', 'Tübingen', 0, 'Tübingen', 2, 'DE', 191),
('DE21', 'Oberbayern', 0, 'Oberbayern', 2, 'DE', 202),
('DE22', 'Niederbayern', 0, 'Niederbayern', 2, 'DE', 226),
('DE23', 'Oberpfalz', 0, 'Oberpfalz', 2, 'DE', 239),
('DE24', 'Oberfranken', 0, 'Oberfranken', 2, 'DE', 250),
('DE25', 'Mittelfranken', 0, 'Mittelfranken', 2, 'DE', 264),
('DE26', 'Unterfranken', 0, 'Unterfranken', 2, 'DE', 277),
('DE27', 'Schwaben', 0, 'Schwaben', 2, 'DE', 290),
('DE30', 'Berlin', 0, 'Berlin', 2, 'DE', 306),
('DE40', 'Brandenburg', 0, 'Brandenburg', 2, 'DE', 309),
('DE50', 'Bremen', 0, 'Bremen', 2, 'DE', 329),
('DE60', 'Hamburg', 0, 'Hamburg', 2, 'DE', 333),
('DE71', 'Darmstadt', 0, 'Darmstadt', 2, 'DE', 336),
('DE72', 'Gießen', 0, 'Gießen', 2, 'DE', 351),
('DE73', 'Kassel', 0, 'Kassel', 2, 'DE', 357),
('DE80', 'Mecklenburg-Vorpommern', 0, 'Mecklenburg-Vorpommern', 2, 'DE', 366),
('DE91', 'Braunschweig', 0, 'Braunschweig', 2, 'DE', 386),
('DE92', 'Hannover', 0, 'Hannover', 2, 'DE', 398),
('DE93', 'Lüneburg', 0, 'Lüneburg', 2, 'DE', 406),
('DE94', 'Weser-Ems', 0, 'Weser-Ems', 2, 'DE', 418),
('DEA1', 'Düsseldorf', 0, 'Düsseldorf', 2, 'DE', 437),
('DEA2', 'Köln', 0, 'Köln', 2, 'DE', 453),
('DEA3', 'Münster', 0, 'Münster', 2, 'DE', 465),
('DEA4', 'Detmold', 0, 'Detmold', 2, 'DE', 474),
('DEA5', 'Arnsberg', 0, 'Arnsberg', 2, 'DE', 482),
('DEB1', 'Koblenz', 0, 'Koblenz', 2, 'DE', 496),
('DEB2', 'Trier', 0, 'Trier', 2, 'DE', 508),
('DEB3', 'Rheinhessen-Pfalz', 0, 'Rheinhessen-Pfalz', 2, 'DE', 514),
('DEC0', 'Saarland', 0, 'Saarland', 2, 'DE', 536),
('DED2', 'Dresden', 0, 'Dresden', 2, 'DE', 544),
('DED3', 'Leipzig', 1, 'Leipzig', 2, 'DE', 556),
('DED4', 'Chemnitz', 0, 'Chemnitz', 2, 'DE', 550),
('DEE0', 'Sachsen-Anhalt', 0, 'Sachsen-Anhalt', 2, 'DE', 561),
('DEF0', 'Schleswig-Holstein', 0, 'Schleswig-Holstein', 2, 'DE', 577),
('DEG0', 'Thüringen', 0, 'Thüringen', 2, 'DE', 594),
('DK01', 'Hovedstaden', 0, 'Hovedstaden', 2, 'DK', 132),
('DK02', 'Sjælland', 0, 'Sjælland', 2, 'DK', 137),
('DK03', 'Syddanmark', 0, 'Syddanmark', 2, 'DK', 140),
('DK04', 'Midtjylland', 0, 'Midtjylland', 2, 'DK', 143),
('DK05', 'Nordjylland', 0, 'Nordjylland', 2, 'DK', 146),
('EE00', 'Eesti', 1, 'EESTI', 0, 'EE', 621),
('EL11', 'Anatoliki Makedonia, Thraki', 0, 'Aνατολική Μακεδονία, Θράκη (Anatoliki Makedonia, Thraki)', 2, 'EL', 649),
('EL12', 'Kentriki Makedonia', 0, 'Κεντρική Μακεδονία (Kentriki Makedonia)', 2, 'EL', 655),
('EL13', 'Dytiki Makedonia', 0, 'Δυτική Μακεδονία (Dytiki Makedonia)', 2, 'EL', 663),
('EL14', 'Thessalia', 0, 'Θεσσαλία (Thessalia)', 2, 'EL', 668),
('EL21', 'Ipeiros', 0, 'Ήπειρος (Ipeiros)', 2, 'EL', 674),
('EL22', 'Ionia Nisia', 0, 'Ιόνια Νησιά (Ionia Nisia)', 2, 'EL', 679),
('EL23', 'Dytiki Ellada', 0, 'Δυτική Ελλάδα (Dytiki Ellada)', 2, 'EL', 684),
('EL24', 'Sterea Ellada', 0, 'Στερεά Ελλάδα (Sterea Ellada)', 2, 'EL', 688),
('EL25', 'Peloponnisos', 0, 'Πελοπόννησος (Peloponnisos)', 2, 'EL', 694),
('EL30', 'Attiki', 0, 'Aττική (Attiki)', 2, 'EL', 701),
('EL41', 'Voreio Aigaio', 0, 'Βόρειο Αιγαίο (Voreio Aigaio)', 2, 'EL', 704),
('EL42', 'Notio Aigaio', 0, 'Νότιο Αιγαίο (Notio Aigaio)', 2, 'EL', 708),
('EL43', 'Kriti', 0, 'Κρήτη (Kriti)', 2, 'EL', 711),
('ES11', 'Galicia', 0, 'Galicia', 2, 'ES', 721),
('ES12', 'Principado de Asturias', 0, 'Principado de Asturias', 2, 'ES', 726),
('ES13', 'Cantabria', 0, 'Cantabria', 2, 'ES', 728),
('ES21', 'País Vasco', 0, 'País Vasco', 2, 'ES', 731),
('ES22', 'Comunidad Foral de Navarra', 0, 'Comunidad Foral de Navarra', 2, 'ES', 735),
('ES23', 'La Rioja', 0, 'La Rioja', 2, 'ES', 737),
('ES24', 'Aragón', 0, 'Aragón', 2, 'ES', 739),
('ES30', 'Comunidad de Madrid', 0, 'Comunidad de Madrid', 2, 'ES', 744),
('ES41', 'Castilla yLeón', 0, 'Castilla y León', 2, 'ES', 747),
('ES42', 'Castilla-La Mancha', 0, 'Castilla-La Mancha', 2, 'ES', 757),
('ES43', 'Extremadura', 0, 'Extremadura', 2, 'ES', 763),
('ES51', 'Cataluña', 0, 'Cataluña', 2, 'ES', 767),
('ES52', 'Comunidad Valenciana', 0, 'Comunidad Valenciana', 2, 'ES', 772),
('ES53', 'Illes Balears', 0, 'Illes Balears', 2, 'ES', 776),
('ES61', 'Andalucía', 0, 'Andalucía', 2, 'ES', 781),
('ES62', 'Región de Murcia', 0, 'Región de Murcia', 2, 'ES', 790),
('ES63', 'Ciudad Autónoma de Ceuta', 0, 'Ciudad Autónoma de Ceuta', 2, 'ES', 792),
('ES64', 'Ciudad Autónoma de Melilla', 0, 'Ciudad Autónoma de Melilla', 2, 'ES', 794),
('ES70', 'Canarias', 0, 'Canarias', 2, 'ES', 797),
('FI19', 'Länsi-Suomi', 0, 'Länsi-Suomi', 2, 'FI', 1542),
('FI1B', 'Helsinki-Uusimaa', 0, 'Helsinki-Uusimaa', 2, 'FI', 1548),
('FI1C', 'Etelä-Suomi', 1, 'Etelä-Suomi', 2, 'FI', 1550),
('FI1D', 'Pohjois-ja Itä-Suomi', 1, 'Pohjois- ja Itä-Suomi', 2, 'FI', 1556),
('FI20', 'Åland', 0, 'Åland', 2, 'FI', 1565),
('FR10', 'Île de France', 0, 'Île de France', 2, 'FR', 810),
('FR21', 'Champagne-Ardenne', 0, 'Champagne-Ardenne', 2, 'FR', 820),
('FR22', 'Picardie', 0, 'Picardie', 2, 'FR', 825),
('FR23', 'Haute-Normandie', 0, 'Haute-Normandie', 2, 'FR', 829),
('FR24', 'Centre', 0, 'Centre', 2, 'FR', 832),
('FR25', 'Basse-Normandie', 0, 'Basse-Normandie', 2, 'FR', 839),
('FR26', 'Bourgogne', 0, 'Bourgogne', 2, 'FR', 843),
('FR30', 'Nord - Pas-de-Calais', 0, 'Nord - Pas-de-Calais', 2, 'FR', 849),
('FR41', 'Lorraine', 0, 'Lorraine', 2, 'FR', 853),
('FR42', 'Alsace', 0, 'Alsace', 2, 'FR', 858),
('FR43', 'Franche-Comté', 0, 'Franche-Comté', 2, 'FR', 861),
('FR51', 'Pays deLaLoire', 0, 'Pays de la Loire', 2, 'FR', 867),
('FR52', 'Bretagne', 0, 'Bretagne', 2, 'FR', 873),
('FR53', 'Poitou-Charentes', 0, 'Poitou-Charentes', 2, 'FR', 878),
('FR61', 'Aquitaine', 0, 'Aquitaine', 2, 'FR', 884),
('FR62', 'Midi-Pyrénées', 0, 'Midi-Pyrénées', 2, 'FR', 890),
('FR63', 'Limousin', 0, 'Limousin', 2, 'FR', 899),
('FR71', 'Rhône-Alpes', 0, 'Rhône-Alpes', 2, 'FR', 904),
('FR72', 'Auvergne', 0, 'Auvergne', 2, 'FR', 913),
('FR81', 'Languedoc-Roussillon', 0, 'Languedoc-Roussillon', 2, 'FR', 919),
('FR82', 'Provence-Alpes-Côte d\'Azur', 0, 'Provence-Alpes-Côte d\'Azur', 2, 'FR', 925),
('FR83', 'Corse', 0, 'Corse', 2, 'FR', 932),
('FR91', 'Guadeloupe', 0, 'Guadeloupe', 2, 'FR', 936),
('FR92', 'Martinique', 0, 'Martinique', 2, 'FR', 938),
('FR93', 'Guyane', 0, 'Guyane', 2, 'FR', 940),
('FR94', 'Réunion', 0, 'Réunion', 2, 'FR', 942),
('HR03', 'Jadranska Hrvatska', 0, 'Jadranska Hrvatska', 2, 'HR', 949),
('HR04', 'Kontinentalna Hrvatska', 0, 'Kontinentalna Hrvatska', 2, 'HR', 957),
('HU10', 'Kozep-Magyarorszag', 0, 'Közép-Magyarország', 2, 'HU', 1159),
('HU21', 'Kozep-Dunantul', 0, 'Közép-Dunántúl', 2, 'HU', 1163),
('HU22', 'Nyugat-Dunantul', 0, 'Nyugat-Dunántúl', 2, 'HU', 1167),
('HU23', 'Del-Dunantul', 0, 'Dél-Dunántúl', 2, 'HU', 1171),
('HU31', 'Eszak-Magyarorszag', 0, 'Észak-Magyarország', 2, 'HU', 1176),
('HU32', 'Eszak-Alfold', 0, 'Észak-Alföld', 2, 'HU', 1180),
('HU33', 'Del-Alfold', 0, 'Dél-Alföld', 2, 'HU', 1184),
('IE01', 'Border, Midland and Western', 0, 'Border, Midland and Western', 2, 'IE', 634),
('IE02', 'Southern and Eastern', 0, 'Southern and Eastern', 2, 'IE', 638),
('ITC1', 'Piemonte', 0, 'Piemonte', 2, 'IT', 977),
('ITC2', 'Valle d\'Aosta/Vallée d\'Aoste', 0, 'Valle d\'Aosta/Vallée d\'Aoste', 2, 'IT', 986),
('ITC3', 'Liguria', 0, 'Liguria', 2, 'IT', 988),
('ITC4', 'Lombardia', 0, 'Lombardia', 2, 'IT', 993),
('ITD1', 'Provincia Autonoma Bolzano/Bozen', 1, 'Provincia Autonoma di Bolzano/Bozen', 2, 'IT', 1058),
('ITD2', 'Provincia Autonoma Trento', 1, 'Provincia Autonoma di Trento', 2, 'IT', 1060),
('ITD3', 'Veneto', 1, 'Veneto', 2, 'IT', 1062),
('ITD4', 'Friuli-Venezia Giulia', 1, 'Friuli-Venezia Giulia', 2, 'IT', 1070),
('ITD5', 'Emilia-Romagna', 1, 'Emilia-Romagna', 2, 'IT', 1075),
('ITE1', 'Toscana', 1, 'Toscana', 2, 'IT', 1086),
('ITE2', 'Umbria', 1, 'Umbria', 2, 'IT', 1097),
('ITE3', 'Marche', 1, 'Marche', 2, 'IT', 1100),
('ITE4', 'Lazio', 1, 'Lazio', 2, 'IT', 1106),
('ITF1', 'Abruzzo', 0, 'Abruzzo', 2, 'IT', 1007),
('ITF2', 'Molise', 0, 'Molise', 2, 'IT', 1012),
('ITF3', 'Campania', 0, 'Campania', 2, 'IT', 1015),
('ITF4', 'Puglia', 0, 'Puglia', 2, 'IT', 1021),
('ITF5', 'Basilicata', 0, 'Basilicata', 2, 'IT', 1028),
('ITF6', 'Calabria', 0, 'Calabria', 2, 'IT', 1031),
('ITG1', 'Sicilia', 0, 'Sicilia', 2, 'IT', 1038),
('ITG2', 'Sardegna', 0, 'Sardegna', 2, 'IT', 1048),
('LT00', 'Lietuva', 0, 'Lietuva', 2, 'LT', 1136),
('LU00', 'Luxembourg (Grand-Duché)', 0, 'Luxembourg', 2, 'LU', 1152),
('LV00', 'Latvija', 0, 'Latvija', 2, 'LV', 1124),
('MT00', 'Malta', 0, 'Malta', 2, 'MT', 1193),
('NL11', 'Groningen', 0, 'Groningen', 2, 'NL', 1201),
('NL12', 'Friesland (NL)', 0, 'Friesland (NL)', 2, 'NL', 1205),
('NL13', 'Drenthe', 0, 'Drenthe', 2, 'NL', 1209),
('NL21', 'Overijssel', 0, 'Overijssel', 2, 'NL', 1214),
('NL22', 'Gelderland', 0, 'Gelderland', 2, 'NL', 1218),
('NL23', 'Flevoland', 0, 'Flevoland', 2, 'NL', 1223),
('NL31', 'Utrecht', 0, 'Utrecht', 2, 'NL', 1226),
('NL32', 'Noord-Holland', 0, 'Noord-Holland', 2, 'NL', 1228),
('NL33', 'Zuid-Holland', 0, 'Zuid-Holland', 2, 'NL', 1236),
('NL34', 'Zeeland', 0, 'Zeeland', 2, 'NL', 1243),
('NL41', 'Noord-Brabant', 0, 'Noord-Brabant', 2, 'NL', 1247),
('NL42', 'Limburg (NL)', 0, 'Limburg (NL)', 2, 'NL', 1252),
('PL11', 'Lodzkie', 0, 'Łódzkie', 2, 'PL', 1312),
('PL12', 'Mazowieckie', 0, 'Mazowieckie', 2, 'PL', 1318),
('PL21', 'Malopolskie', 0, 'Małopolskie', 2, 'PL', 1326),
('PL22', 'Slaskie', 0, 'Śląskie', 2, 'PL', 1332),
('PL31', 'Lubelskie', 0, 'Lubelskie', 2, 'PL', 1342),
('PL32', 'Podkarpackie', 0, 'Podkarpackie', 2, 'PL', 1347),
('PL33', 'Swietokrzyskie', 0, 'Świętokrzyskie', 2, 'PL', 1352),
('PL34', 'Podlaskie', 0, 'Podlaskie', 2, 'PL', 1355),
('PL41', 'Wielkopolskie', 0, 'Wielkopolskie', 2, 'PL', 1360),
('PL42', 'Zachodniopomorskie', 0, 'Zachodniopomorskie', 2, 'PL', 1367),
('PL43', 'Lubuskie', 0, 'Lubuskie', 2, 'PL', 1372),
('PL51', 'Dolnoslaskie', 0, 'Dolnośląskie', 2, 'PL', 1376),
('PL52', 'Opolskie', 0, 'Opolskie', 2, 'PL', 1382),
('PL61', 'Kujawsko-Pomorskie', 0, 'Kujawsko-Pomorskie', 2, 'PL', 1386),
('PL62', 'Warminsko-Mazurskie', 0, 'Warmińsko-Mazurskie', 2, 'PL', 1390),
('PL63', 'Pomorskie', 0, 'Pomorskie', 2, 'PL', 1394),
('PT11', 'Norte', 0, 'Norte', 2, 'PT', 1404),
('PT15', 'Algarve', 0, 'Algarve', 2, 'PT', 1413),
('PT16', 'Centro (P)', 0, 'Centro (PT)', 2, 'PT', 1415),
('PT17', 'Lisboa', 0, 'Lisboa', 2, 'PT', 1428),
('PT18', 'Alentejo', 0, 'Alentejo', 2, 'PT', 1431),
('PT20', 'Região Autónoma dos Açores', 0, 'Região Autónoma dos Açores', 2, 'PT', 1438),
('PT30', 'Região Autónoma da Madeira', 0, 'Região Autónoma da Madeira', 2, 'PT', 1441),
('RO11', 'Nord-Vest', 0, 'Nord-Vest', 2, 'RO', 1448),
('RO12', 'Centru', 0, 'Centru', 2, 'RO', 1455),
('RO21', 'Nord-Est', 0, 'Nord-Est', 2, 'RO', 1463),
('RO22', 'Sud-Est', 0, 'Sud-Est', 2, 'RO', 1470),
('RO31', 'Sud - Muntenia', 0, 'Sud - Muntenia', 2, 'RO', 1478),
('RO32', 'Bucuresti - Ilfov', 0, 'Bucureşti - Ilfov', 2, 'RO', 1486),
('RO41', 'Sud-Vest Oltenia', 0, 'Sud-Vest Oltenia', 2, 'RO', 1490),
('RO42', 'Vest', 0, 'Vest', 2, 'RO', 1496),
('SE11', 'Stockholm', 0, 'Stockholm', 2, 'SE', 1572),
('SE12', 'Östra Mellansverige', 0, 'Östra Mellansverige', 2, 'SE', 1574),
('SE21', 'Småland med öarna', 0, 'Småland med öarna', 2, 'SE', 1581),
('SE22', 'Sydsverige', 0, 'Sydsverige', 2, 'SE', 1586),
('SE23', 'Västsverige', 0, 'Västsverige', 2, 'SE', 1589),
('SE31', 'Norra Mellansverige', 0, 'Norra Mellansverige', 2, 'SE', 1593),
('SE32', 'Mellersta Norrland', 0, 'Mellersta Norrland', 2, 'SE', 1597),
('SE33', 'Övre Norrland', 0, 'Övre Norrland', 2, 'SE', 1600),
('SI01', 'Vzhodna Slovenija', 0, 'Vzhodna Slovenija', 2, 'SI', 1506),
('SI02', 'Zahodna Slovenija', 0, 'Zahodna Slovenija', 2, 'SI', 1515),
('SK01', 'Bratislavsky kraj', 0, 'Bratislavský kraj', 2, 'SK', 1525),
('SK02', 'Zapadne Slovensko', 0, 'Západné Slovensko', 2, 'SK', 1527),
('SK03', 'Stredne Slovensko', 0, 'Stredné Slovensko', 2, 'SK', 1531),
('SK04', 'Vychodne Slovensko', 0, 'Východné Slovensko', 2, 'SK', 1534),
('UKC1', 'Tees Valley and Durham', 0, 'Tees Valley and Durham', 2, 'UK', 1608),
('UKC2', 'Northumberland and Tyne and Wear', 0, 'Northumberland and Tyne and Wear', 2, 'UK', 1613),
('UKD1', 'Cumbria', 0, 'Cumbria', 2, 'UK', 1618),
('UKD2', 'Cheshire', 1, 'Cheshire', 2, 'UK', 1628),
('UKD3', 'Greater Manchester', 1, 'Greater Manchester', 2, 'UK', 1621),
('UKD4', 'Lancashire', 1, 'Lancashire', 2, 'UK', 1624),
('UKD5', 'Merseyside', 1, 'Merseyside', 2, 'UK', 1632),
('UKE1', 'East Yorkshire and NorthernLincolnshire', 0, 'East Yorkshire and Northern Lincolnshire', 2, 'UK', 1638),
('UKE2', 'North Yorkshire', 0, 'North Yorkshire', 2, 'UK', 1642),
('UKE3', 'South Yorkshire', 0, 'South Yorkshire', 2, 'UK', 1645),
('UKE4', 'West Yorkshire', 0, 'West Yorkshire', 2, 'UK', 1648),
('UKF1', 'Derbyshire and Nottinghamshire', 0, 'Derbyshire and Nottinghamshire', 2, 'UK', 1654),
('UKF2', 'Leicestershire, Rutland and Northamptonshire', 0, 'Leicestershire, Rutland and Northamptonshire', 2, 'UK', 1661),
('UKF3', 'Lincolnshire', 0, 'Lincolnshire', 2, 'UK', 1666),
('UKG1', 'Herefordshire, Worcestershire and Warwickshire', 0, 'Herefordshire, Worcestershire and Warwickshire', 2, 'UK', 1669),
('UKG2', 'Shropshire and Staffordshire', 0, 'Shropshire and Staffordshire', 2, 'UK', 1673),
('UKG3', 'West Midlands', 0, 'West Midlands', 2, 'UK', 1678),
('UKH1', 'East Anglia', 0, 'East Anglia', 2, 'UK', 1687),
('UKH2', 'Bedfordshire and Hertfordshire', 0, 'Bedfordshire and Hertfordshire', 2, 'UK', 1692),
('UKH3', 'Essex', 0, 'Essex', 2, 'UK', 1697),
('UKI1', 'InnerLondon', 0, 'Inner London', 2, 'UK', 1702),
('UKI2', 'OuterLondon', 0, 'Outer London', 2, 'UK', 1705),
('UKJ1', 'Berkshire, Buckinghamshire and Oxfordshire', 0, 'Berkshire, Buckinghamshire and Oxfordshire', 2, 'UK', 1710),
('UKJ2', 'Surrey, East and West Sussex', 0, 'Surrey, East and West Sussex', 2, 'UK', 1715),
('UKJ3', 'Hampshire and Isle of Wight', 0, 'Hampshire and Isle of Wight', 2, 'UK', 1720),
('UKJ4', 'Kent', 0, 'Kent', 2, 'UK', 1725),
('UKK1', 'Gloucestershire, Wiltshire and Bristol/Bath area', 0, 'Gloucestershire, Wiltshire and Bristol/Bath area', 2, 'UK', 1729),
('UKK2', 'Dorset and Somerset', 0, 'Dorset and Somerset', 2, 'UK', 1735),
('UKK3', 'Cornwall and Isles of Scilly', 0, 'Cornwall and Isles of Scilly', 2, 'UK', 1739),
('UKK4', 'Devon', 0, 'Devon', 2, 'UK', 1741),
('UKL1', 'West Wales and The Valleys', 0, 'West Wales and The Valleys', 2, 'UK', 1746),
('UKL2', 'East Wales', 0, 'East Wales', 2, 'UK', 1755),
('UKM2', 'Eastern Scotland', 0, 'Eastern Scotland', 2, 'UK', 1761),
('UKM3', 'South Western Scotland', 0, 'South Western Scotland', 2, 'UK', 1770),
('UKM5', 'North Eastern Scotland', 0, 'North Eastern Scotland', 2, 'UK', 1779),
('UKM6', 'Highlands and Islands', 0, 'Highlands and Islands', 2, 'UK', 1781),
('UKN0', 'Northern Ireland', 0, 'Northern Ireland', 2, 'UK', 1789);

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `report_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `creation_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `report_charts`
--

CREATE TABLE `report_charts` (
  `chart_id` bigint(20) NOT NULL,
  `report_id` bigint(20) NOT NULL,
  `creation_dt` datetime DEFAULT CURRENT_TIMESTAMP,
  `cat_id` varchar(3) CHARACTER SET latin1 DEFAULT NULL,
  `group_id` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `chart_data` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `report_tbl`
--

CREATE TABLE `report_tbl` (
  `tbl_id` bigint(20) NOT NULL,
  `report_id` bigint(20) NOT NULL,
  `creation_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cat_id` varchar(3) CHARACTER SET latin1 NOT NULL,
  `group_id` varchar(100) CHARACTER SET latin1 NOT NULL,
  `group_type` varchar(3) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `row_head`
--

CREATE TABLE `row_head` (
  `row_id` bigint(20) NOT NULL,
  `tbl_id` bigint(20) NOT NULL,
  `row_label` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `subcat`
--

CREATE TABLE `subcat` (
  `sub_id` varchar(10) CHARACTER SET latin1 NOT NULL,
  `cat_id` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `description` varchar(45) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subcat`
--

INSERT INTO `subcat` (`sub_id`, `cat_id`, `description`) VALUES
('agr', 'sec', 'Agricultural Statistics'),
('eco', 'eco', 'Economy'),
('edu', 'dem', 'Education'),
('ind', 'bus', 'Enterprise demography'),
('inf', 'geo', 'Major infrastructure'),
('ino', 'bus', 'High growth and innovating enterprises'),
('ins', 'ino', 'Critical Institutions'),
('lab', 'eco', 'Labour'),
('pat', 'ino', 'Patents'),
('pop', 'dem', 'Population Size and dynamism'),
('rnd', 'ino', ' R&D'),
('str', 'sec', 'Structural Business Statistics');

-- --------------------------------------------------------

--
-- Table structure for table `variable`
--

CREATE TABLE `variable` (
  `var_id` varchar(45) NOT NULL,
  `var_name` varchar(45) NOT NULL,
  `description` varchar(255) NOT NULL,
  `cat_id` varchar(10) NOT NULL,
  `sub_id` varchar(10) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `variable`
--

INSERT INTO `variable` (`var_id`, `var_name`, `description`, `cat_id`, `sub_id`, `type`) VALUES
('agr_r_accts', 'AgrPVBP', 'Agriculture (A-Div.01), Production value at basic price (cereals including seeds)', 'sec', '', 'numeric'),
('bd_hgnace2_r3_NBPG1', 'NetBusPopGr_B-E', 'Net business population growth', 'bus', '', 'numeric'),
('bd_hgnace2_r3_NBPG10', 'NetBusPopGr_R-S', 'Net business population growth', 'bus', '', 'numeric'),
('bd_hgnace2_r3_NBPG11', 'NetBusPopGr_Tot', 'Net business population growth', 'bus', '', 'numeric'),
('bd_hgnace2_r3_NBPG2', 'NetBusPopGr_F', 'Net business population growth', 'bus', '', 'numeric'),
('bd_hgnace2_r3_NBPG3', 'NetBusPopGr_G', 'Net business population growth', 'bus', '', 'numeric'),
('bd_hgnace2_r3_NBPG4', 'NetBusPopGr_H', 'Net business population growth', 'bus', '', 'numeric'),
('bd_hgnace2_r3_NBPG5', 'NetBusPopGr_I', 'Net business population growth', 'bus', '', 'numeric'),
('bd_hgnace2_r3_NBPG6', 'NetBusPopGr_J', 'Net business population growth', 'bus', '', 'numeric'),
('bd_hgnace2_r3_NBPG7', 'NetBusPopGr_K-L-X', 'Net business population growth', 'bus', '', 'numeric'),
('bd_hgnace2_r3_NBPG8', 'NetBusPopGr_M-N', 'Net business population growth', 'bus', '', 'numeric'),
('bd_hgnace2_r3_NBPG9', 'NetBusPopGr_P-Q', 'Net business population growth', 'bus', '', 'numeric'),
('bd_hgnace2_r3_NHGE', 'NHGE_Empl', 'Number of high growth enterprises measured in employment (growth by 10% or more)', 'bus', '', 'numeric'),
('bd_size_r3', 'Pop_ActEntr', 'Population of active enterprises', 'bus', '', 'numeric'),
('bd_size_r3_1', 'NEofActEntr', 'Number of employees in the population of active enterprises', 'bus', '', 'numeric'),
('bd_size_r3_ACS', 'AvCompSize', 'Avergage company size: Number of employees in the population of active enterprises divided by Population of active enterprises', 'bus', '', 'numeric'),
('demo_r_d2jan', 'Pop_tot', 'Total Population', 'dem', '', 'numeric'),
('demo_r_d2jan_1', 'Pop_20-34', 'Population aged 20-34 years', 'dem', '', 'numeric'),
('demo_r_d2jan_2', 'Pop_65+', 'Population aged more than 65 years', 'dem', '', 'numeric'),
('demo_r_gind3', 'Pop_change', 'Crude rates of natural change of population', 'dem', '', 'numeric'),
('demo_r_pjanind2', 'DepRatio', 'Dependency Ratio, Elderly (% 65+ over population 15-64)', 'dem', '', 'numeric'),
('edat_lfse_04', 'Edu_Tert', 'Population completed tertiary education', 'dem', '', 'numeric'),
('hrst_st_rcat', 'HRSTofActPop', 'Human resources in science and technology (HRST)  (% of active population)', 'eco', '', 'numeric'),
('hrst_st_rcat_1', 'HRSTofTotPop', 'Human resources in science and technology (HRST)  (% of total population)', 'ino', '', 'numeric'),
('htec_emp_reg2', 'HTEC_Empl', 'Employment in high-tech sectors (% of total employment)', 'ino', '', 'numeric'),
('lfst_r_lfe2emp', 'Empl_15-64', 'Employment (15-64)', 'eco', '', 'numeric'),
('lfst_r_lfp2act', 'Pop_EcAct', 'Economically active population', 'eco', '', 'numeric'),
('lfst_r_lfu3pers', 'Unempl_20-64', 'Unemployment (20-64)', 'eco', '', 'numeric'),
('nama_10r_2gdp', 'GDP', 'Gross Domestic Product (GDP)', 'eco', '', 'numeric'),
('nama_10r_3gva', 'GVA', 'Gross value added', 'eco', '', 'numeric'),
('pat_ep_rtec', 'HTEC_PatApps', 'High-tech patent applications to the European patent office', 'ino', '', 'numeric'),
('pat_ep_rtot', 'PatentApps', 'Patent applications to the European patent office', 'ino', '', 'numeric'),
('rd_e_gerdreg', 'Intram_R&D', 'Total intramural R&D expenditure (% of GDP)', 'ino', '', 'numeric'),
('rd_p_persreg', 'Res_All', 'Researchers all sectors ( Percentage of active population - numerator in head count (HC))', 'ino', '', 'numeric'),
('sbs_r_nuts06_r2_1', 'GEmplRate_B', 'Growth rate of employment (%)_Mining and quarrying', 'eco', '', 'numeric'),
('sbs_r_nuts06_r2_10', 'GEmplRate_L', 'Growth rate of employment (%)_Real estate activities', 'eco', '', 'numeric'),
('sbs_r_nuts06_r2_11', 'GEmplRate_M', 'Growth rate of employment (%)_Professional, scientific and technical activities', 'eco', '', 'numeric'),
('sbs_r_nuts06_r2_12', 'GEmplRate_N', 'Growth rate of employment (%)_Administrative and support service activities', 'eco', '', 'numeric'),
('sbs_r_nuts06_r2_2', 'GEmplRate_C', 'Growth rate of employment (%)_Manufacturing', 'eco', '', 'numeric'),
('sbs_r_nuts06_r2_3', 'GEmplRate_D', 'Growth rate of employment (%)_Electricity, gas, steam and air conditioning supply', 'eco', '', 'numeric'),
('sbs_r_nuts06_r2_4', 'GEmplRate_E', 'Growth rate of employment (%)_Water supply; sewerage, waste management and remediation activities', 'eco', '', 'numeric'),
('sbs_r_nuts06_r2_5', 'GEmplRate_F', 'Growth rate of employment (%)_Construction', 'eco', '', 'numeric'),
('sbs_r_nuts06_r2_6', 'GEmplRate_G', 'Growth rate of employment (%)_Wholesale and retail trade; repair of motor vehicles and motorcycles', 'eco', '', 'numeric'),
('sbs_r_nuts06_r2_7', 'GEmplRate_H', 'Growth rate of employment (%)_Transportation and storage', 'eco', '', 'numeric'),
('sbs_r_nuts06_r2_8', 'GEmplRate_I', 'Growth rate of employment (%)_Accommodation and food service activities', 'eco', '', 'numeric'),
('sbs_r_nuts06_r2_9', 'GEmplRate_J', 'Growth rate of employment (%)_Information and communication', 'eco', '', 'numeric'),
('sbs_r_nuts06_r2_LU1', 'NLU_B', 'Mining and quarrying (B), Number of local units', 'sec', '', 'numeric'),
('sbs_r_nuts06_r2_LU10', 'NLU_L', 'Real estate activities (L), Number of local units', 'sec', '', 'numeric'),
('sbs_r_nuts06_r2_LU11', 'NLU_M', 'Professional, scientific and technical activities (M), Number of local units', 'sec', '', 'numeric'),
('sbs_r_nuts06_r2_LU12', 'NLU_N', 'Administrative and support service activities (N), Number of local units', 'sec', '', 'numeric'),
('sbs_r_nuts06_r2_LU2', 'NLU_C', 'Manufacturing (C), Number of local units', 'sec', '', 'numeric'),
('sbs_r_nuts06_r2_LU3', 'NLU_D', 'Electricity, gas, steam and air conditioning supply (D), Number of local units', 'sec', '', 'numeric'),
('sbs_r_nuts06_r2_LU4', 'NLU_E', 'Water supply; sewerage, waste management and remediation activities (E), Number of local units', 'sec', '', 'numeric'),
('sbs_r_nuts06_r2_LU5', 'NLU_F', 'Construction (F), Number of local units ', 'sec', '', 'numeric'),
('sbs_r_nuts06_r2_LU6', 'NLU_G', 'Wholesale and retail trade; repair of motor vehicles and motorcycles (G), Number of local units', 'sec', '', 'numeric'),
('sbs_r_nuts06_r2_LU7', 'NLU_H', 'Transportation and storage (H), Number of local units', 'sec', '', 'numeric'),
('sbs_r_nuts06_r2_LU8', 'NLU_I', 'Accommodation and food service activities (I), Number of local units', 'sec', '', 'numeric'),
('sbs_r_nuts06_r2_LU9', 'NLU_J', 'Information and communication (J), Number of local units', 'sec', '', 'numeric'),
('sbs_r_nuts06_r2_PE1', 'PE_B', 'Mining and quarrying (B), Number of persons employed', 'sec', '', 'numeric'),
('sbs_r_nuts06_r2_PE10', 'PE_L', 'Real estate activities (L), Number of persons employed', 'sec', '', 'numeric'),
('sbs_r_nuts06_r2_PE11', 'PE_M', 'Professional, scientific and technical activities (M), Number of persons employed', 'sec', '', 'numeric'),
('sbs_r_nuts06_r2_PE12', 'PE_N', 'Administrative and support service activities (N), Number of persons employed', 'sec', '', 'numeric'),
('sbs_r_nuts06_r2_PE2', 'PE_C', 'Manufacturing (C), Number of persons employed', 'sec', '', 'numeric'),
('sbs_r_nuts06_r2_PE3', 'PE_D', 'Electricity, gas, steam and air conditioning supply (D), Number of persons employed', 'sec', '', 'numeric'),
('sbs_r_nuts06_r2_PE4', 'PE_E', 'Water supply; sewerage, waste management and remediation activities (E), Number of persons employed', 'sec', '', 'numeric'),
('sbs_r_nuts06_r2_PE5', 'PE_F', 'Construction (F), Number of persons employed', 'sec', '', 'numeric'),
('sbs_r_nuts06_r2_PE6', 'PE_G', 'Wholesale and retail trade; repair of motor vehicles and motorcycles (G), Number of persons employed', 'sec', '', 'numeric'),
('sbs_r_nuts06_r2_PE7', 'PE_H', 'Transportation and storage (H), Number of persons employed', 'sec', '', 'numeric'),
('sbs_r_nuts06_r2_PE8', 'PE_I', 'Accommodation and food service activities (I), Number of persons employed', 'sec', '', 'numeric'),
('sbs_r_nuts06_r2_PE9', 'PE_J', 'Information and communication (J), Number of persons employed', 'sec', '', 'numeric'),
('tran_r_avpa_nm', 'AvPass', 'Air Transport: Passengers carried per annum', 'geo', 'inf', 'numeric'),
('tran_r_mago_nm', 'MarFr', 'Maritime transport of freight', 'geo', 'inf', 'numeric'),
('tran_r_mapa_nm', 'MarPass', 'Maritime transport of passengers', 'geo', 'inf', 'numeric');

-- --------------------------------------------------------

--
-- Table structure for table `wp_commentmeta`
--

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_comments`
--

CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_links`
--

CREATE TABLE `wp_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_options`
--

CREATE TABLE `wp_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'https://assetsmapping.s3platform.eu', 'yes'),
(2, 'home', 'https://assetsmapping.s3platform.eu', 'yes'),
(3, 'blogname', 'Regional Assets Mapping', 'yes'),
(4, 'blogdescription', 'OnlineS3 Platform', 'yes'),
(5, 'users_can_register', '1', 'yes'),
(6, 'admin_email', 'elvi.galanaki@gmail.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'closed', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'j F Y', 'yes'),
(24, 'time_format', 'H:i', 'yes'),
(25, 'links_updated_date_format', 'd/m/Y, H:i', 'yes'),
(26, 'comment_moderation', '', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%year%/%monthnum%/%day%/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:115:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:6:\"^auth0\";s:17:\"index.php?auth0=1\";s:41:\"^\\.well-known/oauth2-client-configuration\";s:33:\"index.php?a0_action=oauth2-config\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:41:\"wbcr-snippets/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:51:\"wbcr-snippets/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:71:\"wbcr-snippets/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:66:\"wbcr-snippets/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:66:\"wbcr-snippets/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:47:\"wbcr-snippets/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:30:\"wbcr-snippets/([^/]+)/embed/?$\";s:61:\"index.php?post_type=wbcr-snippets&name=$matches[1]&embed=true\";s:34:\"wbcr-snippets/([^/]+)/trackback/?$\";s:55:\"index.php?post_type=wbcr-snippets&name=$matches[1]&tb=1\";s:42:\"wbcr-snippets/([^/]+)/page/?([0-9]{1,})/?$\";s:68:\"index.php?post_type=wbcr-snippets&name=$matches[1]&paged=$matches[2]\";s:49:\"wbcr-snippets/([^/]+)/comment-page-([0-9]{1,})/?$\";s:68:\"index.php?post_type=wbcr-snippets&name=$matches[1]&cpage=$matches[2]\";s:38:\"wbcr-snippets/([^/]+)(?:/([0-9]+))?/?$\";s:67:\"index.php?post_type=wbcr-snippets&name=$matches[1]&page=$matches[2]\";s:30:\"wbcr-snippets/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:40:\"wbcr-snippets/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:60:\"wbcr-snippets/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:55:\"wbcr-snippets/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:55:\"wbcr-snippets/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:36:\"wbcr-snippets/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:58:\"wbcr-snippet-tags/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:70:\"index.php?taxonomy=wbcr-snippet-tags&term=$matches[1]&feed=$matches[2]\";s:53:\"wbcr-snippet-tags/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:70:\"index.php?taxonomy=wbcr-snippet-tags&term=$matches[1]&feed=$matches[2]\";s:34:\"wbcr-snippet-tags/([^/]+)/embed/?$\";s:64:\"index.php?taxonomy=wbcr-snippet-tags&term=$matches[1]&embed=true\";s:46:\"wbcr-snippet-tags/([^/]+)/page/?([0-9]{1,})/?$\";s:71:\"index.php?taxonomy=wbcr-snippet-tags&term=$matches[1]&paged=$matches[2]\";s:28:\"wbcr-snippet-tags/([^/]+)/?$\";s:53:\"index.php?taxonomy=wbcr-snippet-tags&term=$matches[1]\";s:12:\"robots\\.txt$\";s:18:\"index.php?robots=1\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:39:\"index.php?&page_id=24&cpage=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:58:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:68:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:88:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:64:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:53:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$\";s:91:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$\";s:85:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1\";s:77:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:65:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]\";s:61:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]\";s:47:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:57:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:77:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:53:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]\";s:51:\"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]\";s:38:\"([0-9]{4})/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&cpage=$matches[2]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:4:{i:0;s:18:\"auth0/WP_Auth0.php\";i:1;s:25:\"insert-php/insert_php.php\";i:2;s:47:\"really-simple-ssl/rlrsssl-really-simple-ssl.php\";i:3;s:25:\"sucuri-scanner/sucuri.php\";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', 'a:2:{i:0;s:88:\"/home/intelelv1/assetsmapping.s3platform.eu/wp-content/plugins/duplicator/duplicator.php\";i:2;s:0:\"\";}', 'no'),
(40, 'template', 'twentysixteen', 'yes'),
(41, 'stylesheet', 'onlineS3', 'yes'),
(42, 'comment_whitelist', '1', 'yes'),
(43, 'blacklist_keys', '', 'no'),
(44, 'comment_registration', '', 'yes'),
(45, 'html_type', 'text/html', 'yes'),
(46, 'use_trackback', '0', 'yes'),
(47, 'default_role', 'subscriber', 'yes'),
(48, 'db_version', '38590', 'yes'),
(49, 'uploads_use_yearmonth_folders', '1', 'yes'),
(50, 'upload_path', '', 'yes'),
(51, 'blog_public', '1', 'yes'),
(52, 'default_link_category', '2', 'yes'),
(53, 'show_on_front', 'page', 'yes'),
(54, 'tag_base', '', 'yes'),
(55, 'show_avatars', '1', 'yes'),
(56, 'avatar_rating', 'G', 'yes'),
(57, 'upload_url_path', '', 'yes'),
(58, 'thumbnail_size_w', '150', 'yes'),
(59, 'thumbnail_size_h', '150', 'yes'),
(60, 'thumbnail_crop', '1', 'yes'),
(61, 'medium_size_w', '300', 'yes'),
(62, 'medium_size_h', '300', 'yes'),
(63, 'avatar_default', 'mystery', 'yes'),
(64, 'large_size_w', '1024', 'yes'),
(65, 'large_size_h', '1024', 'yes'),
(66, 'image_default_link_type', 'none', 'yes'),
(67, 'image_default_size', '', 'yes'),
(68, 'image_default_align', '', 'yes'),
(69, 'close_comments_for_old_posts', '', 'yes'),
(70, 'close_comments_days_old', '14', 'yes'),
(71, 'thread_comments', '1', 'yes'),
(72, 'thread_comments_depth', '5', 'yes'),
(73, 'page_comments', '', 'yes'),
(74, 'comments_per_page', '50', 'yes'),
(75, 'default_comments_page', 'newest', 'yes'),
(76, 'comment_order', 'asc', 'yes'),
(77, 'sticky_posts', 'a:0:{}', 'yes'),
(78, 'widget_categories', 'a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(79, 'widget_text', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(80, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(81, 'uninstall_plugins', 'a:2:{s:18:\"auth0/WP_Auth0.php\";a:2:{i:0;s:8:\"WP_Auth0\";i:1;s:9:\"uninstall\";}s:25:\"sucuri-scanner/sucuri.php\";s:19:\"sucuriscanUninstall\";}', 'no'),
(82, 'timezone_string', '', 'yes'),
(83, 'page_for_posts', '0', 'yes'),
(84, 'page_on_front', '24', 'yes'),
(85, 'default_post_format', '0', 'yes'),
(86, 'link_manager_enabled', '0', 'yes'),
(87, 'finished_splitting_shared_terms', '1', 'yes'),
(88, 'site_icon', '0', 'yes'),
(89, 'medium_large_size_w', '768', 'yes'),
(90, 'medium_large_size_h', '0', 'yes'),
(91, 'initial_db_version', '36686', 'yes'),
(92, 'wp_user_roles', 'a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:68:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:18:\"edit_wbcr-snippets\";b:1;s:18:\"read_wbcr-snippets\";b:1;s:20:\"delete_wbcr-snippets\";b:1;s:19:\"edit_wbcr-snippetss\";b:1;s:26:\"edit_others_wbcr-snippetss\";b:1;s:22:\"publish_wbcr-snippetss\";b:1;s:27:\"read_private_wbcr-snippetss\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}', 'yes'),
(93, 'WPLANG', 'el', 'yes'),
(94, 'widget_search', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(95, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(96, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(97, 'widget_archives', 'a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(98, 'widget_meta', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(99, 'sidebars_widgets', 'a:5:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-2\";N;s:9:\"sidebar-3\";N;s:13:\"array_version\";i:3;}', 'yes'),
(100, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(101, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(102, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(103, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(104, 'cron', 'a:8:{i:1542708596;a:3:{s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1542708605;a:1:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1542710324;a:3:{s:25:\"um_daily_scheduled_events\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:26:\"um_hourly_scheduled_events\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}s:30:\"um_twicedaily_scheduled_events\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1542710337;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1542710341;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1542721128;a:1:{s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1542789629;a:1:{s:25:\"sucuriscan_scheduled_scan\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}', 'yes'),
(107, 'nonce_key', 'X/5<gUx|Vs@(+Fx;[W6|@$L.-t(j:lW(ur1]3?W4z^?vDk-{7D}:PD(I|!U>H,tE', 'yes'),
(108, 'nonce_salt', '@rx04W&;IzMrc<AR4ld3RMN]fnsb:J2Z!_mJG_`GL`R#gc{K-wm5$@`=b}HcHjXt', 'yes'),
(116, 'auto_core_update_notified', 'a:4:{s:4:\"type\";s:7:\"success\";s:5:\"email\";s:23:\"elvi.galanaki@gmail.com\";s:7:\"version\";s:5:\"4.9.8\";s:9:\"timestamp\";i:1533248804;}', 'no'),
(117, 'auth_key', '6H(y;IHBp5+G]VhQ$Q-$B4]3$lkU&sxF_::KAv#x{e*L0@@Yo@ND`<@FLG(5<;~E', 'yes'),
(118, 'auth_salt', 'F3,_(bBu3Kzbjen0APBDKk=KOy-:HE=<|XbEm:ov ME&Y{0&M}n*}Z6#YF_Ht%z}', 'yes'),
(119, 'logged_in_key', 'Hm$tB7Ujo~O6c9A^LG77o@-7$nYCH0YhGYc|DC|lA6^ ZLz,x6=Yxy(7U1$e3>ua', 'yes'),
(120, 'logged_in_salt', '^I-Bg%MDuMNRS$vNm3=F2]g+FO$~8QSwDf4xEnm;(zM4{%IbL $[cU_u[d[n7q>T', 'yes'),
(148, 'recently_activated', 'a:0:{}', 'yes'),
(152, 'redux-framework-tracking', 'a:3:{s:8:\"dev_mode\";b:0;s:4:\"hash\";s:32:\"1f5602169d247955baee7830a11dcd23\";s:14:\"allow_tracking\";s:2:\"no\";}', 'yes'),
(153, 'um_version', '1.3.80', 'yes');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(154, 'um_cache_fonticons', 'a:1218:{i:0;s:13:\"um-icon-alert\";i:1;s:21:\"um-icon-alert-circled\";i:2;s:19:\"um-icon-android-add\";i:3;s:26:\"um-icon-android-add-circle\";i:4;s:27:\"um-icon-android-alarm-clock\";i:5;s:21:\"um-icon-android-alert\";i:6;s:20:\"um-icon-android-apps\";i:7;s:23:\"um-icon-android-archive\";i:8;s:26:\"um-icon-android-arrow-back\";i:9;s:26:\"um-icon-android-arrow-down\";i:10;s:30:\"um-icon-android-arrow-dropdown\";i:11;s:37:\"um-icon-android-arrow-dropdown-circle\";i:12;s:30:\"um-icon-android-arrow-dropleft\";i:13;s:37:\"um-icon-android-arrow-dropleft-circle\";i:14;s:31:\"um-icon-android-arrow-dropright\";i:15;s:38:\"um-icon-android-arrow-dropright-circle\";i:16;s:28:\"um-icon-android-arrow-dropup\";i:17;s:35:\"um-icon-android-arrow-dropup-circle\";i:18;s:29:\"um-icon-android-arrow-forward\";i:19;s:24:\"um-icon-android-arrow-up\";i:20;s:22:\"um-icon-android-attach\";i:21;s:19:\"um-icon-android-bar\";i:22;s:23:\"um-icon-android-bicycle\";i:23;s:20:\"um-icon-android-boat\";i:24;s:24:\"um-icon-android-bookmark\";i:25;s:20:\"um-icon-android-bulb\";i:26;s:19:\"um-icon-android-bus\";i:27;s:24:\"um-icon-android-calendar\";i:28;s:20:\"um-icon-android-call\";i:29;s:22:\"um-icon-android-camera\";i:30;s:22:\"um-icon-android-cancel\";i:31;s:19:\"um-icon-android-car\";i:32;s:20:\"um-icon-android-cart\";i:33;s:20:\"um-icon-android-chat\";i:34;s:24:\"um-icon-android-checkbox\";i:35;s:30:\"um-icon-android-checkbox-blank\";i:36;s:32:\"um-icon-android-checkbox-outline\";i:37;s:38:\"um-icon-android-checkbox-outline-blank\";i:38;s:32:\"um-icon-android-checkmark-circle\";i:39;s:25:\"um-icon-android-clipboard\";i:40;s:21:\"um-icon-android-close\";i:41;s:21:\"um-icon-android-cloud\";i:42;s:28:\"um-icon-android-cloud-circle\";i:43;s:26:\"um-icon-android-cloud-done\";i:44;s:29:\"um-icon-android-cloud-outline\";i:45;s:29:\"um-icon-android-color-palette\";i:46;s:23:\"um-icon-android-compass\";i:47;s:23:\"um-icon-android-contact\";i:48;s:24:\"um-icon-android-contacts\";i:49;s:24:\"um-icon-android-contract\";i:50;s:22:\"um-icon-android-create\";i:51;s:22:\"um-icon-android-delete\";i:52;s:23:\"um-icon-android-desktop\";i:53;s:24:\"um-icon-android-document\";i:54;s:20:\"um-icon-android-done\";i:55;s:24:\"um-icon-android-done-all\";i:56;s:24:\"um-icon-android-download\";i:57;s:22:\"um-icon-android-drafts\";i:58;s:20:\"um-icon-android-exit\";i:59;s:22:\"um-icon-android-expand\";i:60;s:24:\"um-icon-android-favorite\";i:61;s:32:\"um-icon-android-favorite-outline\";i:62;s:20:\"um-icon-android-film\";i:63;s:22:\"um-icon-android-folder\";i:64;s:27:\"um-icon-android-folder-open\";i:65;s:22:\"um-icon-android-funnel\";i:66;s:21:\"um-icon-android-globe\";i:67;s:20:\"um-icon-android-hand\";i:68;s:23:\"um-icon-android-hangout\";i:69;s:21:\"um-icon-android-happy\";i:70;s:20:\"um-icon-android-home\";i:71;s:21:\"um-icon-android-image\";i:72;s:22:\"um-icon-android-laptop\";i:73;s:20:\"um-icon-android-list\";i:74;s:22:\"um-icon-android-locate\";i:75;s:20:\"um-icon-android-lock\";i:76;s:20:\"um-icon-android-mail\";i:77;s:19:\"um-icon-android-map\";i:78;s:20:\"um-icon-android-menu\";i:79;s:26:\"um-icon-android-microphone\";i:80;s:30:\"um-icon-android-microphone-off\";i:81;s:31:\"um-icon-android-more-horizontal\";i:82;s:29:\"um-icon-android-more-vertical\";i:83;s:24:\"um-icon-android-navigate\";i:84;s:29:\"um-icon-android-notifications\";i:85;s:34:\"um-icon-android-notifications-none\";i:86;s:33:\"um-icon-android-notifications-off\";i:87;s:20:\"um-icon-android-open\";i:88;s:23:\"um-icon-android-options\";i:89;s:22:\"um-icon-android-people\";i:90;s:22:\"um-icon-android-person\";i:91;s:26:\"um-icon-android-person-add\";i:92;s:31:\"um-icon-android-phone-landscape\";i:93;s:30:\"um-icon-android-phone-portrait\";i:94;s:19:\"um-icon-android-pin\";i:95;s:21:\"um-icon-android-plane\";i:96;s:25:\"um-icon-android-playstore\";i:97;s:21:\"um-icon-android-print\";i:98;s:32:\"um-icon-android-radio-button-off\";i:99;s:31:\"um-icon-android-radio-button-on\";i:100;s:23:\"um-icon-android-refresh\";i:101;s:22:\"um-icon-android-remove\";i:102;s:29:\"um-icon-android-remove-circle\";i:103;s:26:\"um-icon-android-restaurant\";i:104;s:19:\"um-icon-android-sad\";i:105;s:22:\"um-icon-android-search\";i:106;s:20:\"um-icon-android-send\";i:107;s:24:\"um-icon-android-settings\";i:108;s:21:\"um-icon-android-share\";i:109;s:25:\"um-icon-android-share-alt\";i:110;s:20:\"um-icon-android-star\";i:111;s:25:\"um-icon-android-star-half\";i:112;s:28:\"um-icon-android-star-outline\";i:113;s:25:\"um-icon-android-stopwatch\";i:114;s:22:\"um-icon-android-subway\";i:115;s:21:\"um-icon-android-sunny\";i:116;s:20:\"um-icon-android-sync\";i:117;s:23:\"um-icon-android-textsms\";i:118;s:20:\"um-icon-android-time\";i:119;s:21:\"um-icon-android-train\";i:120;s:22:\"um-icon-android-unlock\";i:121;s:22:\"um-icon-android-upload\";i:122;s:27:\"um-icon-android-volume-down\";i:123;s:27:\"um-icon-android-volume-mute\";i:124;s:26:\"um-icon-android-volume-off\";i:125;s:25:\"um-icon-android-volume-up\";i:126;s:20:\"um-icon-android-walk\";i:127;s:23:\"um-icon-android-warning\";i:128;s:21:\"um-icon-android-watch\";i:129;s:20:\"um-icon-android-wifi\";i:130;s:16:\"um-icon-aperture\";i:131;s:15:\"um-icon-archive\";i:132;s:20:\"um-icon-arrow-down-a\";i:133;s:20:\"um-icon-arrow-down-b\";i:134;s:20:\"um-icon-arrow-down-c\";i:135;s:20:\"um-icon-arrow-expand\";i:136;s:29:\"um-icon-arrow-graph-down-left\";i:137;s:30:\"um-icon-arrow-graph-down-right\";i:138;s:27:\"um-icon-arrow-graph-up-left\";i:139;s:28:\"um-icon-arrow-graph-up-right\";i:140;s:20:\"um-icon-arrow-left-a\";i:141;s:20:\"um-icon-arrow-left-b\";i:142;s:20:\"um-icon-arrow-left-c\";i:143;s:18:\"um-icon-arrow-move\";i:144;s:20:\"um-icon-arrow-resize\";i:145;s:25:\"um-icon-arrow-return-left\";i:146;s:26:\"um-icon-arrow-return-right\";i:147;s:21:\"um-icon-arrow-right-a\";i:148;s:21:\"um-icon-arrow-right-b\";i:149;s:21:\"um-icon-arrow-right-c\";i:150;s:20:\"um-icon-arrow-shrink\";i:151;s:18:\"um-icon-arrow-swap\";i:152;s:18:\"um-icon-arrow-up-a\";i:153;s:18:\"um-icon-arrow-up-b\";i:154;s:18:\"um-icon-arrow-up-c\";i:155;s:16:\"um-icon-asterisk\";i:156;s:10:\"um-icon-at\";i:157;s:17:\"um-icon-backspace\";i:158;s:25:\"um-icon-backspace-outline\";i:159;s:11:\"um-icon-bag\";i:160;s:24:\"um-icon-battery-charging\";i:161;s:21:\"um-icon-battery-empty\";i:162;s:20:\"um-icon-battery-full\";i:163;s:20:\"um-icon-battery-half\";i:164;s:19:\"um-icon-battery-low\";i:165;s:14:\"um-icon-beaker\";i:166;s:12:\"um-icon-beer\";i:167;s:17:\"um-icon-bluetooth\";i:168;s:15:\"um-icon-bonfire\";i:169;s:16:\"um-icon-bookmark\";i:170;s:14:\"um-icon-bowtie\";i:171;s:17:\"um-icon-briefcase\";i:172;s:11:\"um-icon-bug\";i:173;s:18:\"um-icon-calculator\";i:174;s:16:\"um-icon-calendar\";i:175;s:14:\"um-icon-camera\";i:176;s:12:\"um-icon-card\";i:177;s:12:\"um-icon-cash\";i:178;s:15:\"um-icon-chatbox\";i:179;s:23:\"um-icon-chatbox-working\";i:180;s:17:\"um-icon-chatboxes\";i:181;s:18:\"um-icon-chatbubble\";i:182;s:26:\"um-icon-chatbubble-working\";i:183;s:19:\"um-icon-chatbubbles\";i:184;s:17:\"um-icon-checkmark\";i:185;s:25:\"um-icon-checkmark-circled\";i:186;s:23:\"um-icon-checkmark-round\";i:187;s:20:\"um-icon-chevron-down\";i:188;s:20:\"um-icon-chevron-left\";i:189;s:21:\"um-icon-chevron-right\";i:190;s:18:\"um-icon-chevron-up\";i:191;s:17:\"um-icon-clipboard\";i:192;s:13:\"um-icon-clock\";i:193;s:13:\"um-icon-close\";i:194;s:21:\"um-icon-close-circled\";i:195;s:19:\"um-icon-close-round\";i:196;s:25:\"um-icon-closed-captioning\";i:197;s:13:\"um-icon-cloud\";i:198;s:12:\"um-icon-code\";i:199;s:21:\"um-icon-code-download\";i:200;s:20:\"um-icon-code-working\";i:201;s:14:\"um-icon-coffee\";i:202;s:15:\"um-icon-compass\";i:203;s:15:\"um-icon-compose\";i:204;s:23:\"um-icon-connection-bars\";i:205;s:16:\"um-icon-contrast\";i:206;s:12:\"um-icon-crop\";i:207;s:12:\"um-icon-cube\";i:208;s:12:\"um-icon-disc\";i:209;s:16:\"um-icon-document\";i:210;s:21:\"um-icon-document-text\";i:211;s:12:\"um-icon-drag\";i:212;s:13:\"um-icon-earth\";i:213;s:13:\"um-icon-easel\";i:214;s:12:\"um-icon-edit\";i:215;s:11:\"um-icon-egg\";i:216;s:13:\"um-icon-eject\";i:217;s:13:\"um-icon-email\";i:218;s:20:\"um-icon-email-unread\";i:219;s:24:\"um-icon-erlenmeyer-flask\";i:220;s:32:\"um-icon-erlenmeyer-flask-bubbles\";i:221;s:11:\"um-icon-eye\";i:222;s:20:\"um-icon-eye-disabled\";i:223;s:14:\"um-icon-female\";i:224;s:14:\"um-icon-filing\";i:225;s:19:\"um-icon-film-marker\";i:226;s:16:\"um-icon-fireball\";i:227;s:12:\"um-icon-flag\";i:228;s:13:\"um-icon-flame\";i:229;s:13:\"um-icon-flash\";i:230;s:17:\"um-icon-flash-off\";i:231;s:14:\"um-icon-folder\";i:232;s:12:\"um-icon-fork\";i:233;s:17:\"um-icon-fork-repo\";i:234;s:15:\"um-icon-forward\";i:235;s:14:\"um-icon-funnel\";i:236;s:14:\"um-icon-gear-a\";i:237;s:14:\"um-icon-gear-b\";i:238;s:12:\"um-icon-grid\";i:239;s:14:\"um-icon-hammer\";i:240;s:13:\"um-icon-happy\";i:241;s:21:\"um-icon-happy-outline\";i:242;s:17:\"um-icon-headphone\";i:243;s:13:\"um-icon-heart\";i:244;s:20:\"um-icon-heart-broken\";i:245;s:12:\"um-icon-help\";i:246;s:17:\"um-icon-help-buoy\";i:247;s:20:\"um-icon-help-circled\";i:248;s:12:\"um-icon-home\";i:249;s:16:\"um-icon-icecream\";i:250;s:13:\"um-icon-image\";i:251;s:14:\"um-icon-images\";i:252;s:19:\"um-icon-information\";i:253;s:27:\"um-icon-information-circled\";i:254;s:13:\"um-icon-ionic\";i:255;s:17:\"um-icon-ios-alarm\";i:256;s:25:\"um-icon-ios-alarm-outline\";i:257;s:18:\"um-icon-ios-albums\";i:258;s:26:\"um-icon-ios-albums-outline\";i:259;s:28:\"um-icon-ios-americanfootball\";i:260;s:36:\"um-icon-ios-americanfootball-outline\";i:261;s:21:\"um-icon-ios-analytics\";i:262;s:29:\"um-icon-ios-analytics-outline\";i:263;s:22:\"um-icon-ios-arrow-back\";i:264;s:22:\"um-icon-ios-arrow-down\";i:265;s:25:\"um-icon-ios-arrow-forward\";i:266;s:22:\"um-icon-ios-arrow-left\";i:267;s:23:\"um-icon-ios-arrow-right\";i:268;s:27:\"um-icon-ios-arrow-thin-down\";i:269;s:27:\"um-icon-ios-arrow-thin-left\";i:270;s:28:\"um-icon-ios-arrow-thin-right\";i:271;s:25:\"um-icon-ios-arrow-thin-up\";i:272;s:20:\"um-icon-ios-arrow-up\";i:273;s:14:\"um-icon-ios-at\";i:274;s:22:\"um-icon-ios-at-outline\";i:275;s:19:\"um-icon-ios-barcode\";i:276;s:27:\"um-icon-ios-barcode-outline\";i:277;s:20:\"um-icon-ios-baseball\";i:278;s:28:\"um-icon-ios-baseball-outline\";i:279;s:22:\"um-icon-ios-basketball\";i:280;s:30:\"um-icon-ios-basketball-outline\";i:281;s:16:\"um-icon-ios-bell\";i:282;s:24:\"um-icon-ios-bell-outline\";i:283;s:16:\"um-icon-ios-body\";i:284;s:24:\"um-icon-ios-body-outline\";i:285;s:16:\"um-icon-ios-bolt\";i:286;s:24:\"um-icon-ios-bolt-outline\";i:287;s:16:\"um-icon-ios-book\";i:288;s:24:\"um-icon-ios-book-outline\";i:289;s:21:\"um-icon-ios-bookmarks\";i:290;s:29:\"um-icon-ios-bookmarks-outline\";i:291;s:15:\"um-icon-ios-box\";i:292;s:23:\"um-icon-ios-box-outline\";i:293;s:21:\"um-icon-ios-briefcase\";i:294;s:29:\"um-icon-ios-briefcase-outline\";i:295;s:20:\"um-icon-ios-browsers\";i:296;s:28:\"um-icon-ios-browsers-outline\";i:297;s:22:\"um-icon-ios-calculator\";i:298;s:30:\"um-icon-ios-calculator-outline\";i:299;s:20:\"um-icon-ios-calendar\";i:300;s:28:\"um-icon-ios-calendar-outline\";i:301;s:18:\"um-icon-ios-camera\";i:302;s:26:\"um-icon-ios-camera-outline\";i:303;s:16:\"um-icon-ios-cart\";i:304;s:24:\"um-icon-ios-cart-outline\";i:305;s:21:\"um-icon-ios-chatboxes\";i:306;s:29:\"um-icon-ios-chatboxes-outline\";i:307;s:22:\"um-icon-ios-chatbubble\";i:308;s:30:\"um-icon-ios-chatbubble-outline\";i:309;s:21:\"um-icon-ios-checkmark\";i:310;s:27:\"um-icon-ios-checkmark-empty\";i:311;s:29:\"um-icon-ios-checkmark-outline\";i:312;s:25:\"um-icon-ios-circle-filled\";i:313;s:26:\"um-icon-ios-circle-outline\";i:314;s:17:\"um-icon-ios-clock\";i:315;s:25:\"um-icon-ios-clock-outline\";i:316;s:17:\"um-icon-ios-close\";i:317;s:23:\"um-icon-ios-close-empty\";i:318;s:25:\"um-icon-ios-close-outline\";i:319;s:17:\"um-icon-ios-cloud\";i:320;s:26:\"um-icon-ios-cloud-download\";i:321;s:34:\"um-icon-ios-cloud-download-outline\";i:322;s:25:\"um-icon-ios-cloud-outline\";i:323;s:24:\"um-icon-ios-cloud-upload\";i:324;s:32:\"um-icon-ios-cloud-upload-outline\";i:325;s:18:\"um-icon-ios-cloudy\";i:326;s:24:\"um-icon-ios-cloudy-night\";i:327;s:32:\"um-icon-ios-cloudy-night-outline\";i:328;s:26:\"um-icon-ios-cloudy-outline\";i:329;s:15:\"um-icon-ios-cog\";i:330;s:23:\"um-icon-ios-cog-outline\";i:331;s:24:\"um-icon-ios-color-filter\";i:332;s:32:\"um-icon-ios-color-filter-outline\";i:333;s:22:\"um-icon-ios-color-wand\";i:334;s:30:\"um-icon-ios-color-wand-outline\";i:335;s:19:\"um-icon-ios-compose\";i:336;s:27:\"um-icon-ios-compose-outline\";i:337;s:19:\"um-icon-ios-contact\";i:338;s:27:\"um-icon-ios-contact-outline\";i:339;s:16:\"um-icon-ios-copy\";i:340;s:24:\"um-icon-ios-copy-outline\";i:341;s:16:\"um-icon-ios-crop\";i:342;s:23:\"um-icon-ios-crop-strong\";i:343;s:20:\"um-icon-ios-download\";i:344;s:28:\"um-icon-ios-download-outline\";i:345;s:16:\"um-icon-ios-drag\";i:346;s:17:\"um-icon-ios-email\";i:347;s:25:\"um-icon-ios-email-outline\";i:348;s:15:\"um-icon-ios-eye\";i:349;s:23:\"um-icon-ios-eye-outline\";i:350;s:23:\"um-icon-ios-fastforward\";i:351;s:31:\"um-icon-ios-fastforward-outline\";i:352;s:18:\"um-icon-ios-filing\";i:353;s:26:\"um-icon-ios-filing-outline\";i:354;s:16:\"um-icon-ios-film\";i:355;s:24:\"um-icon-ios-film-outline\";i:356;s:16:\"um-icon-ios-flag\";i:357;s:24:\"um-icon-ios-flag-outline\";i:358;s:17:\"um-icon-ios-flame\";i:359;s:25:\"um-icon-ios-flame-outline\";i:360;s:17:\"um-icon-ios-flask\";i:361;s:25:\"um-icon-ios-flask-outline\";i:362;s:18:\"um-icon-ios-flower\";i:363;s:26:\"um-icon-ios-flower-outline\";i:364;s:18:\"um-icon-ios-folder\";i:365;s:26:\"um-icon-ios-folder-outline\";i:366;s:20:\"um-icon-ios-football\";i:367;s:28:\"um-icon-ios-football-outline\";i:368;s:29:\"um-icon-ios-game-controller-a\";i:369;s:37:\"um-icon-ios-game-controller-a-outline\";i:370;s:29:\"um-icon-ios-game-controller-b\";i:371;s:37:\"um-icon-ios-game-controller-b-outline\";i:372;s:16:\"um-icon-ios-gear\";i:373;s:24:\"um-icon-ios-gear-outline\";i:374;s:19:\"um-icon-ios-glasses\";i:375;s:27:\"um-icon-ios-glasses-outline\";i:376;s:21:\"um-icon-ios-grid-view\";i:377;s:29:\"um-icon-ios-grid-view-outline\";i:378;s:17:\"um-icon-ios-heart\";i:379;s:25:\"um-icon-ios-heart-outline\";i:380;s:16:\"um-icon-ios-help\";i:381;s:22:\"um-icon-ios-help-empty\";i:382;s:24:\"um-icon-ios-help-outline\";i:383;s:16:\"um-icon-ios-home\";i:384;s:24:\"um-icon-ios-home-outline\";i:385;s:20:\"um-icon-ios-infinite\";i:386;s:28:\"um-icon-ios-infinite-outline\";i:387;s:23:\"um-icon-ios-information\";i:388;s:29:\"um-icon-ios-information-empty\";i:389;s:31:\"um-icon-ios-information-outline\";i:390;s:25:\"um-icon-ios-ionic-outline\";i:391;s:18:\"um-icon-ios-keypad\";i:392;s:26:\"um-icon-ios-keypad-outline\";i:393;s:21:\"um-icon-ios-lightbulb\";i:394;s:29:\"um-icon-ios-lightbulb-outline\";i:395;s:16:\"um-icon-ios-list\";i:396;s:24:\"um-icon-ios-list-outline\";i:397;s:20:\"um-icon-ios-location\";i:398;s:28:\"um-icon-ios-location-outline\";i:399;s:18:\"um-icon-ios-locked\";i:400;s:26:\"um-icon-ios-locked-outline\";i:401;s:16:\"um-icon-ios-loop\";i:402;s:23:\"um-icon-ios-loop-strong\";i:403;s:19:\"um-icon-ios-medical\";i:404;s:27:\"um-icon-ios-medical-outline\";i:405;s:18:\"um-icon-ios-medkit\";i:406;s:26:\"um-icon-ios-medkit-outline\";i:407;s:15:\"um-icon-ios-mic\";i:408;s:19:\"um-icon-ios-mic-off\";i:409;s:23:\"um-icon-ios-mic-outline\";i:410;s:17:\"um-icon-ios-minus\";i:411;s:23:\"um-icon-ios-minus-empty\";i:412;s:25:\"um-icon-ios-minus-outline\";i:413;s:19:\"um-icon-ios-monitor\";i:414;s:27:\"um-icon-ios-monitor-outline\";i:415;s:16:\"um-icon-ios-moon\";i:416;s:24:\"um-icon-ios-moon-outline\";i:417;s:16:\"um-icon-ios-more\";i:418;s:24:\"um-icon-ios-more-outline\";i:419;s:24:\"um-icon-ios-musical-note\";i:420;s:25:\"um-icon-ios-musical-notes\";i:421;s:20:\"um-icon-ios-navigate\";i:422;s:28:\"um-icon-ios-navigate-outline\";i:423;s:21:\"um-icon-ios-nutrition\";i:424;s:29:\"um-icon-ios-nutrition-outline\";i:425;s:17:\"um-icon-ios-paper\";i:426;s:25:\"um-icon-ios-paper-outline\";i:427;s:22:\"um-icon-ios-paperplane\";i:428;s:30:\"um-icon-ios-paperplane-outline\";i:429;s:23:\"um-icon-ios-partlysunny\";i:430;s:31:\"um-icon-ios-partlysunny-outline\";i:431;s:17:\"um-icon-ios-pause\";i:432;s:25:\"um-icon-ios-pause-outline\";i:433;s:15:\"um-icon-ios-paw\";i:434;s:23:\"um-icon-ios-paw-outline\";i:435;s:18:\"um-icon-ios-people\";i:436;s:26:\"um-icon-ios-people-outline\";i:437;s:18:\"um-icon-ios-person\";i:438;s:26:\"um-icon-ios-person-outline\";i:439;s:21:\"um-icon-ios-personadd\";i:440;s:29:\"um-icon-ios-personadd-outline\";i:441;s:18:\"um-icon-ios-photos\";i:442;s:26:\"um-icon-ios-photos-outline\";i:443;s:15:\"um-icon-ios-pie\";i:444;s:23:\"um-icon-ios-pie-outline\";i:445;s:16:\"um-icon-ios-pint\";i:446;s:24:\"um-icon-ios-pint-outline\";i:447;s:16:\"um-icon-ios-play\";i:448;s:24:\"um-icon-ios-play-outline\";i:449;s:16:\"um-icon-ios-plus\";i:450;s:22:\"um-icon-ios-plus-empty\";i:451;s:24:\"um-icon-ios-plus-outline\";i:452;s:20:\"um-icon-ios-pricetag\";i:453;s:28:\"um-icon-ios-pricetag-outline\";i:454;s:21:\"um-icon-ios-pricetags\";i:455;s:29:\"um-icon-ios-pricetags-outline\";i:456;s:19:\"um-icon-ios-printer\";i:457;s:27:\"um-icon-ios-printer-outline\";i:458;s:17:\"um-icon-ios-pulse\";i:459;s:24:\"um-icon-ios-pulse-strong\";i:460;s:17:\"um-icon-ios-rainy\";i:461;s:25:\"um-icon-ios-rainy-outline\";i:462;s:21:\"um-icon-ios-recording\";i:463;s:29:\"um-icon-ios-recording-outline\";i:464;s:16:\"um-icon-ios-redo\";i:465;s:24:\"um-icon-ios-redo-outline\";i:466;s:19:\"um-icon-ios-refresh\";i:467;s:25:\"um-icon-ios-refresh-empty\";i:468;s:27:\"um-icon-ios-refresh-outline\";i:469;s:18:\"um-icon-ios-reload\";i:470;s:26:\"um-icon-ios-reverse-camera\";i:471;s:34:\"um-icon-ios-reverse-camera-outline\";i:472;s:18:\"um-icon-ios-rewind\";i:473;s:26:\"um-icon-ios-rewind-outline\";i:474;s:16:\"um-icon-ios-rose\";i:475;s:24:\"um-icon-ios-rose-outline\";i:476;s:18:\"um-icon-ios-search\";i:477;s:25:\"um-icon-ios-search-strong\";i:478;s:20:\"um-icon-ios-settings\";i:479;s:27:\"um-icon-ios-settings-strong\";i:480;s:19:\"um-icon-ios-shuffle\";i:481;s:26:\"um-icon-ios-shuffle-strong\";i:482;s:24:\"um-icon-ios-skipbackward\";i:483;s:32:\"um-icon-ios-skipbackward-outline\";i:484;s:23:\"um-icon-ios-skipforward\";i:485;s:31:\"um-icon-ios-skipforward-outline\";i:486;s:17:\"um-icon-ios-snowy\";i:487;s:23:\"um-icon-ios-speedometer\";i:488;s:31:\"um-icon-ios-speedometer-outline\";i:489;s:16:\"um-icon-ios-star\";i:490;s:21:\"um-icon-ios-star-half\";i:491;s:24:\"um-icon-ios-star-outline\";i:492;s:21:\"um-icon-ios-stopwatch\";i:493;s:29:\"um-icon-ios-stopwatch-outline\";i:494;s:17:\"um-icon-ios-sunny\";i:495;s:25:\"um-icon-ios-sunny-outline\";i:496;s:21:\"um-icon-ios-telephone\";i:497;s:29:\"um-icon-ios-telephone-outline\";i:498;s:22:\"um-icon-ios-tennisball\";i:499;s:30:\"um-icon-ios-tennisball-outline\";i:500;s:24:\"um-icon-ios-thunderstorm\";i:501;s:32:\"um-icon-ios-thunderstorm-outline\";i:502;s:16:\"um-icon-ios-time\";i:503;s:24:\"um-icon-ios-time-outline\";i:504;s:17:\"um-icon-ios-timer\";i:505;s:25:\"um-icon-ios-timer-outline\";i:506;s:18:\"um-icon-ios-toggle\";i:507;s:26:\"um-icon-ios-toggle-outline\";i:508;s:17:\"um-icon-ios-trash\";i:509;s:25:\"um-icon-ios-trash-outline\";i:510;s:16:\"um-icon-ios-undo\";i:511;s:24:\"um-icon-ios-undo-outline\";i:512;s:20:\"um-icon-ios-unlocked\";i:513;s:28:\"um-icon-ios-unlocked-outline\";i:514;s:18:\"um-icon-ios-upload\";i:515;s:26:\"um-icon-ios-upload-outline\";i:516;s:20:\"um-icon-ios-videocam\";i:517;s:28:\"um-icon-ios-videocam-outline\";i:518;s:23:\"um-icon-ios-volume-high\";i:519;s:22:\"um-icon-ios-volume-low\";i:520;s:21:\"um-icon-ios-wineglass\";i:521;s:29:\"um-icon-ios-wineglass-outline\";i:522;s:17:\"um-icon-ios-world\";i:523;s:25:\"um-icon-ios-world-outline\";i:524;s:12:\"um-icon-ipad\";i:525;s:14:\"um-icon-iphone\";i:526;s:12:\"um-icon-ipod\";i:527;s:11:\"um-icon-jet\";i:528;s:11:\"um-icon-key\";i:529;s:13:\"um-icon-knife\";i:530;s:14:\"um-icon-laptop\";i:531;s:12:\"um-icon-leaf\";i:532;s:14:\"um-icon-levels\";i:533;s:17:\"um-icon-lightbulb\";i:534;s:12:\"um-icon-link\";i:535;s:14:\"um-icon-load-a\";i:536;s:14:\"um-icon-load-b\";i:537;s:14:\"um-icon-load-c\";i:538;s:14:\"um-icon-load-d\";i:539;s:16:\"um-icon-location\";i:540;s:24:\"um-icon-lock-combination\";i:541;s:14:\"um-icon-locked\";i:542;s:14:\"um-icon-log-in\";i:543;s:15:\"um-icon-log-out\";i:544;s:12:\"um-icon-loop\";i:545;s:14:\"um-icon-magnet\";i:546;s:12:\"um-icon-male\";i:547;s:11:\"um-icon-man\";i:548;s:11:\"um-icon-map\";i:549;s:14:\"um-icon-medkit\";i:550;s:13:\"um-icon-merge\";i:551;s:13:\"um-icon-mic-a\";i:552;s:13:\"um-icon-mic-b\";i:553;s:13:\"um-icon-mic-c\";i:554;s:13:\"um-icon-minus\";i:555;s:21:\"um-icon-minus-circled\";i:556;s:19:\"um-icon-minus-round\";i:557;s:15:\"um-icon-model-s\";i:558;s:15:\"um-icon-monitor\";i:559;s:12:\"um-icon-more\";i:560;s:13:\"um-icon-mouse\";i:561;s:18:\"um-icon-music-note\";i:562;s:15:\"um-icon-navicon\";i:563;s:21:\"um-icon-navicon-round\";i:564;s:16:\"um-icon-navigate\";i:565;s:15:\"um-icon-network\";i:566;s:18:\"um-icon-no-smoking\";i:567;s:15:\"um-icon-nuclear\";i:568;s:14:\"um-icon-outlet\";i:569;s:18:\"um-icon-paintbrush\";i:570;s:19:\"um-icon-paintbucket\";i:571;s:22:\"um-icon-paper-airplane\";i:572;s:17:\"um-icon-paperclip\";i:573;s:13:\"um-icon-pause\";i:574;s:14:\"um-icon-person\";i:575;s:18:\"um-icon-person-add\";i:576;s:22:\"um-icon-person-stalker\";i:577;s:17:\"um-icon-pie-graph\";i:578;s:11:\"um-icon-pin\";i:579;s:16:\"um-icon-pinpoint\";i:580;s:13:\"um-icon-pizza\";i:581;s:13:\"um-icon-plane\";i:582;s:14:\"um-icon-planet\";i:583;s:12:\"um-icon-play\";i:584;s:19:\"um-icon-playstation\";i:585;s:12:\"um-icon-plus\";i:586;s:20:\"um-icon-plus-circled\";i:587;s:18:\"um-icon-plus-round\";i:588;s:14:\"um-icon-podium\";i:589;s:13:\"um-icon-pound\";i:590;s:13:\"um-icon-power\";i:591;s:16:\"um-icon-pricetag\";i:592;s:17:\"um-icon-pricetags\";i:593;s:15:\"um-icon-printer\";i:594;s:20:\"um-icon-pull-request\";i:595;s:18:\"um-icon-qr-scanner\";i:596;s:13:\"um-icon-quote\";i:597;s:19:\"um-icon-radio-waves\";i:598;s:14:\"um-icon-record\";i:599;s:15:\"um-icon-refresh\";i:600;s:13:\"um-icon-reply\";i:601;s:17:\"um-icon-reply-all\";i:602;s:16:\"um-icon-ribbon-a\";i:603;s:16:\"um-icon-ribbon-b\";i:604;s:11:\"um-icon-sad\";i:605;s:19:\"um-icon-sad-outline\";i:606;s:16:\"um-icon-scissors\";i:607;s:14:\"um-icon-search\";i:608;s:16:\"um-icon-settings\";i:609;s:13:\"um-icon-share\";i:610;s:15:\"um-icon-shuffle\";i:611;s:21:\"um-icon-skip-backward\";i:612;s:20:\"um-icon-skip-forward\";i:613;s:22:\"um-icon-social-android\";i:614;s:30:\"um-icon-social-android-outline\";i:615;s:22:\"um-icon-social-angular\";i:616;s:30:\"um-icon-social-angular-outline\";i:617;s:20:\"um-icon-social-apple\";i:618;s:28:\"um-icon-social-apple-outline\";i:619;s:22:\"um-icon-social-bitcoin\";i:620;s:30:\"um-icon-social-bitcoin-outline\";i:621;s:21:\"um-icon-social-buffer\";i:622;s:29:\"um-icon-social-buffer-outline\";i:623;s:21:\"um-icon-social-chrome\";i:624;s:29:\"um-icon-social-chrome-outline\";i:625;s:22:\"um-icon-social-codepen\";i:626;s:30:\"um-icon-social-codepen-outline\";i:627;s:19:\"um-icon-social-css3\";i:628;s:27:\"um-icon-social-css3-outline\";i:629;s:27:\"um-icon-social-designernews\";i:630;s:35:\"um-icon-social-designernews-outline\";i:631;s:23:\"um-icon-social-dribbble\";i:632;s:31:\"um-icon-social-dribbble-outline\";i:633;s:22:\"um-icon-social-dropbox\";i:634;s:30:\"um-icon-social-dropbox-outline\";i:635;s:19:\"um-icon-social-euro\";i:636;s:27:\"um-icon-social-euro-outline\";i:637;s:23:\"um-icon-social-facebook\";i:638;s:31:\"um-icon-social-facebook-outline\";i:639;s:25:\"um-icon-social-foursquare\";i:640;s:33:\"um-icon-social-foursquare-outline\";i:641;s:28:\"um-icon-social-freebsd-devil\";i:642;s:21:\"um-icon-social-github\";i:643;s:29:\"um-icon-social-github-outline\";i:644;s:21:\"um-icon-social-google\";i:645;s:29:\"um-icon-social-google-outline\";i:646;s:25:\"um-icon-social-googleplus\";i:647;s:33:\"um-icon-social-googleplus-outline\";i:648;s:25:\"um-icon-social-hackernews\";i:649;s:33:\"um-icon-social-hackernews-outline\";i:650;s:20:\"um-icon-social-html5\";i:651;s:28:\"um-icon-social-html5-outline\";i:652;s:24:\"um-icon-social-instagram\";i:653;s:32:\"um-icon-social-instagram-outline\";i:654;s:25:\"um-icon-social-javascript\";i:655;s:33:\"um-icon-social-javascript-outline\";i:656;s:23:\"um-icon-social-linkedin\";i:657;s:31:\"um-icon-social-linkedin-outline\";i:658;s:23:\"um-icon-social-markdown\";i:659;s:21:\"um-icon-social-nodejs\";i:660;s:22:\"um-icon-social-octocat\";i:661;s:24:\"um-icon-social-pinterest\";i:662;s:32:\"um-icon-social-pinterest-outline\";i:663;s:21:\"um-icon-social-python\";i:664;s:21:\"um-icon-social-reddit\";i:665;s:29:\"um-icon-social-reddit-outline\";i:666;s:18:\"um-icon-social-rss\";i:667;s:26:\"um-icon-social-rss-outline\";i:668;s:19:\"um-icon-social-sass\";i:669;s:20:\"um-icon-social-skype\";i:670;s:28:\"um-icon-social-skype-outline\";i:671;s:23:\"um-icon-social-snapchat\";i:672;s:31:\"um-icon-social-snapchat-outline\";i:673;s:21:\"um-icon-social-tumblr\";i:674;s:29:\"um-icon-social-tumblr-outline\";i:675;s:18:\"um-icon-social-tux\";i:676;s:21:\"um-icon-social-twitch\";i:677;s:29:\"um-icon-social-twitch-outline\";i:678;s:22:\"um-icon-social-twitter\";i:679;s:30:\"um-icon-social-twitter-outline\";i:680;s:18:\"um-icon-social-usd\";i:681;s:26:\"um-icon-social-usd-outline\";i:682;s:20:\"um-icon-social-vimeo\";i:683;s:28:\"um-icon-social-vimeo-outline\";i:684;s:23:\"um-icon-social-whatsapp\";i:685;s:31:\"um-icon-social-whatsapp-outline\";i:686;s:22:\"um-icon-social-windows\";i:687;s:30:\"um-icon-social-windows-outline\";i:688;s:24:\"um-icon-social-wordpress\";i:689;s:32:\"um-icon-social-wordpress-outline\";i:690;s:20:\"um-icon-social-yahoo\";i:691;s:28:\"um-icon-social-yahoo-outline\";i:692;s:18:\"um-icon-social-yen\";i:693;s:26:\"um-icon-social-yen-outline\";i:694;s:22:\"um-icon-social-youtube\";i:695;s:30:\"um-icon-social-youtube-outline\";i:696;s:16:\"um-icon-soup-can\";i:697;s:24:\"um-icon-soup-can-outline\";i:698;s:20:\"um-icon-speakerphone\";i:699;s:19:\"um-icon-speedometer\";i:700;s:13:\"um-icon-spoon\";i:701;s:12:\"um-icon-star\";i:702;s:18:\"um-icon-stats-bars\";i:703;s:13:\"um-icon-steam\";i:704;s:12:\"um-icon-stop\";i:705;s:19:\"um-icon-thermometer\";i:706;s:18:\"um-icon-thumbsdown\";i:707;s:16:\"um-icon-thumbsup\";i:708;s:14:\"um-icon-toggle\";i:709;s:21:\"um-icon-toggle-filled\";i:710;s:19:\"um-icon-transgender\";i:711;s:15:\"um-icon-trash-a\";i:712;s:15:\"um-icon-trash-b\";i:713;s:14:\"um-icon-trophy\";i:714;s:14:\"um-icon-tshirt\";i:715;s:22:\"um-icon-tshirt-outline\";i:716;s:16:\"um-icon-umbrella\";i:717;s:18:\"um-icon-university\";i:718;s:16:\"um-icon-unlocked\";i:719;s:14:\"um-icon-upload\";i:720;s:11:\"um-icon-usb\";i:721;s:19:\"um-icon-videocamera\";i:722;s:19:\"um-icon-volume-high\";i:723;s:18:\"um-icon-volume-low\";i:724;s:21:\"um-icon-volume-medium\";i:725;s:19:\"um-icon-volume-mute\";i:726;s:12:\"um-icon-wand\";i:727;s:17:\"um-icon-waterdrop\";i:728;s:12:\"um-icon-wifi\";i:729;s:17:\"um-icon-wineglass\";i:730;s:13:\"um-icon-woman\";i:731;s:14:\"um-icon-wrench\";i:732;s:12:\"um-icon-xbox\";i:733;s:15:\"um-faicon-glass\";i:734;s:15:\"um-faicon-music\";i:735;s:16:\"um-faicon-search\";i:736;s:20:\"um-faicon-envelope-o\";i:737;s:15:\"um-faicon-heart\";i:738;s:14:\"um-faicon-star\";i:739;s:16:\"um-faicon-star-o\";i:740;s:14:\"um-faicon-user\";i:741;s:14:\"um-faicon-film\";i:742;s:18:\"um-faicon-th-large\";i:743;s:12:\"um-faicon-th\";i:744;s:17:\"um-faicon-th-list\";i:745;s:15:\"um-faicon-check\";i:746;s:15:\"um-faicon-times\";i:747;s:21:\"um-faicon-search-plus\";i:748;s:22:\"um-faicon-search-minus\";i:749;s:19:\"um-faicon-power-off\";i:750;s:16:\"um-faicon-signal\";i:751;s:13:\"um-faicon-cog\";i:752;s:17:\"um-faicon-trash-o\";i:753;s:14:\"um-faicon-home\";i:754;s:16:\"um-faicon-file-o\";i:755;s:17:\"um-faicon-clock-o\";i:756;s:14:\"um-faicon-road\";i:757;s:18:\"um-faicon-download\";i:758;s:29:\"um-faicon-arrow-circle-o-down\";i:759;s:27:\"um-faicon-arrow-circle-o-up\";i:760;s:15:\"um-faicon-inbox\";i:761;s:23:\"um-faicon-play-circle-o\";i:762;s:16:\"um-faicon-repeat\";i:763;s:17:\"um-faicon-refresh\";i:764;s:18:\"um-faicon-list-alt\";i:765;s:14:\"um-faicon-lock\";i:766;s:14:\"um-faicon-flag\";i:767;s:20:\"um-faicon-headphones\";i:768;s:20:\"um-faicon-volume-off\";i:769;s:21:\"um-faicon-volume-down\";i:770;s:19:\"um-faicon-volume-up\";i:771;s:16:\"um-faicon-qrcode\";i:772;s:17:\"um-faicon-barcode\";i:773;s:13:\"um-faicon-tag\";i:774;s:14:\"um-faicon-tags\";i:775;s:14:\"um-faicon-book\";i:776;s:18:\"um-faicon-bookmark\";i:777;s:15:\"um-faicon-print\";i:778;s:16:\"um-faicon-camera\";i:779;s:14:\"um-faicon-font\";i:780;s:14:\"um-faicon-bold\";i:781;s:16:\"um-faicon-italic\";i:782;s:21:\"um-faicon-text-height\";i:783;s:20:\"um-faicon-text-width\";i:784;s:20:\"um-faicon-align-left\";i:785;s:22:\"um-faicon-align-center\";i:786;s:21:\"um-faicon-align-right\";i:787;s:23:\"um-faicon-align-justify\";i:788;s:14:\"um-faicon-list\";i:789;s:17:\"um-faicon-outdent\";i:790;s:16:\"um-faicon-indent\";i:791;s:22:\"um-faicon-video-camera\";i:792;s:19:\"um-faicon-picture-o\";i:793;s:16:\"um-faicon-pencil\";i:794;s:20:\"um-faicon-map-marker\";i:795;s:16:\"um-faicon-adjust\";i:796;s:14:\"um-faicon-tint\";i:797;s:25:\"um-faicon-pencil-square-o\";i:798;s:24:\"um-faicon-share-square-o\";i:799;s:24:\"um-faicon-check-square-o\";i:800;s:16:\"um-faicon-arrows\";i:801;s:23:\"um-faicon-step-backward\";i:802;s:23:\"um-faicon-fast-backward\";i:803;s:18:\"um-faicon-backward\";i:804;s:14:\"um-faicon-play\";i:805;s:15:\"um-faicon-pause\";i:806;s:14:\"um-faicon-stop\";i:807;s:17:\"um-faicon-forward\";i:808;s:22:\"um-faicon-fast-forward\";i:809;s:22:\"um-faicon-step-forward\";i:810;s:15:\"um-faicon-eject\";i:811;s:22:\"um-faicon-chevron-left\";i:812;s:23:\"um-faicon-chevron-right\";i:813;s:21:\"um-faicon-plus-circle\";i:814;s:22:\"um-faicon-minus-circle\";i:815;s:22:\"um-faicon-times-circle\";i:816;s:22:\"um-faicon-check-circle\";i:817;s:25:\"um-faicon-question-circle\";i:818;s:21:\"um-faicon-info-circle\";i:819;s:20:\"um-faicon-crosshairs\";i:820;s:24:\"um-faicon-times-circle-o\";i:821;s:24:\"um-faicon-check-circle-o\";i:822;s:13:\"um-faicon-ban\";i:823;s:20:\"um-faicon-arrow-left\";i:824;s:21:\"um-faicon-arrow-right\";i:825;s:18:\"um-faicon-arrow-up\";i:826;s:20:\"um-faicon-arrow-down\";i:827;s:15:\"um-faicon-share\";i:828;s:16:\"um-faicon-expand\";i:829;s:18:\"um-faicon-compress\";i:830;s:14:\"um-faicon-plus\";i:831;s:15:\"um-faicon-minus\";i:832;s:18:\"um-faicon-asterisk\";i:833;s:28:\"um-faicon-exclamation-circle\";i:834;s:14:\"um-faicon-gift\";i:835;s:14:\"um-faicon-leaf\";i:836;s:14:\"um-faicon-fire\";i:837;s:13:\"um-faicon-eye\";i:838;s:19:\"um-faicon-eye-slash\";i:839;s:30:\"um-faicon-exclamation-triangle\";i:840;s:15:\"um-faicon-plane\";i:841;s:18:\"um-faicon-calendar\";i:842;s:16:\"um-faicon-random\";i:843;s:17:\"um-faicon-comment\";i:844;s:16:\"um-faicon-magnet\";i:845;s:20:\"um-faicon-chevron-up\";i:846;s:22:\"um-faicon-chevron-down\";i:847;s:17:\"um-faicon-retweet\";i:848;s:23:\"um-faicon-shopping-cart\";i:849;s:16:\"um-faicon-folder\";i:850;s:21:\"um-faicon-folder-open\";i:851;s:18:\"um-faicon-arrows-v\";i:852;s:18:\"um-faicon-arrows-h\";i:853;s:19:\"um-faicon-bar-chart\";i:854;s:24:\"um-faicon-twitter-square\";i:855;s:25:\"um-faicon-facebook-square\";i:856;s:22:\"um-faicon-camera-retro\";i:857;s:13:\"um-faicon-key\";i:858;s:14:\"um-faicon-cogs\";i:859;s:18:\"um-faicon-comments\";i:860;s:21:\"um-faicon-thumbs-o-up\";i:861;s:23:\"um-faicon-thumbs-o-down\";i:862;s:19:\"um-faicon-star-half\";i:863;s:17:\"um-faicon-heart-o\";i:864;s:18:\"um-faicon-sign-out\";i:865;s:25:\"um-faicon-linkedin-square\";i:866;s:20:\"um-faicon-thumb-tack\";i:867;s:23:\"um-faicon-external-link\";i:868;s:17:\"um-faicon-sign-in\";i:869;s:16:\"um-faicon-trophy\";i:870;s:23:\"um-faicon-github-square\";i:871;s:16:\"um-faicon-upload\";i:872;s:17:\"um-faicon-lemon-o\";i:873;s:15:\"um-faicon-phone\";i:874;s:18:\"um-faicon-square-o\";i:875;s:20:\"um-faicon-bookmark-o\";i:876;s:22:\"um-faicon-phone-square\";i:877;s:17:\"um-faicon-twitter\";i:878;s:18:\"um-faicon-facebook\";i:879;s:16:\"um-faicon-github\";i:880;s:16:\"um-faicon-unlock\";i:881;s:21:\"um-faicon-credit-card\";i:882;s:13:\"um-faicon-rss\";i:883;s:15:\"um-faicon-hdd-o\";i:884;s:18:\"um-faicon-bullhorn\";i:885;s:14:\"um-faicon-bell\";i:886;s:21:\"um-faicon-certificate\";i:887;s:22:\"um-faicon-hand-o-right\";i:888;s:21:\"um-faicon-hand-o-left\";i:889;s:19:\"um-faicon-hand-o-up\";i:890;s:21:\"um-faicon-hand-o-down\";i:891;s:27:\"um-faicon-arrow-circle-left\";i:892;s:28:\"um-faicon-arrow-circle-right\";i:893;s:25:\"um-faicon-arrow-circle-up\";i:894;s:27:\"um-faicon-arrow-circle-down\";i:895;s:15:\"um-faicon-globe\";i:896;s:16:\"um-faicon-wrench\";i:897;s:15:\"um-faicon-tasks\";i:898;s:16:\"um-faicon-filter\";i:899;s:19:\"um-faicon-briefcase\";i:900;s:20:\"um-faicon-arrows-alt\";i:901;s:15:\"um-faicon-users\";i:902;s:14:\"um-faicon-link\";i:903;s:15:\"um-faicon-cloud\";i:904;s:15:\"um-faicon-flask\";i:905;s:18:\"um-faicon-scissors\";i:906;s:17:\"um-faicon-files-o\";i:907;s:19:\"um-faicon-paperclip\";i:908;s:18:\"um-faicon-floppy-o\";i:909;s:16:\"um-faicon-square\";i:910;s:14:\"um-faicon-bars\";i:911;s:17:\"um-faicon-list-ul\";i:912;s:17:\"um-faicon-list-ol\";i:913;s:23:\"um-faicon-strikethrough\";i:914;s:19:\"um-faicon-underline\";i:915;s:15:\"um-faicon-table\";i:916;s:15:\"um-faicon-magic\";i:917;s:15:\"um-faicon-truck\";i:918;s:19:\"um-faicon-pinterest\";i:919;s:26:\"um-faicon-pinterest-square\";i:920;s:28:\"um-faicon-google-plus-square\";i:921;s:21:\"um-faicon-google-plus\";i:922;s:15:\"um-faicon-money\";i:923;s:20:\"um-faicon-caret-down\";i:924;s:18:\"um-faicon-caret-up\";i:925;s:20:\"um-faicon-caret-left\";i:926;s:21:\"um-faicon-caret-right\";i:927;s:17:\"um-faicon-columns\";i:928;s:14:\"um-faicon-sort\";i:929;s:19:\"um-faicon-sort-desc\";i:930;s:18:\"um-faicon-sort-asc\";i:931;s:18:\"um-faicon-envelope\";i:932;s:18:\"um-faicon-linkedin\";i:933;s:14:\"um-faicon-undo\";i:934;s:15:\"um-faicon-gavel\";i:935;s:20:\"um-faicon-tachometer\";i:936;s:19:\"um-faicon-comment-o\";i:937;s:20:\"um-faicon-comments-o\";i:938;s:14:\"um-faicon-bolt\";i:939;s:17:\"um-faicon-sitemap\";i:940;s:18:\"um-faicon-umbrella\";i:941;s:19:\"um-faicon-clipboard\";i:942;s:21:\"um-faicon-lightbulb-o\";i:943;s:18:\"um-faicon-exchange\";i:944;s:24:\"um-faicon-cloud-download\";i:945;s:22:\"um-faicon-cloud-upload\";i:946;s:17:\"um-faicon-user-md\";i:947;s:21:\"um-faicon-stethoscope\";i:948;s:18:\"um-faicon-suitcase\";i:949;s:16:\"um-faicon-bell-o\";i:950;s:16:\"um-faicon-coffee\";i:951;s:17:\"um-faicon-cutlery\";i:952;s:21:\"um-faicon-file-text-o\";i:953;s:20:\"um-faicon-building-o\";i:954;s:20:\"um-faicon-hospital-o\";i:955;s:19:\"um-faicon-ambulance\";i:956;s:16:\"um-faicon-medkit\";i:957;s:21:\"um-faicon-fighter-jet\";i:958;s:14:\"um-faicon-beer\";i:959;s:18:\"um-faicon-h-square\";i:960;s:21:\"um-faicon-plus-square\";i:961;s:27:\"um-faicon-angle-double-left\";i:962;s:28:\"um-faicon-angle-double-right\";i:963;s:25:\"um-faicon-angle-double-up\";i:964;s:27:\"um-faicon-angle-double-down\";i:965;s:20:\"um-faicon-angle-left\";i:966;s:21:\"um-faicon-angle-right\";i:967;s:18:\"um-faicon-angle-up\";i:968;s:20:\"um-faicon-angle-down\";i:969;s:17:\"um-faicon-desktop\";i:970;s:16:\"um-faicon-laptop\";i:971;s:16:\"um-faicon-tablet\";i:972;s:16:\"um-faicon-mobile\";i:973;s:18:\"um-faicon-circle-o\";i:974;s:20:\"um-faicon-quote-left\";i:975;s:21:\"um-faicon-quote-right\";i:976;s:17:\"um-faicon-spinner\";i:977;s:14:\"um-faicon-spin\";i:978;s:16:\"um-faicon-circle\";i:979;s:15:\"um-faicon-reply\";i:980;s:20:\"um-faicon-github-alt\";i:981;s:18:\"um-faicon-folder-o\";i:982;s:23:\"um-faicon-folder-open-o\";i:983;s:17:\"um-faicon-smile-o\";i:984;s:17:\"um-faicon-frown-o\";i:985;s:15:\"um-faicon-meh-o\";i:986;s:17:\"um-faicon-gamepad\";i:987;s:20:\"um-faicon-keyboard-o\";i:988;s:16:\"um-faicon-flag-o\";i:989;s:24:\"um-faicon-flag-checkered\";i:990;s:18:\"um-faicon-terminal\";i:991;s:14:\"um-faicon-code\";i:992;s:19:\"um-faicon-reply-all\";i:993;s:21:\"um-faicon-star-half-o\";i:994;s:24:\"um-faicon-location-arrow\";i:995;s:14:\"um-faicon-crop\";i:996;s:19:\"um-faicon-code-fork\";i:997;s:22:\"um-faicon-chain-broken\";i:998;s:18:\"um-faicon-question\";i:999;s:14:\"um-faicon-info\";i:1000;s:21:\"um-faicon-exclamation\";i:1001;s:21:\"um-faicon-superscript\";i:1002;s:19:\"um-faicon-subscript\";i:1003;s:16:\"um-faicon-eraser\";i:1004;s:22:\"um-faicon-puzzle-piece\";i:1005;s:20:\"um-faicon-microphone\";i:1006;s:26:\"um-faicon-microphone-slash\";i:1007;s:16:\"um-faicon-shield\";i:1008;s:20:\"um-faicon-calendar-o\";i:1009;s:27:\"um-faicon-fire-extinguisher\";i:1010;s:16:\"um-faicon-rocket\";i:1011;s:16:\"um-faicon-maxcdn\";i:1012;s:29:\"um-faicon-chevron-circle-left\";i:1013;s:30:\"um-faicon-chevron-circle-right\";i:1014;s:27:\"um-faicon-chevron-circle-up\";i:1015;s:29:\"um-faicon-chevron-circle-down\";i:1016;s:15:\"um-faicon-html5\";i:1017;s:14:\"um-faicon-css3\";i:1018;s:16:\"um-faicon-anchor\";i:1019;s:20:\"um-faicon-unlock-alt\";i:1020;s:18:\"um-faicon-bullseye\";i:1021;s:20:\"um-faicon-ellipsis-h\";i:1022;s:20:\"um-faicon-ellipsis-v\";i:1023;s:20:\"um-faicon-rss-square\";i:1024;s:21:\"um-faicon-play-circle\";i:1025;s:16:\"um-faicon-ticket\";i:1026;s:22:\"um-faicon-minus-square\";i:1027;s:24:\"um-faicon-minus-square-o\";i:1028;s:18:\"um-faicon-level-up\";i:1029;s:20:\"um-faicon-level-down\";i:1030;s:22:\"um-faicon-check-square\";i:1031;s:23:\"um-faicon-pencil-square\";i:1032;s:30:\"um-faicon-external-link-square\";i:1033;s:22:\"um-faicon-share-square\";i:1034;s:17:\"um-faicon-compass\";i:1035;s:29:\"um-faicon-caret-square-o-down\";i:1036;s:27:\"um-faicon-caret-square-o-up\";i:1037;s:30:\"um-faicon-caret-square-o-right\";i:1038;s:13:\"um-faicon-eur\";i:1039;s:13:\"um-faicon-gbp\";i:1040;s:13:\"um-faicon-usd\";i:1041;s:13:\"um-faicon-inr\";i:1042;s:13:\"um-faicon-jpy\";i:1043;s:13:\"um-faicon-rub\";i:1044;s:13:\"um-faicon-krw\";i:1045;s:13:\"um-faicon-btc\";i:1046;s:14:\"um-faicon-file\";i:1047;s:19:\"um-faicon-file-text\";i:1048;s:24:\"um-faicon-sort-alpha-asc\";i:1049;s:25:\"um-faicon-sort-alpha-desc\";i:1050;s:25:\"um-faicon-sort-amount-asc\";i:1051;s:26:\"um-faicon-sort-amount-desc\";i:1052;s:26:\"um-faicon-sort-numeric-asc\";i:1053;s:27:\"um-faicon-sort-numeric-desc\";i:1054;s:19:\"um-faicon-thumbs-up\";i:1055;s:21:\"um-faicon-thumbs-down\";i:1056;s:24:\"um-faicon-youtube-square\";i:1057;s:17:\"um-faicon-youtube\";i:1058;s:14:\"um-faicon-xing\";i:1059;s:21:\"um-faicon-xing-square\";i:1060;s:22:\"um-faicon-youtube-play\";i:1061;s:17:\"um-faicon-dropbox\";i:1062;s:24:\"um-faicon-stack-overflow\";i:1063;s:19:\"um-faicon-instagram\";i:1064;s:16:\"um-faicon-flickr\";i:1065;s:13:\"um-faicon-adn\";i:1066;s:19:\"um-faicon-bitbucket\";i:1067;s:26:\"um-faicon-bitbucket-square\";i:1068;s:16:\"um-faicon-tumblr\";i:1069;s:23:\"um-faicon-tumblr-square\";i:1070;s:25:\"um-faicon-long-arrow-down\";i:1071;s:23:\"um-faicon-long-arrow-up\";i:1072;s:25:\"um-faicon-long-arrow-left\";i:1073;s:26:\"um-faicon-long-arrow-right\";i:1074;s:15:\"um-faicon-apple\";i:1075;s:17:\"um-faicon-windows\";i:1076;s:17:\"um-faicon-android\";i:1077;s:15:\"um-faicon-linux\";i:1078;s:18:\"um-faicon-dribbble\";i:1079;s:15:\"um-faicon-skype\";i:1080;s:20:\"um-faicon-foursquare\";i:1081;s:16:\"um-faicon-trello\";i:1082;s:16:\"um-faicon-female\";i:1083;s:14:\"um-faicon-male\";i:1084;s:16:\"um-faicon-gittip\";i:1085;s:15:\"um-faicon-sun-o\";i:1086;s:16:\"um-faicon-moon-o\";i:1087;s:17:\"um-faicon-archive\";i:1088;s:13:\"um-faicon-bug\";i:1089;s:12:\"um-faicon-vk\";i:1090;s:15:\"um-faicon-weibo\";i:1091;s:16:\"um-faicon-renren\";i:1092;s:19:\"um-faicon-pagelines\";i:1093;s:24:\"um-faicon-stack-exchange\";i:1094;s:30:\"um-faicon-arrow-circle-o-right\";i:1095;s:29:\"um-faicon-arrow-circle-o-left\";i:1096;s:29:\"um-faicon-caret-square-o-left\";i:1097;s:22:\"um-faicon-dot-circle-o\";i:1098;s:20:\"um-faicon-wheelchair\";i:1099;s:22:\"um-faicon-vimeo-square\";i:1100;s:13:\"um-faicon-try\";i:1101;s:23:\"um-faicon-plus-square-o\";i:1102;s:23:\"um-faicon-space-shuttle\";i:1103;s:15:\"um-faicon-slack\";i:1104;s:25:\"um-faicon-envelope-square\";i:1105;s:19:\"um-faicon-wordpress\";i:1106;s:16:\"um-faicon-openid\";i:1107;s:20:\"um-faicon-university\";i:1108;s:24:\"um-faicon-graduation-cap\";i:1109;s:15:\"um-faicon-yahoo\";i:1110;s:16:\"um-faicon-google\";i:1111;s:16:\"um-faicon-reddit\";i:1112;s:23:\"um-faicon-reddit-square\";i:1113;s:28:\"um-faicon-stumbleupon-circle\";i:1114;s:21:\"um-faicon-stumbleupon\";i:1115;s:19:\"um-faicon-delicious\";i:1116;s:14:\"um-faicon-digg\";i:1117;s:20:\"um-faicon-pied-piper\";i:1118;s:24:\"um-faicon-pied-piper-alt\";i:1119;s:16:\"um-faicon-drupal\";i:1120;s:16:\"um-faicon-joomla\";i:1121;s:18:\"um-faicon-language\";i:1122;s:13:\"um-faicon-fax\";i:1123;s:18:\"um-faicon-building\";i:1124;s:15:\"um-faicon-child\";i:1125;s:13:\"um-faicon-paw\";i:1126;s:15:\"um-faicon-spoon\";i:1127;s:14:\"um-faicon-cube\";i:1128;s:15:\"um-faicon-cubes\";i:1129;s:17:\"um-faicon-behance\";i:1130;s:24:\"um-faicon-behance-square\";i:1131;s:15:\"um-faicon-steam\";i:1132;s:22:\"um-faicon-steam-square\";i:1133;s:17:\"um-faicon-recycle\";i:1134;s:13:\"um-faicon-car\";i:1135;s:14:\"um-faicon-taxi\";i:1136;s:14:\"um-faicon-tree\";i:1137;s:17:\"um-faicon-spotify\";i:1138;s:20:\"um-faicon-deviantart\";i:1139;s:20:\"um-faicon-soundcloud\";i:1140;s:18:\"um-faicon-database\";i:1141;s:20:\"um-faicon-file-pdf-o\";i:1142;s:21:\"um-faicon-file-word-o\";i:1143;s:22:\"um-faicon-file-excel-o\";i:1144;s:27:\"um-faicon-file-powerpoint-o\";i:1145;s:22:\"um-faicon-file-image-o\";i:1146;s:24:\"um-faicon-file-archive-o\";i:1147;s:22:\"um-faicon-file-audio-o\";i:1148;s:22:\"um-faicon-file-video-o\";i:1149;s:21:\"um-faicon-file-code-o\";i:1150;s:14:\"um-faicon-vine\";i:1151;s:17:\"um-faicon-codepen\";i:1152;s:18:\"um-faicon-jsfiddle\";i:1153;s:19:\"um-faicon-life-ring\";i:1154;s:24:\"um-faicon-circle-o-notch\";i:1155;s:15:\"um-faicon-rebel\";i:1156;s:16:\"um-faicon-empire\";i:1157;s:20:\"um-faicon-git-square\";i:1158;s:13:\"um-faicon-git\";i:1159;s:21:\"um-faicon-hacker-news\";i:1160;s:23:\"um-faicon-tencent-weibo\";i:1161;s:12:\"um-faicon-qq\";i:1162;s:16:\"um-faicon-weixin\";i:1163;s:21:\"um-faicon-paper-plane\";i:1164;s:23:\"um-faicon-paper-plane-o\";i:1165;s:17:\"um-faicon-history\";i:1166;s:21:\"um-faicon-circle-thin\";i:1167;s:16:\"um-faicon-header\";i:1168;s:19:\"um-faicon-paragraph\";i:1169;s:17:\"um-faicon-sliders\";i:1170;s:19:\"um-faicon-share-alt\";i:1171;s:26:\"um-faicon-share-alt-square\";i:1172;s:14:\"um-faicon-bomb\";i:1173;s:18:\"um-faicon-futbol-o\";i:1174;s:13:\"um-faicon-tty\";i:1175;s:20:\"um-faicon-binoculars\";i:1176;s:14:\"um-faicon-plug\";i:1177;s:20:\"um-faicon-slideshare\";i:1178;s:16:\"um-faicon-twitch\";i:1179;s:14:\"um-faicon-yelp\";i:1180;s:21:\"um-faicon-newspaper-o\";i:1181;s:14:\"um-faicon-wifi\";i:1182;s:20:\"um-faicon-calculator\";i:1183;s:16:\"um-faicon-paypal\";i:1184;s:23:\"um-faicon-google-wallet\";i:1185;s:17:\"um-faicon-cc-visa\";i:1186;s:23:\"um-faicon-cc-mastercard\";i:1187;s:21:\"um-faicon-cc-discover\";i:1188;s:17:\"um-faicon-cc-amex\";i:1189;s:19:\"um-faicon-cc-paypal\";i:1190;s:19:\"um-faicon-cc-stripe\";i:1191;s:20:\"um-faicon-bell-slash\";i:1192;s:22:\"um-faicon-bell-slash-o\";i:1193;s:15:\"um-faicon-trash\";i:1194;s:19:\"um-faicon-copyright\";i:1195;s:12:\"um-faicon-at\";i:1196;s:20:\"um-faicon-eyedropper\";i:1197;s:21:\"um-faicon-paint-brush\";i:1198;s:23:\"um-faicon-birthday-cake\";i:1199;s:20:\"um-faicon-area-chart\";i:1200;s:19:\"um-faicon-pie-chart\";i:1201;s:20:\"um-faicon-line-chart\";i:1202;s:16:\"um-faicon-lastfm\";i:1203;s:23:\"um-faicon-lastfm-square\";i:1204;s:20:\"um-faicon-toggle-off\";i:1205;s:19:\"um-faicon-toggle-on\";i:1206;s:17:\"um-faicon-bicycle\";i:1207;s:13:\"um-faicon-bus\";i:1208;s:17:\"um-faicon-ioxhost\";i:1209;s:19:\"um-faicon-angellist\";i:1210;s:12:\"um-faicon-cc\";i:1211;s:13:\"um-faicon-ils\";i:1212;s:18:\"um-faicon-meanpath\";i:1213;s:14:\"um-faicon-spin\";i:1214;s:14:\"um-faicon-spin\";i:1215;s:14:\"um-faicon-spin\";i:1216;s:14:\"um-faicon-spin\";i:1217;s:14:\"um-faicon-spin\";}', 'yes'),
(155, 'widget_um_search_widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(156, 'um_cached_role_admin', 'a:15:{s:4:\"core\";s:5:\"admin\";s:18:\"can_access_wpadmin\";i:1;s:20:\"can_not_see_adminbar\";i:0;s:17:\"can_edit_everyone\";i:1;s:19:\"can_delete_everyone\";i:1;s:16:\"can_edit_profile\";i:1;s:18:\"can_delete_profile\";i:1;s:12:\"can_view_all\";i:1;s:24:\"can_make_private_profile\";i:1;s:26:\"can_access_private_profile\";i:1;s:16:\"default_homepage\";i:1;s:6:\"status\";s:8:\"approved\";s:16:\"auto_approve_act\";s:16:\"redirect_profile\";s:11:\"after_login\";s:14:\"redirect_admin\";s:12:\"after_logout\";s:13:\"redirect_home\";}', 'yes'),
(157, 'um_cache_userdata_1', 'a:91:{s:2:\"ID\";i:1;s:10:\"user_login\";s:4:\"elvi\";s:9:\"user_pass\";s:34:\"$P$BYdIDDt0i7pMB7pocPKfEH1bvV412Y0\";s:13:\"user_nicename\";s:4:\"elvi\";s:10:\"user_email\";s:23:\"elvi.galanaki@gmail.com\";s:8:\"user_url\";s:0:\"\";s:15:\"user_registered\";s:19:\"2017-01-18 10:09:56\";s:11:\"user_status\";s:1:\"0\";s:12:\"display_name\";s:4:\"elvi\";s:13:\"administrator\";b:1;s:8:\"wp_roles\";s:13:\"administrator\";s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:6:\"filter\";N;s:8:\"nickname\";s:4:\"elvi\";s:10:\"first_name\";s:0:\"\";s:9:\"last_name\";s:0:\"\";s:11:\"description\";s:0:\"\";s:12:\"rich_editing\";s:4:\"true\";s:17:\"comment_shortcuts\";s:5:\"false\";s:11:\"admin_color\";s:5:\"fresh\";s:7:\"use_ssl\";s:1:\"0\";s:20:\"show_admin_bar_front\";s:4:\"true\";s:18:\"show_welcome_panel\";s:1:\"1\";s:37:\"wp_dashboard_quick_press_last_post_id\";s:1:\"3\";s:14:\"account_status\";s:8:\"approved\";s:19:\"account_status_name\";s:8:\"Approved\";s:4:\"core\";s:5:\"admin\";s:18:\"can_access_wpadmin\";i:1;s:20:\"can_not_see_adminbar\";i:0;s:17:\"can_edit_everyone\";i:1;s:19:\"can_delete_everyone\";i:1;s:16:\"can_edit_profile\";i:1;s:18:\"can_delete_profile\";i:1;s:12:\"can_view_all\";i:1;s:24:\"can_make_private_profile\";i:1;s:26:\"can_access_private_profile\";i:1;s:16:\"default_homepage\";i:1;s:6:\"status\";s:8:\"approved\";s:16:\"auto_approve_act\";s:16:\"redirect_profile\";s:11:\"after_login\";s:14:\"redirect_admin\";s:12:\"after_logout\";s:13:\"redirect_home\";s:11:\"super_admin\";i:1;}', 'yes'),
(158, '__ultimatemember_sitekey', 'localhost/region_profile-eft35E78ixEsqnAVdBPo', 'yes'),
(159, 'um_is_installed', '1', 'yes'),
(160, 'um_core_forms', 'a:3:{i:4;i:4;i:5;i:5;i:6;i:6;}', 'yes'),
(161, 'um_core_directories', 'a:1:{i:7;i:7;}', 'yes'),
(162, 'um_core_pages', 'a:7:{s:4:\"user\";i:8;s:5:\"login\";i:10;s:8:\"register\";i:12;s:7:\"members\";i:14;s:6:\"logout\";i:16;s:7:\"account\";i:18;s:14:\"password-reset\";i:20;}', 'yes');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(163, 'um_options', 'a:185:{s:9:\"core_user\";i:8;s:10:\"core_login\";i:10;s:13:\"core_register\";i:12;s:12:\"core_members\";i:14;s:11:\"core_logout\";i:16;s:12:\"core_account\";i:18;s:19:\"core_password-reset\";i:20;s:12:\"default_role\";s:6:\"member\";s:14:\"permalink_base\";s:10:\"user_login\";s:12:\"display_name\";s:9:\"full_name\";s:29:\"force_display_name_capitlized\";i:1;s:15:\"author_redirect\";i:1;s:12:\"members_page\";i:1;s:13:\"use_gravatars\";i:0;s:37:\"use_um_gravatar_default_builtin_image\";s:7:\"default\";s:29:\"use_um_gravatar_default_image\";i:0;s:24:\"reset_require_strongpass\";i:0;s:33:\"editable_primary_email_in_profile\";i:0;s:20:\"account_tab_password\";i:1;s:19:\"account_tab_privacy\";i:1;s:25:\"account_tab_notifications\";i:1;s:18:\"account_tab_delete\";i:1;s:19:\"delete_account_text\";s:150:\"Are you sure you want to delete your account? This will erase all of your account data from the site. To delete your account enter your password below\";s:12:\"account_name\";i:1;s:20:\"account_name_require\";i:1;s:13:\"account_email\";i:1;s:25:\"account_hide_in_directory\";i:1;s:26:\"account_require_strongpass\";i:0;s:9:\"panic_key\";s:10:\"ZeUz8Ksc9q\";s:10:\"accessible\";i:0;s:19:\"access_exclude_uris\";a:0:{}s:20:\"home_page_accessible\";i:1;s:24:\"category_page_accessible\";i:1;s:13:\"wpadmin_login\";i:1;s:25:\"deny_admin_frontend_login\";i:0;s:22:\"wpadmin_login_redirect\";s:13:\"um_login_page\";s:16:\"wpadmin_register\";i:1;s:25:\"wpadmin_register_redirect\";s:16:\"um_register_page\";s:24:\"access_widget_admin_only\";i:1;s:27:\"enable_reset_password_limit\";i:1;s:27:\"reset_password_limit_number\";i:3;s:34:\"disable_admin_reset_password_limit\";i:0;s:13:\"blocked_words\";s:47:\"admin\r\nadministrator\r\nwebmaster\r\nsupport\r\nstaff\";s:9:\"mail_from\";s:14:\"region_profile\";s:14:\"mail_from_addr\";s:23:\"elvi.galanaki@gmail.com\";s:10:\"email_html\";i:0;s:16:\"welcome_email_on\";i:1;s:17:\"welcome_email_sub\";s:23:\"Welcome to {site_name}!\";s:13:\"welcome_email\";s:306:\"Hi {display_name},\r\n\r\nThank you for signing up with {site_name}! Your account is now active.\r\n\r\nTo login please visit the following url:\r\n\r\n{login_url}\r\n\r\nYour account e-mail: {email}\r\nYour account username: {username}\r\n\r\nIf you have any problems, please contact us at {admin_email}\r\n\r\nThanks,\r\n{site_name}\";s:18:\"checkmail_email_on\";i:1;s:19:\"checkmail_email_sub\";s:28:\"Please activate your account\";s:15:\"checkmail_email\";s:266:\"Hi {display_name},\r\n\r\nThank you for signing up with {site_name}! To activate your account, please click the link below to confirm your email address:\r\n\r\n{account_activation_link}\r\n\r\nIf you have any problems, please contact us at {admin_email}\r\n\r\nThanks,\r\n{site_name}\";s:16:\"pending_email_on\";i:1;s:17:\"pending_email_sub\";s:30:\"Your account is pending review\";s:13:\"pending_email\";s:272:\"Hi {display_name},\r\n\r\nThank you for signing up with {site_name}! Your account is currently being reviewed by a member of our team.\r\n\r\nPlease allow us some time to process your request.\r\n\r\nIf you have any problems, please contact us at {admin_email}\r\n\r\nThanks,\r\n{site_name}\";s:17:\"approved_email_on\";i:1;s:18:\"approved_email_sub\";s:41:\"Your account at {site_name} is now active\";s:14:\"approved_email\";s:378:\"Hi {display_name},\r\n\r\nThank you for signing up with {site_name}! Your account has been approved and is now active.\r\n\r\nTo login please visit the following url:\r\n\r\n{login_url}\r\n\r\nYour account e-mail: {email}\r\nYour account username: {username}\r\nSet your account password: {password_reset_link}\r\n\r\nIf you have any problems, please contact us at {admin_email}\r\n\r\nThanks,\r\n{site_name}\";s:17:\"rejected_email_on\";i:1;s:18:\"rejected_email_sub\";s:30:\"Your account has been rejected\";s:14:\"rejected_email\";s:260:\"Hi {display_name},\r\n\r\nThank you for applying for membership to {site_name}! We have reviewed your information and unfortunately we are unable to accept you as a member at this moment.\r\n\r\nPlease feel free to apply again at a future date.\r\n\r\nThanks,\r\n{site_name}\";s:17:\"inactive_email_on\";i:1;s:18:\"inactive_email_sub\";s:33:\"Your account has been deactivated\";s:14:\"inactive_email\";s:222:\"Hi {display_name},\r\n\r\nThis is an automated email to let you know your {site_name} account has been deactivated.\r\n\r\nIf you would like your account to be reactivated please contact us at {admin_email}\r\n\r\nThanks,\r\n{site_name}\";s:17:\"deletion_email_on\";i:1;s:18:\"deletion_email_sub\";s:29:\"Your account has been deleted\";s:14:\"deletion_email\";s:332:\"Hi {display_name},\r\n\r\nThis is an automated email to let you know your {site_name} account has been deleted. All of your personal information has been permanently deleted and you will no longer be able to login to {site_name}.\r\n\r\nIf your account has been deleted by accident please contact us at {admin_email}\r\n\r\nThanks,\r\n{site_name}\";s:16:\"resetpw_email_on\";i:1;s:17:\"resetpw_email_sub\";s:19:\"Reset your password\";s:13:\"resetpw_email\";s:266:\"Hi {display_name},\r\n\r\nWe received a request to reset the password for your account. If you made this request, click the link below to change your password:\r\n\r\n{password_reset_link}\r\n\r\nIf you didn\'t make this request, you can ignore this email\r\n\r\nThanks,\r\n{site_name}\";s:18:\"changedpw_email_on\";i:1;s:19:\"changedpw_email_sub\";s:42:\"Your {site_name} password has been changed\";s:15:\"changedpw_email\";s:279:\"Hi {display_name},\r\n\r\nYou recently changed the password associated with your {site_name} account.\r\n\r\nIf you did not make this change and believe your {site_name} account has been compromised, please contact us at the following email address: {admin_email}\r\n\r\nThanks,\r\n{site_name}\";s:11:\"admin_email\";s:23:\"elvi.galanaki@gmail.com\";s:24:\"notification_new_user_on\";i:1;s:25:\"notification_new_user_sub\";s:30:\"[{site_name}] New user account\";s:21:\"notification_new_user\";s:187:\"{display_name} has just created an account on {site_name}. To view their profile click here:\r\n\r\n{user_profile_link}\r\n\r\nHere is the submitted registration form:\r\n\r\n{submitted_registration}\";s:22:\"notification_review_on\";i:0;s:23:\"notification_review_sub\";s:38:\"[{site_name}] New user awaiting review\";s:19:\"notification_review\";s:245:\"{display_name} has just applied for membership to {site_name} and is waiting to be reviewed.\r\n\r\nTo review this member please click the following link:\r\n\r\n{user_profile_link}\r\n\r\nHere is the submitted registration form:\r\n\r\n{submitted_registration}\";s:24:\"notification_deletion_on\";i:0;s:25:\"notification_deletion_sub\";s:29:\"[{site_name}] Account deleted\";s:21:\"notification_deletion\";s:58:\"{display_name} has just deleted their {site_name} account.\";s:17:\"photo_thumb_sizes\";a:3:{i:0;i:40;i:1;i:80;i:2;i:190;}s:17:\"cover_thumb_sizes\";a:2:{i:0;i:300;i:1;i:600;}s:17:\"image_compression\";i:60;s:15:\"image_max_width\";i:1000;s:15:\"cover_min_width\";i:1000;s:13:\"profile_title\";s:31:\"{display_name} | region_profile\";s:12:\"profile_desc\";s:83:\"{display_name} is on {site_name}. Join {site_name} to view {display_name}\'s profile\";s:18:\"directory_template\";s:7:\"members\";s:12:\"active_color\";s:7:\"#3ba1da\";s:15:\"secondary_color\";s:7:\"#44b0ec\";s:17:\"primary_btn_color\";s:7:\"#3ba1da\";s:17:\"primary_btn_hover\";s:7:\"#44b0ec\";s:16:\"primary_btn_text\";s:4:\"#fff\";s:19:\"secondary_btn_color\";s:4:\"#eee\";s:19:\"secondary_btn_hover\";s:7:\"#e5e5e5\";s:18:\"secondary_btn_text\";s:4:\"#666\";s:14:\"help_tip_color\";s:4:\"#ccc\";s:16:\"form_field_label\";s:4:\"#555\";s:11:\"form_border\";s:14:\"2px solid #ddd\";s:17:\"form_border_hover\";s:14:\"2px solid #bbb\";s:13:\"form_bg_color\";s:4:\"#fff\";s:19:\"form_bg_color_focus\";s:4:\"#fff\";s:15:\"form_text_color\";s:4:\"#666\";s:16:\"form_placeholder\";s:4:\"#aaa\";s:15:\"form_icon_color\";s:4:\"#aaa\";s:13:\"form_asterisk\";i:0;s:19:\"form_asterisk_color\";s:4:\"#aaa\";s:16:\"profile_template\";s:7:\"profile\";s:17:\"profile_max_width\";s:6:\"1000px\";s:22:\"profile_area_max_width\";s:5:\"600px\";s:13:\"profile_align\";s:6:\"center\";s:13:\"profile_icons\";s:5:\"label\";s:24:\"profile_primary_btn_word\";s:14:\"Update Profile\";s:21:\"profile_secondary_btn\";i:1;s:26:\"profile_secondary_btn_word\";s:6:\"Cancel\";s:12:\"profile_role\";s:1:\"0\";s:15:\"profile_main_bg\";s:0:\"\";s:17:\"profile_header_bg\";s:0:\"\";s:14:\"default_avatar\";a:1:{s:3:\"url\";s:99:\"http://assetsmapping.s3platform.eu/wp-content/plugins/ultimate-member/assets/img/default_avatar.jpg\";}s:17:\"profile_photosize\";s:5:\"190px\";s:19:\"profile_photocorner\";s:1:\"1\";s:21:\"profile_cover_enabled\";i:1;s:19:\"profile_cover_ratio\";s:5:\"2.7:1\";s:21:\"profile_show_metaicon\";i:0;s:19:\"profile_header_text\";s:4:\"#999\";s:25:\"profile_header_link_color\";s:4:\"#555\";s:26:\"profile_header_link_hcolor\";s:4:\"#444\";s:25:\"profile_header_icon_color\";s:4:\"#aaa\";s:26:\"profile_header_icon_hcolor\";s:7:\"#3ba1da\";s:17:\"profile_show_name\";i:1;s:25:\"profile_show_social_links\";i:0;s:16:\"profile_show_bio\";i:1;s:21:\"profile_show_html_bio\";s:0:\"\";s:20:\"profile_bio_maxchars\";i:180;s:19:\"profile_header_menu\";s:2:\"bc\";s:18:\"profile_empty_text\";i:1;s:22:\"profile_empty_text_emo\";i:1;s:12:\"profile_menu\";i:1;s:16:\"profile_tab_main\";i:1;s:24:\"profile_tab_main_privacy\";i:0;s:22:\"profile_tab_main_roles\";s:0:\"\";s:17:\"profile_tab_posts\";i:1;s:25:\"profile_tab_posts_privacy\";i:0;s:23:\"profile_tab_posts_roles\";s:0:\"\";s:20:\"profile_tab_comments\";i:1;s:28:\"profile_tab_comments_privacy\";i:0;s:26:\"profile_tab_comments_roles\";s:0:\"\";s:24:\"profile_menu_default_tab\";s:4:\"main\";s:18:\"profile_menu_icons\";i:1;s:17:\"register_template\";s:8:\"register\";s:18:\"register_max_width\";s:5:\"450px\";s:14:\"register_align\";s:6:\"center\";s:14:\"register_icons\";s:5:\"label\";s:25:\"register_primary_btn_word\";s:8:\"Register\";s:22:\"register_secondary_btn\";i:1;s:27:\"register_secondary_btn_word\";s:5:\"Login\";s:26:\"register_secondary_btn_url\";s:0:\"\";s:13:\"register_role\";s:1:\"0\";s:14:\"login_template\";s:5:\"login\";s:15:\"login_max_width\";s:5:\"450px\";s:11:\"login_align\";s:6:\"center\";s:11:\"login_icons\";s:5:\"label\";s:22:\"login_primary_btn_word\";s:5:\"Login\";s:19:\"login_secondary_btn\";i:1;s:24:\"login_secondary_btn_word\";s:8:\"Register\";s:23:\"login_secondary_btn_url\";s:0:\"\";s:22:\"login_forgot_pass_link\";i:1;s:21:\"login_show_rememberme\";i:1;s:28:\"um_profile_object_cache_stop\";i:0;s:13:\"um_flush_stop\";i:0;s:29:\"um_generate_slug_in_directory\";i:0;s:18:\"current_url_method\";s:11:\"SERVER_NAME\";s:22:\"um_port_forwarding_url\";i:0;s:21:\"um_force_utf8_strings\";i:0;s:14:\"enable_timebot\";i:1;s:14:\"disable_minify\";i:0;s:12:\"disable_menu\";i:0;s:19:\"js_css_exlcude_home\";i:0;s:14:\"js_css_exclude\";a:0:{}s:14:\"js_css_include\";a:0:{}s:17:\"enable_custom_css\";i:0;s:14:\"allow_tracking\";i:0;}', 'yes'),
(164, 'um_first_setup_roles', '1', 'yes'),
(165, 'um_hashed_passwords_fix', '1', 'yes'),
(166, 'redux_version_upgraded_from', '3.6.0.1', 'yes'),
(170, 'um_options-transients', 'a:2:{s:14:\"changed_values\";a:0:{}s:9:\"last_save\";i:1484734559;}', 'yes'),
(187, 'theme_mods_twentysixteen', 'a:1:{s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1484735921;s:4:\"data\";a:2:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}}}}', 'yes'),
(188, 'current_theme', 'OnlineS3', 'yes'),
(189, 'theme_mods_onlineS3', 'a:2:{i:0;b:0;s:18:\"custom_css_post_id\";i:-1;}', 'yes'),
(190, 'theme_switched', '', 'yes'),
(1087, 'um_cached_role_', 'a:15:{s:4:\"core\";s:6:\"member\";s:18:\"can_access_wpadmin\";i:0;s:20:\"can_not_see_adminbar\";i:1;s:17:\"can_edit_everyone\";i:0;s:19:\"can_delete_everyone\";i:0;s:16:\"can_edit_profile\";i:1;s:18:\"can_delete_profile\";i:1;s:12:\"can_view_all\";i:1;s:24:\"can_make_private_profile\";i:0;s:26:\"can_access_private_profile\";i:0;s:16:\"default_homepage\";i:1;s:6:\"status\";s:8:\"approved\";s:16:\"auto_approve_act\";s:16:\"redirect_profile\";s:11:\"after_login\";s:16:\"redirect_profile\";s:12:\"after_logout\";s:13:\"redirect_home\";}', 'yes'),
(1274, 'db_upgraded', '', 'yes'),
(1282, 'can_compress_scripts', '0', 'no'),
(1283, 'um_cached_users_queue', '0', 'no'),
(1291, 'fresh_site', '0', 'yes'),
(2614, 'wp_auth0_settings', 'a:55:{s:6:\"domain\";s:21:\"onlines3.eu.auth0.com\";s:13:\"custom_domain\";s:0:\"\";s:9:\"client_id\";s:32:\"EHatr5vO5cmpISPwChZ7ITEbJtvqzYMF\";s:13:\"client_secret\";s:64:\"uDXJrOuBpUka1xzjBQ0BXNmbzqxTyJG6xzOCi7BM8U3I-71juRkJs8gTKzMokzUS\";s:24:\"client_signing_algorithm\";s:5:\"HS256\";s:16:\"cache_expiration\";i:1440;s:15:\"auth0_app_token\";s:37:\"https://onlines3.eu.auth0.com/api/v2/\";s:23:\"wordpress_login_enabled\";s:1:\"1\";s:15:\"password_policy\";s:4:\"fair\";s:3:\"sso\";s:1:\"1\";s:18:\"fullcontact_apikey\";s:0:\"\";s:8:\"icon_url\";s:70:\"http://assetsmapping.s3platform.eu/wp-content/uploads/2017/11/logo.png\";s:10:\"form_title\";s:27:\"2.1 Regional Assets Mapping\";s:8:\"gravatar\";s:1:\"1\";s:10:\"custom_css\";s:0:\"\";s:9:\"custom_js\";s:0:\"\";s:14:\"username_style\";s:0:\"\";s:13:\"primary_color\";s:16:\"rgb(0, 111, 180)\";s:8:\"language\";s:0:\"\";s:19:\"language_dictionary\";s:0:\"\";s:23:\"requires_verified_email\";s:1:\"1\";s:25:\"default_login_redirection\";s:52:\"http://assetsmapping.s3platform.eu/index.php?auth0=1\";s:16:\"lock_connections\";s:0:\"\";s:7:\"cdn_url\";s:46:\"https://cdn.auth0.com/js/lock/11.5/lock.min.js\";s:13:\"migration_ips\";s:0:\"\";s:17:\"auto_login_method\";s:0:\"\";s:9:\"ip_ranges\";s:0:\"\";s:14:\"valid_proxy_ip\";s:0:\"\";s:10:\"extra_conf\";s:0:\"\";s:20:\"custom_signup_fields\";s:0:\"\";s:18:\"social_twitter_key\";s:0:\"\";s:21:\"social_twitter_secret\";s:0:\"\";s:19:\"social_facebook_key\";s:0:\"\";s:22:\"social_facebook_secret\";s:0:\"\";s:19:\"auth0_server_domain\";s:15:\"auth0.auth0.com\";s:12:\"allow_signup\";i:0;s:25:\"client_secret_b64_encoded\";b:0;s:12:\"singlelogout\";i:0;s:19:\"override_wp_avatars\";i:0;s:8:\"geo_rule\";N;s:11:\"income_rule\";N;s:11:\"fullcontact\";N;s:3:\"mfa\";N;s:18:\"social_big_buttons\";i:0;s:17:\"auto_provisioning\";i:0;s:22:\"remember_users_session\";b:0;s:20:\"passwordless_enabled\";b:0;s:20:\"jwt_auth_integration\";i:0;s:23:\"auth0_implicit_workflow\";i:0;s:20:\"force_https_callback\";i:0;s:20:\"migration_ips_filter\";i:0;s:12:\"migration_ws\";i:0;s:15:\"migration_token\";N;s:18:\"migration_token_id\";N;s:16:\"link_auth0_users\";N;}', 'yes'),
(2615, 'auth0_db_version', '19', 'yes'),
(2616, 'widget_wp_auth0_widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(2617, 'widget_wp_auth0_popup_widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(2618, 'widget_wp_auth0_social_amplification_widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(2622, 'auth0_error_log', 'a:20:{i:0;a:4:{s:7:\"section\";s:37:\"WP_Auth0_Api_Client::get_client_token\";s:4:\"code\";s:12:\"unknown_code\";s:7:\"message\";s:272:\"{\"error\":\"access_denied\",\"error_description\":\"Client is not authorized to access \\\"https://onlines3.eu.auth0.com/api/v2/\\\". You might probably want to create a \\\"client-grant\\\" associated to this API. See: https://auth0.com/docs/api/v2#!/Client_Grants/post_client_grants\"}\";s:4:\"date\";i:1539615532;}i:1;a:4:{s:7:\"section\";s:37:\"WP_Auth0_Api_Client::get_client_token\";s:4:\"code\";s:12:\"unknown_code\";s:7:\"message\";s:272:\"{\"error\":\"access_denied\",\"error_description\":\"Client is not authorized to access \\\"https://onlines3.eu.auth0.com/api/v2/\\\". You might probably want to create a \\\"client-grant\\\" associated to this API. See: https://auth0.com/docs/api/v2#!/Client_Grants/post_client_grants\"}\";s:4:\"date\";i:1539615147;}i:2;a:4:{s:7:\"section\";s:37:\"WP_Auth0_Api_Client::get_client_token\";s:4:\"code\";s:12:\"unknown_code\";s:7:\"message\";s:272:\"{\"error\":\"access_denied\",\"error_description\":\"Client is not authorized to access \\\"https://onlines3.eu.auth0.com/api/v2/\\\". You might probably want to create a \\\"client-grant\\\" associated to this API. See: https://auth0.com/docs/api/v2#!/Client_Grants/post_client_grants\"}\";s:4:\"date\";i:1538988617;}i:3;a:4:{s:7:\"section\";s:37:\"WP_Auth0_Api_Client::get_client_token\";s:4:\"code\";s:12:\"unknown_code\";s:7:\"message\";s:177:\"{\"error\":\"unauthorized_client\",\"error_description\":\"Grant type \'client_credentials\' not allowed for the client.\",\"error_uri\":\"https://auth0.com/docs/clients/client-grant-types\"}\";s:4:\"date\";i:1538752379;}i:4;a:4:{s:7:\"section\";s:37:\"WP_Auth0_Api_Client::get_client_token\";s:4:\"code\";s:12:\"unknown_code\";s:7:\"message\";s:177:\"{\"error\":\"unauthorized_client\",\"error_description\":\"Grant type \'client_credentials\' not allowed for the client.\",\"error_uri\":\"https://auth0.com/docs/clients/client-grant-types\"}\";s:4:\"date\";i:1538751369;}i:5;a:4:{s:7:\"section\";s:37:\"WP_Auth0_Api_Client::get_client_token\";s:4:\"code\";s:12:\"unknown_code\";s:7:\"message\";s:177:\"{\"error\":\"unauthorized_client\",\"error_description\":\"Grant type \'client_credentials\' not allowed for the client.\",\"error_uri\":\"https://auth0.com/docs/clients/client-grant-types\"}\";s:4:\"date\";i:1538751363;}i:6;a:4:{s:7:\"section\";s:37:\"WP_Auth0_Api_Client::get_client_token\";s:4:\"code\";s:12:\"unknown_code\";s:7:\"message\";s:177:\"{\"error\":\"unauthorized_client\",\"error_description\":\"Grant type \'client_credentials\' not allowed for the client.\",\"error_uri\":\"https://auth0.com/docs/clients/client-grant-types\"}\";s:4:\"date\";i:1538751026;}i:7;a:4:{s:7:\"section\";s:37:\"WP_Auth0_Api_Client::get_client_token\";s:4:\"code\";s:12:\"unknown_code\";s:7:\"message\";s:177:\"{\"error\":\"unauthorized_client\",\"error_description\":\"Grant type \'client_credentials\' not allowed for the client.\",\"error_uri\":\"https://auth0.com/docs/clients/client-grant-types\"}\";s:4:\"date\";i:1538750741;}i:8;a:4:{s:7:\"section\";s:37:\"WP_Auth0_Api_Client::get_client_token\";s:4:\"code\";s:12:\"unknown_code\";s:7:\"message\";s:177:\"{\"error\":\"unauthorized_client\",\"error_description\":\"Grant type \'client_credentials\' not allowed for the client.\",\"error_uri\":\"https://auth0.com/docs/clients/client-grant-types\"}\";s:4:\"date\";i:1538750735;}i:9;a:4:{s:7:\"section\";s:37:\"WP_Auth0_Api_Client::get_client_token\";s:4:\"code\";s:12:\"unknown_code\";s:7:\"message\";s:177:\"{\"error\":\"unauthorized_client\",\"error_description\":\"Grant type \'client_credentials\' not allowed for the client.\",\"error_uri\":\"https://auth0.com/docs/clients/client-grant-types\"}\";s:4:\"date\";i:1538736428;}i:10;a:4:{s:7:\"section\";s:37:\"WP_Auth0_Api_Client::get_client_token\";s:4:\"code\";s:12:\"unknown_code\";s:7:\"message\";s:177:\"{\"error\":\"unauthorized_client\",\"error_description\":\"Grant type \'client_credentials\' not allowed for the client.\",\"error_uri\":\"https://auth0.com/docs/clients/client-grant-types\"}\";s:4:\"date\";i:1538736337;}i:11;a:4:{s:7:\"section\";s:37:\"WP_Auth0_Api_Client::get_client_token\";s:4:\"code\";s:12:\"unknown_code\";s:7:\"message\";s:177:\"{\"error\":\"unauthorized_client\",\"error_description\":\"Grant type \'client_credentials\' not allowed for the client.\",\"error_uri\":\"https://auth0.com/docs/clients/client-grant-types\"}\";s:4:\"date\";i:1538735943;}i:12;a:4:{s:7:\"section\";s:37:\"WP_Auth0_Api_Client::get_client_token\";s:4:\"code\";s:12:\"unknown_code\";s:7:\"message\";s:177:\"{\"error\":\"unauthorized_client\",\"error_description\":\"Grant type \'client_credentials\' not allowed for the client.\",\"error_uri\":\"https://auth0.com/docs/clients/client-grant-types\"}\";s:4:\"date\";i:1538735939;}i:13;a:4:{s:7:\"section\";s:37:\"WP_Auth0_Api_Client::get_client_token\";s:4:\"code\";s:12:\"unknown_code\";s:7:\"message\";s:177:\"{\"error\":\"unauthorized_client\",\"error_description\":\"Grant type \'client_credentials\' not allowed for the client.\",\"error_uri\":\"https://auth0.com/docs/clients/client-grant-types\"}\";s:4:\"date\";i:1538735917;}i:14;a:4:{s:7:\"section\";s:37:\"WP_Auth0_Api_Client::get_client_token\";s:4:\"code\";s:12:\"unknown_code\";s:7:\"message\";s:177:\"{\"error\":\"unauthorized_client\",\"error_description\":\"Grant type \'client_credentials\' not allowed for the client.\",\"error_uri\":\"https://auth0.com/docs/clients/client-grant-types\"}\";s:4:\"date\";i:1538735910;}i:15;a:4:{s:7:\"section\";s:37:\"WP_Auth0_Api_Client::get_client_token\";s:4:\"code\";s:12:\"unknown_code\";s:7:\"message\";s:177:\"{\"error\":\"unauthorized_client\",\"error_description\":\"Grant type \'client_credentials\' not allowed for the client.\",\"error_uri\":\"https://auth0.com/docs/clients/client-grant-types\"}\";s:4:\"date\";i:1538730370;}i:16;a:4:{s:7:\"section\";s:37:\"WP_Auth0_Api_Client::get_client_token\";s:4:\"code\";s:12:\"unknown_code\";s:7:\"message\";s:177:\"{\"error\":\"unauthorized_client\",\"error_description\":\"Grant type \'client_credentials\' not allowed for the client.\",\"error_uri\":\"https://auth0.com/docs/clients/client-grant-types\"}\";s:4:\"date\";i:1538730326;}i:17;a:4:{s:7:\"section\";s:37:\"WP_Auth0_Api_Client::get_client_token\";s:4:\"code\";s:12:\"unknown_code\";s:7:\"message\";s:177:\"{\"error\":\"unauthorized_client\",\"error_description\":\"Grant type \'client_credentials\' not allowed for the client.\",\"error_uri\":\"https://auth0.com/docs/clients/client-grant-types\"}\";s:4:\"date\";i:1538730323;}i:18;a:4:{s:7:\"section\";s:37:\"WP_Auth0_Api_Client::get_client_token\";s:4:\"code\";s:12:\"unknown_code\";s:7:\"message\";s:177:\"{\"error\":\"unauthorized_client\",\"error_description\":\"Grant type \'client_credentials\' not allowed for the client.\",\"error_uri\":\"https://auth0.com/docs/clients/client-grant-types\"}\";s:4:\"date\";i:1538730318;}i:19;a:4:{s:7:\"section\";s:37:\"WP_Auth0_Api_Client::get_client_token\";s:4:\"code\";s:12:\"unknown_code\";s:7:\"message\";s:177:\"{\"error\":\"unauthorized_client\",\"error_description\":\"Grant type \'client_credentials\' not allowed for the client.\",\"error_uri\":\"https://auth0.com/docs/clients/client-grant-types\"}\";s:4:\"date\";i:1538730314;}}', 'yes'),
(5187, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(5188, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(5189, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(5190, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(5191, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(9496, 'wbcr_inp_cache_options', 'a:3:{s:25:\"factory_dismissed_notices\";b:0;s:44:\"factory_404_plugin_activated_wbcr_insert_php\";i:1536828654;s:17:\"upgrade_up_to_201\";i:1;}', 'yes'),
(9497, 'wbcr_inp_factory_404_plugin_activated_wbcr_insert_php', '1536828654', 'yes'),
(9498, 'factory_plugin_versions', 'a:1:{s:15:\"wbcr_insert_php\";s:10:\"free-2.0.6\";}', 'yes'),
(9499, 'wbcr_inp_upgrade_up_to_201', '1', 'yes'),
(9970, 'rlrsssl_options', 'a:14:{s:12:\"site_has_ssl\";b:1;s:4:\"hsts\";b:0;s:22:\"htaccess_warning_shown\";b:0;s:19:\"review_notice_shown\";b:0;s:25:\"ssl_success_message_shown\";b:0;s:26:\"autoreplace_insecure_links\";b:1;s:17:\"plugin_db_version\";s:5:\"3.1.1\";s:5:\"debug\";b:0;s:20:\"do_not_edit_htaccess\";b:0;s:17:\"htaccess_redirect\";b:0;s:11:\"ssl_enabled\";b:1;s:19:\"javascript_redirect\";b:1;s:11:\"wp_redirect\";b:1;s:31:\"switch_mixed_content_fixer_hook\";b:0;}', 'yes'),
(9981, 'secure_auth_key', 'M[x#kf-A[%:R._7N}pQ 5TyyF/n6[8xmn?kiP$SqBkARgG5S>]r{5!.hJ.z~C)f}', 'no'),
(9982, 'secure_auth_salt', ')eT@ng:bphn|/*@%zmE9P-i]!d(3Dj;$y5]0L.LIT~gz XqOPE H7Mzb:XMLzzDK', 'no'),
(10231, '_transient_is_multi_author', '0', 'yes'),
(10770, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:62:\"https://downloads.wordpress.org/release/el/wordpress-4.9.8.zip\";s:6:\"locale\";s:2:\"el\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:62:\"https://downloads.wordpress.org/release/el/wordpress-4.9.8.zip\";s:10:\"no_content\";b:0;s:11:\"new_bundled\";b:0;s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"4.9.8\";s:7:\"version\";s:5:\"4.9.8\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"4.7\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1542707126;s:15:\"version_checked\";s:5:\"4.9.8\";s:12:\"translations\";a:0:{}}', 'no'),
(10771, '_site_transient_update_themes', 'O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1542707125;s:7:\"checked\";a:2:{s:8:\"onlineS3\";s:5:\"1.0.0\";s:13:\"twentysixteen\";s:3:\"1.5\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}}', 'no'),
(10936, '_site_transient_timeout_theme_roots', '1542708925', 'no'),
(10937, '_site_transient_theme_roots', 'a:2:{s:8:\"onlineS3\";s:7:\"/themes\";s:13:\"twentysixteen\";s:7:\"/themes\";}', 'no'),
(10939, '_site_transient_update_plugins', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1542707127;s:7:\"checked\";a:4:{s:18:\"auth0/WP_Auth0.php\";s:5:\"3.7.1\";s:25:\"insert-php/insert_php.php\";s:5:\"2.0.6\";s:47:\"really-simple-ssl/rlrsssl-really-simple-ssl.php\";s:5:\"3.1.1\";s:25:\"sucuri-scanner/sucuri.php\";s:6:\"1.8.18\";}s:8:\"response\";a:2:{s:18:\"auth0/WP_Auth0.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:19:\"w.org/plugins/auth0\";s:4:\"slug\";s:5:\"auth0\";s:6:\"plugin\";s:18:\"auth0/WP_Auth0.php\";s:11:\"new_version\";s:5:\"3.8.1\";s:3:\"url\";s:36:\"https://wordpress.org/plugins/auth0/\";s:7:\"package\";s:48:\"https://downloads.wordpress.org/plugin/auth0.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:58:\"https://ps.w.org/auth0/assets/icon-256x256.png?rev=1194871\";s:2:\"1x\";s:58:\"https://ps.w.org/auth0/assets/icon-128x128.png?rev=1194871\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:61:\"https://ps.w.org/auth0/assets/banner-1544x500.png?rev=1194880\";s:2:\"1x\";s:60:\"https://ps.w.org/auth0/assets/banner-772x250.png?rev=1194880\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"4.9.8\";s:12:\"requires_php\";s:3:\"5.3\";s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:47:\"really-simple-ssl/rlrsssl-really-simple-ssl.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:31:\"w.org/plugins/really-simple-ssl\";s:4:\"slug\";s:17:\"really-simple-ssl\";s:6:\"plugin\";s:47:\"really-simple-ssl/rlrsssl-really-simple-ssl.php\";s:11:\"new_version\";s:5:\"3.1.2\";s:3:\"url\";s:48:\"https://wordpress.org/plugins/really-simple-ssl/\";s:7:\"package\";s:66:\"https://downloads.wordpress.org/plugin/really-simple-ssl.3.1.2.zip\";s:5:\"icons\";a:1:{s:2:\"1x\";s:70:\"https://ps.w.org/really-simple-ssl/assets/icon-128x128.png?rev=1782452\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:72:\"https://ps.w.org/really-simple-ssl/assets/banner-772x250.jpg?rev=1881345\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:3:\"5.0\";s:12:\"requires_php\";s:3:\"5.4\";s:13:\"compatibility\";O:8:\"stdClass\":0:{}}}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:2:{s:25:\"insert-php/insert_php.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:24:\"w.org/plugins/insert-php\";s:4:\"slug\";s:10:\"insert-php\";s:6:\"plugin\";s:25:\"insert-php/insert_php.php\";s:11:\"new_version\";s:5:\"2.0.6\";s:3:\"url\";s:41:\"https://wordpress.org/plugins/insert-php/\";s:7:\"package\";s:53:\"https://downloads.wordpress.org/plugin/insert-php.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:63:\"https://ps.w.org/insert-php/assets/icon-256x256.jpg?rev=1891898\";s:2:\"1x\";s:63:\"https://ps.w.org/insert-php/assets/icon-128x128.jpg?rev=1891898\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:66:\"https://ps.w.org/insert-php/assets/banner-1544x500.jpg?rev=1891898\";s:2:\"1x\";s:65:\"https://ps.w.org/insert-php/assets/banner-772x250.jpg?rev=1891898\";}s:11:\"banners_rtl\";a:0:{}}s:25:\"sucuri-scanner/sucuri.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:28:\"w.org/plugins/sucuri-scanner\";s:4:\"slug\";s:14:\"sucuri-scanner\";s:6:\"plugin\";s:25:\"sucuri-scanner/sucuri.php\";s:11:\"new_version\";s:6:\"1.8.18\";s:3:\"url\";s:45:\"https://wordpress.org/plugins/sucuri-scanner/\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/plugin/sucuri-scanner.1.8.18.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/sucuri-scanner/assets/icon-256x256.png?rev=1235419\";s:2:\"1x\";s:67:\"https://ps.w.org/sucuri-scanner/assets/icon-128x128.png?rev=1235419\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:69:\"https://ps.w.org/sucuri-scanner/assets/banner-772x250.png?rev=1235419\";}s:11:\"banners_rtl\";a:0:{}}}}', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `wp_postmeta`
--

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(2, 4, '_um_custom_fields', 'a:6:{s:10:\"user_login\";a:15:{s:5:\"title\";s:8:\"Username\";s:7:\"metakey\";s:10:\"user_login\";s:4:\"type\";s:4:\"text\";s:5:\"label\";s:8:\"Username\";s:8:\"required\";i:1;s:6:\"public\";i:1;s:8:\"editable\";i:0;s:8:\"validate\";s:15:\"unique_username\";s:9:\"min_chars\";i:3;s:9:\"max_chars\";i:24;s:8:\"position\";s:1:\"1\";s:6:\"in_row\";s:9:\"_um_row_1\";s:10:\"in_sub_row\";s:1:\"0\";s:9:\"in_column\";s:1:\"1\";s:8:\"in_group\";s:0:\"\";}s:10:\"user_email\";a:13:{s:5:\"title\";s:14:\"E-mail Address\";s:7:\"metakey\";s:10:\"user_email\";s:4:\"type\";s:4:\"text\";s:5:\"label\";s:14:\"E-mail Address\";s:8:\"required\";i:0;s:6:\"public\";i:1;s:8:\"editable\";i:1;s:8:\"validate\";s:12:\"unique_email\";s:8:\"position\";s:1:\"4\";s:6:\"in_row\";s:9:\"_um_row_1\";s:10:\"in_sub_row\";s:1:\"0\";s:9:\"in_column\";s:1:\"1\";s:8:\"in_group\";s:0:\"\";}s:13:\"user_password\";a:16:{s:5:\"title\";s:8:\"Password\";s:7:\"metakey\";s:13:\"user_password\";s:4:\"type\";s:8:\"password\";s:5:\"label\";s:8:\"Password\";s:8:\"required\";i:1;s:6:\"public\";i:1;s:8:\"editable\";i:1;s:9:\"min_chars\";i:8;s:9:\"max_chars\";i:30;s:15:\"force_good_pass\";i:1;s:18:\"force_confirm_pass\";i:1;s:8:\"position\";s:1:\"5\";s:6:\"in_row\";s:9:\"_um_row_1\";s:10:\"in_sub_row\";s:1:\"0\";s:9:\"in_column\";s:1:\"1\";s:8:\"in_group\";s:0:\"\";}s:10:\"first_name\";a:12:{s:5:\"title\";s:10:\"First Name\";s:7:\"metakey\";s:10:\"first_name\";s:4:\"type\";s:4:\"text\";s:5:\"label\";s:10:\"First Name\";s:8:\"required\";i:0;s:6:\"public\";i:1;s:8:\"editable\";i:1;s:8:\"position\";s:1:\"2\";s:6:\"in_row\";s:9:\"_um_row_1\";s:10:\"in_sub_row\";s:1:\"0\";s:9:\"in_column\";s:1:\"1\";s:8:\"in_group\";s:0:\"\";}s:9:\"last_name\";a:12:{s:5:\"title\";s:9:\"Last Name\";s:7:\"metakey\";s:9:\"last_name\";s:4:\"type\";s:4:\"text\";s:5:\"label\";s:9:\"Last Name\";s:8:\"required\";i:0;s:6:\"public\";i:1;s:8:\"editable\";i:1;s:8:\"position\";s:1:\"3\";s:6:\"in_row\";s:9:\"_um_row_1\";s:10:\"in_sub_row\";s:1:\"0\";s:9:\"in_column\";s:1:\"1\";s:8:\"in_group\";s:0:\"\";}s:9:\"_um_row_1\";a:4:{s:4:\"type\";s:3:\"row\";s:2:\"id\";s:9:\"_um_row_1\";s:8:\"sub_rows\";s:1:\"1\";s:4:\"cols\";s:1:\"1\";}}'),
(3, 4, '_um_mode', 'register'),
(4, 4, '_um_core', 'register'),
(5, 4, '_um_register_use_globals', '1'),
(6, 5, '_um_custom_fields', 'a:3:{s:8:\"username\";a:13:{s:5:\"title\";s:18:\"Username or E-mail\";s:7:\"metakey\";s:8:\"username\";s:4:\"type\";s:4:\"text\";s:5:\"label\";s:18:\"Username or E-mail\";s:8:\"required\";i:1;s:6:\"public\";i:1;s:8:\"editable\";i:0;s:8:\"validate\";s:24:\"unique_username_or_email\";s:8:\"position\";s:1:\"1\";s:6:\"in_row\";s:9:\"_um_row_1\";s:10:\"in_sub_row\";s:1:\"0\";s:9:\"in_column\";s:1:\"1\";s:8:\"in_group\";s:0:\"\";}s:13:\"user_password\";a:16:{s:5:\"title\";s:8:\"Password\";s:7:\"metakey\";s:13:\"user_password\";s:4:\"type\";s:8:\"password\";s:5:\"label\";s:8:\"Password\";s:8:\"required\";i:1;s:6:\"public\";i:1;s:8:\"editable\";i:1;s:9:\"min_chars\";i:8;s:9:\"max_chars\";i:30;s:15:\"force_good_pass\";i:1;s:18:\"force_confirm_pass\";i:1;s:8:\"position\";s:1:\"2\";s:6:\"in_row\";s:9:\"_um_row_1\";s:10:\"in_sub_row\";s:1:\"0\";s:9:\"in_column\";s:1:\"1\";s:8:\"in_group\";s:0:\"\";}s:9:\"_um_row_1\";a:4:{s:4:\"type\";s:3:\"row\";s:2:\"id\";s:9:\"_um_row_1\";s:8:\"sub_rows\";s:1:\"1\";s:4:\"cols\";s:1:\"1\";}}'),
(7, 5, '_um_mode', 'login'),
(8, 5, '_um_core', 'login'),
(9, 5, '_um_login_use_globals', '1'),
(10, 6, '_um_custom_fields', 'a:1:{s:9:\"_um_row_1\";a:4:{s:4:\"type\";s:3:\"row\";s:2:\"id\";s:9:\"_um_row_1\";s:8:\"sub_rows\";s:1:\"1\";s:4:\"cols\";s:1:\"1\";}}'),
(11, 6, '_um_mode', 'profile'),
(12, 6, '_um_core', 'profile'),
(13, 6, '_um_profile_use_globals', '1'),
(14, 7, '_um_template', 'members'),
(15, 7, '_um_mode', 'directory'),
(16, 7, '_um_has_profile_photo', '0'),
(17, 7, '_um_has_cover_photo', '0'),
(18, 7, '_um_show_social', '0'),
(19, 7, '_um_show_userinfo', '0'),
(20, 7, '_um_show_tagline', '0'),
(21, 7, '_um_search', '0'),
(22, 7, '_um_userinfo_animate', '1'),
(23, 7, '_um_sortby', 'user_registered_desc'),
(24, 7, '_um_profile_photo', '1'),
(25, 7, '_um_cover_photos', '1'),
(26, 7, '_um_show_name', '1'),
(27, 7, '_um_directory_header', '{total_users} Members'),
(28, 7, '_um_directory_header_single', '{total_users} Member'),
(29, 7, '_um_directory_no_users', 'We are sorry. We cannot find any users who match your search criteria.'),
(30, 7, '_um_profiles_per_page', '12'),
(31, 7, '_um_profiles_per_page_mobile', '6'),
(32, 7, '_um_core', 'members'),
(54, 22, '_um_core', 'admin'),
(55, 22, '_um_can_access_wpadmin', '1'),
(56, 22, '_um_can_not_see_adminbar', '0'),
(57, 22, '_um_can_edit_everyone', '1'),
(58, 22, '_um_can_delete_everyone', '1'),
(59, 22, '_um_can_edit_profile', '1'),
(60, 22, '_um_can_delete_profile', '1'),
(61, 22, '_um_can_view_all', '1'),
(62, 22, '_um_can_make_private_profile', '1'),
(63, 22, '_um_can_access_private_profile', '1'),
(64, 22, '_um_default_homepage', '1'),
(65, 22, '_um_status', 'approved'),
(66, 22, '_um_auto_approve_act', 'redirect_profile'),
(67, 22, '_um_after_login', 'redirect_admin'),
(68, 22, '_um_after_logout', 'redirect_home'),
(69, 23, '_um_core', 'member'),
(70, 23, '_um_can_access_wpadmin', '0'),
(71, 23, '_um_can_not_see_adminbar', '1'),
(72, 23, '_um_can_edit_everyone', '0'),
(73, 23, '_um_can_delete_everyone', '0'),
(74, 23, '_um_can_edit_profile', '1'),
(75, 23, '_um_can_delete_profile', '1'),
(76, 23, '_um_can_view_all', '1'),
(77, 23, '_um_can_make_private_profile', '0'),
(78, 23, '_um_can_access_private_profile', '0'),
(79, 23, '_um_default_homepage', '1'),
(80, 23, '_um_status', 'approved'),
(81, 23, '_um_auto_approve_act', 'redirect_profile'),
(82, 23, '_um_after_login', 'redirect_profile'),
(83, 23, '_um_after_logout', 'redirect_home'),
(84, 24, '_edit_last', '1'),
(85, 24, '_edit_lock', '1496404727:1'),
(86, 24, '_um_custom_access_settings', '0'),
(87, 24, '_um_accessible', '0'),
(88, 24, '_um_access_redirect2', ''),
(89, 24, '_um_access_roles', 'a:1:{i:0;s:1:\"0\";}'),
(90, 24, '_um_access_redirect', ''),
(98, 28, '_edit_last', '1'),
(99, 28, '_edit_lock', '1488284240:1'),
(100, 28, '_um_custom_access_settings', '0'),
(101, 28, '_um_accessible', '0'),
(102, 28, '_um_access_redirect2', ''),
(103, 28, '_um_access_roles', 'a:1:{i:0;s:1:\"0\";}'),
(104, 28, '_um_access_redirect', ''),
(105, 32, '_edit_last', '1'),
(106, 32, '_edit_lock', '1493225894:1'),
(107, 32, '_um_custom_access_settings', '0'),
(108, 32, '_um_accessible', '0'),
(109, 32, '_um_access_redirect2', ''),
(110, 32, '_um_access_roles', 'a:1:{i:0;s:1:\"0\";}'),
(111, 32, '_um_access_redirect', ''),
(112, 35, '_edit_last', '1'),
(113, 35, '_edit_lock', '1496131024:1'),
(126, 52, '_wp_attached_file', '2017/11/logo.png'),
(127, 52, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:353;s:6:\"height\";i:258;s:4:\"file\";s:16:\"2017/11/logo.png\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:16:\"logo-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:16:\"logo-300x219.png\";s:5:\"width\";i:300;s:6:\"height\";i:219;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');

-- --------------------------------------------------------

--
-- Table structure for table `wp_posts`
--

CREATE TABLE `wp_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(4, 1, '2017-01-18 10:15:57', '2017-01-18 10:15:57', '', 'Default Registration', '', 'publish', 'closed', 'closed', '', 'default-registration', '', '', '2017-01-18 10:15:57', '2017-01-18 10:15:57', '', 0, 'http://assetsmapping.s3platform.eu/um_form/default-registration/', 0, 'um_form', '', 0),
(5, 1, '2017-01-18 10:15:57', '2017-01-18 10:15:57', '', 'Default Login', '', 'publish', 'closed', 'closed', '', 'default-login', '', '', '2017-01-18 10:15:57', '2017-01-18 10:15:57', '', 0, 'http://assetsmapping.s3platform.eu/um_form/default-login/', 0, 'um_form', '', 0),
(6, 1, '2017-01-18 10:15:57', '2017-01-18 10:15:57', '', 'Default Profile', '', 'publish', 'closed', 'closed', '', 'default-profile', '', '', '2017-01-18 10:15:57', '2017-01-18 10:15:57', '', 0, 'http://assetsmapping.s3platform.eu/um_form/default-profile/', 0, 'um_form', '', 0),
(7, 1, '2017-01-18 10:15:57', '2017-01-18 10:15:57', '', 'Members', '', 'publish', 'closed', 'closed', '', 'members', '', '', '2017-01-18 10:15:57', '2017-01-18 10:15:57', '', 0, 'http://assetsmapping.s3platform.eu/um_directory/members/', 0, 'um_directory', '', 0),
(22, 1, '2017-01-18 10:15:58', '2017-01-18 10:15:58', '', 'Admin', '', 'publish', 'closed', 'closed', '', 'admin', '', '', '2017-01-18 10:15:58', '2017-01-18 10:15:58', '', 0, 'http://assetsmapping.s3platform.eu/um_role/admin/', 0, 'um_role', '', 0),
(23, 1, '2017-01-18 10:15:58', '2017-01-18 10:15:58', '', 'Member', '', 'publish', 'closed', 'closed', '', 'member', '', '', '2017-01-18 10:15:58', '2017-01-18 10:15:58', '', 0, 'http://assetsmapping.s3platform.eu/um_role/member/', 0, 'um_role', '', 0),
(24, 1, '2017-01-18 10:39:40', '2017-01-18 10:39:40', '[insert_php]include \'php-src/templates/home.php\';[/insert_php]', 'home', '', 'publish', 'closed', 'closed', '', 'home', '', '', '2017-01-18 10:39:40', '2017-01-18 10:39:40', '', 0, 'http://assetsmapping.s3platform.eu/?page_id=24', 0, 'page', '', 0),
(25, 1, '2017-01-18 10:39:40', '2017-01-18 10:39:40', '[insert_php]include \'php-src/templates/home.php\';[/insert_php]', 'home', '', 'inherit', 'closed', 'closed', '', '24-revision-v1', '', '', '2017-01-18 10:39:40', '2017-01-18 10:39:40', '', 24, 'http://assetsmapping.s3platform.eu/2017/01/18/24-revision-v1/', 0, 'revision', '', 0),
(28, 1, '2017-01-19 09:24:43', '2017-01-19 09:24:43', '[insert_php]include \'php-src/templates/admin.php\';[/insert_php]', 'admin', '', 'publish', 'closed', 'closed', '', 'admin', '', '', '2017-01-19 09:24:43', '2017-01-19 09:24:43', '', 0, 'http://assetsmapping.s3platform.eu/?page_id=28', 0, 'page', '', 0),
(29, 1, '2017-01-19 09:24:43', '2017-01-19 09:24:43', '[insert_php]include \'php-src/templates/admin.php\';[/insert_php]', 'admin', '', 'inherit', 'closed', 'closed', '', '28-revision-v1', '', '', '2017-01-19 09:24:43', '2017-01-19 09:24:43', '', 28, 'http://assetsmapping.s3platform.eu/2017/01/19/28-revision-v1/', 0, 'revision', '', 0),
(32, 1, '2017-02-16 08:49:27', '2017-02-16 08:49:27', '[insert_php]include \'php-src/templates/contents.php\';[/insert_php]', 'contents', '', 'publish', 'closed', 'closed', '', 'contents', '', '', '2017-02-16 08:49:27', '2017-02-16 08:49:27', '', 0, 'http://assetsmapping.s3platform.eu/?page_id=32', 0, 'page', '', 0),
(33, 1, '2017-02-16 08:49:27', '2017-02-16 08:49:27', '[insert_php]include \'php-src/templates/contents.php\';[/insert_php]', 'contents', '', 'inherit', 'closed', 'closed', '', '32-revision-v1', '', '', '2017-02-16 08:49:27', '2017-02-16 08:49:27', '', 32, 'http://assetsmapping.s3platform.eu/2017/02/16/32-revision-v1/', 0, 'revision', '', 0),
(35, 1, '2017-05-25 10:49:16', '2017-05-25 10:49:16', '[insert_php]include \'php-src/templates/preview.php\';[/insert_php]', 'preview', '', 'publish', 'closed', 'closed', '', 'preview', '', '', '2017-05-25 10:49:16', '2017-05-25 10:49:16', '', 0, 'http://assetsmapping.s3platform.eu/?page_id=35', 0, 'page', '', 0),
(36, 1, '2017-05-25 10:49:16', '2017-05-25 10:49:16', '[insert_php]include \'php-src/templates/preview.php\';[/insert_php]', 'preview', '', 'inherit', 'closed', 'closed', '', '35-revision-v1', '', '', '2017-05-25 10:49:16', '2017-05-25 10:49:16', '', 35, 'http://assetsmapping.s3platform.eu/2017/05/25/35-revision-v1/', 0, 'revision', '', 0),
(52, 1, '2017-11-07 14:25:35', '2017-11-07 14:25:35', '', 'logo', '', 'inherit', 'closed', 'closed', '', 'logo', '', '', '2017-11-07 14:25:35', '2017-11-07 14:25:35', '', 0, 'http://assetsmapping.s3platform.eu/wp-content/uploads/2017/11/logo.png', 0, 'attachment', 'image/png', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_termmeta`
--

CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_terms`
--

CREATE TABLE `wp_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Χωρίς κατηγορία', '%ce%b1%cf%84%ce%b1%ce%be%ce%b9%ce%bd%cf%8c%ce%bc%ce%b7%cf%84%ce%b1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_relationships`
--

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(8, 1, 0),
(10, 1, 0),
(12, 1, 0),
(14, 1, 0),
(16, 1, 0),
(18, 1, 0),
(20, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_taxonomy`
--

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_usermeta`
--

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_users`
--

CREATE TABLE `wp_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `year`
--

CREATE TABLE `year` (
  `year_id` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `year`
--

INSERT INTO `year` (`year_id`) VALUES
('2005'),
('2006'),
('2007'),
('2008'),
('2009'),
('2010'),
('2011'),
('2012'),
('2013'),
('2014'),
('2015'),
('2016');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `cell_data`
--
ALTER TABLE `cell_data`
  ADD PRIMARY KEY (`col_id`,`row_id`),
  ADD KEY `col_id` (`col_id`),
  ADD KEY `row_id` (`row_id`);

--
-- Indexes for table `col_head`
--
ALTER TABLE `col_head`
  ADD PRIMARY KEY (`col_id`),
  ADD KEY `col_head_ibfk_1` (`tbl_id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`country_id`),
  ADD UNIQUE KEY `description_UNIQUE` (`description`);

--
-- Indexes for table `in_data`
--
ALTER TABLE `in_data`
  ADD PRIMARY KEY (`var_id`,`reg_id`,`year_id`),
  ADD KEY `year_data_fk_idx` (`year_id`),
  ADD KEY `var_data_fk_idx` (`var_id`),
  ADD KEY `reg_data_fk_indx` (`reg_id`);

--
-- Indexes for table `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`reg_id`),
  ADD UNIQUE KEY `label_UNIQUE` (`label`),
  ADD KEY `reg_count_fk_idx` (`country_id`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`report_id`),
  ADD UNIQUE KEY `user_id_UNIQUE` (`user_id`);

--
-- Indexes for table `report_charts`
--
ALTER TABLE `report_charts`
  ADD PRIMARY KEY (`chart_id`),
  ADD KEY `cat_report_fk_idx` (`cat_id`),
  ADD KEY `report_chart_fk` (`report_id`);

--
-- Indexes for table `report_tbl`
--
ALTER TABLE `report_tbl`
  ADD PRIMARY KEY (`tbl_id`),
  ADD KEY `report_tbl_fkey_idx` (`report_id`);

--
-- Indexes for table `row_head`
--
ALTER TABLE `row_head`
  ADD PRIMARY KEY (`row_id`),
  ADD KEY `row_head_ibfk_1` (`tbl_id`);

--
-- Indexes for table `subcat`
--
ALTER TABLE `subcat`
  ADD PRIMARY KEY (`sub_id`),
  ADD KEY `sub_cat_fk_idx` (`cat_id`);

--
-- Indexes for table `variable`
--
ALTER TABLE `variable`
  ADD PRIMARY KEY (`var_id`),
  ADD KEY `var_sub_fk_idx` (`description`),
  ADD KEY `var_cat_fk_idx` (`cat_id`);

--
-- Indexes for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_comments`
--
ALTER TABLE `wp_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Indexes for table `wp_links`
--
ALTER TABLE `wp_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Indexes for table `wp_options`
--
ALTER TABLE `wp_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`);

--
-- Indexes for table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_posts`
--
ALTER TABLE `wp_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Indexes for table `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_terms`
--
ALTER TABLE `wp_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Indexes for table `wp_term_relationships`
--
ALTER TABLE `wp_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indexes for table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Indexes for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_users`
--
ALTER TABLE `wp_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- Indexes for table `year`
--
ALTER TABLE `year`
  ADD PRIMARY KEY (`year_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `col_head`
--
ALTER TABLE `col_head`
  MODIFY `col_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `report_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `report_charts`
--
ALTER TABLE `report_charts`
  MODIFY `chart_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `report_tbl`
--
ALTER TABLE `report_tbl`
  MODIFY `tbl_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `row_head`
--
ALTER TABLE `row_head`
  MODIFY `row_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_comments`
--
ALTER TABLE `wp_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_links`
--
ALTER TABLE `wp_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_options`
--
ALTER TABLE `wp_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10940;

--
-- AUTO_INCREMENT for table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `wp_posts`
--
ALTER TABLE `wp_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_terms`
--
ALTER TABLE `wp_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_users`
--
ALTER TABLE `wp_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cell_data`
--
ALTER TABLE `cell_data`
  ADD CONSTRAINT `cell_data_ibfk_1` FOREIGN KEY (`col_id`) REFERENCES `col_head` (`col_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cell_data_ibfk_2` FOREIGN KEY (`row_id`) REFERENCES `row_head` (`row_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `col_head`
--
ALTER TABLE `col_head`
  ADD CONSTRAINT `col_head_ibfk_1` FOREIGN KEY (`tbl_id`) REFERENCES `report_tbl` (`tbl_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `in_data`
--
ALTER TABLE `in_data`
  ADD CONSTRAINT `year_data_fk` FOREIGN KEY (`year_id`) REFERENCES `year` (`year_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `region`
--
ALTER TABLE `region`
  ADD CONSTRAINT `country_reg_fk` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `report_charts`
--
ALTER TABLE `report_charts`
  ADD CONSTRAINT `report_chart_fk` FOREIGN KEY (`report_id`) REFERENCES `report` (`report_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `report_tbl`
--
ALTER TABLE `report_tbl`
  ADD CONSTRAINT `report_tbl_fkey` FOREIGN KEY (`report_id`) REFERENCES `report` (`report_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `row_head`
--
ALTER TABLE `row_head`
  ADD CONSTRAINT `row_head_ibfk_1` FOREIGN KEY (`tbl_id`) REFERENCES `report_tbl` (`tbl_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `variable`
--
ALTER TABLE `variable`
  ADD CONSTRAINT `var_cat_fk` FOREIGN KEY (`cat_id`) REFERENCES `category` (`cat_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
