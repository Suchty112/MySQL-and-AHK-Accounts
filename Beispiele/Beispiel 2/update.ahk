UrlDownloadToFile, %HauptDLURL%NewVersion.txt, %Stammverzeichniss%NewVersion.txt
FileRead, neuesteversion, %Stammverzeichniss%NewVersion.txt

if (neuesteversion>version)
{
	newververfügbar := 1
	MsgBox, 4,, Es ist eine neue Version verfügbar, v%neuesteversion%. Wollen Sie diese Downloaden ?
	IfMsgBox, Yes
	{
		MsgBox,,, Downloade Update, 10
		UrlDownloadToFile,%HauptDLURL%DuxAquila.exe,  %A_ScriptName%.new
		BatchFile=
		(
		Ping 127.0.0.1
		Del "%A_ScriptName%"
		Rename "%A_ScriptName%.new" "%A_ScriptName%"
		Ping 109.230.219.119
		Del Update.bat
		)
		FileDelete,update.bat
		FileAppend,%BatchFile%,update.bat
		MsgBox, Update wird ausgeführt, bitte warten...
		Run,update.bat
		ExitApp
	}
	IfMsgBox, No
	{
		ExitApp
	}
}
Else
{
MsgBox, 64, Info, Ihr Keybinder ist Aktuell viel Spaß bei der Nutzung, 1
}
FileDelete, %Stammverzeichniss%NewVersion.txt
