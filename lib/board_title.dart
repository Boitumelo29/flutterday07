import 'package:flutter/material.dart';
import 'package:flutterday07/tile_state.dart';

class BoardTile extends StatelessWidget {
  final double titleDimention;
  final VoidCallback ontapped;
  final TileState tileState;
  const BoardTile(
      {super.key,
      required this.titleDimention,
      required this.ontapped,
      required this.tileState});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: titleDimention,
      height: titleDimention,
      child: GestureDetector(
        onTap: ontapped,
        child: _widgetForTileState(),
      ),
    );
  }

  Widget _widgetForTileState() {
    Widget widget;

    switch (tileState) {
      case TileState.empty:
        {
          widget = Container();
        }
        break;
      case TileState.cross:
        {
          widget = Image.asset("lib/images/x.png");
        }
        break;
      case TileState.circle:
        {
          widget = Image.asset("lib/images/o.png");
        }
        break;
    }

    return widget;
  }
}
