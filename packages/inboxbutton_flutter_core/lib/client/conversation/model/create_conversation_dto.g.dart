// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_conversation_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateConversationDto _$CreateConversationDtoFromJson(
        Map<String, dynamic> json) =>
    CreateConversationDto(
      status: $enumDecodeNullable(_$ConversationStatusEnumMap, json['status']),
      subject: json['subject'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      message: json['message'] == null
          ? null
          : CreateMessageDto.fromJson(json['message'] as Map<String, dynamic>),
      from: json['from'] == null
          ? null
          : CreateParticipantDto.fromJson(json['from'] as Map<String, dynamic>),
      to: (json['to'] as List<dynamic>?)
          ?.map((e) => CreateParticipantDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      channels: (json['channels'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$CreateConversationChannelEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$CreateConversationDtoToJson(
        CreateConversationDto instance) =>
    <String, dynamic>{
      'status': _$ConversationStatusEnumMap[instance.status],
      'subject': instance.subject,
      'tags': instance.tags,
      'message': instance.message,
      'from': instance.from,
      'to': instance.to,
      'channels': instance.channels
          ?.map((e) => _$CreateConversationChannelEnumMap[e]!)
          .toList(),
    };

const _$ConversationStatusEnumMap = {
  ConversationStatus.Draft: 'Draft',
  ConversationStatus.Active: 'Active',
  ConversationStatus.Unknown: 'Unknown',
};

const _$CreateConversationChannelEnumMap = {
  CreateConversationChannel.InApp: 'InApp',
  CreateConversationChannel.MobilePush: 'MobilePush',
  CreateConversationChannel.Email: 'Email',
  CreateConversationChannel.Sms: 'Sms',
  CreateConversationChannel.Unknown: 'Unknown',
};
