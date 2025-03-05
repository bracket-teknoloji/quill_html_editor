pluginManagement {
    val flutterSdkPath: String = run {
        val localPropertiesFile = file("local.properties")
        check(localPropertiesFile.exists()) { "local.properties file not found." }
        
        val properties = localPropertiesFile.readLines()
            .associate { 
                val (key, value) = it.split("=")
                key.trim() to value.trim() 
            }

        val flutterSdkPath = properties["flutter.sdk"]
        checkNotNull(flutterSdkPath) { "flutter.sdk not set in local.properties" }
        flutterSdkPath
    }

    includeBuild("$flutterSdkPath/packages/flutter_tools/gradle")

    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}

plugins {
    id("dev.flutter.flutter-plugin-loader") version "1.0.0"
    id("org.gradle.toolchains.foojay-resolver-convention") version "0.8.0"
    id("com.android.application") version "8.9.0" apply false
    id("org.jetbrains.kotlin.android") version "2.0.20" apply false
    id("com.google.gms.google-services") version "4.4.0" apply false
    id("com.google.firebase.crashlytics") version "2.9.9" apply false
}

include(":app")
