@set path=C:\Android\Sdk\platform-tools;%path%
@set path=C:\Android\Sdk\build-tools\28.0.3;%path%

adb shell cd /sdcard "&&" ^
   dalvikvm ^
   -cp keytool.dex ^
   com.ya.KeyTool.KeyTool

pause

