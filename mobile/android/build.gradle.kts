allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// --- Logique buildDir existante ---
val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)

    // 🔥 LE FIX MAGIQUE POUR GRADLE 9.1.0 & GOOGLE_MOBILE_ADS
    // On injecte une propriété 'all' dynamique dans l'objet configurations
    // pour que la ligne 58 du plugin ne plante plus.
    if (project.name == "google_mobile_ads") {
        project.configurations.apply {
            (this as Any).let { container ->
                project.extensions.extraProperties.set("all", container)
            }
        }
    }

    // Forcer compileSdk 36 pour tous les modules
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

    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}