class FetchDataException implements Exception {
  final String message;

  FetchDataException(this.message);

  @override
  String toString() {
    return 'FetchDataException: $message';
  }
}

class ParseDataException implements Exception {
  final String message;

  ParseDataException(this.message);

  @override
  String toString() {
    return 'ParseDataException: $message';
  }
}
