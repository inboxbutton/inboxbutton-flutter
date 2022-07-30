// part of swagger.api;
//
// class PaginatedConversationMessagesDto {
//
//   List<MessageDto> items = [];
//
//   PaginatedConversationsDtoMetadata metadata = null;
//
//   PaginatedConversationMessagesDto();
//
//   @override
//   String toString() {
//     return 'PaginatedConversationMessagesDto[items=$items, metadata=$metadata, ]';
//   }
//
//   PaginatedConversationMessagesDto.fromJson(Map<String, dynamic> json) {
//     if (json == null) return;
//     items = MessageDto.listFromJson(json['items']);
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
//   static List<PaginatedConversationMessagesDto> listFromJson(List<dynamic> json) {
//     return json == null ? new List<PaginatedConversationMessagesDto>() : json.map((value) => new PaginatedConversationMessagesDto.fromJson(value)).toList();
//   }
//
//   static Map<String, PaginatedConversationMessagesDto> mapFromJson(Map<String, Map<String, dynamic>> json) {
//     var map = new Map<String, PaginatedConversationMessagesDto>();
//     if (json != null && json.length > 0) {
//       json.forEach((String key, Map<String, dynamic> value) => map[key] = new PaginatedConversationMessagesDto.fromJson(value));
//     }
//     return map;
//   }
// }
