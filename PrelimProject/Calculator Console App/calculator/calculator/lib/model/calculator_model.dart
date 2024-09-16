class Calculator {
  double num1;
  double num2;
  String operation;
  double result;

  Calculator({
    required this.num1,
    required this.num2,
    required this.operation,
    this.result = 0,
  });
}
