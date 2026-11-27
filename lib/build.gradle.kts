plugins {
    `java-library`
}

dependencies {
    testImplementation(libs.junit.jupiter)
    testRuntimeOnly("org.junit.platform:junit-platform-launcher")
}

tasks.register<Copy>("jarSpiral") {
    group = "build"
    description = "Assembles the JAR and copies it to sketches/spiral/code."
    dependsOn(tasks.named("jar"))
    from(layout.buildDirectory.file("libs/app.jar"))
    into("../sketches/spiral/code")
}
