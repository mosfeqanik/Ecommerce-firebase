import 'package:flutter/cupertino.dart';

class Total extends ChangeNotifier{
  double total =0;

  resetTotal(){
    total=0;
  }

  increment(String price){
    total += double.parse(price);
    notifyListeners();
  }

  decrement(String price){
    total -= double.parse(price);
    notifyListeners();
  }
}
