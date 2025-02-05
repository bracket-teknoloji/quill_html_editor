allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

rootProject.layout.buildDirectory.set(File("../build"))
subprojects {
    layout.buildDirectory.set(rootProject.layout.buildDirectory.dir(project.name))
    evaluationDependsOn(":app")

    configurations.all {
        exclude(group = "com.google.android.gms", module = "play-services-safetynet")
        resolutionStrategy.eachDependency {
            if (requested.group == "com.android.support" && !requested.name.contains("multidex")) {
                useVersion("27.1.1")
            }
        }
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
