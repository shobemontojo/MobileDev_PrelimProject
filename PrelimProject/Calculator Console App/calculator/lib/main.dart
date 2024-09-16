import 'dart:io';

import 'package:calculator/models/calculator_model.dart';
import 'package:calculator/services/calculator_service.dart';

class CalculatorApp {
  final CalculatorService calculatorService;

  // Injecting CalculatorService into the CalculatorApp class
  CalculatorApp({required this.calculatorService});

  void run() {
    print('Welcome to the Dart Console Calculator!');

    // Get the first number
    print('Enter the first number:');
    double num1 = _getDoubleInput();

    // Get the operation
    print('Enter the operation (+, -, *, /):');
    String? operation = stdin.readLineSync()?.trim(); // Trim the input

    if (operation == null ||
        operation.isEmpty ||
        !['+', '-', '*', '/'].contains(operation)) {
      print('Invalid operation input.');
      return; // Exiting the program if no valid operation is given
    }

    // Get the second number
    print('Enter the second number:');
    double num2 = _getDoubleInput();

    // Create the Calculator object and pass the values
    Calculator calculator =
        Calculator(num1: num1, num2: num2, operation: operation);

    // Calculate the result using the injected service
    try {
      double result = calculatorService.calculate(calculator);
      print('The result is: $result');
    } catch (e) {
      print('Error: ${e.toString()}'); // Catching and printing any error
    }
  }

  // Function to safely read a double input
  double _getDoubleInput() {
    while (true) {
      String? input = stdin.readLineSync()?.trim(); // Trim the input
      if (input != null && double.tryParse(input) != null) {
        return double.parse(input);
      } else {
        print('Invalid input. Please enter a valid number:');
      }
    }
  }
}

void main() {
  // Injecting CalculatorService into CalculatorApp
  CalculatorService calculatorService = CalculatorService();
  CalculatorApp app = CalculatorApp(calculatorService: calculatorService);

  app.run();
}
