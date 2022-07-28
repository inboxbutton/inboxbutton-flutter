import 'package:json_annotation/json_annotation.dart';

import 'create_message_dto.dart';

part 'reply_conversation_dto.g.dart';

@JsonSerializable()
class ReplyConversationDto {
  CreateMessageDto? message;

  ReplyConversationDto({this.message});

  factory ReplyConversationDto.fromJson(Map<String, dynamic> json) =>
      _$ReplyConversationDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ReplyConversationDtoToJson(this);
}
