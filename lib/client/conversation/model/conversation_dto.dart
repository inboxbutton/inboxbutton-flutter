import 'package:json_annotation/json_annotation.dart';

import 'attachment.dart';
import 'create_participant_dto.dart';
import 'enum.dart';

part 'conversation_dto.g.dart';

@JsonSerializable()
class ConversationDto {
  List<Attachment>? attachments;
  @JsonKey(unknownEnumValue: ConversationPriority.Unknown)
  ConversationPriority? priority;
  @JsonKey(unknownEnumValue: ConversationStatus.Unknown)
  ConversationStatus? status;
  List<CreateParticipantDto>? to;
  List<CreateParticipantDto>? from;
  String? id;
  String? subject;
  String? body;
  List<String>? channels;
  List<String>? tags;
  String? lastIncomingMessage;
  String? source;
  String? creatorId;
  DateTime? deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  ConversationDto(
      {this.attachments,
      this.priority,
      this.status,
      this.to,
      this.from,
      this.id,
      this.subject,
      this.body,
      this.channels,
      this.tags,
      this.lastIncomingMessage,
      this.source,
      this.creatorId,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  factory ConversationDto.fromJson(Map<String, dynamic> json) =>
      _$ConversationDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ConversationDtoToJson(this);
}
