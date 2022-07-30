import 'package:json_annotation/json_annotation.dart';

import 'attachment.dart';

part 'message_dto.g.dart';

@JsonSerializable()
class MessageDto {
  String? id;
  String? conversationId;
  String? body;
  List<Attachment>? attachments;
  String? creatorId;
  DateTime? sentAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  MessageDto(
      {this.id,
      this.conversationId,
      this.body,
      this.attachments,
      this.creatorId,
      this.sentAt,
      this.createdAt,
      this.updatedAt});

  factory MessageDto.fromJson(Map<String, dynamic> json) =>
      _$MessageDtoFromJson(json);
  Map<String, dynamic> toJson() => _$MessageDtoToJson(this);
}
