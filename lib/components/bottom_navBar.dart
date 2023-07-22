// ignore_for_file: camel_case_types, file_names, non_constant_identifier_names
import 'package:dice_app2/components/diceZone.dart';
import 'package:flutter/services.dart';
import '../Provider/totalDice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class bottom_navBar extends StatefulWidget {
  const bottom_navBar({super.key});
  @override
  State<bottom_navBar> createState() => _bottom_navBarState();
}

class _bottom_navBarState extends State<bottom_navBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 25, top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  //artır
                  context.read<diceList>().addDice(randomNumber());
                });
              },
              onLongPress: () {
                for (int i = 0; i < 10; i++) {
                  context.read<diceList>().addDice(randomNumber());
                }
              },
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey.shade900),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 54,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  //reroll
                  HapticFeedback.vibrate();
                  context.read<diceList>().reRollDice();
                });
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 7),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    shape: BoxShape.rectangle,
                    color: Colors.grey.shade900),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Row(
                      children: [
                        Center(
                          child: Text(
                            'Roll ${context.watch<diceList>().diceses.length} Dice',
                            style: const TextStyle(
                                color: Colors.white,
                                overflow: TextOverflow.fade),
                          ),
                        ),
                        const Icon(
                          Icons.refresh,
                          color: Colors.white,
                          size: 54,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  //azalt
                  int i = context.read<diceList>().diceses.length;
                  if (i > 1) {
                    i--;
                    context.read<diceList>().removeDice(0);
                  }
                });
              },
              onLongPress: () {
                for (int z = 0; z < 10; z++) {
                  int i = context.read<diceList>().diceses.length;
                  if (i > 1) {
                    context.read<diceList>().removeDice(0);
                  }
                }
              },
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey.shade900),
                child: const Icon(
                  Icons.remove,
                  color: Colors.white,
                  size: 54,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
