plugins {
    application
}

dependencies {
    testImplementation(libs.junit.jupiter)
    testRuntimeOnly("org.junit.platform:junit-platform-launcher")

    implementation(libs.guava)
    implementation(project(":lib"))
}

application {
    mainClass = "org.example.App"
}
