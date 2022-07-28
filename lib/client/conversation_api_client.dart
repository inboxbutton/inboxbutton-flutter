import 'package:dio/dio.dart';
import 'package:inboxbutton_flutter/client/inboxbutton_header_option.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

import '../interceptors/request_interceptor.dart';

part 'conversation_api_client.g.dart';

/// A Calculator.
@RestApi()
abstract class ConversationApiClient {
  factory ConversationApiClient(Dio dio, {String baseUrl}) =
      _ConversationApiClient;

  static const int CONNECTION_TIME = 10;
  static const basePath = 'https://dev-api.inboxbutton.com/v1/conversations';

  static Dio getDio(InboxButtonHeaderOption option) {
    var dio = Dio(BaseOptions(
        baseUrl: option.basePath,
        connectTimeout: CONNECTION_TIME * 1000,
        receiveTimeout: CONNECTION_TIME * 1000));

    dio.interceptors.addAll([
      RequestInterceptor(option),
      if (option.isDebug)
        PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseHeader: true,
            responseBody: true),
    ]);
    return dio;
  }
}
