# Android reverse-engineering related aliases.
if [ "$(uname)" == "Darwin" ]; then
  alias jd-gui="open -a jd-gui"
  # These are for compiling native android code.
  # Based on brew installs of android-sdk and android-ndk.
  export ANDROID_SDK_HOME=`echo $(brew --cellar)/android-sdk`
  # Gradle needs this.
  export ANDROID_HOME=${ANDROID_SDK_HOME}
  export ANDROID_NDK_HOME=`echo $(brew --cellar)/android-ndk`
  export PATH=$PATH:$ANDROID_NDK_HOME
  # For gradle wrapper.
  export PATH=$PATH:$ANDROID_SDK_HOME/tools/templates/gradle/wrapper
  SYSROOT_ARM=${ANDROID_NDK_HOME}/platforms/android-14/arch-arm
  SYSROOT_X86=${ANDROID_NDK_HOME}/platforms/android-14/arch-x86
  ARM_GCC="${ANDROID_NDK_HOME}/toolchains/arm-linux-androideabi-4.8/prebuilt/darwin-x86/bin/arm-linux-androideabi-gcc"
  X86_GCC="${ANDROID_NDK_HOME}/toolchains/x86-4.8/prebuilt/darwin-x86/bin/i686-linux-android-gcc"
  alias ANDROID_CC="$ARM_GCC --sysroot=$SYSROOT_ARM " #-B /usr/local/google/android_src_code/system/core/include"
  alias ANDROID_CC_X86="$X86_GCC --sysroot=$SYSROOT_X86 "
else
  export ANDROID_SDK_HOME=$HOME/android_sdk
  # On mac, these are installed via homebrew.
  # TODO(ashishb): On GNU/Linux, install it using some package manager as well.
  alias apktool="java -jar $HOME/tools/android/apktool.jar"
  alias dex2jar=$HOME/tools/android/dex2jar-0.0.9.15/d2j-dex2jar.sh
  alias jd-gui="$HOME/AndroidTools/jd-gui/jd-gui"
fi

export ANDROID_HVPROTO=ddm  # For Hierarchy viewer
alias burp="java -jar $HOME/Tools/burpsuite_free_v1.6.jar"
alias printcert="keytool -printcert -file"
alias signapk="jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore my-release-key.keystore alias_name"
alias android_screendump="adb shell screencap -p | perl -pe 's/\x0D\x0A/\x0A/g'"
alias android_get_id='adb shell content query --uri content://settings/secure --projection name:value | grep android_id'
alias android_locale_change="adb shell am start -n 'com.android.settings/.Settings\$LocalePickerActivity'"
alias android_dev_options="adb shell am start -n com.android.settings/.DevelopmentSettings"
alias adbt="adb logcat -v time"
alias aapt="/usr/local/Caskroom/android-sdk/4333796/build-tools/27.0.3/aapt"
alias aapt2="/usr/local/Caskroom/android-sdk/4333796/build-tools/27.0.3/aapt2"
alias apksigner="/usr/local/Caskroom/android-sdk/4333796/build-tools/27.0.3/apksigner"

function update_android_id(){
  # Update the android id.
  # TODO(ashishb): Add a different query for devices where sqlite3 is not present
  # but content binary is present.
  adb shell sqlite3 \
    /data/data/com.android.providers.settings/databases/settings.db \
    "update 'secure' set value=\"${1}\" where name='android_id'"
  # Now soft_reboot.
  adb shell setprop ctl.restart surfaceflinger
  adb shell setprop ctl.restart zygote
}

# TODO(ashishb): Add jadx tool to the list.
# https://github.com/skylot/jadx

# Source: https://gist.github.com/tyvsmith/6056422
function dex-method-count() {
  cat $1 | head -c 92 | tail -c 4 | hexdump -e '1/4 "%d\n"'
}
 
function dex-method-count-by-package() {
  dir=$(mktemp -d -t dex)
  baksmali $1 -o $dir
  for pkg in `find $dir/* -type d`; do
    smali $pkg -o $pkg/classes.dex
    count=$(dex-method-count $pkg/classes.dex)
    name=$(echo ${pkg:(${#dir} + 1)} | tr '/' '.')
    echo -e "$count\t$name"
  done
  rm -rf $dir
}
 
function dex-field-count(){
  cat $1 | head -c 84 | tail -c 4 | hexdump -e '1/4 "%d\n"'
}
 
function dex-field-count-by-package() {
  dir=$(mktemp -d -t dex)
  baksmali $1 -o $dir
  for pkg in `find $dir/* -type d`; do
    smali $pkg -o $pkg/classes.dex
    count=$(dex-field-count $pkg/classes.dex)
    name=$(echo ${pkg:(${#dir} + 1)} | tr '/' '.')
    echo -e "$count\t$name"
  done
  rm -rf $dir
}
