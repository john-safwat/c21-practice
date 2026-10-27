import 'package:c21_online/core/colors/colors.dart';
import 'package:c21_online/ui/calculator/digit_button.dart';
import 'package:c21_online/ui/calculator/operation_button.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        children: [
          // this is the screen widget
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(16),
              alignment: .centerRight,
              child: Text(
                result,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: .bold,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
          // this is the buttons layout
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                spacing: 16,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      spacing: 16,
                      children: [
                        Expanded(
                          child: Row(
                            crossAxisAlignment: .stretch,
                            spacing: 16,
                            children: [
                              OperationButton(
                                content: "AC",
                                color: AppColors.lightGray,
                                onPress: _onAllClearPress,
                              ),
                              OperationButton(
                                content: "C",
                                color: AppColors.lightGray,
                                onPress: _onClearPress,
                              ),
                              OperationButton(
                                content: "/",
                                onPress: _onOperationPress,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: .stretch,
                            spacing: 16,
                            children: [
                              DigitButton(content: "7", onPress: _onDigitPress),
                              DigitButton(content: "8", onPress: _onDigitPress),
                              DigitButton(content: "9", onPress: _onDigitPress),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: .stretch,
                            spacing: 16,
                            children: [
                              DigitButton(content: "4", onPress: _onDigitPress),
                              DigitButton(content: "5", onPress: _onDigitPress),
                              DigitButton(content: "6", onPress: _onDigitPress),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: .stretch,
                            spacing: 16,
                            children: [
                              DigitButton(content: "1", onPress: _onDigitPress),
                              DigitButton(content: "2", onPress: _onDigitPress),
                              DigitButton(content: "3", onPress: _onDigitPress),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: .stretch,
                            spacing: 16,
                            children: [
                              DigitButton(
                                content: "0",
                                flex: 2,
                                onPress: _onDigitPress,
                              ),
                              DigitButton(content: ".", onPress: _onDigitPress),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      spacing: 16,
                      crossAxisAlignment: .stretch,
                      children: [
                        OperationButton(
                          content: '*',
                          onPress: _onOperationPress,
                        ),
                        OperationButton(
                          content: '-',
                          onPress: _onOperationPress,
                        ),
                        OperationButton(
                          content: '+',
                          flex: 3,
                          onPress: _onOperationPress,
                        ),
                        OperationButton(
                          content: '=',
                          flex: 3,
                          color: AppColors.lightBlue,
                          onPress: _onEqualButtonPress,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String result = "0";
  String calculationResult = "0";

  String firstDigit = "";

  String secondDigit = "";

  String? operation;

  void _onDigitPress(String digit) {
    if (operation == null) {
      if (calculationResult == firstDigit && firstDigit != "") {
        firstDigit = "";
        result = "0";
      }
      firstDigit += digit;
      result = firstDigit;
    } else {
      secondDigit += digit;
      result = secondDigit;
    }
    print(firstDigit);
    print(secondDigit);
    print(operation);
    setState(() {});
  }

  void _onOperationPress(String operation) {
    if (this.operation != null) {
      _onEqualButtonPress("");
    }
    this.operation = operation;
    result = "0";
    setState(() {});
  }

  void _onEqualButtonPress(String _) {
    if (firstDigit == "") return;
    if (secondDigit == "") return;
    switch (operation) {
      case "+":
        result = (double.parse(firstDigit) + double.parse(secondDigit))
            .toString();
        break;

      case "-":
        result = (double.parse(firstDigit) - double.parse(secondDigit))
            .toString();
        break;
      case "*":
        result = (double.parse(firstDigit) * double.parse(secondDigit))
            .toString();
        break;
      case "/":
        result = (double.parse(firstDigit) / double.parse(secondDigit))
            .toString();
        break;
    }
    calculationResult = result;
    operation = null;
    firstDigit = result;
    secondDigit = "";
    setState(() {});
  }

  void _onClearPress(String _) {}

  void _onAllClearPress(String _) {}
}
