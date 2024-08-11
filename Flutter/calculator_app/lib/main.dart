import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = "0";
  String _input = "";
  double _num1 = 0.0;
  double _num2 = 0.0;
  String _operand = "";
  String _equation = "";

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        _input = "";
        _output = "0";
        _num1 = 0.0;
        _num2 = 0.0;
        _operand = "";
        _equation = "";
      } else if (buttonText == "+" ||
          buttonText == "-" ||
          buttonText == "/" ||
          buttonText == "*") {
        if (_input.isNotEmpty) {
          _num1 = double.parse(_input);
          _operand = buttonText;
          _equation = _input + " " + _operand + " ";
          _input = "";
        }
      } else if (buttonText == ".") {
        if (!_input.contains(".")) {
          _input += buttonText;
          _equation += buttonText;
        }
      } else if (buttonText == "=") {
        if (_input.isNotEmpty) {
          _num2 = double.parse(_input);

          switch (_operand) {
            case "+":
              _output = (_num1 + _num2).toString();
              break;
            case "-":
              _output = (_num1 - _num2).toString();
              break;
            case "*":
              _output = (_num1 * _num2).toString();
              break;
            case "/":
              _output = (_num1 / _num2).toString();
              break;
          }

          _equation += " "+ " = " + _output;
          _input = _output;
          _num1 = 0.0;
          _num2 = 0.0;
          _operand = "";
        }
      } else if (buttonText == "⌫") {
        if (_input.isNotEmpty) {
          _input = _input.substring(0, _input.length - 1);
          _equation = _equation.substring(0, _equation.length - 1);
          if (_input.isEmpty) {
            _input = "0";
          }
        }
      } else if (buttonText == "(" || buttonText == ")") {
        if (_input == "0") {
          _input = buttonText;
          _equation = buttonText;
        } else {
          _input += buttonText;
          _equation += buttonText;
        }
      } else {
        if (_input == "0") {
          _input = buttonText;
          _equation = buttonText;
        } else {
          _input += buttonText;
          _equation += buttonText;
        }
      }

      _output = _input.isEmpty ? "0" : _input;
    });
  }

  Widget _buildButton(String buttonText, {Color color = Colors.grey}) {
    return ElevatedButton(
      onPressed: () => _buttonPressed(buttonText),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(color),
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(20)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      child: Text(
        buttonText,
        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Basic Calculator'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  _equation,
                  style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70),
                ),
                Text(
                  _output,
                  style: const TextStyle(
                      fontSize: 48.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          const Expanded(
            child: Divider(color: Colors.white70),
          ),
          Expanded(
            flex: 2,
            child: GridView.count(
              crossAxisCount: 4,
              padding: EdgeInsets.all(8.0),
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              children: [
                _buildButton("7"),
                _buildButton("8"),
                _buildButton("9"),
                _buildButton("/", color: Colors.orange),
                _buildButton("4"),
                _buildButton("5"),
                _buildButton("6"),
                _buildButton("*", color: Colors.orange),
                _buildButton("1"),
                _buildButton("2"),
                _buildButton("3"),
                _buildButton("-", color: Colors.orange),
                _buildButton("."),
                _buildButton("0"),
                _buildButton("⌫", color: Colors.red),
                _buildButton("+", color: Colors.orange),
                _buildButton("(", color: Colors.blue),
                _buildButton(")", color: Colors.blue),
                _buildButton("C", color: const Color.fromRGBO(244, 67, 54, 1)),
                _buildButton("=", color: Colors.green),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
