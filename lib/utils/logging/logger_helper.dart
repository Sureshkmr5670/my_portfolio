import 'package:logger/logger.dart';

// LoggerHelper class to manage logging across different environments.
class Logging {
  // The _logger is a private static instance of Logger.
  static final Logger _logger = Logger(
    printer: PrettyPrinter(),
    // Set the default logging level to Level.debug for development.
    level: _getLoggingLevel(),
  );

  // Method to determine the logging level based on the environment.
  static Level _getLoggingLevel() {
    // Retrieve the current environment from an environment variable or config.
    // This is a placeholder, replace with actual environment retrieval logic.
    String environment = 'development'; // Example: 'development', 'pre-production', 'production'

    // Set the logging level based on the environment.
    switch (environment) {
      case 'development':
        return Level.debug;
      case 'pre-production':
        return Level.warning;
      case 'production':
        // In production, we restrict logging completely.
        return Level.off;
      default:
        return Level.debug;
    }
  }

  // Debug level logging - for detailed debugging information.
  static void debug(String message) {
    _logger.d(message);
  }

  // Info level logging - for general informational messages.
  static void info(String message) {
    _logger.i(message);
  }

  // Warning level logging - for potential issues or warnings.
  static void warn(String message) {
    _logger.w(message);
  }

  // Error level logging - for logging errors that occur during execution.
  static void error(String message, [dynamic error]) {
    _logger.e(message, error: error, stackTrace: StackTrace.current);
  }

  // Fatal level logging - for critical issues that require immediate attention.
  static void fatal(String message) {
    // The 'f' method is not a standard method in the Logger package.
    // Assuming it's a custom method for fatal errors, otherwise use 'e' for error.
    _logger.e('Fatal error: $message', error: null, stackTrace: StackTrace.current);
  }

  // Generic log method - to log messages with a specific log level.
  static void log(Level level, String message) {
    _logger.log(level, message);
  }
}
