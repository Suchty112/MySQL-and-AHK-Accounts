DROP TABLE IF EXISTS `accounts`;
CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(32) NOT NULL,
  `Passwd` varchar(64) NOT NULL,
  `Accountlevel` int(11) NOT NULL DEFAULT '1' COMMENT 'Implimentiert',
  `ErstelltAm` varchar(32) NOT NULL COMMENT 'Wann wurde der Account erstellt',
  `ErstelltVon` varchar(64) NOT NULL COMMENT 'Von wehm wurde er erstellt',
  `LetzterLogin` varchar(32) NOT NULL COMMENT 'Wann war der letzte Login',
  `gesperrt` varchar(32) NOT NULL DEFAULT '0' COMMENT 'gesperrt',
  PRIMARY KEY (`id`),
  KEY `id` (`id`,`Name`,`Passwd`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Daten für Tabelle `accounts`
--

INSERT INTO `accounts` (`id`, `Name`, `Passwd`, `Accountlevel`, `ErstelltAm`, `ErstelltVon`, `LetzterLogin`) VALUES
(1, 'admin', 'admin', 1337, '', 'Dux Aquila', '', '0'),
(2, 'Test', 'test', 1, '', 'Dux Aquila', '', '0');
