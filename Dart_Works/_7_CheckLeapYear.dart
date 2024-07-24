import 'dart:io';

// Function to check if a year is a leap year
bool isLeapYear(int year) {
  if (year % 4 != 0) {
    return false;
  } else if (year % 100 != 0) {
    return true;
  } else if (year % 400 != 0) {
    return false;
  } else {
    return true;
  }
}

// Function to check if a year is a century year
bool isCenturyYear(int year) {
  return year % 100 == 0;
}

// Function to check if a year is a millennium year
bool isMillenniumYear(int year) {
  return year % 1000 == 0;
}

void main() {
  // Take the year as input from the user
  stdout.write("Enter a year: ");
  int? year = int.tryParse(stdin.readLineSync()!);

  if (year == null) {
    print("Invalid input. Please enter a valid year.");
  } else {
    // Check if the year is a leap year
    if (isLeapYear(year)) {
      print("$year is a leap year.");
    } else {
      print("$year is not a leap year.");
    }

    // Check if the year is a century year
    if (isCenturyYear(year)) {
      print("$year is a century year.");
    } else {
      print("$year is not a century year.");
    }

    // Check if the year is a millennium year
    if (isMillenniumYear(year)) {
      print("$year is a millennium year.");
    } else {
      print("$year is not a millennium year.");
    }
  }
}
