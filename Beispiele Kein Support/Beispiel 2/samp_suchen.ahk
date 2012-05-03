samp_suchen:
FullFileName=
FileSelectFolder, FullFileName,,1,FileName
    Pfad1 = %FullFileName%
	IniWrite, %Pfad1%, %Stammverzeichniss%%speicherdatei%, Einstellung, SampPfad
	GuiControl,3:,Pfad1,%Pfad1%
Return
