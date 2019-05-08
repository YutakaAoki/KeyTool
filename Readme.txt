[From whom]

Yutaka Aoki(Japanese), NOWSMARTSOFT.
Date: 2019/05/07

-------------------------------------
[What is this ?]

This is a trasnport of KeyTool(Java, JDK 1.7) for android.

keytool.dex which prebuilt version is included by this project is used to create keystore
in the actual android device.

Since keytool.dex is from *.class made fully from *.java, it can be probably
run in almost all andorid devices.

It is convenient for standalone development of android application.

Probably, the keystore which is created by this tool can be used
for signing *.apk package.

Since this tool is a beta version, the full testing has not been done yet.

But dalvikvm executes this keytool.dex, and inputs name or company name etc.
from adb shell for the actual android device, and outputs keystore actually.

I have seen outputed keystore file really in my real amazon Fire 7 tablet.

But I have not tested signing *.apk with it yet.

I have made keytool.dex first in 7th May, 2019 and just on the day
uploaded all sources and its prebuilt binary(*.dex).

This was built with JDK 1.7 source (GPL).
I choosed necessary sources and changed or commented out some codes.

"// YA" or "// YA, " begins before the first line of changed source.

------------------------------------------------------------------------
[Prerequisite]

1. Windows OS  (I have been using Win7, 64BIT, Pro.)
2. JDK
3. Android SDK
4. cygwin's tee (d:\cygwin\tee), if any.

Even if you don't have tee command, you can build this project.

------------------------------------------------------------------------
[[Important]]

The base path must NOT have any spaces.
The reason is that since "b-create-java-list.bat" uses simple
cmd.exe's dir /S /B command to create the list of *.java
under ./src directory and it is passed to javac.exe command
with @javalist.txt, if it includes any spaces, javac.exe
command will take one filename as two or more filenames.

For example :

[1] good example
C:\github\KeyTool\.git        # This is not needed to exist.
C:\github\KeyTool\src
C:\github\KeyTool\build
C:\github\KeyTool\...

[2] bad example
C:\Users\Taro Yamada\.git     # This is not needed to exist.
C:\Users\Taro Yamada\src
C:\Users\Taro Yamada\build
C:\Users\Taro Yamada\...

=======================================================
[[How to build]]

This project uses only cmd.exe's *.BAT file, javac.exe,
dx.bat to build the binary from source code.

javac.exe  : from JDK 1.7 or JDK 1.8
dx.bat     : from Android SDK
*.BAT      : from the source tree of this project.

------------------------------------
[First step to build]

-------------------------------------------------------
[1] set current directory

$ cd C:\github\KeyTool

[2] create javalist.txt

list up *.java files under src/ to the file javalist.txt.

$ b-create-java-list.bat

=======================================================
[[If you build with tee]]

-------------------------------------------------------
[3] src/*.java ---> javac ---> build/obj/*.class

$ b-compile.bat

-------------------------------------------------------
[4] build/obj/*.class ---> dx.bat ---> build/apk/keytool.dex

$ b-create-dex.bat


=======================================================
[[If you build without tee]]

-------------------------------------------------------
[3] src/*.java ---> javac ---> build/obj/*.class

$ c-compile-wo-tee.bat

-------------------------------------------------------
[4] build/obj/*.class ---> dx.bat ---> build/apk/keytool.dex

$ c-create-dex-wo-tee.bat

=======================================================
[[Test]]

Test uses build/apk/keytool.dex and adb.exe in host PC.

You needs the following tools and files to test :

1. adb.exe    : Android Debugging Bridge from Android SDK

2. build/apk/keytool.dex : A keytool which format is dalvikvm byte code and is a final
                           target of this project to build.
                           But this file is distributed as prebuilt style from git dowonload site.

Since keytool.dex is distributed as prebuilt style from git download site,
you can test it without any building steps from source codes.


------------------------------------------------
[1] PC: keytool.dex --> adb push --> andoird: /sdcard/keytool.dex

$ b-push-keytool-dex.bat

----------------------------------------------
[2] output keytool's help message

$ b-run-keytool-dex-in-dev-help.bat

------------------------------------
[3] test keytool

$ b-run-keytool-dex-in-dev-test.bat

This is equivalent to the following :
--------------------------------------
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
--------------------------------------
