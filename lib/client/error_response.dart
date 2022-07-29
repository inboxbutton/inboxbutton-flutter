import 'package:json_annotation/json_annotation.dart';

part 'error_response.g.dart';

@JsonSerializable()
class ErrorResponse {
  int? statusCode;
  String? message;
  DateTime? timestamp;
  String? path;

  ErrorResponse({this.statusCode, this.message, this.timestamp, this.path});

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorResponseToJson(this);
}
