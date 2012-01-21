FileCreateDir, %Stammverzeichniss%
FileCreateDir, %Stammverzeichniss%Grafiken
FileSetAttrib, +H, %Stammverzeichniss%Grafiken

IfNotExist, %Stammverzeichniss%Grafiken\bg-01.png
UrlDownloadToFile, %HauptDLURL%gfx\bg-01.png, %Stammverzeichniss%Grafiken\bg-01.png
IfNotExist, %Stammverzeichniss%Grafiken\x.png
UrlDownloadToFile, %HauptDLURL%gfx\x.png, %Stammverzeichniss%Grafiken\x.png
IfNotExist, %Stammverzeichniss%Grafiken\move.png
URLDownloadToFile, %HauptDLURL%gfx\move.png, %Stammverzeichniss%Grafiken\move.png
IfNotExist, %Stammverzeichniss%Grafiken\bg-02.jpg
UrlDownloadToFile, %HauptDLURL%gfx\bg-02.jpg, %Stammverzeichniss%Grafiken\bg-02.jpg
