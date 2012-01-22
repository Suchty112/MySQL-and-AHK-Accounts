<?php
/*
Die Accountöschung wie folgt:
admin.php?name=<Adminname>&pass=<Adminpasswort>&deluser=<Accountt der gelöscht werden soll>

Die Accounterstellung wie folgt:
admin2.php?name=name=<Adminname>&pass=<Adminpasswort>&useradd=<Neuer Nutzer>&passwd=<Passwort>&level=<Admin Level>
*/
include ('config.php');
$Now = date("Y-m-d H:i:s");
$Fehlermeldung1 = sprintf("<strong>FEHLER:</strong> Benutzername oder Passwort falsch");
$Fehlermeldung2 = sprintf("<strong>FEHLER:</strong> Sie haben nicht angegeben was sie machen wollen");
$Fehlermeldung3 = sprintf("<strong>FEHLER:</strong> Zu löschender Account wurde nicht gefunden!");
$Fehlermeldung4 = sprintf("<strong>FEHLER:</strong> Sie können nicht den einzigsten Admin Account Löschen!");
$Loescherfolg = sprintf("Wurde erfolgreich gelöscht");

$UserAddFehler1 = sprintf("<strong>FEHLER:</strong> Ein Account mit dem Namen ist schon vorhanden!");
$UserAddFehler2 = sprintf("<strong>FEHLER:</strong> Sie haben kein Passwort angegeben!");
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

if ($AccLevel == "1337") {
	if (!$_GET['useradd']) {
		if (!$_GET['deluser']) {
		exit($Fehlermeldung2);
		} else {
			$delusercheck = sprintf("SELECT * FROM accounts WHERE Name='%s'",
				mysql_real_escape_string($_GET['deluser']));
			$result = mysql_query($delusercheck);
			if (!$result) {
				echo "<strong>FEHLER:</strong> Konnte Abfrage ($delusercheck) <br>nicht erfolgreich ausfuehren von DB: <br>" . mysql_error();
				exit(ABBRUCH);
			}
			
			if (mysql_num_rows($result) == 0) {
				exit($Fehlermeldung3);
			}
			
			while ($row = mysql_fetch_assoc($result)) {
				$DelAccLevel = $row["Accountlevel"];
			}
			mysql_free_result($result);
			$LastAdminCheck = sprintf("SELECT * FROM accounts WHERE Name NOT LIKE '%s' AND Accountlevel=1337",
				mysql_real_escape_string($_GET['deluser']));
			$result = mysql_query($LastAdminCheck);
			if (!$result) {
				echo "<strong>FEHLER:</strong> Konnte Abfrage ($LastAdminCheck) <br>nicht erfolgreich ausfuehren von DB: <br>" . mysql_error();
				exit(ABBRUCH);
			}
			
			if (mysql_num_rows($result) == 0) {
				exit($Fehlermeldung4);
			} elseif  (mysql_num_rows($result) >= 1) {
				$DelString = sprintf("DELETE FROM accounts WHERE Name = '%s'",
					mysql_real_escape_string($_GET['deluser']));
				$delResult = mysql_query($DelString);
				if (!$delResult) {
					echo "<strong>FEHLER:</strong> Konnte Abfrage ($DelString) <br>nicht erfolgreich ausfuehren von DB: <br>" . mysql_error();
					mysql_free_result($delResult);
					exit(ABBRUCH);
				} else {
					echo $_GET['deluser'];
					echo " ";
					mysql_free_result($delResult);
					exit($Loescherfolg);
				}
			} else {
				echo "Unbekannter Fehler";
			}
			mysql_free_result($result);
		}
	} else {
		$Now = date("Y-m-d H:i");
		$NameCheck = sprintf("SELECT * FROM accounts WHERE Name='%s'",
			mysql_real_escape_string($_GET['useradd']));
		$result = mysql_query($NameCheck);
		if (!$result) {
			echo "<strong>FEHLER:</strong> Konnte Abfrage ($NameCheck) <br>nicht erfolgreich ausfuehren von DB: <br>" . mysql_error();
			exit(ABBRUCH);
		}
		
		if (mysql_num_rows($result) >= 1) {
			exit($UserAddFehler1);
		} else {
			if (!$_GET['passwd']) {
				exit($UserAddFehler2);
			} else {
				$adduser = "INSERT INTO accounts SET
					Name   = '" . mysql_real_escape_string($_GET['useradd']) . "',
					Passwd   = '" . mysql_real_escape_string($_GET['passwd']) . "',
					Accountlevel   = '" . mysql_real_escape_string($_GET['level']) . "',
					ErstelltAm   = '" . mysql_real_escape_string($Now) . "',
					ErstelltVon   = '" . mysql_real_escape_string($_GET['name']) . "'";
				$ausgabe = mysql_query($adduser);
				if (!$ausgabe) {
					echo "<strong>FEHLER:</strong> Konnte Abfrage ($adduser) <br>nicht erfolgreich ausfuehren von DB: <br>" . mysql_error();
					exit(ABBRUCH);
				} else {
					echo "Test";
				}
			}
		}
	}
}

mysql_free_result($result);
mysql_close();
exit;

?>
