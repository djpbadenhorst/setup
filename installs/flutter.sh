wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.16.5-stable.tar.xz
tar -xvf ./flutter_linux_3.16.5-stable.tar.xz
rm flutter_linux_3.16.5-stable.tar.xz
mv ./flutter/ ~/flutter

sudo apt install -y libstdc++-13-dev default-jre
wget https://dl.google.com/android/repository/commandlinetools-linux-10406996_latest.zip
unzip commandlinetools-linux-10406996_latest.zip

mkdir -p ~/android_sdk/cmdline-tools/
mv cmdline-tools/ ~/android_sdk/cmdline-tools/latest/
rm commandlinetools-linux-10406996_latest.zip

export PATH=$PATH:$HOME/flutter/bin
export CHROME_EXECUTABLE=chromium
export PATH=$PATH:$HOME/android_sdk/cmdline-tools/latest/bin
export ANDROID_HOME=$HOME/android_sdk/
export ANDROID_SDK_HOME=$HOME/android_sdk/
export ANDROID_SDK_ROOT=$HOME/android_sdk/

sdkmanager --install "platform-tools" 
sdkmanager --install "build-tools;34.0.0"
sdkmanager --install "emulator"
sdkmanager --install "platforms;android-34"
sdkmanager --install "system-images;android-34;google_apis;x86_64"

flutter config --android-sdk $HOME/android_sdk/
flutter doctor --android-licenses
flutter doctor

avdmanager create avd -n default -k "system-images;android-34;google_apis;x86_64"
