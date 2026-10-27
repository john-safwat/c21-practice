import 'package:c21_online/ui/xo/xo_game.dart';
import 'package:flutter/material.dart';

class XoButton extends StatelessWidget {
  final Player? player;
  final int index;
  final void Function(int) onPress;

  const XoButton({
    required this.player,
    required this.index,
    required this.onPress,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          onPress(index);
        },
        child: player == null
            ? SizedBox(width: double.infinity, height: double.infinity)
            : Image.asset(
                "assets/images/${player == Player.X ? "x" : "o"}.png",
              ),
      ),
    );
  }
}
