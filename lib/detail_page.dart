import 'package:epsi_shop/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'product_model.dart';

class DetailPage extends StatelessWidget {
  final Product product;
  const DetailPage(this.product,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.nom),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              //alignment: Alignment.center,
              height: 180,
              child: Hero(
                  tag: product.nom,
                  child: Image.network(product.image)
              ),
            ),
            Text(product.nom,style: Theme.of(context).textTheme.headline6,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Description : ",style: Theme.of(context).textTheme.headline5,),
            ),
            Text(product.description,),
            // Display the rating using the getRating method from our product object
            Text("Rating :",style: Theme.of(context).textTheme.headline5,),
            product.getRating(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(product.displayPriceInEuro(),
                  style: Theme.of(context).textTheme.headline4
                      ?.copyWith(color: Colors.black),),
                  // Allow user to add an item in the cart directly from the detail page.
                  ElevatedButton(onPressed: (){context.read<CartModel>().add(product);}, child: Text("Acheter".toUpperCase()),)
              ],),

            ),
          ],
        ),
      ),
    );
  }
}