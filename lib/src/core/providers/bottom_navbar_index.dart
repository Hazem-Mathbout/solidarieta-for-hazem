import 'package:flutter/material.dart';

class BottomNavbarIndex extends ChangeNotifier {
  int _currentIndex = 1;
  getCurrentIndex() => _currentIndex;

  updateCurrentIndex(int newIndex) {
    _currentIndex = newIndex;
    notifyListeners();
  }
}
