plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.ma_chana9_app"
    compileSdk = 36

    // ✅ CORRECTION ICI : Ajout de la version du NDK requise par le plugin jni
    ndkVersion = "28.2.13676358"

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

// ✅ Nouvelle syntaxe pour corriger les warnings Kotlin
kotlin {
    compilerOptions {
        jvmTarget.set(org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17)
    }
}

flutter {
    source = "../.."
}