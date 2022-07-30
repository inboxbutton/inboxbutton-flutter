import 'package:inboxbutton_flutter/client/conversation/model/conversation_dto.dart';
import 'package:json_annotation/json_annotation.dart';

import 'paginated_metadata.dart';

part 'paginated_conversation_dto.g.dart';

@JsonSerializable()
class PaginatedConversationDto {
  List<ConversationDto>? items;
  PaginatedMetadata? metadata;

  PaginatedConversationDto({this.items, this.metadata});

  factory PaginatedConversationDto.fromJson(Map<String, dynamic> json) =>
      _$PaginatedConversationDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PaginatedConversationDtoToJson(this);
}
