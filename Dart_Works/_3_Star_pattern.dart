import 'dart:io';

void main() {
  // Take the user's name as input
  stdout.write("Enter your name: ");
  String name = stdin.readLineSync()!;

  // Print the star pattern of the name
  printStarPattern(name);
}

void printStarPattern(String name) {
  // Define the star patterns for each letter
  Map<String, List<String>> patterns = {
    'A': [
      "  *  ",
      " * * ",
      "*   *",
      "*****",
      "*   *"
    ],
    'B': [
      "**** ",
      "*   *",
      "**** ",
      "*   *",
      "**** "
    ],
    'C': [
      " ****",
      "*    ",
      "*    ",
      "*    ",
      " ****"
    ],
    'D': [
      "**** ",
      "*   *",
      "*   *",
      "*   *",
      "**** "
    ],
    'E': [
      "*****",
      "*    ",
      "*****",
      "*    ",
      "*****"
    ],
    'F': [
      "*****",
      "*    ",
      "*****",
      "*    ",
      "*    "
    ],
    'G': [
      " ****",
      "*    ",
      "* ***",
      "*   *",
      " ****"
    ],
    'H': [
      "*   *",
      "*   *",
      "*****",
      "*   *",
      "*   *"
    ],
    'I': [
      "*****",
      "  *  ",
      "  *  ",
      "  *  ",
      "*****"
    ],
    'J': [
      "*****",
      "   * ",
      "   * ",
      "*  * ",
      " **  "
    ],
    'K': [
      "*   *",
      "*  * ",
      "***  ",
      "*  * ",
      "*   *"
    ],
    'L': [
      "*    ",
      "*    ",
      "*    ",
      "*    ",
      "*****"
    ],
    'M': [
      "*   *",
      "** **",
      "* * *",
      "*   *",
      "*   *"
    ],
    'N': [
      "*   *",
      "**  *",
      "* * *",
      "*  **",
      "*   *"
    ],
    'O': [
      " *** ",
      "*   *",
      "*   *",
      "*   *",
      " *** "
    ],
    'P': [
      "**** ",
      "*   *",
      "**** ",
      "*    ",
      "*    "
    ],
    'Q': [
      " *** ",
      "*   *",
      "*   *",
      "*  **",
      " ****"
    ],
    'R': [
      "**** ",
      "*   *",
      "**** ",
      "*  * ",
      "*   *"
    ],
    'S': [
      " ****",
      "*    ",
      " *** ",
      "    *",
      "**** "
    ],
    'T': [
      "*****",
      "  *  ",
      "  *  ",
      "  *  ",
      "  *  "
    ],
    'U': [
      "*   *",
      "*   *",
      "*   *",
      "*   *",
      " *** "
    ],
    'V': [
      "*   *",
      "*   *",
      "*   *",
      " * * ",
      "  *  "
    ],
    'W': [
      "*   *",
      "*   *",
      "* * *",
      "** **",
      "*   *"
    ],
    'X': [
      "*   *",
      " * * ",
      "  *  ",
      " * * ",
      "*   *"
    ],
    'Y': [
      "*   *",
      " * * ",
      "  *  ",
      "  *  ",
      "  *  "
    ],
    'Z': [
      "*****",
      "   * ",
      "  *  ",
      " *   ",
      "*****"
    ],
    ' ': [
      "     ",
      "     ",
      "     ",
      "     ",
      "     "
    ],
  };

  // Convert the name to uppercase and iterate through each character
  name = name.toUpperCase();

  // Create an empty list to store the pattern lines
  List<String> result = List.generate(5, (index) => "");

  for (int i = 0; i < name.length; i++) {
    String char = name[i];
    if (patterns.containsKey(char)) {
      for (int j = 0; j < 5; j++) {
        result[j] += patterns[char]![j] + " ";
      }
    }
  }

  // Print the star pattern
  for (String line in result) {
    print(line);
  }
}
