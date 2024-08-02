
import 'package:flutter/material.dart';
import 'package:minimal_shop/models/product.dart';

class Shop extends ChangeNotifier{
     final List<Product> _shop =[
       Product("Product 1", 99.99, "Product 1 escription"),
       Product("Product 2", 123.43, "Product 1 escription"),
       Product("Product 3", 91.19, "Product 1 escription"),
       Product("Product 4", 199, "Product 1 escription")
     ];

     List<Product> _cart =[];

     //商品
     List<Product> get shop => _shop;

     //购物列表
     List<Product> get cart => _cart;

     void addToCart(Product item){
       _cart.add(item);
       notifyListeners();
     }

     void removeFromCart(Product item){
       _cart.remove(item);
       notifyListeners();
     }

}