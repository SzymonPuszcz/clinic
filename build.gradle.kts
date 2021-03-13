import org.jetbrains.kotlin.gradle.tasks.KotlinCompile

buildscript {
    repositories {
        mavenCentral()
    }
}

plugins {
    val kotlinVersion = "1.4.21"
    val springVersion = "2.4.3"
    val springManagementVersion = "1.0.11.RELEASE"

    id("org.jetbrains.kotlin.plugin.allopen") version kotlinVersion
    id("org.jetbrains.kotlin.plugin.noarg") version kotlinVersion
    kotlin("jvm") version kotlinVersion apply false
    kotlin("plugin.spring") version kotlinVersion apply false

    id("org.springframework.boot") version springVersion apply false

    id("io.spring.dependency-management") version springManagementVersion apply false
}

allprojects {
    group = "org.clinic"
    version = "1.0.0"

    tasks.withType<JavaCompile> {
        sourceCompatibility = "1.8"
        targetCompatibility = "1.8"
    }

    tasks.withType<KotlinCompile> {
        kotlinOptions {
            freeCompilerArgs = listOf("-Xjsr305=strict")
            jvmTarget = "1.8"
            incremental = false
        }
    }
}
subprojects {
    repositories {
        mavenCentral()
        maven("https://dl.bintray.com/serpro69/maven-release-candidates/")
    }

    apply {
        plugin("io.spring.dependency-management")
    }
}
