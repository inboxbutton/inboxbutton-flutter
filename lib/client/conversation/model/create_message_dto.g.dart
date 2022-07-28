// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_message_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateMessageDto _$CreateMessageDtoFromJson(Map<String, dynamic> json) =>
    CreateMessageDto(
      body: json['body'] as String?,
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CreateMessageDtoToJson(CreateMessageDto instance) =>
    <String, dynamic>{
      'body': instance.body,
      'attachments': instance.attachments,
    };
