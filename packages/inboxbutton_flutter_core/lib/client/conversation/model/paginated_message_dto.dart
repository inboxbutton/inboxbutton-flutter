import 'package:inboxbutton_flutter/client/conversation/model/message_dto.dart';
import 'package:json_annotation/json_annotation.dart';

import 'paginated_metadata.dart';

part 'paginated_message_dto.g.dart';

@JsonSerializable()
class PaginatedMessageDto {
  List<MessageDto>? items;
  PaginatedMetadata? metadata;

  PaginatedMessageDto({this.items, this.metadata});

  factory PaginatedMessageDto.fromJson(Map<String, dynamic> json) =>
      _$PaginatedMessageDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PaginatedMessageDtoToJson(this);
}
