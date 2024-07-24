import 'dart:io';
void main() {
  // Function to read input (as a string) and parse it to integer
  int readInt() {
    return int.parse(stdin.readLineSync()!);
  }

  // Prompt the user for the number of inputs
  print('How many numbers do you want to add?');
  int count = readInt();

  // Create a list to hold the numbers
  List<int> numbers = [];

  // Prompt the user to enter the numbers
  for (int i = 0; i < count; i++) {
    print('Enter number ${i + 1}:');
    int number = readInt();
    numbers.add(number);
  }

  // Calculate the sum of the numbers
  int sum = numbers.reduce((a, b) => a + b);

  // Print the result
  print('The sum of the entered numbers is $sum');
}
