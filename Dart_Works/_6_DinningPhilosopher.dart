import 'dart:async';

class Philosopher {
  final String name;
  final Fork leftFork;
  final Fork rightFork;

  Philosopher(this.name, this.leftFork, this.rightFork);

  Future<void> dine() async {
    while (true) {
      print('$name is thinking.');
      await Future.delayed(Duration(seconds: 1)); // Simulate thinking

      print('$name is hungry.');
      await leftFork.pickUp(name);
      await rightFork.pickUp(name);

      print('$name is eating.');
      await Future.delayed(Duration(seconds: 1)); // Simulate eating

      leftFork.putDown(name);
      rightFork.putDown(name);

      print('$name finished eating and put down the forks.');
    }
  }
}

class Fork {
  final int id;
  bool _isPicked = false;

  Fork(this.id);

  Future<void> pickUp(String philosopherName) async {
    while (_isPicked) {
      await Future.delayed(Duration(milliseconds: 100)); // Wait if the fork is picked
    }
    _isPicked = true;
    print('$philosopherName picked up fork $id.');
  }

  void putDown(String philosopherName) {
    _isPicked = false;
    print('$philosopherName put down fork $id.');
  }
}

void main() {
  final forks = List.generate(5, (i) => Fork(i));
  final philosophers = List.generate(5, (i) => Philosopher(
      'Philosopher ${i + 1}', forks[i], forks[(i + 1) % forks.length]));

  // Start dining for each philosopher
  philosophers.forEach((philosopher) => philosopher.dine());
}
