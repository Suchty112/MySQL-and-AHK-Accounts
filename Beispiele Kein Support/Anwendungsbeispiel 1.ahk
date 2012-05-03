#SingleInstance, force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.

Gui, Login:Add, Text, x6 y10 w250 h20 , Bitte geben sie ihren Namen und Ihr Passwort ein
Gui, Login:Add, Edit, x6 y30 w250 h20 vLoginName, Name
Gui, Login:Add, Edit, x6 y50 w250 h20 vPassword, Password
Gui, Login:Add, Button, x6 y70 w90 h20 gLoginCheck, OK
Gui, Login:Add, Button, x166 y70 w90 h20 gLoginAbbruch, Abbrechen
Gui, Login:+LabelLogin -Caption
Gui, Login: +LastFound
Gui, Login:Show, w267 h103, Login
return

LoginAbbruch:
LoginClose:
LoginEscape:
ExitApp

LoginCheck:
Gui, Login:Submit, NoHide
CheckURL = http://rev0.re.ohost.de/index.php?name=%LoginName%&pass=%Password%
Checksumme:=UrlDownloadToVar(CheckURL)
if (Checksumme ="1") {
	MsgBox, 64, Information, Ihre Accountdaten wurden gefunden und waren richtig
	Gui, Login:Destroy
	goto, Mainframe
}
if (Checksumme = "2") {
	MsgBox, 16, ACHTUNG!!!!!, Ihr Passwort war falsch
	ExitApp
}
if (Checksumme = "3") {
	MsgBox, 16, ACHTUNG!!!!!, Ihr Account wurde nicht gefunden
	ExitApp
}
return
#Include UrlDownloadToVar.ahk ;Thanks on olfen for http://www.autohotkey.com/forum/topic10466.html

Mainframe:
Gui, Add, Text, x16 y7 , Das hier könnte euer Haiuptfenster sein
Gui, Add, Text, x16 y57 , Hier habe ich mal ein Hotkey gemacht, der nur dann geht wenn die Anmeldung erfolgreich war `n`nHotkey = F12
Gui, Show, w477 h377, Mainframe
return

GuiClose:
ExitApp

#if (Checksumme = "1") ;Dieses geht nur mit AHK L 
;Alles was ihr hier zwischen die beiden #if schreibt geht auch nur dann wenn die Checksumme auch 1 war
F12::
MsgBox, 64, Info, Dieses war die Taste F12 und dein Passwort war richtig`n`nDamit das hier geht`, braucht ihr AHK L denn sonst habt ihr die Funktion `n`n#if nicht ,
return

#if 

;sollte das beu euch nicht gehen würde es auch so gehen
F12::
if (Checksumme ="1") {
	MsgBox, 64, Info, Dieses war die Taste F12 und dein Passwort war richtig
}
else {
	MsgBox, 16, Fehler, Sie sind noch nicht eingeloggt,
}
return
;