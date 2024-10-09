part 'numerology_result.dart';

/// This class performs numerology calculations based on a user's name.
class NumerologyCalculator {
  /// A map that associates letters with their corresponding numerical values.
  final Map<String, int> _numerologyChart = {
    'A': 1,
    'B': 2,
    'C': 3,
    'D': 4,
    'E': 5,
    'F': 8,
    'G': 3,
    'H': 5,
    'I': 1,
    'J': 1,
    'K': 2,
    'L': 3,
    'M': 4,
    'N': 5,
    'O': 7,
    'P': 8,
    'Q': 1,
    'R': 2,
    'S': 3,
    'T': 4,
    'U': 6,
    'V': 6,
    'W': 6,
    'X': 5,
    'Y': 1,
    'Z': 7,
  };

  /// A set of vowels used to calculate the Heart's Desire (Soul Urge) number.
  final Set<String> _vowels = {'A', 'E', 'I', 'O', 'U'};

  /// Calculates numerology results based on the provided [name].
  ///
  /// This method computes three key numerology numbers:
  /// - **Destiny Number**: Represents the individual's purpose and life path,
  ///   calculated as the sum of all letter values in the name.
  /// - **Heart Desire Number**: Reflects the person's inner self and desires,
  ///   calculated as the sum of vowel values.
  /// - **Personality Number**: Indicates how others perceive the individual,
  ///   calculated as the sum of consonant values.
  ///
  /// Returns a [NumerologyResult] object containing the calculated numbers.
  NumerologyResult calculate(String name) {
    int destinyNumber = _calculateDestinyNumber(name);
    int heartDesireNumber = _calculateHeartDesireNumber(name);
    int personality = _calculatePersonalityNumber(name);

    return NumerologyResult(
      destiny: destinyNumber,
      heartsDesire: heartDesireNumber,
      personality: personality,
    );
  }

  /// Calculates the Destiny Number by summing the values of all characters in the [name].
  /// Reduces the sum to a single digit unless it is a master number (11 or 22).
  int _calculateDestinyNumber(String name) {
    int sum = _getNumerologySum(name, (_) => true);

    return _reduceToSingleDigit(sum);
  }

  /// Calculates the Heart's Desire Number by summing the values of vowels in the [name].
  /// Returns 0 if there are no vowels present.
  int _calculateHeartDesireNumber(String name) {
    int sum = _getNumerologySum(name, (letter) => _vowels.contains(letter));

    return sum == 0 ? 0 : _reduceToSingleDigit(sum);
  }

  /// Calculates the Personality Number by summing the values of consonants in the [name].
  /// Returns 0 if there are no consonants present.
  int _calculatePersonalityNumber(String name) {
    int sum = _getNumerologySum(name,
        (letter) => !_vowels.contains(letter)); // Sum of consonant values only
    return sum != 0
        ? _reduceToSingleDigit(sum)
        : 0; // Return 0 if no consonants found
  }

  /// Helper method to calculate the sum of character values based on a filtering condition.
  /// The [filterCondition] function determines which letters are included in the sum.
  int _getNumerologySum(String name, bool Function(String) filterCondition) {
    return name
        .toUpperCase()
        .replaceAll(' ', '')
        .split('')
        .where(
          (letter) =>
              _numerologyChart.containsKey(letter) && filterCondition(letter),
        )
        .map(
          (letter) => _numerologyChart[letter] ?? 0,
        )
        .fold(0, (a, b) => a + b); // Sums all valid letter values
  }

  /// Reduces a number to a single digit unless it is a master number (11 or 22).
  int _reduceToSingleDigit(int number) {
    while (number > 9 && number != 11 && number != 22) {
      number =
          number.toString().split('').map(int.parse).reduce((a, b) => a + b);
    }

    return number;
  }
}
