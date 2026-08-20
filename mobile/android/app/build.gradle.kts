plugins {
    id("com.android.application")
    id("kotlin-android")
    // C'est ce plugin qui dit à Flutter que le projet est "supporté"
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.ma_chana9_app"
    compileSdk = 36

    defaultConfig {
        applicationId = "com.example.ma_chana9_app"
        minSdk = flutter.minSdkVersion
        targetSdk = 36
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
}

flutter {
    source = "../.."
}
