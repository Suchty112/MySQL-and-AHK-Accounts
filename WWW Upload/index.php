<?php
include ('config.php');
$Name = $_GET['name'];
$Pass = $_GET['pass'];
$sql = sprintf("SELECT * FROM accounts WHERE Name='%s'",
            mysql_real_escape_string($Name));
$result = mysql_query($sql);
if (!$result) {
    echo "Konnte Abfrage ($sql) nicht erfolgreich ausführen von DB: " . mysql_error();
    exit;
} else {
	$LastLogin = sprintf("UPDATE accounts SET LetzterLogin='%s' WHERE Name='%s'",
            mysql_real_escape_string($Now),
            mysql_real_escape_string($_GET['name']));
}


if (mysql_num_rows($result) == 0) {
    echo "3";
    exit;
}

while ($row = mysql_fetch_assoc($result)) {
    $PassCheck = $row["Passwd"];
    $Gesperrt = $row["gesperrt"];
    $AccLevel = $row["Acccountlevel"];
}
mysql_free_result($result);
if ($Pass == $PassCheck) {
	if ($Gesperrt == "0") {
		echo "1";
		$SetLastLogin = mysql_query($LastLogin);
		if (!$SetLastLogin) {
			echo "<strong>FEHLER:</strong> Konnte Abfrage ($LastLogin) <br>nicht erfolgreich ausfuehren von DB: <br>" . mysql_error();
			exit(ABBRUCH);
		}
	} else {
		echo "6";
	}
} else {
	echo "2";
}
mysql_close();
exit;?>
