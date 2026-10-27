import 'dart:async';

import 'package:c21_online/core/colors/colors.dart';
import 'package:c21_online/ui/xo/xo_button.dart';
import 'package:flutter/material.dart';

enum Player { X, O }

class XoGame extends StatefulWidget {
  Player player;

  XoGame({required this.player, super.key});

  @override
  State<XoGame> createState() => _XoGameState();
}

class _XoGameState extends State<XoGame> {
  List<Player?> board = List.filled(9, null);
  late String displayMessage =
      "It's Player ${widget.player == Player.X ? "X" : "O"} Turn";

  int seconds = 0;
  String time = "00:00";

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (_) {
      _updateTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.cyan, AppColors.blue],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 16,
              children: [
                // timer card
                Container(
                  width: double.infinity,
                  alignment: .center,
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    time,
                    style: TextStyle(fontWeight: .bold, fontSize: 28),
                  ),
                ),
                Text(
                  displayMessage,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 24,
                    fontWeight: .bold,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Spacer(),
                            Divider(),
                            Spacer(),
                            Divider(),
                            Spacer(),
                          ],
                        ),
                        Row(
                          children: [
                            Spacer(),
                            VerticalDivider(),
                            Spacer(),
                            VerticalDivider(),
                            Spacer(),
                          ],
                        ),
                        Column(
                          spacing: 16,
                          children: [
                            Expanded(
                              child: Row(
                                spacing: 16,
                                children: [
                                  XoButton(
                                    player: board[0],
                                    index: 0,
                                    onPress: _onPlayerPress,
                                  ),
                                  XoButton(
                                    player: board[1],
                                    index: 1,
                                    onPress: _onPlayerPress,
                                  ),
                                  XoButton(
                                    player: board[2],
                                    index: 2,
                                    onPress: _onPlayerPress,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                spacing: 16,
                                children: [
                                  XoButton(
                                    player: board[3],
                                    index: 3,
                                    onPress: _onPlayerPress,
                                  ),
                                  XoButton(
                                    player: board[4],
                                    index: 4,
                                    onPress: _onPlayerPress,
                                  ),
                                  XoButton(
                                    player: board[5],
                                    index: 5,
                                    onPress: _onPlayerPress,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                spacing: 16,
                                children: [
                                  XoButton(
                                    player: board[6],
                                    index: 6,
                                    onPress: _onPlayerPress,
                                  ),
                                  XoButton(
                                    player: board[7],
                                    index: 7,
                                    onPress: _onPlayerPress,
                                  ),
                                  XoButton(
                                    player: board[8],
                                    index: 8,
                                    onPress: _onPlayerPress,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _updateTimer() {
    seconds++;
    int min = seconds ~/ 60;
    int sec = seconds % 60;
    time =
        "${min.toString().padLeft(2, "0")}:${sec.toString().padLeft(2, "0")}";
    setState(() {});
  }

  void _onPlayerPress(int index) {
    if (board[index] != null) return;
    board[index] = widget.player;
    if (checkWin()) {
      board = List.filled(9, null);
      displayMessage = "Player ${widget.player == Player.X ? "X" : "O"} Won";
      widget.player = widget.player == Player.X ? Player.O : Player.X;
    } else if (checkDraw()) {
      board = List.filled(9, null);
      widget.player = widget.player == Player.X ? Player.O : Player.X;
      displayMessage = "It's a Draw";
    } else {
      widget.player = widget.player == Player.X ? Player.O : Player.X;
      displayMessage =
          "It's Player ${widget.player == Player.X ? "X" : "O"} Turn";
    }
    setState(() {});
  }

  bool checkDraw() {
    for (var element in board) {
      if (element == null) return false;
    }
    return true;
  }

  bool checkWin() {
    if (board[0] == board[1] && board[1] == board[2] && board[0] != null) {
      return true;
    } else if (board[3] == board[4] &&
        board[4] == board[5] &&
        board[3] != null) {
      return true;
    } else if (board[6] == board[7] &&
        board[7] == board[8] &&
        board[6] != null) {
      return true;
    } else if (board[0] == board[3] &&
        board[3] == board[6] &&
        board[0] != null) {
      return true;
    } else if (board[1] == board[4] &&
        board[4] == board[7] &&
        board[1] != null) {
      return true;
    } else if (board[2] == board[5] &&
        board[5] == board[8] &&
        board[2] != null) {
      return true;
    } else if (board[0] == board[4] &&
        board[4] == board[8] &&
        board[0] != null) {
      return true;
    } else if (board[2] == board[4] &&
        board[4] == board[6] &&
        board[2] != null) {
      return true;
    }
    return false;
  }
}
