import com.android.build.gradle.AppExtension

val android = project.extensions.getByType(AppExtension::class.java)

android.apply {
    flavorDimensions("flavor-type")

    productFlavors {
        create("dev") {
            dimension = "flavor-type"
            applicationId = "com.executionlab.movie_demo_app.dev"
            resValue(type = "string", name = "app_name", value = "Movie App (Dev)")
            buildConfigField(type = "String", name = "field_one", value = "\"example field one\"")
            buildConfigField(type = "char", name = "field_two", value = "\'y\'")
            buildConfigField(type = "double", name = "field_three", value = "20.0")
        }
        create("staging") {
            dimension = "flavor-type"
            applicationId = "com.executionlab.movie_demo_app.staging"
            resValue(type = "string", name = "app_name", value = "Movie App (Staging)")
        }
        create("prod") {
            dimension = "flavor-type"
            applicationId = "com.executionlab.movie_demo_app"
            resValue(type = "string", name = "app_name", value = "Movie App")
        }
    }

    buildFeatures.buildConfig = true
}