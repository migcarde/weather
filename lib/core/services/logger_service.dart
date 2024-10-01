import 'package:logger/logger.dart';

final logger = LoggerService();

class LoggerService {
  static final LoggerService _instance = LoggerService._internal();

  factory LoggerService() => _instance;

  static final _logger = Logger(
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

  void trace(Object message) => _logger.t(message);
  void debug(Object message) => _logger.d(message);
  void information(Object message) => _logger.i(message);
  void warning(Object message) => _logger.w(message);
  void error(Object message) => _logger.e(message);
  void fatal(Object message) => _logger.f(message);
}
