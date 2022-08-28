import 'package:flutter/material.dart';

class ScrollOffset with ChangeNotifier {
  double _offset = 0.0;

  void updateOffset(double newOffset) {
    _offset = newOffset;
    notifyListeners();
  }

  double get offsetValue {
    return _offset;
  }
}
