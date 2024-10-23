import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'icons_api.g.dart';

@RestApi()
abstract class IconsApi {
  factory IconsApi(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _IconsApi;

  @GET('/img/wn/{image}@2x.png')
  @DioResponseType(ResponseType.bytes)
  Future<HttpResponse<List<int>>> downloadImage(@Path('image') image);
}
