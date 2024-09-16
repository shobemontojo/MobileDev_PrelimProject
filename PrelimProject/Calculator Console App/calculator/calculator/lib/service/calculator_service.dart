import 'package:calculator/model/calculator_model.dart';

class CalculatorService {
  double calculate(Calculator calculator) {
    switch (calculator.operation) {
      case '+':
        return calculator.num1 + calculator.num2;
      case '-':
        return calculator.num1 - calculator.num2;
      case '*':
        return calculator.num1 * calculator.num2;
      case '/':
        if (calculator.num2 == 0) {
          throw Exception('Division by zero is not allowed');
        }
        return calculator.num1 / calculator.num2;
      default:
        throw Exception('Invalid operation');
    }
  }
}
