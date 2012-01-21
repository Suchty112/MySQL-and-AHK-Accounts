:?:/fill::
Suspend, Permit
SendInput /motor{Enter}
Sleep, 500
SendInput, t/tanken{Enter}
Sleep, 500
SendInput, t/kb INFO: Nachdem das Tanken abgeschlossen ist, in das "I" Gehen{Enter}t/kb und dort die Taste "<" betätigen, Es wird dann bezahlt{Enter}
Keywait, <, D, T60
If !errorlevel
{
	Sleep, 500
	SendInput, t/enter{Enter}
	Sleep, 500
	SendInput, t/bezahlen{Enter}
	Sleep, 500
	SendInput, t/exit{Enter}
}
else
{
	SendInput, t/kb Info: Es wurde nicht mit dem Keybinder gezahlt{Enter}
}
Suspend, Off
Hotkey, t, On
return

:?:/rl::
Suspend, Permit
SendInput /a Macht kurz ein Relog{Enter}
Sleep, 500
SendInput t/q{Enter}
Sleep, 11000
Suspend Off
Hotkey, t, On
		Process , exist, samp.exe
		Process, Close, %errorLevel%
Run, %Pfad%\samp.exe %ServerIP%
Return

:?:geschäft::
Suspend, Permit
SendInput, /kb Was wollen sie Verkaufen{Space}
Input, ware, V I M,{Enter}
If !errorlevel = 0
{
	Suspend, On
	Sleep, 500
	SendInput, t/kb an wen wollen sie Verkaufen?(Die ID Eingeben){Space}
	Input, user, V I M, {Enter}
	Suspend, Off
	if !ErrorLevel  =  0
	{
		Suspend, On
		Sleep, 500
		SendInput, t/kb Wieviel wollen sie Verkaufen?{Space}
		Input, menge, V I M,{Enter}		
		Suspend, Off
		if !ErrorLevel = 0
		{
			Sleep, 500
			SendInput, t/kb Sobald sie nun "<" Drücken werden die %ware% an %User% in höhe von %menge% weitergegeben{Enter}
			Keywait, <, D, T20
			If !ErrorLevel
			{
				SendInput, t/nehmen %ware%{Space}%menge%{Enter}t/give %ware% %User% %menge%{Enter}
				Sleep 500
				SendInput, t/me dankt für das geschäft{Enter}
			}
		}
	}
}
Suspend, Off
Hotkey, t, On
return
