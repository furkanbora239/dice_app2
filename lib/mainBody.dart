// ignore_for_file: file_names, camel_case_types

import 'package:dice_app2/components/diceZone.dart';
import 'package:dice_app2/components/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/bottom_navBar.dart';
import 'Provider/totalDice.dart';

class mainBody extends StatelessWidget {
  const mainBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: sideMenu(),
      ),
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title:
            Text('Dice Roller (${context.watch<diceList>().totalDiceNumber})'),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: const diceZone(),
      bottomNavigationBar: const bottom_navBar(),
    );
  }
}
