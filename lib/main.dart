import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text("Tic_Tac_Toe"),
              const SizedBox(
                height: 10,
              ),
              Stack(children: [
                _boardTiles(),
                Image.asset("lib/images/board.png"),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _boardTiles() {
    return Builder(builder: (context) {
      final boardDimension = MediaQuery.of(context).size.width;
      return Container(
        width: boardDimension,
        height: boardDimension,
        color: Colors.red,
      );
    });
  }
}
