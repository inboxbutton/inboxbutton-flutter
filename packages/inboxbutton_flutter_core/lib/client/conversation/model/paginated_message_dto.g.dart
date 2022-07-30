// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_message_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedMessageDto _$PaginatedMessageDtoFromJson(Map<String, dynamic> json) =>
    PaginatedMessageDto(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => MessageDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      metadata: json['metadata'] == null
          ? null
          : PaginatedMetadata.fromJson(
              json['metadata'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaginatedMessageDtoToJson(
        PaginatedMessageDto instance) =>
    <String, dynamic>{
      'items': instance.items,
      'metadata': instance.metadata,
    };
