// part of swagger.api;
//
// class PaginatedConversationsDto {
//
//   List<ConversationDto> items = [];
//
//   PaginatedConversationsDtoMetadata metadata = null;
//
//   PaginatedConversationsDto();
//
//   @override
//   String toString() {
//     return 'PaginatedConversationsDto[items=$items, metadata=$metadata, ]';
//   }
//
//   PaginatedConversationsDto.fromJson(Map<String, dynamic> json) {
//     if (json == null) return;
//     items = ConversationDto.listFromJson(json['items']);
//     metadata = new PaginatedConversationsDtoMetadata.fromJson(json['metadata']);
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'items': items,
//       'metadata': metadata
//      };
//   }
//
//   static List<PaginatedConversationsDto> listFromJson(List<dynamic> json) {
//     return json == null ? new List<PaginatedConversationsDto>() : json.map((value) => new PaginatedConversationsDto.fromJson(value)).toList();
//   }
//
//   static Map<String, PaginatedConversationsDto> mapFromJson(Map<String, Map<String, dynamic>> json) {
//     var map = new Map<String, PaginatedConversationsDto>();
//     if (json != null && json.length > 0) {
//       json.forEach((String key, Map<String, dynamic> value) => map[key] = new PaginatedConversationsDto.fromJson(value));
//     }
//     return map;
//   }
// }
