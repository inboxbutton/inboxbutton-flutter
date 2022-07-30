// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_participant_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateParticipantDto _$CreateParticipantDtoFromJson(
        Map<String, dynamic> json) =>
    CreateParticipantDto(
      externalId: json['externalId'] as String?,
      email: json['email'] as String,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CreateParticipantDtoToJson(
        CreateParticipantDto instance) =>
    <String, dynamic>{
      'externalId': instance.externalId,
      'email': instance.email,
      'name': instance.name,
    };
