// ignore_for_file: non_constant_identifier_names
import 'package:dice_app2/Provider/totalDice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'mainBody.dart';
import 'package:flutter/services.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => counter(),
          ),
          ChangeNotifierProvider(
            create: (_) => diceList(),
          ),
        ],
        child: const MyApp(),
      )));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'dice rollar',
      home: mainBody(),
    );
  }
}
