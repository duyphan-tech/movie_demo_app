import 'package:logger/web.dart';
import 'package:movie_demo_app/core/configs/app_config.dart';

class AppLogger {
  final _logger = Logger(
    filter: null, // Use the default LogFilter (-> only log in debug mode)
    printer: PrettyPrinter(
      methodCount: 2,
      // Number of method calls to be displayed
      errorMethodCount: 8,
      // Number of method calls if stacktrace is provided
      lineLength: 120,
      // Width of the output
      colors: true,
      // Colorful log messages
      printEmojis: true, // Print an emoji for each log message
    ), // Use the PrettyPrinter to format and print log
    output: null, // Use the default LogOutput (-> send everything to console)
  );

  void printLog(String type, String txt) {
    AppConfig? config;
    if (config!.flavor == Flavor.dev) {
      switch (type) {
        case "i":
          _logger.i(txt);
          break;
        case "d":
          _logger.d(txt);
          break;
        case "e":
          _logger.e(txt);
          break;
        default:
          _logger.i(txt);
          break;
      }
    }
  }
}
