import 'package:json_annotation/json_annotation.dart';

import 'attachment.dart';

part 'create_message_dto.g.dart';

@JsonSerializable()
class CreateMessageDto {
  String? body;
  List<Attachment>? attachments;

  CreateMessageDto({this.body, this.attachments});

  factory CreateMessageDto.fromJson(Map<String, dynamic> json) =>
      _$CreateMessageDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CreateMessageDtoToJson(this);
}
