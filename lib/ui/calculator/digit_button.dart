import 'package:c21_online/core/colors/colors.dart';
import 'package:flutter/material.dart';

class DigitButton extends StatelessWidget {
  final String content;
  final int flex;
  final void Function(String) onPress;

  const DigitButton({
    required this.content,
    this.flex = 1,
    required this.onPress,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: FilledButton(
        onPressed: () {
          onPress(content);
        },
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.gray,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          textStyle: TextStyle(fontSize: 24, fontWeight: .bold),
        ),
        child: Text(content, style: TextStyle(color: AppColors.lightBlue)),
      ),
    );
  }
}
