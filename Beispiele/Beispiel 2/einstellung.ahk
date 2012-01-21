Gui2:
einstellung:
If (2open == "0")
{
	Gui, 1:Destroy
	Gui, 3:Destroy
	IniRead, Name, %Stammverzeichniss%%speicherdatei%, einstellung, Name, Name
	IniRead, Pass, %Stammverzeichniss%%speicherdatei%, einstellung, Pass, Passwort
	IniRead, Pfad, %Stammverzeichniss%%speicherdatei%, einstellung, SampPfad
	IniRead, tsname, %Stammverzeichniss%%speicherdatei%, TEAMSPEAK, tsname, None
	IniRead, channel, %Stammverzeichniss%%speicherdatei%, TEAMSPEAK, channel, None
	IniRead, channpass, %Stammverzeichniss%%speicherdatei%, TEAMSPEAK, channpass, None
	IniRead, Tor, %Stammverzeichniss%%speicherdatei%, Einstellung, Tor, None
	Gui, 2:Add, Picture, x-4 y0 w490 h380 , %Stammverzeichniss%Grafiken\bg-01.png
	Gui, 2:Add, Picture, x456 y10 w10 h10 geclose , %Stammverzeichniss%Grafiken\x.png
	Gui, 2:Add, Picture, x436 y10 w10 h10 gMainframemove BackgroundTrans, %Stammverzeichniss%Grafiken\move.png
	Gui, 2:Add, Edit, x16 y30 w110 h20 vname, %Name%
	Gui, 2:Add, Edit, x16 y80 w110 h20 +Password vPass, %Pass%
	Gui, 2:Add, Edit, x16 y130 w110 h20 vTor, %Tor%
	Gui, 2:Add, Edit, x336 y30 w110 h20 vtsname, %tsname%
	Gui, 2:Add, Edit, x336 y80 w110 h20 vchannelpass, %channpass%
	Gui, 2:Add, Edit, x336 y130 w110 h20 vchannel, %channel%
	Gui, 2:Add, Button, x16 y300 w90 h20 gsamp_suchen, GTA Suchen
	Gui, 2:Add, Button, x16 y330 w90 h20 gspeichern, Speichern	
	Gui, 2:Add, Button, x136 y300 w90 h20 ginidel, Zurücksetzen
	Gui, 2:Add, Button, x136 y330 w90 h20 gzurück, Zurück
	Gui, 2:Add, Button, x256 y300 w90 h20 gtastenbelegung, Tastenbelegung
	Gui, 2:Font, S8 CBlue, Verdana	
	Gui, 2:Add, Text, x16 y10 w110 h20 BackgroundTrans, Dein Name
	Gui, 2:Add, Text, x16 y60 w110 h20 BackgroundTrans, Dein Passwort
	Gui, 2:Add, Text, x16 y110 w130 h20 BackgroundTrans, Torbefehl
	Gui, 2:Add, Text, x336 y10 w110 h20 BackgroundTrans, Dein TS Name
	Gui, 2:Add, Text, x336 y60 w110 h20 BackgroundTrans, Dein TS chan Passwort
	Gui, 2:Add, Text, x336 y110 w110 h20 BackgroundTrans, Dein TS Channel
	Gui, 2:+Label2 -Caption
	WinSet, Region, 0-0 w477 h377 R30-30
	Gui, 2:Show,  h377 w477, Duxis Einstellungen
	2open = 1
}
Else
{
	Gui, 2:Destroy
	2open = 0
}

Return

eclose:
2Escape:
2Close:
ExitApp

#Include zurueck.ahk
#Include samp_suchen.ahk
#Include speichern.ahk

inidel:
MsgBox, 262164, ACHTUNG!!!!, Sind sie sicher das sie ihre Gesammten Einstellungen zurücksetzen wollen? `n`nSie können nicht mehr wiederher gestellt werden!
IfMsgBox, Yes
{
	IniDelete, %Stammverzeichniss%%speicherdatei%, Einstellung
	IniDelete, %Stammverzeichniss%%speicherdatei%, TEAMSPEAK
	MsgBox, 64, ACHTUNG!!!!, Ihre Einstellungen sind zurück gesetzt
}
IfMsgBox, No
{
	MsgBox, 0, ACHTUNG!!!!, Ihre Einstellungen sind erhalten geblieben
}
return
