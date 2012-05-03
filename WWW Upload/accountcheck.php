<?php
include ('config.php');
$Name=$_GET['name'];
$Pass=$_GET['pass'];

if(!$_GET['name']){
	echo "Sie haben keinen Namen angegeben.</br>
	Wollen sie dieses jetzt aendern?
	<form action='account.php'>
	<p><input type='submit' value='ja' /></p>
	</form>";
}else{
	$sql = sprintf("SELECT * FROM accounts WHERE Name='%s'",
	            mysql_real_escape_string($Name));
	$result = mysql_query($sql);
	if (!$result) {
	    echo "Konnte Abfrage ($sql) nicht erfolgreich ausführen von DB: " . mysql_error();
	    exit;
	} else {
		$LastLogin = sprintf("UPDATE accounts SET LetzterLogin='%s' WHERE Name='%s'",
	            mysql_real_escape_string($Now),
	            mysql_real_escape_string($Name));
	}


	if (mysql_num_rows($result) == 0) {
		echo "FEHLER: Ihr Name oder Passwort ist nicht richtig!";
		exit;
	}

	while ($row = mysql_fetch_array($result, MYSQL_BOTH)) {
	    $PassCheck = $row["Passwd"];
	    $Gesperrt = $row["gesperrt"];
	    $AccLevel = $row["Accountlevel"];
	}
	mysql_free_result($result);
	if ($Pass == $PassCheck) {
		if ($Gesperrt == "0") {
			echo "1";
			$SetLastLogin = mysql_query($LastLogin);
			if (!$SetLastLogin) {
				echo "FEHLER: Konnte Abfrage ($LastLogin) <br>nicht erfolgreich ausfuehren von DB: <br>" . mysql_error();
				exit(ABBRUCH);
			}
		} else {
			echo "FEHLER: Ihr Account ist gesperrt, bitte wenden sie sich an einen Administrator!";
			exit;
		}
	} else {
		echo "FEHLER: Ihr Name oder Passwort ist nicht richtig!";
		exit;
	}
	mysql_close();
	exit;
}

?>
