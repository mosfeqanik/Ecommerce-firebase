import 'package:flutter/cupertino.dart';

class EcommerceProvider extends ChangeNotifier {
  bool _isObscure = true;

  bool get isObscure => _isObscure;
  set isObscure(bool value) {
    _isObscure = value;
    notifyListeners();
  }

  bool _isEditButtonClicked = true;

  bool get isEditButtonClicked => _isEditButtonClicked;

  set isEditButtonClicked(bool value) {
    _isEditButtonClicked = value;
    notifyListeners();
  }

  int _dotPosition = 0;

  int get dotPosition => _dotPosition;
  set dotPosition(int value) {
    _dotPosition = value;
    notifyListeners();
  }
}
