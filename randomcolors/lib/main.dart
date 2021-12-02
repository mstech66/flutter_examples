// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'dart:math' as math;

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ColorPager(),
    );
  }
}

class ColorPager extends StatefulWidget {
  const ColorPager({Key? key}) : super(key: key);

  @override
  State<ColorPager> createState() => _ColorPagerState();
}

class _ColorPagerState extends State<ColorPager> {
  int colorLuminance = (Colors.white).value;
  Color generateRandomColorString() {
    var color =
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    colorLuminance =
        (color.computeLuminance() < 0.5 ? Colors.white : Colors.black).value;
    return color;
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Random Colors')),
          backgroundColor: Colors.green,
        ),
        body: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return InkWell(
                onTap: () {},
                child: Ink(
                  color: generateRandomColorString(),
                  width: deviceSize.width,
                  height: deviceSize.height,
                  child: const Center(
                      child: Text(
                    'Sample Text',
                    style: TextStyle(fontSize: 30),
                    textAlign: TextAlign.center,
                  )),
                ),
              );
            }));
  }
}
