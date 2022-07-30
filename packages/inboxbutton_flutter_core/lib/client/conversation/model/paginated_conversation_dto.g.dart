// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_conversation_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedConversationDto _$PaginatedConversationDtoFromJson(
        Map<String, dynamic> json) =>
    PaginatedConversationDto(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => ConversationDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      metadata: json['metadata'] == null
          ? null
          : PaginatedMetadata.fromJson(
              json['metadata'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaginatedConversationDtoToJson(
        PaginatedConversationDto instance) =>
    <String, dynamic>{
      'items': instance.items,
      'metadata': instance.metadata,
    };
