import 'package:flutter/cupertino.dart';

import 'Product_List.dart';

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

  List<ProductList> _productlist = [];
  List<ProductList> get productlists => _productlist;
  set productlists(List<ProductList> value) {
    _productlist = value;
  }

  bool _isLoading = true;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }


}
