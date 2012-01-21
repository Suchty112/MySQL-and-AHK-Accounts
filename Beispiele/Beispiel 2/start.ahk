;
; GTA Start Version: 1.x
; Language:       German Unicode
; Platform:       Win9x/NT
; Author:         Dux Aquila <DuxAquila@googlemail.com>
;
; Script Function:
;	Startet das Spiel GTA-SA Multiplayer ändert dabei auch den Namen in SAMP  
;

start:
If (Name == "Name")
{
	MsgBox, 20, Achtung, Wenn sie Fortfahren wird Ihr Login nicht gehen`, da der Name in der Ini falsch ist`n`nWollen sie den vorher ändern?
	IfMsgBox, Yes
	{
		Gui, 1:-LastFound
		Gui, 1:Destroy
		1open = 0
		Gui, 2:+LastFound
		GuiID := WinExist()
		Goto,Gui2
		Gui, 2:Show, x131 y91 h377 w477, Duxis Einstellungen
	}
}
Else
{
	IfExist %Pfad%\samp.exe
	{
		Process , exist, samp.exe
		Process, Close, %errorLevel%
		RegWrite, REG_SZ,HKEY_CURRENT_USER, Software\SAMP,PlayerName,%Name%
		Run, %Pfad%\samp.exe %ServerIP%
	}
	Else
	{
		MsgBox, 20, FEHLER!!!!, Der Pfad zur samp.exe wurde noch nicht angegeben oder konnte nicht gefunden werden.`n`nMöchten sie dies nun machen/überprüfen?
		IfMsgBox, Yes
		{
			FullFileName=
			FileSelectFolder, FullFileName,,1,FileName
			Pfad1 = %FullFileName%
			IniWrite, %Pfad1%, %Stammverzeichniss%%speicherdatei%, einstellung, SampPfad
			GuiControl,3:,Pfad1,%Pfad1%
		}
	}
}

Return
