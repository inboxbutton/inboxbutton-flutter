import 'package:dio/dio.dart';
import 'package:inboxbutton_flutter/client/conversation/model/conversation_dto.dart';
import 'package:inboxbutton_flutter/client/conversation/model/create_conversation_dto.dart';
import 'package:inboxbutton_flutter/client/conversation/model/paginated_conversation_dto.dart';
import 'package:inboxbutton_flutter/client/conversation/model/paginated_message_dto.dart';
import 'package:inboxbutton_flutter/client/conversation/model/reply_conversation_dto.dart';
import 'package:inboxbutton_flutter/client/conversation/model/update_conversation_dto.dart';
import 'package:inboxbutton_flutter/client/inboxbutton_header_option.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

import '../../interceptors/request_interceptor.dart';

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
        baseUrl: basePath,
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

  @POST("/conversations")
  Future<HttpResponse<ConversationDto>> createConversation(
      @Body() CreateConversationDto request);

  @PUT("/conversations/{id}")
  Future<HttpResponse<ConversationDto>> updateConversation(
      @Path("id") String id, @Body() UpdateConversationDto request);

  @GET("/conversations")
  Future<HttpResponse<PaginatedConversationDto>> getUserConversation(
      @Header(RequestInterceptor.X_USER_EMAIL) String? email,
      @Query("page") int page,
      @Query("perPage") int perPage,
      @Query("category") String? category);

  @GET("/conversations/search")
  Future<HttpResponse<ConversationDto>> searchConversation(
      @Query("q") String category);

  @POST("/conversations/{id}/messages")
  Future<HttpResponse<ConversationDto>> replyMessage(
      @Path("id") String conversationId, @Body() ReplyConversationDto request);

  @GET("/conversations/{id}")
  Future<HttpResponse<ConversationDto>> getConversation(@Path("id") String id);

  @GET("/conversations/{id}/messages")
  Future<HttpResponse<PaginatedMessageDto>> getMessage(
    @Path("id") String conversationId,
    @Query("page") int page,
    @Query("perPage") int perPage,
  );

  @PATCH("/conversations/{id}/read")
  Future<HttpResponse<ConversationDto>> readConversation(@Path("id") String id);

  @DELETE("/conversations/{id}")
  Future<HttpResponse<ConversationDto>> deleteConversation(
      @Path("id") String id);
}
