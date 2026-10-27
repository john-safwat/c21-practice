import 'package:c21_online/core/colors/colors.dart';
import 'package:flutter/material.dart';

class OperationButton extends StatelessWidget {
  final String content;
  final int flex;
  final Color color;
  final void Function(String) onPress;

  const OperationButton({
    required this.content,
    this.flex = 2,
    this.color = AppColors.blue,
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
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          textStyle: TextStyle(
            fontSize: 24,
            fontWeight: .bold,
            color: AppColors.white,
          ),
        ),
        child: Text(content),
      ),
    );
  }
}
