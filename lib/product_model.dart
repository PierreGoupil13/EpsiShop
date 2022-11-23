import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Product{
  String nom;
  String description;
  num prix;
  String image;
  String categorie;
  num rating;

  Product(this.nom, this.description, this.prix, this.image, this.categorie, this.rating);

  //{
  // "id":1,
  // "title":"Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
  // "price":109.95,
  // "description":"Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
  // "category":"men's clothing",
  // "image":"https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
  // "rating":{"rate":3.9,"count":120}
  // }
  Product.fromJson(Map<String,dynamic> json)
    : nom = json["title"],
      description = json["description"],
      prix = json["price"] ,
      image = json["image"],
      categorie = json["category"],
      // I added the rating field
      rating = json["rating"]["rate"];


  String displayPriceInEuro() => "$prix €";

  //String displayRating() => "$rating";

  /* Method that use the RatingBar Widget and display the rating from the Json file
   in form of stars. */
  getRating(){
    return RatingBar.builder(
      initialRating: rating.toDouble(),
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) =>
      const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
         // We don't need to have an action executed when the rating is modified
      },
    );
  }

}