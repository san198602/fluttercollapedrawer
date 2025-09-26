// ignore_for_file: file_names
import 'package:flutter/material.dart';

class Navigationprovider extends ChangeNotifier {
  bool _isCollapsed = false;
  bool get isCollapse => _isCollapsed;

  void toggleIsCollapased() {
    _isCollapsed = !_isCollapsed;
    notifyListeners();
  }
}
