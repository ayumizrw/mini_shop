import 'package:flutter/material.dart';
import 'package:minimal_shop/components/my_button.dart';
import 'package:minimal_shop/models/shop.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {


  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        title: Text("购物车"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Expanded(
              child: cart.isEmpty? const Center(child: Text("购物车是空的。。")):ListView.builder(
                  itemCount: cart.length,
                  itemBuilder: (context, index) {
                    var item = cart[index];
                    return ListTile(
                      title: Text(item.name),
                      subtitle: Text(item.price.toStringAsFixed(2)),
                      trailing: IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () => removeItemFromCart(context, item),
                      ),
                    );
                  })),


          Padding(
            padding: const EdgeInsets.all(50.0),
            child:MyButton(onTap:() =>payButtonPressed(context), child: Text("Pay Now",))
          ),
        ],
      ),
    );
  }

  removeItemFromCart(BuildContext context, Product item) {
    showDialog<void>(
      context: context,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('提示'),
          content: Text('是否删除商品'),
          actions: <Widget>[
            TextButton(
              child: Text('Yes'),
              onPressed: () {
                Navigator.of(dialogContext).pop();
                context
                    .read<Shop>()
                    .removeFromCart(item); // Dismiss alert dialog
              },
            ),
            TextButton(
              child: Text(
                'No',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Dismiss alert dialog
              },
            ),
          ],
        );
      },
    );
  }

  payButtonPressed(BuildContext context) {
    showDialog<void>(
      context: context,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('title'),
          content: Text('现在支付'),
          actions: <Widget>[
            MaterialButton(
              child: Text('是的'),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Dismiss alert dialog
              },
            ),
          ],
        );
      },
    );
  }
}
