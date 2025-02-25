import 'dart:async';

import 'package:flutter/material.dart';
//import 'package:pokemon_app/button.dart';
import 'package:pokemon_app/characters/boy.dart';
import 'package:pokemon_app/maps/pokelab.dart';
//import 'package:pokemon_app/maps/littleroot.dart';
import 'button.dart';
//import 'characters/boy.dart';
import 'maps/littleroot.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /*
    VARIABLES

  */

  // littleroot
  //double mapX = 1.125;
  //double mapY = 0.65;
  
  double mapX = 0;
  double mapY = 0;

  // pokelab
  double labMapX = 0;
  double labMapY = 0;

  // boy character
  int boySpriteCount = 0;
  String boyDirection = 'Down';

  // game stuff
  String currentLocation = 'littleroot';

  double step = 0.25;

  // no mans land for little root
  /*List<List<double>> noMansLandLittleroot = [
    [0.625, 0.9],

  ]; */

    List<List<double>> noMansLandLittleroot = [
    [0.125, 2.9],
    [0.125, 2.65],
    [0.375, 2.65],
    [0.625, 2.65],
    [0.875, 2.65],
    [1.125, 2.65],
    [1.375, 2.65],
    [1.625, 2.65],
    [1.875, 2.65],
    [2.125, 2.65],
    [2.625, 1.9],
    [2.625, 2.15],
    [2.375, 2.15],
    [2.125, 2.15],
    [2.125, 2.4],
    [2.625, 1.65],
    [2.625, 1.4] ,
    [2.625, 1.15],
    [2.625, 0.9],
    [2.625, 0.65],
    [2.625, 0.4],
    [2.625, 0.15],
    [2.625, -0.1],
    [2.625, -0.35],
    [2.625, -0.6],
    [2.625, -0.85],
    [2.625, -1.1],
    [2.625, -1.35],
    [2.625, -1.6],
    [2.375, -1.6],
    [2.125, -1.6],
    [2.125, -1.85],
    [2.125, -2.1],
    [1.875, -2.1],
    [1.625, -2.1],
    [1.375, -2.1],
    [1.125, -2.1],
    [0.875, -2.1],
    [0.625, -2.1],
    [0.375, -2.1],
    [0.125, -2.1],
    [-0.125, -2.1],
    [-0.375, -2.1],
    [-0.625, -2.1],
    [-0.875, -2.1],
    [-1.125, -2.1],
    [-1.375, -2.1],
    [-1.625, -2.1],
    [-0.875, -2.1],
    [-1.125, -2.1],
    [-1.375, -2.1],
    [-1.625, -2.1],
    [-1.875, -1.6],
    [-2.125, -1.6],
    [-2.375, -1.1],
    [-2.625, -1.1],
    [-2.625, -0.85],
    [-2.625, -0.6],
    [-2.625, -0.35],
    [-2.625, -0.1],
    [-2.625, 0.15],
    [-2.625, 0.4],
    [-2.625, 0.65],
    [-2.625, 0.9],
    [-2.625, 1.15],
    [-2.625, 1.4],
    [-2.625, 1.65],
    [-2.625, 1.9],
    [-2.625, 2.15],
    [-2.375, 2.15],
    [-2.125, 2.15],
    [-2.125, 2.4],
    [-2.125, 2.65],
    [-1.875, 2.65],
    [-1.625, 2.65],
    [-1.375, 2.65],
    [-1.125, 2.65],
    [-0.875, 2.65],
    [-0.625, 2.65],
    [-0.625, 0.9],
    [-0.875, 0.9],
    [-1.125, 0.9],
    [-1.375, 0.9],
    [-1.625, 0.9],
    [-1,875, 0.9],
    [-1.875, 1.15],
    [-1.625, 1.15],
    [-1.375, 1.15],
    [-1.125, 1.15],
    [-0.875, 1.15],
    [-1.875, 1.4],
    [-1.625, 1.4],
    [-1.375, 1.4],
    [-1.125, 1.4],
    [-0.875, 1.4],
    [-1.875, 1.65],
    [-1.625, 1.65],
    [-1.375, 1.65],
    [-1.125, 1.65],
    [-0.875, 1.65],
    [-1.875, 1.9],
    [-1.625, 1.9],
    [-1.375, 1.9],
    [-1.125, 1.9],
    [-0.875, 1.9],
    [0.625, 0.9],
    [0.875, 0.9],
    [1.125, 0.9],
    [1.375, 0.9],
    [1.625, 0.9],
    [1.875, 0.9],
    [0.875, 1.15],
    [1.125, 1.15],
    [1.375, 1.15],
    [1.625, 1.15],
    [1.875, 1.15],
    [0.875, 1.4],
    [1.125, 1.4],
    [1.375, 1.4],
    [1.625, 1.4],
    [1.875, 1.4],
    [0.875, 1.65],
    [1.125, 1.65],
    [1.375, 1.65],
    [1.625, 1.65],
    [1.875, 1.65],
    [0.875, 1.9],
    [1.125, 1.9],
    [1.375, 1.9],
    [1.625, 1.9],
    [1.875, 1.9],
    [1.625, -0.1],
    [1.375, -0.1],
    [1.125, -0.1],
    [0.875, -0.1],
    [0.625, -0.1],
    [0.375, -0.1],
    [0.125, -0.1],
    [1.625, -0.35],
    [1.375, -0.35],
    [1.125, -0.35],
    [0.875, -0.35],
    [0.625, -0.35],
    [0.375, -0.35],
    [0.125, -0.35],
    [1.625, -0.6],
    [1.375, -0.6],
    [1.125, -0.6],
    [0.875, -0.6],
    [0.625, -0.6],
    [0.375, -0.6],
    [0.125, -0.6],
    [1.625, -0.85],
    [1.375, -0.85],
    [1.125, -0.85],
    [0.875, -0.85],
    [0.625, -0.85],
    [0.375, -0.85],
    [0.125, -0.85],
    [1.625, -1.1],
    [1.375, -1.1],
    [1.125, -1.1],
    [0.875, -1.1],
    [0.375, -1.1],
    [0.125, -1.1],
    [0.875, -1.35],
    [-1.375, -0.35],
    [-1.625, -1.85],
    [-1.625, -1.6],
    [-2.125, -1.35],
    [2.125, -1.1],
    [-0.625, 2.9],
    [-0.125, 3.15],
    [-0.375, 3.15]
  ];

  void moveUp() {
    boyDirection = 'Up';
    if (currentLocation == 'littleroot') {
      if (canMoveTo(boyDirection, noMansLandLittleroot, mapX, mapY)) {
        setState(() {
          mapY += step;
        });
      }

      if (double.parse((mapX).toStringAsFixed(4)) == 0.6250 &&
          double.parse((mapY).toStringAsFixed(4)) == -1.1) {
            setState(() {
              currentLocation = 'pokelab';
              labMapX = 0;
              labMapY = -2.73;
            });
          }
    }
    animateWalk();
  }

  void moveDown() {
    boyDirection = 'Down';
    if (currentLocation == 'littleroot') {
      if (canMoveTo(boyDirection, noMansLandLittleroot, mapX, mapY)) {
        setState(() {
          mapY -= step;
        });
      }
    }
    animateWalk();
  }

  void moveRight() {
    boyDirection = 'Right';
    if (currentLocation == 'littleroot') {
      if (canMoveTo(boyDirection, noMansLandLittleroot, mapX, mapY)) {
        setState(() {
          mapX -= step;
        });
      }
    }
    animateWalk();
  }

  void moveLeft() {
    boyDirection = 'Left';

    if (currentLocation == 'littleroot') {
      if (canMoveTo(boyDirection, noMansLandLittleroot, mapX, mapY)) {
        setState(() {
          mapX += step;
        });
      }
    }

    animateWalk();
  }

  void pressedA() {}
  void pressedB() {}

  void animateWalk() {
    print('x: ' + mapX.toString() + 'y: ' + mapY.toString());

    Timer.periodic(Duration(milliseconds: 50), (timer) {
      setState(() {
        boySpriteCount++;
      });

      if (boySpriteCount == 3) {
        boySpriteCount = 0;
        timer.cancel();
      }
    });
  }

  double cleanNum(double num) {
    return double.parse(num.toStringAsExponential(4));
  }

  bool canMoveTo(String direction, var noMansLand, double x, double y) {
    double stepX = 0;
    double stepY = 0;

    if (direction == 'Left') {
      stepX = step;
      stepY = 0;
    } else if (direction == 'Right') {
      stepX = -step;
      stepY = 0;
    } else if (direction == 'Up') {
      stepX = 0;
      stepY = step;
    } else if (direction == 'Left') {
      stepX = 0;
      stepY = -step;
    }

    for (int i = 0; i < noMansLandLittleroot.length; i++) {
      if ((cleanNum(noMansLand[i][0]) == cleanNum(x + stepX)) &&
          (cleanNum(noMansLand[i][1]) == cleanNum(y + stepY))) {
        return false;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              color: Colors.black,
              child: Stack(
                children: [
                  // little root
                  LittleRoot(
                    x: mapX,
                    y: mapY,
                    currentMap: currentLocation,
                  ),

                  // pokelab
                  /* MyPokeLab(
                    x: labMapX,
                    y: labMapY,
                    currentMap: currentLocation,
                  ), */

                  // boy character
                  Container(
                    alignment: Alignment(0, 0),
                    child: MyBoy(
                      location: currentLocation,
                      boySpriteCount: boySpriteCount,
                      direction: boyDirection,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey[900],
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'G A M E B O Y',
                      style: TextStyle(color: Colors.white),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                ),
                                MyButton(
                                  text: '⬅',
                                  function: moveLeft,
                                ),
                                Container(
                                  height: 50,
                                  width: 50,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                MyButton(
                                  text: '⬆',
                                  function: moveUp,
                                ),
                                Container(
                                  height: 50,
                                  width: 50,
                                ),
                                MyButton(
                                  text: '⬇',
                                  function: moveDown,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                ),
                                MyButton(
                                  text: '⮕',
                                  function: moveRight,
                                ),
                                Container(
                                  height: 50,
                                  width: 50,
                                ),
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                ),
                                MyButton(
                                  text: 'b',
                                  function: pressedB,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                MyButton(
                                  text: 'a',
                                  function: pressedA,
                                ),
                                Container(
                                  height: 50,
                                  width: 50,
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    Text(
                      'C R E A T E D B Y M A T I A S',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
