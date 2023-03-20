import 'package:flutter/material.dart';

//random olarak zarın oluşturulduğu yer
class Rdice extends StatefulWidget {
  final int wichDice;
  const Rdice({super.key, required this.wichDice});

  @override
  State<Rdice> createState() => _RdiceState();
}

class _RdiceState extends State<Rdice> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Image.asset(
      'images/dice${widget.wichDice}.png',
      color: Colors.black,
    ));
  }
}
