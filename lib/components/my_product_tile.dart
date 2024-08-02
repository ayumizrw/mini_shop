import 'package:flutter/material.dart';
import 'package:minimal_shop/models/product.dart';
import 'package:provider/provider.dart';

import '../models/shop.dart';

class MyProduct extends StatelessWidget {
  Product product;

  MyProduct({super.key, required this.product});

  void addToCart(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text("去诶当年那个添加到购物车吗？"),
              actions: [
                MaterialButton(
                    child: Text("Cancel"),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                MaterialButton(
                    child: Text("Yes"),
                    onPressed: () {
                      Navigator.pop(context);

                      context.read<Shop>().addToCart(product);
                    })
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25),
      width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(12)),
                  child: Icon(Icons.factory),
                  width: double.infinity,
                  padding: const EdgeInsets.all(25),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                product.name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                product.description,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\¥' + product.price.toStringAsFixed(2),
                style: TextStyle(fontSize: 25),
              ),
              Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(12)),
                  child: IconButton(
                      onPressed: () => addToCart(context),
                      icon: Icon(Icons.add))),
            ],
          ),
        ],
      ),
    );
  }
}
