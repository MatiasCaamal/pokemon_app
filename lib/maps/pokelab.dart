import 'package:flutter/material.dart';

class MyPokeLab extends StatelessWidget {
  double x;
  double y;
  String currentMap;

  MyPokeLab({required this.x, required this.y, required this.currentMap});

  @override
  Widget build(BuildContext context) {
    if (currentMap == 'pokelab') {
      return Container(
        alignment: Alignment(x, y),
        child: Image.asset(
          'lib/images/pokelab.png',
          width: MediaQuery.of(context).size.width * 0.75,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return Container();
    }
  }
}
