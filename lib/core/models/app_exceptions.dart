sealed class AppException implements Exception {
  const AppException();
}

class MessageException extends AppException {
  final String message;

  const MessageException(this.message);
}
