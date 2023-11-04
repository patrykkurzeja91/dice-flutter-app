import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red[800],
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red[800],
        ),
        body: Container(padding: EdgeInsets.all(12.0), child: DicePage()),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 2;

  randomNumberFrom1to6() {
    return Random().nextInt(6) + 1;
  }

  randomizeRightDiceNumber() {
    setState(() {
      rightDiceNumber = randomNumberFrom1to6();
    });
  }

  randomizeLeftDiceNumber() {
    setState(() {
      leftDiceNumber = randomNumberFrom1to6();
    });
  }

  randomizeDiceNumber() {
    randomizeLeftDiceNumber();
    randomizeRightDiceNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: Row(
            children: [
              Expanded(
                child: TextButton(
                  child: Image.asset('images/dice$leftDiceNumber.png'),
                  onPressed: () => randomizeLeftDiceNumber(),
                ),
              ),
              Expanded(
                child: TextButton(
                  child: Image.asset('images/dice$rightDiceNumber.png'),
                  onPressed: () => randomizeRightDiceNumber(),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(12.0, 24.0, 12.0, 0.0),
          child: ElevatedButton(
            onPressed: () => randomizeDiceNumber(),
            child: Text('Roll Both Dices', style: TextStyle(fontSize: 20.0)),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
              foregroundColor: MaterialStateProperty.all(Colors.red[800]),
            ),
          ),
        ),
      ],
    );
  }
}
