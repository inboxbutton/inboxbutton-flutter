// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_participant_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateParticipantDto _$CreateParticipantDtoFromJson(
        Map<String, dynamic> json) =>
    CreateParticipantDto(
      json['externalId'] as String?,
      json['email'] as String?,
      json['name'] as String?,
    );

Map<String, dynamic> _$CreateParticipantDtoToJson(
        CreateParticipantDto instance) =>
    <String, dynamic>{
      'externalId': instance.externalId,
      'email': instance.email,
      'name': instance.name,
    };
