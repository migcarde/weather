import 'package:dio/dio.dart';
import 'package:weather/core/services/logger_service.dart';

class ResponseInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.debug(
        '------ Response [${response.statusCode}]: Path: ${response.requestOptions.path} ------');

    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logger.debug('------ Response error ------');
    super.onError(err, handler);
  }
}
