#SingleInstance, force
#NoEnv
Version := "1.0.0.0"
MainUrl := "localhost"

Gui, Login:+LabelLogin +LastFound +AlwaysOnTop -Caption
WinSet, TransColor, EEAA99 255
Gui, Login:Add, Text, x6 y10 w250 h20 +BackgroundTrans , Bitte geben sie ihren Namen und Ihr Passwort ein
Gui, Login:Add, Edit, x6 y30 w250 h20 +BackgroundTrans vLoginName, Name
Gui, Login:Add, Edit, x6 y50 w250 h20 +BackgroundTrans vPassword, Password
Gui, Login:Add, Button, x6 y70 w90 h20 gLoginCheck, OK
Gui, Login:Add, Button, x166 y70 w90 h20 gLoginAbbruch, Abbrechen
Gui, Login:Color, EEAA99
Gui, Login:Show, w267 h103, Login
return

LoginAbbruch:
LoginClose:
LoginEscape:
ExitApp

LoginCheck:
Gui, Login:Submit, NoHide
Gui, Login:Destroy
CheckURL = %MainUrl%/accountcheck.php?name=%LoginName%&pass=%Password%
URLDownloadToFile, %CheckURL%, %A_Temp%Acc.txt
FileRead, Checksumme, %A_Temp%Acc.txt 
FileDelete, %A_Temp%Acc.txt
IfInString, Checksumme, Account:True 
{
	IfInString, Checksumme, Accountlevel:1 
	{
		Admin := "0"
	}
	IfInString, Checksumme, Accountlevel:2 
	{
		Admin := "2"
	}
	IfInString, Checksumme, Accountlevel:3 
	{
		Admin := "3"
	}
	goto, Update
}
IfInString, Checksumme, Account:Closed 
{
	MsgBox, 16, Fehler, Ihr Account ist gesperrt`, bitte wenden sie sich an ihren Leader
	ExitApp
} 
else {
	MsgBox, 16, Fehler, Der Login scheiterte aus folgendem grund: `n`n%Checksumme%
	ExitApp
}
return

Update:
URLDownloadToFile, %MainUrl%/update.txt, %A_Temp%Update.txt
FileRead, Updateversion, %A_Temp%Update.txt
FileDelete, %A_Temp%Update.txt
if (Updateversion > version) {
	UpdateTrue := "1"
}
UpdateCheck := "1"
if(UpdateCheck = "1") {
	if(UpdateTrue = "1") {
		Gui, Update:+LabelUpdate +LastFound +AlwaysOnTop -Caption
		WinSet, TransColor, EEAA99 255
		Gui, Update:Font, s18 cblack,
		Gui, Update:Add, Text,  +BackgroundTrans, Es ist ein neues Update verfügbar `nInstallierte Version   = %Version% `nVerfügbare Version = %Updateversion% `n Wollen sie jetzt das Update durchführen?
		Gui, Update:Color, EEAA99
		Gui, Update:Add, Button, x6  y200 w120 h20 , Ja	
		Gui, Update:Add, Button, x186 y200 w120 h20 gBeenden, Nein
		Gui, Update:Show,  ,Update
	return
	}
}
return

Main:
if (Admin = "0") {
	Gui, Main:Add, Tab2, x-4 y0 w480 h377 , Main|Einstellungen|Bug Report
} else {
	Gui, Main:Add, Tab2, x-4 y0 w480 h377 , Main|Einstellungen|Bug Report|Admin
}	
Gui, Main:Add, Picture, x430 y0 w15 h15 gBeenden, close.png
Gui, Main:Add, Picture, x410 y0 w15 h15 gMove, move.png
Gui, Main:Tab, Main
Gui, Main:Add, Text, x6 y45 w220 h300 , Text1
Gui, Main:Add, Text, x246 y45 w220 h300 , Text2
Gui, Main:Add, Button, x6 y340 w100 h30 , GTA Starten
Gui, Main:Add, Button, x176 y340 w100 h30 , Über
Gui, Main:Add, Button, x356 y340 w100 h30 , Teamspeak Starten
Gui, Main:Tab, Einstellungen
Gui, Main:Add, Edit, x6 y55 w110 h20 , Dein Name
Gui, Main:Add, Edit, x6 y85 w110 h20 , Dein Passwort
Gui, Main:Add, Edit, x6 y115 w110 h20 , Ingame Name
Gui, Main:Add, Edit, x6 y145 w110 h20 , Ingame Passwort
Gui, Main:Add, Edit, x6 y175 w110 h20 , Ingame Passwort
Gui, Main:Add, Edit, x6 y205 w110 h20 , Teamspeak Name
Gui, Main:Add, CheckBox, x346 y55 w100 h20 , Hilfe Aus
Gui, Main:Tab, Bug Report
Gui, Main:Add, Text, x6 y55 w450 h300 , KeybinderInfo
if (Admin != "0") {
	Gui, Main:Tab, Admin
	if (Admin == "3") {
		Gui, Main:Add, Edit, x6 y45 w100 h20 , Name
		Gui, Main:Add, Edit, x126 y45 w100 h20 , Passwort
		Gui, Main:Add, Edit, x246 y45 w100 h20 , Rank
		Gui, Main:Add, CheckBox, x6 y75 w100 h20 , Account erstellen
		Gui, Main:Add, CheckBox, x126 y75 w100 h20 , Account Sperren
		Gui, Main:Add, CheckBox, x246 y75 w100 h20 , Account löschen
		Gui, Main:Add, Button, x66 y115 w100 h30 , Absenden
	} if (Admin == "2") {
		Gui, Main:Add, Edit, x6 y45 w100 h20 , Name
		Gui, Main:Add, Edit, x126 y45 w100 h20 , Passwort
		Gui, Main:Add, Edit, x246 y45 w100 h20 , Rank
		Gui, Main:Add, CheckBox, x6 y75 w100 h20 , Account erstellen
		Gui, Main:Add, CheckBox, x126 y75 w100 h20 , Account Sperren
		Gui, Main:Add, Button, x66 y115 w100 h30 , Absenden
	}
}
Gui, Main:+LabelMain -Caption +LastFound +ToolWindow
WinSet, Region, 0-0 w477 h377 R30-30
Gui, Main:Show, w477 h377 , O-Amt Binder by DuxAquila
return


; MAIN Funktionen 

Move:
PostMessage, 0xA1, 2,,, A
Return

TTMENU()
{
	static AktuelleControl, VorherigeControl, _TT 
	AktuelleControl := A_GuiControl
	If (AktuelleControl <> VorherigeControl and not InStr(AktuelleControl, " "))
	{
		ToolTip
		SetTimer, ToolTipAnzeige, 100
		VorherigeControl := AktuelleControl
	}
	return

	ToolTipAnzeige:
    SetTimer, ToolTipAnzeige, Off
    ToolTip % %AktuelleControl%_TT 
    SetTimer, ToolTipAusblenden, 5000
	return

	ToolTipAusblenden:
    SetTimer, ToolTipAusblenden, Off
    ToolTip
	return
}


Beenden:
UpdateEscape:
UpdateClose:
MainEscape:
MainClose:
ExitApp
