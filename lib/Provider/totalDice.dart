// ignore_for_file: file_names, camel_case_types, non_constant_identifier_names

// Import package
import 'package:dice_app2/components/diceZone.dart';
import 'package:flutter/material.dart';

class counter with ChangeNotifier {
  int _TotalDice = 1;

  int get TotalDice => _TotalDice;

  void changer(int number) {
    _TotalDice = number;
    notifyListeners();
  }
}

class diceList with ChangeNotifier {
  final List<int> _diceses = [
    1,
  ];

  List get diceses => _diceses;

  int _totalDiceNumber = 1;

  int get totalDiceNumber => _totalDiceNumber;

  void addDice(item) {
    _diceses.add(item);
    totalDiceUpdater();
    notifyListeners();
  }

  void clearDiceses() {
    _diceses.clear();
    totalDiceUpdater();

    notifyListeners();
  }

  void removeDice(index) {
    _diceses.removeAt(index);
    totalDiceUpdater();

    notifyListeners();
  }

  void itemChange(int index, int newNumber) {
    _diceses[index] = newNumber;
    totalDiceUpdater();
    notifyListeners();
  }

  void reRollDice() {
    int c = _diceses.length;
    _diceses.clear();
    for (int i = 0; i < c; i++) {
      _diceses.add(randomNumber());
    }
    totalDiceUpdater();
    notifyListeners();
  }

  void totalDiceUpdater() {
    int sum = 0;
    for (int element in _diceses) {
      sum += element;
    }
    _totalDiceNumber = sum;
    notifyListeners();
  }
}
