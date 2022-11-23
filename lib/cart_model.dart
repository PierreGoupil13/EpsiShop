import 'package:flutter/cupertino.dart';

import 'product_model.dart';

class CartModel extends ChangeNotifier{
  List<Product> _lsProducts = [];

  add(Product product){
    _lsProducts.add(product);
    notifyListeners();
  }
  remove(Product product){
    _lsProducts.remove(product);
    notifyListeners();
  }
  getProducts() => _lsProducts;
  getCount() => _lsProducts.length;

  // Fonction qui nous donne la somme de notre panier
  getTotal(){
    num _somme = 0;
    for(int i = 0; i < _lsProducts.length; i++){
      _somme += _lsProducts[i].prix;
    }
    return _somme.roundToDouble();
  }
}