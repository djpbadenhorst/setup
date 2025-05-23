sudo snap install flutter --classic
export CHROME_EXECUTABLE=chromium
flutter doctor

sudo apt install google-android-cmdline-tools-13.0-installer
sudo sdkmanager --licenses
flutter doctor

sudo sdkmanager --install "platform-tools"
sudo sdkmanager --install "platforms;android-34"
flutter config --android-sdk /usr/lib/android_sdk/
flutter doctor

sudo sdkmanager --install "system-images;android-34;google_apis;x86_64"
sudo sdkmanager --install "system-images;android-33;android-wear;x86_64"
avdmanager create avd -n default -k "system-images;android-34;google_apis;x86_64"
avdmanager create avd -n watch -k "system-images;android-33;android-wear;x86_64" --device "wearos_large_round"
flutter emulators --launch default
flutter emulators --launch watch
