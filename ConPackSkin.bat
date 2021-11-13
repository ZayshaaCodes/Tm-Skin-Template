
@echo OFF
set E="C:\Program Files\NVIDIA Corporation\NVIDIA Texture Tools Exporter\nvtt_export.exe"
set Z="C:\Program Files\7-Zip\7z.exe"
set P=%~1

mkdir ".\%P%\converted"    

@REM BC1
FOR /R ".\%P%\" %%i IN (*_B.png *_AO.png) do (
    echo Converting: %%i
    %E% "%%i" -o "%P%\converted\%%~ni.dds" -f 15 
    )

@REM BC3
FOR /R ".\%P%\" %%i IN (*_I.png) do (
    echo Converting: %%i
    %E% "%%i" -o "%P%\converted\%%~ni.dds" -f 18 
    )

@REM BC4
FOR /R ".\%P%\" %%i IN (*_CoatR.png *_DirtMask.png) do (
    echo Converting: %%i
    %E% "%%i" -o "%P%\converted\%%~ni.dds" -f 20
    )

@REM BC5
FOR /R ".\%P%\" %%i IN (*_R.png *_N.png) do (
    echo Converting: %%i
    %E% "%%i" -o "%P%\converted\%%~ni.dds" -f 21 
    )

%Z% a -tzip ".\%P%.zip" ".\%P%\converted\*"

echo DONE!
echo New skin found at ".\%P%.zip"