plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.movie_demo_app"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.example.movie_demo_app"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }

    flavorDimensions += "env"

    productFlavors {
        // Flavor DEV
        create("dev") {
            dimension = "env"
            applicationIdSuffix = ".dev" // App ID sẽ thành ...app.dev
            resValue("string", "app_name", "My App Dev") // Tạo string resource động
            // signingConfig = signingConfigs.getByName("debug") // (Tuỳ chọn)
        }

        // Flavor PROD
        create("prod") {
            dimension = "env"
            // Không cần suffix, giữ nguyên ID gốc
            resValue("string", "app_name", "My App")
        }
    }
}

flutter {
    source = "../.."
}
