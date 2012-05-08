<html>
<head>
 <title>Account Management</title>
</head>
</html>
<?php
/*
admin.php?name=<AdminName>&pass=<AdminPassword>&action<Aktionsnummer>&user=<UserFürAktion>[&userpass=<PasswordFürUser>&AccountLevel=<AdminLevel>]
action 1 = Accounterstellung --> GEHT
action 2 = Account sperren --> FEHLT 
action 3 = Account entsperren --> FEHLT 
action 4 = Account löschen --> FEHLT
action 5 = Account übersicht --> Kommt vielleicht

*/
include ('config.php');
$Name = $_GET['name'];
$Pass = $_GET['pass'];
$Option = $_GET['action'];
if(!$Name and !$Pass) {
	exit(ERROR);
}

$Now = date("Y-m-d H:i:s");
$sql = sprintf("SELECT * FROM accounts WHERE Name='%s' AND Passwd='%s'",
            mysql_real_escape_string($_GET['name']),
            mysql_real_escape_string($_GET['pass']));
$result = mysql_query($sql);
if (!$result) {
	echo "<strong>FEHLER:</strong> Konnte Abfrage ($sql) <br>nicht erfolgreich ausfuehren von DB: <br>" . mysql_error();
	exit(ABBRUCH);
} else {
	$LastLogin = sprintf("UPDATE accounts SET LetzterLogin='%s' WHERE Name='%s'",
            mysql_real_escape_string($Now),
            mysql_real_escape_string($_GET['name']));
	$SetLastLogin = mysql_query($LastLogin);
	if (!$SetLastLogin) {
		echo "<strong>FEHLER:</strong> Konnte Abfrage ($LastLogin) <br>nicht erfolgreich ausfuehren von DB: <br>" . mysql_error();
		exit(ABBRUCH);
	}
}

if (mysql_num_rows($result) == 0) {
	exit($Fehlermeldung1);
}

while ($row = mysql_fetch_assoc($result)) {
    	$AccLevel = $row["Accountlevel"];
}
mysql_free_result($result);

//Account erstellen ANFANG
if ($Option = 1) {
	if ($AccLevel >= $Admin || $AccLevel == $Supporter) {
		if (!$_GET['user']) {
			echo "FEHLER: Sie haben kein Accountnamen angegeben";
			exit;
		} else {
			$User = $_GET['user'];
		}

		if (!$_GET['level']) {
			$Level = 1;
		} else {
		$Level = $_GET['level'];
		}

		if (!$_GET['userpass']) {
			$UserPassword = getpass();
		} else {
			$UserPassword = $_GET['userpass'];
		}

		$CheckUserString = sprintf("SELECT * FROM accounts WHERE Name='%s'",
			mysql_real_escape_string($_GET['user']));
		$CheckUserQuery = mysql_query($CheckUserString);
		
		if (!$CheckUserQuery) {
			echo " Konnte die Abfrage ($CheckUserString)</br>nicht ausführen</br>" . mysql_error();
		}
		
		if (mysql_num_rows($CheckUserQuery) == 0) {

			$adduser = "INSERT INTO accounts SET
				Name   = '" . mysql_real_escape_string($User) . "',
				Passwd   = '" . mysql_real_escape_string($UserPassword) . "',
				Accountlevel   = '" . mysql_real_escape_string($Level) . "',
				ErstelltAm   = '" . mysql_real_escape_string($Now) . "',
				ErstelltVon   = '" . mysql_real_escape_string($_GET['name']) . "'";
			$ausgabe = mysql_query($adduser);
			if (!$ausgabe) {
				echo "Konnte die Abfrage ($adduser) <br>nicht erfolgreich ausfuehren von DB: <br>" . mysql_error();
					exit(ABBRUCH);
			} else {
				$Adminlog=fopen("adminlog.txt","a");
				fputs($Adminlog, 
  					Date("d.m.Y, H:i:s",time()) .
					", " . $Name .
					", Legte den User " . $User .
					", mit dem Passwort " . $UserPassword .
					", und dem Accountlevel " . $Level .
					", an."
					"\n"
					);
				fclose($Adminlog);
				echo "Der User ($User) wurde mit dem Passwort: ($UserPassword) und dem Accountlevel: ($Level) erfolgreich angelegt";
				Exit;
			}
		} else {
			echo "Ein Account mit dem Namen ist schon vorhanden";
			exit;
		}
	} else {
		echo " Sie sind nicht berechtigt";
		exit;
	}
}
//Account erstellen ENDE

//funktionen
function getpass() {
	$newpass = "";
	$laenge=6;
	$string="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
	mt_srand((double)microtime()*1000000);
	for ($i=1; $i <= $laenge; $i++) {
	$newpass .= substr($string, mt_rand(0,strlen($string)-1), 1);
	}
	return $newpass;
} 
exit;
?>
