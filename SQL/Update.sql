ALTER TABLE `accounts` ADD `ErstelltAm` varchar(32) NOT NULL COMMENT 'Wann wurde der Account erstellt',
ADD `ErstelltVon` VARCHAR( 64 ) NOT NULL COMMENT 'Von wehm wurde er erstellt',
ADD `LetzterLogin` VARCHAR( 32 ) NOT NULL COMMENT 'Wann war der letzte Login';

