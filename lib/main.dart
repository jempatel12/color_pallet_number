import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String userInput = '';
  List<Color> colorPalette = [];

  void updateColorPalette() {
    colorPalette.clear();
    final rng = Random();
    for (int i = 0; i < userInput.length; i++) {
      colorPalette.add(Color.fromRGBO(
        rng.nextInt(256),
        rng.nextInt(256),
        rng.nextInt(256),
        1,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Color Palette',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
          centerTitle: true,
        ),
        backgroundColor: Colors.blue.shade100,
        body: Center(
          child: Column(
            children: [
              TextField(
                onChanged: (value) {
                  setState(() {
                    userInput = value;
                    updateColorPalette();
                  });
                },
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 5,
                  children: List.generate(colorPalette.length, (index) {
                    return Container(
                      color: colorPalette[index],
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
