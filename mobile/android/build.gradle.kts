allprojects {
    repositories {
        google()
        mavenCentral()
    }

    // 🔥 FIX ADMOB : Crée la propriété 'all' manquante dans Gradle 9
    afterEvaluate {
        if (project.name == "google_mobile_ads") {
            project.extensions.extraProperties.set("all", project.configurations)
        }
    }
}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)

    // Forcer compileSdk 36 pour la compatibilité Android 15
    afterEvaluate {
        if (plugins.hasPlugin("com.android.application") || plugins.hasPlugin("com.android.library")) {
            extensions.findByType(com.android.build.gradle.BaseExtension::class.java)?.apply {
                compileSdkVersion(36)
                defaultConfig {
                    targetSdk = 36
                }
            }
        }
    }
}