import 'package:flutter/material.dart';
import 'package:minimal_shop/components/my_drawer.dart';
import 'package:minimal_shop/components/my_product_tile.dart';
import 'package:minimal_shop/models/shop.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;

    return Scaffold(
      appBar: AppBar(
        title: Text("Shop购物"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(onPressed: () => Navigator.pushNamed(context, "/cart_page"), icon: Icon(Icons.card_travel))
        ],
      ),
      drawer: MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        children: [
          const SizedBox(
            height: 25,
          ),
          //shop title
          Center(
              child: Text(
            "商店,选择商品",
            style:
                TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
          )),
          //shop subtitle

          //product list
          SizedBox(
            height: 550,
            child: ListView.builder(
                itemCount: products.length,
                padding: const EdgeInsets.all(25),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var product = products[index];
                  return MyProduct(product: product);
                }),
          ),
        ],
      ),
    );
  }
}
