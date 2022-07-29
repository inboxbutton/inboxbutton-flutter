// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversationDto _$ConversationDtoFromJson(Map<String, dynamic> json) =>
    ConversationDto(
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      priority: $enumDecodeNullable(
          _$ConversationPriorityEnumMap, json['priority'],
          unknownValue: ConversationPriority.Unknown),
      status: $enumDecodeNullable(_$ConversationStatusEnumMap, json['status'],
          unknownValue: ConversationStatus.Unknown),
      to: (json['to'] as List<dynamic>?)
          ?.map((e) => CreateParticipantDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      from: json['from'] == null
          ? null
          : CreateParticipantDto.fromJson(json['from'] as Map<String, dynamic>),
      id: json['id'] as String?,
      subject: json['subject'] as String?,
      body: json['body'] as String?,
      channels: (json['channels'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      lastIncomingMessage: json['lastIncomingMessage'] as String?,
      source: json['source'] as String?,
      creatorId: json['creatorId'] as String?,
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$ConversationDtoToJson(ConversationDto instance) =>
    <String, dynamic>{
      'attachments': instance.attachments,
      'priority': _$ConversationPriorityEnumMap[instance.priority],
      'status': _$ConversationStatusEnumMap[instance.status],
      'to': instance.to,
      'from': instance.from,
      'id': instance.id,
      'subject': instance.subject,
      'body': instance.body,
      'channels': instance.channels,
      'tags': instance.tags,
      'lastIncomingMessage': instance.lastIncomingMessage,
      'source': instance.source,
      'creatorId': instance.creatorId,
      'deletedAt': instance.deletedAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$ConversationPriorityEnumMap = {
  ConversationPriority.Low: 'Low',
  ConversationPriority.Medium: 'Medium',
  ConversationPriority.High: 'High',
  ConversationPriority.Unknown: 'Unknown',
};

const _$ConversationStatusEnumMap = {
  ConversationStatus.Draft: 'Draft',
  ConversationStatus.Active: 'Active',
  ConversationStatus.Unknown: 'Unknown',
};
