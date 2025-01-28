allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

rootProject.buildDir = File("../build")
subprojects {
    project.buildDir = File("${rootProject.buildDir}/${project.name}")
    project.evaluationDependsOn(":app")
    project.configurations.all {
        exclude(group = "com.google.android.gms", module = "play-services-safetynet")
        resolutionStrategy.eachDependency {
            if (requested.group == "com.android.support" && !requested.name.contains("multidex")) {
                useVersion("27.1.1")
            }
        }
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.buildDir)
}
