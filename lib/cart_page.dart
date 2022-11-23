import 'package:epsi_shop/cart_model.dart';
import 'package:epsi_shop/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    CartModel _lsReadCart = context.watch<CartModel>();
    return Scaffold(
      appBar: AppBar(title: Text("Panier EpsiShop")),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text("Votre panier contient ${_lsReadCart.getCount()} élément",
                style: Theme.of(context).textTheme.headline6,
              ),
              Expanded(
                /* The ListView uses the Cart that is passed with the provider and
                draw it with the number of items in the cart, the total amount, and an option
                to delete an item from the cart.
                I used the watch() function for the amount and the number of item so that it
                changes dynamicly with the item deleted from the cart.
                 */
                child: ListView.builder(
                  itemCount: context.watch<CartModel>().getCount(),
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Image.network(_lsReadCart.getProducts()[index].image,
                        width: 80,height: 80,),
                      title: Text(_lsReadCart.getProducts()[index].nom),
                      subtitle: Text(_lsReadCart.getProducts()[index].categorie),
                      // Dynamicly delete an item from the cart.
                      trailing: IconButton(onPressed:()
                          {_lsReadCart.remove(_lsReadCart.getProducts()[index]);},
                          icon: Icon(Icons.delete)),
                    );
                  }
                ),
              ),

              Text("Votre panier total est de : ${context.watch<CartModel>().getTotal()} €",
                style: Theme.of(context).textTheme.headline6,
              )

            ],
          ),
        ),
      ),
    );
  }
}
