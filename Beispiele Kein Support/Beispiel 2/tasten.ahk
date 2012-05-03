F3::
SendInput t/togooc{Enter}
Return

F4::
SendInput t/togphone{Enter}
Return

F10::
SendInput %pass%{Enter}
Return

F12::
Suspend
SendInput t/me schaltet den %Projektname% ein/aus{Enter}
Return 

1::
SendInput, t/fschlüssel{Enter}
return

2::
SendInput, t/fschloss{Enter}
return

3::
SendInput, t/freparatur{Enter}
return

4::
SendInput, t/finfo{Enter}
return

5::
SendInput, t/enter{Enter}
return

6::
SendInput, t/exit{Enter}
return


8::
IniRead, haube, %stammverzeichniss%%speicherdatei%, Variablen, haube, 0
If (haube = "0")
{
	SendInput, t/motorhaube auf{Enter}
	IniWrite, 1, %stammverzeichniss%%speicherdatei%, Variablen, haube
}
Else
{
	SendInput, t/motorhaube zu{Enter}
	IniWrite, 0, %stammverzeichniss%%speicherdatei%, Variablen, haube
}
Return

9::
IniRead, kofferraum, %stammverzeichniss%%speicherdatei%, Variablen, kofferraum, 0
If (kofferraum = "0")
{
	SendInput, t/kofferraum auf{Enter}
	IniWrite, 1, %stammverzeichniss%%speicherdatei%, Variablen, kofferraum
}
Else
{
	SendInput, t/kofferraum zu{Enter}
	IniWrite, 0, %stammverzeichniss%%speicherdatei%, Variablen, kofferraum
}
Return

0::
IniRead, licht, %stammverzeichniss%%speicherdatei%, Variablen, licht, 0
If (licht = "0")
{
	SendInput, t/licht an{Enter}
	IniWrite, 1, %stammverzeichniss%%speicherdatei%, Variablen, licht
}
Else
{
	SendInput, t/licht aus{Enter}
	IniWrite, 0, %stammverzeichniss%%speicherdatei%, Variablen, licht
}
Return

ß::
SendInput, t/motor{Enter}
Return

z::
SendInput, t/zoll{Enter} t/s Mach auf die Schranke{Enter}
return 

ä::
SendInput, t{up}{Enter}
return
 
 #::
 If (Tor == "None")
{
	SendInput, t/kb Sie haben in den Einstellungen kein Tor definiert{Enter}
	Sleep, 500
	SendInput, t/kb Möchten sie jetzt eins setzen [Ja | Nein]{Enter}
	Suspend, On
	SendInput, t/kb{Space}
	Input, Antwort, V I M, {Enter}
	Suspend, Off
	if !Errorlevel = 0
	{
		if (Antwort = "Ja")
		{
			Sleep, 500
			SendInput, t/kb Geben sie nun den Torbefehl ohne / ein{Enter}
			Sleep, 500
			SendInput, t/kb zb. pitor pdd {Enter}
			Sleep, 500 
			Suspend, On
			SendInput, t/kb{Space}
			Input, Tor, V I M, {Enter}
			Suspend, Off
			if !Errorlevel = 0
			{
				IniWrite, %Tor%, %Stammverzeichniss%%speicherdatei%, Einstellung, Tor
				IniRead, Tor, %Stammverzeichniss%%speicherdatei%, Einstellung, Tor
				Sleep, 500
				SendInput, t/kb So wird der Befehl Ausgeführt " /%Tor% "{Enter}
			}
		}
		if (Antwort = "Nein")
		{
			Sleep, 500
			SendInput, t/kb Es wurde kein Tor gespeichert{Enter}
		}
	}
}
else
{
	SendInput, t/%tor%{Enter}
}
return

!#::
If (Tor = "None")
{
	SendInput, t/kb Sie haben in den Einstellungen kein Tor definiert{Enter}
	Sleep, 500
	SendInput, t/kb Möchten sie jetzt eins setzen [Ja | Nein]{Enter}
	Suspend, On
	SendInput, t/kb{Space}
	Input, Antwort, V I M, {Enter}
	Suspend, Off
	if !Errorlevel = 0
	{
		if (Antwort = "Ja")
		{
			Sleep, 500
			SendInput, t/kb Geben sie nun den Torbefehl ohne / ein{Enter}
			Sleep, 500
			SendInput, t/kb zb. pitor pdd {Enter}
			Sleep, 500 
			Suspend, On
			SendInput, t/kb{Space}
			Input, Tor, V I M, {Enter}
			Suspend, Off
			if !Errorlevel = 0
			{
				IniWrite, %Tor%, %Stammverzeichniss%%speicherdatei%, Einstellung, Tor
				IniRead, Tor, %Stammverzeichniss%%speicherdatei%, Einstellung, Tor
				Sleep, 500
				SendInput, t/kb So wird der Befehl Ausgeführt " /%Tor% "{Enter}
			}
		}
		if (Antwort = "Nein")
		{
			Sleep, 500
			SendInput, t/kb Es wurde kein Tor gespeichert{Enter}
		}
	}
}
else
{
	SendInput, t/kb Sie können nun das Tor neu Definieren{Enter}
	Sleep, 500
	SendInput, t/kb Wollen sie dieses nun machen? [Ja | Nein]{Enter}
	Suspend, On
	SendInput, t/kb{Space}
	Input, Antwort, V I M, {Enter}
	Suspend, Off
	if !Errorlevel = 0
	{
		if (Antwort = "Ja")
		{
			Sleep, 500
			SendInput, t/kb Geben sie nun den Torbefehl ohne / ein{Enter}
			Sleep, 500
			SendInput, t/kb zb. pitor pdd {Enter}
			Sleep, 500 
			Suspend, On
			SendInput, t/kb{Space}
			Input, Tor, V I M, {Enter}
			Suspend, Off
			if !Errorlevel = 0
			{
				IniWrite, %Tor%, %Stammverzeichniss%%speicherdatei%, Einstellung, Tor
				IniRead, Tor, %Stammverzeichniss%%speicherdatei%, Einstellung, Tor
				Sleep, 500
				SendInput, t/kb So wird der Befehl Ausgeführt " /%Tor% "{Enter}
			}
		}
		if (Antwort = "Nein")
		{
			Sleep, 500
			SendInput, t/kb Ihr Tor ist noch "/%tor%"{Enter}
		}
	}
}
return
