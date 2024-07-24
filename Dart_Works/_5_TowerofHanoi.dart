import 'dart:io';

void main() {
  // Take the number of disks as input from the user
  stdout.write("Enter the number of disks: ");
  int? n = int.tryParse(stdin.readLineSync()!);

  if (n == null || n <= 0) {
    print("Invalid input. Please enter a positive integer.");
    return;
  }

  print("Moves for $n disks:");
  towerOfHanoi(n, 'A', 'C', 'B');
}

void towerOfHanoi(int n, String fromPeg, String toPeg, String auxPeg) {
  if (n == 1) {
    print("Move disk 1 from peg $fromPeg to peg $toPeg");
    return;
  }
  towerOfHanoi(n - 1, fromPeg, auxPeg, toPeg);
  print("Move disk $n from peg $fromPeg to peg $toPeg");
  towerOfHanoi(n - 1, auxPeg, toPeg, fromPeg);
}
