// ignore_for_file: camel_case_types, file_names
import 'dart:math';

import 'package:dice_app2/components/dice.dart';
import 'package:shake/shake.dart';
import '../Provider/totalDice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

class diceZone extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const diceZone({
    Key? key,
  });

  @override
  State<diceZone> createState() => _diceZoneState();
}

class _diceZoneState extends State<diceZone> {
  @override
  void initState() {
    super.initState();
    ShakeDetector.autoStart(onPhoneShake: () {
      setState(() {
        context.read<diceList>().reRollDice();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemBuilder: (BuildContext context, index) {
        return GestureDetector(
          onDoubleTap: () {
            context.read<diceList>().itemChange(index, randomNumber());
            HapticFeedback.lightImpact();
          },
          child: Rdice(
              wichDice: context.read<diceList>().diceses.elementAt(index)),
        );
      },
      itemCount: context.watch<diceList>().diceses.length,
      padding: const EdgeInsets.all(15),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: forGrid(context
              .watch<diceList>()
              .diceses
              .length), //forGrid(context.watch<diceList>().diceses.length)
          mainAxisSpacing: 5,
          crossAxisSpacing: 5),
    );
  }
}

int forGrid(int index) {
  if (index < 3) {
    return 1;
  } else if (index < 9) {
    return 2;
  } else {
    return 3;
  }
}
//Text('merhaba dünya ${context.watch<counter>().TotalDice}'))

int randomNumber() {
  int i = Random().nextInt(6) + 1;
  return i;
}
