import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  FlutterTts flutterTts;
  Random random = Random();
  int diceNumber;

  void refreshDiceNumber() {
    // r = min + rnd.nextInt(max - min);
    //where min and max should be specified.
    diceNumber = 1 + random.nextInt(7 - 1);
  }

  @override
  void initState() {
    super.initState();
    flutterTts = FlutterTts();
    refreshDiceNumber();
  }

  @override
  Widget build(BuildContext context) {
    flutterTts.speak(diceNumber.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text('Dice app'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('images/dice faces black/$diceNumber.png'),
            Spacer(),
            ElevatedButton(
              style: ButtonStyle(),
              onPressed: () {
                setState(() {
                  refreshDiceNumber();
                });
              },
              child: Container(
                child: Center(
                    child: Text(
                  'Refresh',
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.w300),
                )),
                height: 60,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
