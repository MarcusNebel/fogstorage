plugins {
    id("com.android.application")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.fogstorage"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.example.fogstorage"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        create("release")
    }

    buildTypes {
        getByName("debug") {
            applicationIdSuffix = ".debug"
        }

        getByName("release") {
            val isReleaseTask = gradle.startParameter.taskNames.any {
                it.contains("release", ignoreCase = true)
            }

            if (isReleaseTask) {
                val keystoreFile = System.getenv("KEYSTORE_FILE")
                val keystorePassword = System.getenv("KEYSTORE_PASSWORD")
                val keyAlias = System.getenv("KEY_ALIAS")
                val keyPassword = System.getenv("KEY_PASSWORD")

                if (
                    keystoreFile.isNullOrBlank() ||
                    keystorePassword.isNullOrBlank() ||
                    keyAlias.isNullOrBlank() ||
                    keyPassword.isNullOrBlank()
                ) {
                    throw GradleException(
                        "Release-Build abgebrochen: Signing-ENV-Variablen fehlen."
                    )
                }

                signingConfig = signingConfigs.getByName("release").apply {
                    storeFile = file(keystoreFile)
                    storePassword = keystorePassword
                    this.keyAlias = keyAlias
                    this.keyPassword = keyPassword
                }
            }
        }
    }
}

kotlin {
    compilerOptions {
        jvmTarget = org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17
    }
}

flutter {
    source = "../.."
}
