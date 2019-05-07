@set path=C:\Android\Sdk\platform-tools;%path%
@set path=C:\Android\Sdk\build-tools\28.0.3;%path%

adb push build/apk/keytool.dex /sdcard/keytool.dex

pause

