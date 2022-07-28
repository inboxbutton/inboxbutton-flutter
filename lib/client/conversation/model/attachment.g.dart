// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attachment _$AttachmentFromJson(Map<String, dynamic> json) => Attachment(
      json['title'] as String?,
      json['url'] as String?,
      json['size'] as String?,
      json['mimeType'] as String?,
    );

Map<String, dynamic> _$AttachmentToJson(Attachment instance) =>
    <String, dynamic>{
      'title': instance.title,
      'url': instance.url,
      'size': instance.size,
      'mimeType': instance.mimeType,
    };
