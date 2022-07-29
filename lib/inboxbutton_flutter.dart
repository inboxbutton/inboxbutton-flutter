library inboxbutton_flutter;

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:inboxbutton_flutter/client/conversation/conversation_api_client.dart';
import 'package:inboxbutton_flutter/client/conversation/model/create_conversation_dto.dart';
import 'package:inboxbutton_flutter/client/conversation/model/paginated_conversation_dto.dart';
import 'package:inboxbutton_flutter/client/error_response.dart';
import 'package:inboxbutton_flutter/inboxbutton_exception.dart';

import 'client/conversation/model/conversation_dto.dart';
import 'client/inboxbutton_header_option.dart';

class InboxButtonSdk {
  static final InboxButtonSdk _instance = InboxButtonSdk._internal();
  factory InboxButtonSdk() => _instance;
  InboxButtonSdk._internal();
  static InboxButtonSdk get instance => _instance;
  late InboxButtonHeaderOption _conversationApiHeaderOption;

  void setup(String apiKey, {bool isDebug = true}) {
    _conversationApiHeaderOption = InboxButtonHeaderOption(
      apiKey: apiKey,
      isDebug: isDebug,
    );
  }

  void setUserEmail(String userEmail) {
    _conversationApiHeaderOption.userEmail = userEmail;
  }

  Future<ConversationDto> createConversation(
      CreateConversationDto request) async {
    var response = await ConversationApiClient(
            ConversationApiClient.getDio(_conversationApiHeaderOption))
        .createConversation(request)
        .catchError((error) {
      if (error is DioError) {
        var unwrapped = error.error;
        if (unwrapped is InboxButtonException) {
          Future.error(unwrapped);
        }
      }
    });
    return response.data;
  }

  //update conversation
  // Future<ConversationDto> updateConversation(
  //     UpdateConversationDto request) async {
  //   var response = await ConversationApiClient(
  //           ConversationApiClient.getDio(_conversationApiHeaderOption))
  //       .updateConversation(request)
  //       .catchError((error) {
  //     if (error is DioError) {
  //       var unwrapped = error.error;
  //       if (unwrapped is InboxButtonException) {
  //         throw unwrapped;
  //       }
  //     }
  //   });
  //   return response.data;
  // }

  //get user conversations
  FutureOr<PaginatedConversationDto> getUserConversations(
      {required int page, required int perPage, String? category}) async {
    var email = _conversationApiHeaderOption.userEmail;
    if (email == null || email.isEmpty) {
      throw InboxButtonException(ErrorResponse(
          message: "User email is required, use setUserEmail() to set it."));
    }
    try {
      var response = await ConversationApiClient(
              ConversationApiClient.getDio(_conversationApiHeaderOption))
          .getUserConversation(email, page, perPage, category);
      return response.data;
    } on DioError catch (e) {
      var errorResponse = ErrorResponse.fromJson(e.response?.data);
      throw InboxButtonException(errorResponse);
    }
  }

  // @POST("/conversations")
  // Future<HttpResponse<ConversationDto>> createConversation(
  //     @Body() CreateConversationDto request);
  //
  // @PUT("/conversations/{id}")
  // Future<HttpResponse<ConversationDto>> updateConversation(
  //     @Path("id") String id, @Body() UpdateConversationDto request);
  //
  // @GET("/conversations")
  // Future<HttpResponse<ConversationDto>> getUserConversation(
  //     @Header(RequestInterceptor.X_USER_EMAIL) String email,
  //     @Query("page") int page,
  //     @Query("perPage") int perPage,
  //     @Query("category") String category);
  //
  // @GET("/conversations/search")
  // Future<HttpResponse<ConversationDto>> searchConversation(
  //     @Query("q") String category);
  //
  // @POST("/conversations/{id}/messages")
  // Future<HttpResponse<ConversationDto>> replyMessage(
  //     @Path("id") String conversationId, @Body() ReplyConversationDto request);
  //
  // @GET("/conversations/{id}")
  // Future<HttpResponse<ConversationDto>> getConversation(@Path("id") String id);
  //
  // @GET("/conversations/{id}/messages")
  // Future<HttpResponse<ConversationDto>> getMessage(
  //     @Path("id") String conversationId,
  //     @Query("page") int page,
  //     @Query("perPage") int perPage,
  //     );
  //
  // @PATCH("/conversations/{id}/read")
  // Future<HttpResponse<ConversationDto>> readConversation(@Path("id") String id);
  //
  // @DELETE("/conversations/{id}")
  // Future<HttpResponse<ConversationDto>> deleteConversation(
  //     @Path("id") String id);
}
