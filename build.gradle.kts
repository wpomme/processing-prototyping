plugins {
    id("com.diffplug.spotless") version "7.0.2" apply false
}

subprojects {
    apply(plugin = "java")
    apply(plugin = "checkstyle")
    apply(plugin = "com.diffplug.spotless")

    repositories {
        mavenCentral()
    }

    extensions.configure<org.gradle.api.plugins.JavaPluginExtension> {
        toolchain {
            languageVersion = JavaLanguageVersion.of(27)
        }
    }

    extensions.configure<org.gradle.api.plugins.quality.CheckstyleExtension> {
        configFile = file("${System.getProperty("user.home")}/.config/checkstyle/google_checks.xml")
        toolVersion = "14.4.0"
    }

    extensions.configure<com.diffplug.gradle.spotless.SpotlessExtension> {
        java {
            googleJavaFormat()
        }
    }

    tasks.named<Test>("test") {
        useJUnitPlatform()
    }
}
