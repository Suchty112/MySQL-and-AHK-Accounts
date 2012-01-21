#Include variablen.ahk
#Include update.ahk
#Include download.ahk
Gui:
Gui 1:+LastFound
GuiID :=WinExist()
IniRead, Name, %Stammverzeichniss%%speicherdatei%, einstellung, Name, Name
IniRead, Pass, %Stammverzeichniss%%speicherdatei%, einstellung, Pass, Passwort
IniRead, Pfad, %Stammverzeichniss%%speicherdatei%, einstellung, SampPfad
IniRead, tsname, %Stammverzeichniss%%speicherdatei%, TEAMSPEAK, tsname, None
IniRead, channel, %Stammverzeichniss%%speicherdatei%, TEAMSPEAK, channel, None
IniRead, channpass, %Stammverzeichniss%%speicherdatei%, TEAMSPEAK, channpass, None
IniRead, Tor, %Stammverzeichniss%%speicherdatei%, Einstellung, Tor, None
Gui, 1:Add, Picture, x-4 y0 w490 h380 , %Stammverzeichniss%Grafiken\bg-01.png
Gui, 1:Add, Picture, x456 y10 w10 h10 gclose , %Stammverzeichniss%Grafiken\x.png
Gui, 1:Add, Picture, x436 y10 w10 h10 gMainframemove BackgroundTrans, %Stammverzeichniss%Grafiken\move.png
Gui, 1:Add, Button, x16 y330 w90 h20 gstart, Start
Gui, 1:Add, Button, x206 y330 w90 h20 geinstellung, Einstellung
Gui, 1:Add, Button, x376 y330 w90 h20 gtastenbelegung, Tastenbelegung
Gui, 1:+Label1 -Caption
WinSet, Region, 0-0 w477 h377 R30-30
Gui, 1:Show,  h377 w477, Duxis Keybinder
Return

close:
1Escape:
1Close:
IniDelete, %Stammverzeichniss%%speicherdatei%, Variablen
ExitApp

Mainframemove:
PostMessage, 0xA1, 2,,, A
Return

#Include einstellung.ahk
#Include tastenbelegung.ahk
#Include start.ahk
#Include gta.ahk
#Include tasten.ahk
#Include schreibbefehle.ahk