import 'dart:convert';

import 'client/error_response.dart';

class InboxButtonException implements Exception {
  ErrorResponse errorResponse;

  InboxButtonException(this.errorResponse);

  @override
  String toString() {
    JsonEncoder encoder = const JsonEncoder.withIndent('  ');
    var jsonString = encoder.convert(errorResponse);
    return jsonString;
  }
}
