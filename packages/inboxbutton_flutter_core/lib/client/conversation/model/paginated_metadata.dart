import 'package:json_annotation/json_annotation.dart';

part 'paginated_metadata.g.dart';

@JsonSerializable()
class PaginatedMetadata {
  int? currentPage;
  int? perPage;
  int? totalPages;
  int? totalCount;

  PaginatedMetadata(
      {this.currentPage, this.perPage, this.totalPages, this.totalCount});

  factory PaginatedMetadata.fromJson(Map<String, dynamic> json) =>
      _$PaginatedMetadataFromJson(json);
  Map<String, dynamic> toJson() => _$PaginatedMetadataToJson(this);
}
