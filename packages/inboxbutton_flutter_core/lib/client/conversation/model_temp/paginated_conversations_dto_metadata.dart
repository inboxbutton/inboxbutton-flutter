// part of swagger.api;
//
// class PaginatedConversationsDtoMetadata {
//
//   double currentPage = null;
//
//   double perPage = null;
//
//   double totalPages = null;
//
//   double totalCount = null;
//
//   PaginatedConversationsDtoMetadata();
//
//   @override
//   String toString() {
//     return 'PaginatedConversationsDtoMetadata[currentPage=$currentPage, perPage=$perPage, totalPages=$totalPages, totalCount=$totalCount, ]';
//   }
//
//   PaginatedConversationsDtoMetadata.fromJson(Map<String, dynamic> json) {
//     if (json == null) return;
//     currentPage = json['currentPage'];
//     perPage = json['perPage'];
//     totalPages = json['totalPages'];
//     totalCount = json['totalCount'];
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'currentPage': currentPage,
//       'perPage': perPage,
//       'totalPages': totalPages,
//       'totalCount': totalCount
//      };
//   }
//
//   static List<PaginatedConversationsDtoMetadata> listFromJson(List<dynamic> json) {
//     return json == null ? new List<PaginatedConversationsDtoMetadata>() : json.map((value) => new PaginatedConversationsDtoMetadata.fromJson(value)).toList();
//   }
//
//   static Map<String, PaginatedConversationsDtoMetadata> mapFromJson(Map<String, Map<String, dynamic>> json) {
//     var map = new Map<String, PaginatedConversationsDtoMetadata>();
//     if (json != null && json.length > 0) {
//       json.forEach((String key, Map<String, dynamic> value) => map[key] = new PaginatedConversationsDtoMetadata.fromJson(value));
//     }
//     return map;
//   }
// }
