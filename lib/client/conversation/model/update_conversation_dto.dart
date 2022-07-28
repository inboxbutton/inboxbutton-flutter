import 'package:json_annotation/json_annotation.dart';

import 'create_message_dto.dart';
import 'create_participant_dto.dart';
import 'enum.dart';

part 'update_conversation_dto.g.dart';

@JsonSerializable()
class UpdateConversationDto {
  ConversationStatus? status;
  String? subject;
  List<String>? tags;
  CreateMessageDto? message;
  CreateParticipantDto? from;
  List<CreateParticipantDto>? to;
  List<CreateConversationChannel>? channels;

  UpdateConversationDto(
      {this.status,
      this.subject,
      this.tags,
      this.message,
      this.from,
      this.to,
      this.channels});

  factory UpdateConversationDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateConversationDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateConversationDtoToJson(this);
}
