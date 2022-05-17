import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  late String source;
  void updateSource(String newSource) {
    source = newSource;
    notifyListeners();
  }
}
