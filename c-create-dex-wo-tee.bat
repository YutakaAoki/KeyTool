@set ANDROID_HOME=C:\Android\Sdk
@set path=%ANDROID_HOME%\platform-tools;%path%
@set path=%ANDROID_HOME%\build-tools\28.0.3;%path%


call dx.bat ^
     --dex ^
     --output=build/apk/keytool.dex ^
     --core-library ^
     build/obj/

pause

