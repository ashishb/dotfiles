# Android reverse-engineering related aliases.
if [ "$(uname)" == "Darwin" ]; then
  # Based on brew install android-sdk
  export ANDROID_HOME=/usr/local/opt/android-sdk
else
  export ANDROID_HOME=$HOME/android_sdk
fi
export ANDROID_SDK_ROOT=$ANDROID_HOME
alias aapt="$HOME/tools/android/aapt"
alias apktool="java -jar $HOME/tools/android/apktool.jar"
alias burp="java -jar $HOME/Tools/burpsuite_free_v1.5.jar"
alias dex2jar=$HOME/tools/android/dex2jar-0.0.9.15/d2j-dex2jar.sh
if [ "$(uname)" == "Darwin" ]; then
  alias jd-gui="/Applications/JD-GUI.app/Contents/MacOS/jd-gui"
  alias jad="$HOME/tools/android/jad158g.mac.intel/jad"
else
  alias jd-gui="$HOME/AndroidTools/jd-gui/jd-gui"
fi
alias printcert="keytool -printcert -file"
alias signapk="jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore my-release-key.keystore alias_name"
alias android_screenshot="java -jar $HOME/tools/android/AndroidScreenCapture_1.1/AShot-1.1.jar"
alias get_android_id='adb shell content query --uri content://settings/secure --projection name:value | grep android_id'
if [[ `uname -s` == "Darwin" ]]; then
  # These are for compiling native android code.
  # Based on brew install android-ndk.
  export ANDROID_NDK_HOME=/usr/local/Cellar/android-ndk/r9c/
  SYSROOT=${ANDROID_NDK_HOME}/platforms/android-14/arch-arm
  alias \
    ANDROID_CC="${ANDROID_NDK_HOME}/toolchains/arm-linux-androideabi-4.8/prebuilt/darwin-x86/bin/arm-linux-androideabi-gcc --sysroot=$SYSROOT " #-B /usr/local/google/android_src_code/system/core/include"
fi
