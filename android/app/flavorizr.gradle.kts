import com.android.build.gradle.AppExtension

val android = project.extensions.getByType(AppExtension::class.java)

android.apply {
    flavorDimensions("flavor-type")

    productFlavors {
        create("dev") {
            dimension = "flavor-type"
            applicationId = "com.executionlab.movie_demo_app.dev"
            resValue(type = "string", name = "app_name", value = "My App (Dev)")
        }
        create("staging") {
            dimension = "flavor-type"
            applicationId = "com.executionlab.movie_demo_app.staging"
            resValue(type = "string", name = "app_name", value = "My App (Staging)")
        }
        create("prod") {
            dimension = "flavor-type"
            applicationId = "com.executionlab.movie_demo_app"
            resValue(type = "string", name = "app_name", value = "My App")
        }
    }
}