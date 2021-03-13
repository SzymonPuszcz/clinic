import io.spring.gradle.dependencymanagement.dsl.DependencyManagementExtension

plugins {
    id("org.jetbrains.kotlin.plugin.allopen")
    id("org.jetbrains.kotlin.plugin.noarg")

    kotlin("jvm")
    kotlin("plugin.spring")
}

the<io.spring.gradle.dependencymanagement.dsl.DependencyManagementExtension>().apply {
    imports {
        mavenBom(org.springframework.boot.gradle.plugin.SpringBootPlugin.BOM_COORDINATES)
    }
}

dependencies {
    implementation(project(":clinic-common"))
    implementation(project(":clinic-service"))
    implementation(project(":clinic-model"))
    implementation(kotlin("reflect"))
    implementation(kotlin("stdlib-jdk8"))
    implementation("org.springframework.boot:spring-boot-starter-web")
    implementation("org.springframework.boot:spring-boot-starter-validation")
    val modelmapperVersion: String by project
    implementation("org.modelmapper:modelmapper:$modelmapperVersion")
    implementation("org.springframework.data:spring-data-commons")

    testImplementation("org.springframework.boot:spring-boot-starter-test") {
        exclude(module = "junit")
        exclude(module = "mockito-core")
    }
    val kotestVersion: String by project
    testImplementation("io.kotest:kotest-runner-junit5:$kotestVersion")
    testImplementation("io.kotest:kotest-extensions-spring:$kotestVersion")
    val fakerVersion: String by project
    testImplementation("io.github.serpro69:kotlin-faker:$fakerVersion")
    val springmockkVersion: String by project
    testImplementation("com.ninja-squad:springmockk:$springmockkVersion")
}

noArg {
    annotation("org.clinic.annotation.Dto")
}
