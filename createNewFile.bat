REM Mevcut dosyanın içerisini değiştirerek kaydeden batch dosyasıdır. YNY

cd C:\Program Files\PIPC\PIVision\Scripts\app\editor\symbols\ext
set /p Number=<number.txt
set /a result=(%Number%+1)
@echo off 
    setlocal enableextensions disabledelayedexpansion

    set "search=gaugeT%Number%"
    set "replace=gaugeT%result%"

    set "jsFile=sym-gaugeT%Number%.js"
    set "newJsFile=sym-gaugeT%result%.js"

    for /f "delims=" %%i in ('type "%jsFile%" ^& break ^> "%jsFile%" ') do (
        set "line=%%i"
        setlocal enabledelayedexpansion
        >>"%jsFile%" echo( %%i
        >>"%newJsFile%" echo(!line:%search%=%replace%!
        endlocal
    )

    setlocal enableextensions disabledelayedexpansion
    set "search2=gaugeT%Number%"
    set "replace2=gaugeT%result%"

    set "htmlFile=sym-gaugeT%Number%-template.html"
    set "newHtmlFile=sym-gaugeT%result%-template.html"

    for /f "delims=" %%i in ('type "%htmlFile%" ^& break ^> "%htmlFile%" ') do (
        set "line=%%i"
	setlocal enabledelayedexpansion
        >>"%htmlFile%" echo( %%i
        >>"%newHtmlFile%" echo(!line:%search2%=%replace2%!
        endlocal
    )

@echo off
>number.txt echo %result%
