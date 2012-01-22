ALTER TABLE `accounts` ADD `erstellt am` varchar(32) NOT NULL COMMENT 'Wann wurde der Account erstellt',
ADD `erstellt von` VARCHAR( 64 ) NOT NULL COMMENT 'Von wehm wurde er erstellt',
ADD `letzter Login` VARCHAR( 32 ) NOT NULL COMMENT 'Wann war der letzte Login';

