allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)

    // 🔥 LE FIX ABSOLU POUR GOOGLE_MOBILE_ADS (LIGNE 58)
    // On trompe le compilateur Groovy en lui donnant ce qu'il attend
    if (project.name == "google_mobile_ads") {
        val configs = project.configurations
        (configs as ExtensionAware).extra.set("all", configs)
        project.extra.set("all", configs)
    }

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

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}