import 'client/error_response.dart';

class InboxButtonException implements Exception {
  ErrorResponse errorResponse;

  InboxButtonException(this.errorResponse);

  @override
  String toString() {
    return errorResponse.message ?? "";
  }
}
