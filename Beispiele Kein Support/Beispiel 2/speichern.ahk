Speichern:
Gui, 2:Submit,NoHide
IniWrite, %Name%, %Stammverzeichniss%%speicherdatei%, Einstellung, Name
IniWrite, %Pass%, %Stammverzeichniss%%speicherdatei%, Einstellung, Pass
IniWrite, %tsname%, %Stammverzeichniss%%speicherdatei%, TEAMSPEAK, tsname
IniWrite, %channel%, %Stammverzeichniss%%speicherdatei%, TEAMSPEAK, channel
IniWrite, %channpass%, %Stammverzeichniss%%speicherdatei%, TEAMSPEAK, channpass
IniWrite, %Tor%, %Stammverzeichniss%%speicherdatei%, Einstellung, Tor
IniRead, Name, %Stammverzeichniss%%speicherdatei%, einstellung, Name, Name
IniRead, Pass, %Stammverzeichniss%%speicherdatei%, einstellung, Pass, Passwort
IniRead, Pfad, %Stammverzeichniss%%speicherdatei%, einstellung, SampPfad
IniRead, tsname, %Stammverzeichniss%%speicherdatei%, TEAMSPEAK, tsname, Teamspeak Name
IniRead, channel, %Stammverzeichniss%%speicherdatei%, TEAMSPEAK, channel, Teamspeak Channel Name
IniRead, channpass, %Stammverzeichniss%%speicherdatei%, TEAMSPEAK, channpass, Teamspeak Channel Passwort
IniRead, Tor, %Stammverzeichniss%%speicherdatei%, Einstellung, Tor
IfNotExist %Pfad%\samp.exe
{
	MsgBox, 4144, FEHLER!, Samp.exe konnte nicht gefunden werden!!! `n Bitte überprüfen sie ihre Suche, 5
	IniDelete, F%Stammverzeichniss%/%speicherdatei%, einstellung ,SampPfad
}
Else
{
	MsgBox, 262208, Info, Ihre Einstellungen wurden Gespeichert , 2
	Gui, 2:-LastFound
	Gui, 2:Destroy
	2open = 0
	Gui, 2:+LastFound
	GuiID := WinExist()
	Goto,Gui
	Gui, 1:Show,  h377 w477, Duxis Keybinder
}
  
Return