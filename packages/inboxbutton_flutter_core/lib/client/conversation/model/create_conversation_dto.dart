import 'package:json_annotation/json_annotation.dart';

import 'create_message_dto.dart';
import 'create_participant_dto.dart';
import 'enum.dart';

part 'create_conversation_dto.g.dart';

@JsonSerializable()
class CreateConversationDto {
  ConversationStatus? status;
  String? subject;
  List<String>? tags;
  CreateMessageDto? message;
  CreateParticipantDto? from;
  List<CreateParticipantDto>? to;
  List<CreateConversationChannel>? channels;

  CreateConversationDto(
      {this.status,
      this.subject,
      this.tags,
      this.message,
      this.from,
      this.to,
      this.channels});

  factory CreateConversationDto.fromJson(Map<String, dynamic> json) =>
      _$CreateConversationDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CreateConversationDtoToJson(this);
}
