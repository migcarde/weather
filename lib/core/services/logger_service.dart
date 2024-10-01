import 'package:logger/logger.dart';

final logger = LoggerService();

class LoggerService {
  static final LoggerService _instance = LoggerService._internal();

  factory LoggerService() => _instance;

  final _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      dateTimeFormat: DateTimeFormat.none,
    ),
  );

  LoggerService._internal();

  void trace(String message) => _logger.t(message);
  void debug(String message) => _logger.d(message);
  void information(String message) => _logger.i(message);
  void warning(String message) => _logger.w(message);
  void error(String message) => _logger.e(message);
  void fatal(String message) => _logger.f(message);
}
