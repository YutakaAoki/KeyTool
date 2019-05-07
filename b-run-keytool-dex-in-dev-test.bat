@set path=C:\Android\Sdk\platform-tools;%path%
@set path=C:\Android\Sdk\build-tools\28.0.3;%path%

adb shell rm /sdcard/keystore.jks

adb shell cd /sdcard "&&" ^
   dalvikvm ^
   -cp keytool.dex ^
   com.ya.KeyTool.KeyTool ^
   -genkeypair ^
   -keystore keystore.jks ^
   -alias androidkey ^
   -validity 10000 ^
   -keyalg RSA ^
   -keysize 2048 ^
   -storepass android ^
   -keypass android


pause

