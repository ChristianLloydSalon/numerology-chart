import 'dart:io';

import 'package:coding_challenge/invalid_name_exception.dart';

/// This class handles user input and ensures the input is valid.
class InputHandler {
  /// Validates if the provided [name] consists only of alphabetic characters and spaces.
  bool isValidName(String name) {
    // Regex for alphabetic characters and spaces
    final validCharacters = RegExp(r'^[a-zA-Z\s]+$');

    return name.isNotEmpty && validCharacters.hasMatch(name);
  }

  /// Prompts the user for a valid name input and throws an exception if invalid.
  /// Returns the name as a trimmed string (removes leading/trailing spaces).
  String getNameInput() {
    stdout.write('Enter your full name: ');
    String? name = stdin.readLineSync();

    // Validate if the input is null or empty
    if (name == null || name.trim().isEmpty) {
      throw InvalidNameException('Input cannot be empty.');
    }

    // Validate the input for non-alphabetic characters
    if (!isValidName(name)) {
      throw InvalidNameException(
        'Invalid input. Please use only alphabetic characters and spaces.',
      );
    }

    return name.trim(); // Return valid and trimmed name
  }
}
