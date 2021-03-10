dependencies {
    implementation(project(":clinic-common"))
    implementation(project(":clinic-service"))
    implementation(project(":clinic-model"))
    implementation("org.springframework.boot:spring-boot-starter-web")
    implementation("org.springframework.boot:spring-boot-starter-validation")
    implementation("org.modelmapper:modelmapper:2.3.0")
    implementation("org.springframework.data:spring-data-commons")

    testImplementation("org.springframework.boot:spring-boot-starter-test") {
        exclude(module = "junit")
        exclude(module = "mockito-core")
    }
    // testImplementation("io.mockk:mockk:1.10.6")
    testImplementation("com.ninja-squad:springmockk:3.0.1")
}

noArg {
    annotation("org.clinic.annotation.Dto")
}
