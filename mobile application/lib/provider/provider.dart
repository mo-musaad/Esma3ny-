import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  static int _pageNumber = 0;

  static int get pageNumber => _pageNumber;

  void changePageNumber({required int pageNum}) {
    _pageNumber = pageNum;
    print(_pageNumber);
    notifyListeners();
  }
}
