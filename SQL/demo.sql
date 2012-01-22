DROP TABLE IF EXISTS `accounts`;
CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(32) NOT NULL,
  `Passwd` varchar(64) NOT NULL,
  `Accountlevel` int(11) NOT NULL DEFAULT '1' COMMENT 'für die Zukunft',
  `erstellt am` varchar(32) NOT NULL COMMENT 'Wann wurde der Account erstellt',
  `erstellt von` varchar(64) NOT NULL COMMENT 'Von wehm wurde er erstellt',
  `letzter Login` varchar(32) NOT NULL COMMENT 'Wann war der letzte Login',
  PRIMARY KEY (`id`),
  KEY `id` (`id`,`Name`,`Passwd`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

INSERT INTO `accounts` (`id`, `Name`, `Passwd`, `Accountlevel`, `erstellt am`, `erstellt von`, `letzter Login`) VALUES
(1, 'Max Mustermann', 'abc', 1, '', '', ''),
(2, 'Babara Schmitt ', '123', 1, '', '', ''),
(3, 'Test', 'abc123', 1337, '', '', '');
