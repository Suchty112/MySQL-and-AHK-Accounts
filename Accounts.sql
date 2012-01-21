DROP TABLE IF EXISTS `accounts`;
CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(32) NOT NULL,
  `Passwd` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`,`Name`,`Passwd`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

INSERT INTO `accounts` (`id`, `Name`, `Passwd`) VALUES
(1, 'Max Mustermann', 'abc'),
(2, 'Babara Schmitt ', '123'),
(3, 'Test', 'abc123');