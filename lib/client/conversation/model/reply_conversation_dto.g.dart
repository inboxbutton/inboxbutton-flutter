// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reply_conversation_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReplyConversationDto _$ReplyConversationDtoFromJson(
        Map<String, dynamic> json) =>
    ReplyConversationDto(
      message: json['message'] == null
          ? null
          : CreateMessageDto.fromJson(json['message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReplyConversationDtoToJson(
        ReplyConversationDto instance) =>
    <String, dynamic>{
      'message': instance.message,
    };
