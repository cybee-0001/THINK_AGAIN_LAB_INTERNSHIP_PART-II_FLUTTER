import 'dart:io';

void main() {
  // Take the number of terms as input from the user
  stdout.write("Enter the number of terms: ");
  int? n = int.tryParse(stdin.readLineSync()!);

  if (n == null || n <= 0) {
    print("Invalid input. Please enter a positive integer.");
    return;
  }

  print("Fibonacci series up to $n terms:");

  for (int i = 0; i < n; i++) {
    stdout.write("${fibonacci(i)} ");
  }
}

int fibonacci(int n) {
  if (n <= 1) {
    return n;
  } else {
    return fibonacci(n - 1) + fibonacci(n - 2);
  }
}
