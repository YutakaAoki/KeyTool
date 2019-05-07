@set ANDROID_HOME=C:\Android\Sdk
@set PLATFORM=%ANDROID_HOME%\platforms\android-10
@set JAVA_HOME=D:\Program Files\Java\jdk1.7.0_67

javac ^
    -J-Duser.language=en ^
    -source 1.7 -target 1.7 ^
    -sourcepath src ^
    -bootclasspath "%PLATFORM%/android.jar" ^
    -d build/obj ^
    @javalist.txt


wzeditor.exe z-javac-log.txt



pause

