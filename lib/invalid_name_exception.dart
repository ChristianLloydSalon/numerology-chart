/// Exception class for handling invalid name input.
class InvalidNameException implements Exception {
  final String message;
  InvalidNameException(this.message);

  @override
  String toString() => 'InvalidNameException: $message';
}
