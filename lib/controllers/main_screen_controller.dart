import 'package:flutter/material.dart';

class MainScreenNotifier extends ChangeNotifier {
  int _pageIndex = 0;
  bool _isCartClicked = false;

  int get pageIndex => _pageIndex;
  bool get isCartClicked => _isCartClicked;

  set pageIndex(int index) {
    _pageIndex = index;
    notifyListeners();
  }

  set isCartClicked(bool value) {
    _isCartClicked = value;
    notifyListeners();
  }
}
