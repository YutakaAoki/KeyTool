@echo off

@set ANDROID_HOME=C:\Android\Sdk
@set path=%ANDROID_HOME%\platform-tools;%path%
@set path=%ANDROID_HOME%\build-tools\28.0.3;%path%

call :MyMkDir build/apk

@echo build/obj/*.class --^> build/apk/keytool.dex
call dx.bat ^
     --dex ^
     --output=build/apk/keytool.dex ^
     --core-library ^
     build/obj/

pause
exit


:MyMkDir
if not exist "%1" (
	mkdir "%1"
)
exit /b

