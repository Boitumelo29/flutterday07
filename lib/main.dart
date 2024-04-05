import 'package:flutter/material.dart';
import 'package:flutterday07/board_title.dart';
import 'package:flutterday07/tile_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _boardState = List.filled(9, TileState.empty);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
      final titleDimension = boardDimension / 3;

      return Container(
        width: boardDimension,
        height: boardDimension,
        child: Column(
          children: chunk(_boardState, 3).asMap().entries.map((entry) {
            final chunkIndex = entry.key;
            final titleStateChunk = entry.value;

            return Row(
              children: titleStateChunk.asMap().entries.map((innerEntry) {
                final innerIndex = innerEntry.key;
                final tileState = innerEntry.value;
                final tileIndex = (chunkIndex * 3) + innerIndex;
                return BoardTile(
                  titleDimention: titleDimension,
                  ontapped: () {
                    print(tileIndex);
                  },
                  tileState: tileState,
                );
              }).toList(),
            );
          }).toList(),
        ),
      );
    });
  }
  //we stopped at 28:52 creating function
}
