import 'package:coding_challenge/input_handler.dart';
import 'package:coding_challenge/invalid_name_exception.dart';
import 'package:coding_challenge/numerology_calculator.dart';

/// The controller that orchestrates input, calculation, and output.
void main() {
  final inputHandler = InputHandler();
  final calculator = NumerologyCalculator();

  try {
    // Prompt the user for valid input and display the valid name.
    String name = inputHandler.getNameInput();

    final result = calculator.calculate(name);

    print('Your Destiny Number is ${result.destiny}');
    print('Your Heart\'s Desire Number is ${result.heartsDesire}');
    print('Your Personality Number is ${result.personality}');
  } on InvalidNameException catch (error) {
    print(error);
  } catch (error) {
    print('An unexpected error occurred: $error');
  }
}
