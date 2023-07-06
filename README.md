# Krunch-app
This repository contains a Flutter project. Follow the instructions below to set it up and run it in an emulator.

## Prerequisites

Make sure you have the following software installed on your system:

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Android Studio (for Android development): [Install Android Studio](https://developer.android.com/studio)
- Xcode (for iOS development, macOS only): [Install Xcode](https://developer.apple.com/xcode/)

## Getting Started

1. Clone this repository to your local machine:

   git clone https://github.com/Krunch-tech/krunch-app.git

2. Change to project directory

   cd krunch-app

3. Fetch the dependencies

  flutter pub get

4. Launch an emulator

   **Android**:
   Use Android Studio's AVD Manager to create and start an Android emulator. Alternatively, you can use the flutter emulators command to list and launch emulators     from the command line.

   **iOS**:
   Run the following command in a terminal to launch the iOS simulator:

   open -a Simulator

5. Run the app
   use the following command in terminal
   flutter run
   
## Additional configuration

  If you encounter any issues related to dependencies, run the following command to update them:

  flutter pub upgrade

  Additionally in this project you may encounter google sign in error then perform some of the steps:
  
  Set up a new project on Google Cloud Console:</br>
 *Go to Google Cloud Console.</br>
 *Create a new project and provide a suitable name.</br>
 *In the project settings, note down the Package Name. You'll need it for later steps.</br>
 *Generate a SHA-1 fingerprint for your project:</br>
 *Android: Open the terminal and navigate to the android folder of your Flutter project (cd android).</br>
 *Run the following command to generate the SHA-1 fingerprint:</br>
 
 keytool -list -v -alias androiddebugkey -keystore ~/.android/debug.keystore

 *Provide the keystore password when prompted (default is android).</br>
 *Note down the SHA-1 fingerprint value.</br>

