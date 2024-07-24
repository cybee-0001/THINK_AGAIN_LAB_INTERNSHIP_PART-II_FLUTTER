import 'dart:io';
import 'dart:math';

// Function to check if a number is even or odd
bool isEven(int number) => number % 2 == 0;

// Function to check if a number is prime
bool isPrime(int number) {
  if (number <= 1) return false;
  for (int i = 2; i <= sqrt(number).toInt(); i++) {
    if (number % i == 0) return false;
  }
  return true;
}

// Function to check if a number is an Armstrong number
bool isArmstrong(int number) {
  int sum = 0, temp = number;
  int numberOfDigits = number.toString().length;
  while (temp > 0) {
    int digit = temp % 10;
    sum += pow(digit, numberOfDigits).toInt();
    temp ~/= 10;
  }
  return sum == number;
}

// Function to check if a number is positive or negative
String isPositiveOrNegative(int number) => number >= 0 ? "Positive" : "Negative";

// Function to check if a number is a palindrome
bool isPalindrome(int number) {
  String original = number.toString();
  String reversed = original.split('').reversed.join('');
  return original == reversed;
}

void main() {
  while (true) {
    // Take the number as input from the user
    stdout.write("Enter a number: ");
    int? number = int.tryParse(stdin.readLineSync()!);

    if (number == null) {
      print("Invalid input. Please enter a valid number.");
      continue;
    }

    // Ask the user which type they want to check
    print("Enter the type of check you want to perform:");
    print("1) Even or Odd");
    print("2) Prime or Not Prime");
    print("3) Armstrong or Not Armstrong");
    print("4) Positive or Negative");
    print("5) Palindrome or Not Palindrome");
    print("6) Exit");
    
    stdout.write("Your choice: ");
    int? choice = int.tryParse(stdin.readLineSync()!);

    if (choice == null || choice < 1 || choice > 6) {
      print("Invalid choice. Please select a valid option.");
      continue;
    }

    if (choice == 6) {
      print("Exiting the program. Goodbye!");
      break;
    }

    // Perform the appropriate check based on the user's choice
    switch (choice) {
      case 1:
        print("$number is ${isEven(number) ? "Even" : "Odd"}.");
        break;
      case 2:
        print("$number is ${isPrime(number) ? "Prime" : "Not Prime"}.");
        break;
      case 3:
        print("$number is ${isArmstrong(number) ? "an Armstrong Number" : "not an Armstrong Number"}.");
        break;
      case 4:
        print("$number is ${isPositiveOrNegative(number)}.");
        break;
      case 5:
        print("$number is ${isPalindrome(number) ? "a Palindrome" : "not a Palindrome"}.");
        break;
    }
  }
}
