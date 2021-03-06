dependencies {
    implementation(project(":clinic-common"))
    implementation(project(":clinic-service"))
    implementation(project(":clinic-model"))
    implementation("org.springframework.boot:spring-boot-starter-web")
    implementation("org.springframework.boot:spring-boot-starter-validation")
    implementation("org.modelmapper:modelmapper:2.3.0")

    testImplementation("org.springframework.boot:spring-boot-starter-test")
}

noArg {
    annotation("org.clinic.annotation.Dto")
}
