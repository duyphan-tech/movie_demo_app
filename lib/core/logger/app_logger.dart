import 'package:flutter/foundation.dart';
import 'package:logger/web.dart';

/// Cấp độ log
enum LogLevel { debug, info, warning, error }

/// Logger chuẩn cho toàn bộ ứng dụng
///
/// Tự động filter log theo môi trường:
/// - Debug mode: Hiển thị tất cả log
/// - Profile/Release mode: Chỉ hiển thị warning và error
///
/// Cách dùng:
/// ```dart
/// // Log đơn giản
/// AppLogger.d('Debug message');
/// AppLogger.i('Info message');
/// AppLogger.w('Warning message');
/// AppLogger.e('Error message');
///
/// // Log với tag
/// AppLogger.d('Debug', tag: 'DeepLink');
///
/// // Log với exception
/// AppLogger.e('Error', error: exception, stackTrace: stack);
/// ```
class AppLogger {
  static final AppLogger _instance = AppLogger._internal();

  factory AppLogger() => _instance;

  AppLogger._internal() {
    _logger = Logger(
      filter: _AppLogFilter(),
      printer: PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 5,
        lineLength: 120,
        colors: true,
        printEmojis: true,
        dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
      ),
      output: kDebugMode ? null : _NoOpLogOutput(),
    );
  }

  late final Logger _logger;

  /// Log debug - dùng cho development
  static void d(String message, {String? tag, Object? error, StackTrace? stackTrace}) {
    _instance._log(LogLevel.debug, message, tag: tag, error: error, stackTrace: stackTrace);
  }

  /// Log info - thông tin quan trọng
  static void i(String message, {String? tag, Object? error, StackTrace? stackTrace}) {
    _instance._log(LogLevel.info, message, tag: tag, error: error, stackTrace: stackTrace);
  }

  /// Log warning - cảnh báo
  static void w(String message, {String? tag, Object? error, StackTrace? stackTrace}) {
    _instance._log(LogLevel.warning, message, tag: tag, error: error, stackTrace: stackTrace);
  }

  /// Log error - lỗi
  static void e(String message, {String? tag, Object? error, StackTrace? stackTrace}) {
    _instance._log(LogLevel.error, message, tag: tag, error: error, stackTrace: stackTrace);
  }

  void _log(
    LogLevel level,
    String message, {
    String? tag,
    Object? error,
    StackTrace? stackTrace,
  }) {
    final formattedMessage = tag != null ? '[$tag] $message' : message;

    switch (level) {
      case LogLevel.debug:
        _logger.d(formattedMessage, error: error, stackTrace: stackTrace);
      case LogLevel.info:
        _logger.i(formattedMessage, error: error, stackTrace: stackTrace);
      case LogLevel.warning:
        _logger.w(formattedMessage, error: error, stackTrace: stackTrace);
      case LogLevel.error:
        _logger.e(formattedMessage, error: error, stackTrace: stackTrace);
    }
  }

  /// Log method cũ - giữ lại để compatible với code cũ
  /// Khuyến nghị dùng các method d/i/w/e thay thế
  @Deprecated('Dùng AppLogger.d/i/w/e thay thế')
  void printLog(String type, String txt) {
    switch (type) {
      case 'i':
        _logger.i(txt);
      case 'd':
        _logger.d(txt);
      case 'e':
        _logger.e(txt);
      default:
        _logger.i(txt);
    }
  }
}

/// Filter log theo môi trường
class _AppLogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    // Chỉ log ở debug mode
    if (!kDebugMode) return false;

    // Hoặc luôn log error/warning ngay cả ở profile mode
    if (event.level.index >= Level.warning.index) return true;

    return true;
  }
}

/// Output không làm gì - dùng cho release mode
class _NoOpLogOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    // Không output gì ở release mode
  }
}

/// Instance global - giữ lại để compatible
@Deprecated('Dùng AppLogger.d/i/w/e thay thế')
AppLogger logger = AppLogger();
