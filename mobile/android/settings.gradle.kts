pluginManagement {
    val flutterSdkPath = providers.gradleProperty("flutter.sdk").get()
    includeBuild("$flutterSdkPath/packages/flutter_tools/gradle")
    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}

plugins {
    // Utiliser le loader de plugins standard
    id("dev.flutter.flutter-plugin-loader") version "1.0.0"
    // Versions adaptées à Gradle 9.x
    id("com.android.application") version "8.7.0" apply false
    id("org.jetbrains.kotlin.android") version "1.9.24" apply false
}

include(":app")