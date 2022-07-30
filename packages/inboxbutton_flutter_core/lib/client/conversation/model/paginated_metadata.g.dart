// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedMetadata _$PaginatedMetadataFromJson(Map<String, dynamic> json) =>
    PaginatedMetadata(
      currentPage: json['currentPage'] as int?,
      perPage: json['perPage'] as int?,
      totalPages: json['totalPages'] as int?,
      totalCount: json['totalCount'] as int?,
    );

Map<String, dynamic> _$PaginatedMetadataToJson(PaginatedMetadata instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'perPage': instance.perPage,
      'totalPages': instance.totalPages,
      'totalCount': instance.totalCount,
    };
