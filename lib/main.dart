import 'package:c21_online/core/routes/app_routes.dart';
import 'package:c21_online/ui/calculator/calculator_screen.dart';
import 'package:c21_online/ui/xo/xo_game.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        AppRoutes.calculator: (context) => CalculatorScreen(),
        AppRoutes.xoGame: (context) {
          var arg = ModalRoute.of(context)?.settings.arguments as Player?;
          return XoGame(player: arg ?? Player.X);
        },
      },
      initialRoute: AppRoutes.xoGame,
    );
  }
}
