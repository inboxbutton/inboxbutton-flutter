import 'package:dio/dio.dart';

import '../client/inboxbutton_header_option.dart';

class RequestInterceptor extends InterceptorsWrapper {
  static const String ACCEPT = "Accept";
  static const String X_API_KEY = " X-API-KEY";
  static const String X_USER_EMAIL = " X-USER-EMAIL";

  InboxButtonHeaderOption headerOptions;

  RequestInterceptor(this.headerOptions);

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers[ACCEPT] = "application/json";
    options.headers[X_API_KEY] = headerOptions.apiKey;
    options.headers[X_USER_EMAIL] = headerOptions.userEmail;
    return super.onRequest(options, handler);
  }
}
