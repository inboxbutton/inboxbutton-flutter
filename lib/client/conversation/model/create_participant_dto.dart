import 'package:json_annotation/json_annotation.dart';

part 'create_participant_dto.g.dart';

@JsonSerializable()
class CreateParticipantDto {
  String? externalId;

  String? email;

  String? name;

  CreateParticipantDto(this.externalId, this.email, this.name);

  factory CreateParticipantDto.fromJson(Map<String, dynamic> json) =>
      _$CreateParticipantDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CreateParticipantDtoToJson(this);
}
