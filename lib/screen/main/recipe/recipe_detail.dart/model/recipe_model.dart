// To parse this JSON data, do
//
//     final recipe = recipeFromJson(jsonString);

import 'dart:convert';

import 'package:bitarif/core/base/model/base_model.dart';
import 'package:bitarif/screen/authenticate/auth/model/bitarif_user.dart';

List<Recipe> recipeFromJson(String str) =>
    List<Recipe>.from(json.decode(str).map((x) => Recipe.fromJson(x)));

String recipeToJson(List<Recipe> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Recipe extends BaseModel {
  Recipe({
    this.id,
    this.user,
    this.category,
    this.difficulty,
    this.ingredients,
    this.title,
    this.desc,
    this.imageUrl,
    this.time,
    this.serving,
    this.likes,
    this.createdDate,
  });

  final int id;
  final BitarifUser user;
  final List<Category> category;
  final Difficulty difficulty;
  final List<Ingredient> ingredients;
  final String title;
  final String desc;
  final String imageUrl;
  final String time;
  final String serving;
  final int likes;
  final DateTime createdDate;

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        id: json["id"],
        user: BitarifUser().fromJson(json["user"]),
        category: List<Category>.from(
            json["category"].map((x) => Category.fromJson(x))),
        difficulty: Difficulty.fromJson(json["difficulty"]),
        ingredients: List<Ingredient>.from(
            json["ingredients"].map((x) => Ingredient.fromJson(x))),
        title: json["title"],
        desc: json["desc"],
        imageUrl: json["image_url"],
        time: json["time"],
        serving: json["serving"],
        likes: json["likes"],
        createdDate: DateTime.parse(json["created_date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user.toJson(),
        "category": List<dynamic>.from(category.map((x) => x.toJson())),
        "difficulty": difficulty.toJson(),
        "ingredients": List<dynamic>.from(ingredients.map((x) => x.toJson())),
        "title": title,
        "desc": desc,
        "image_url": imageUrl,
        "time": time,
        "serving": serving,
        "likes": likes,
        "created_date":
            "${createdDate.year.toString().padLeft(4, '0')}-${createdDate.month.toString().padLeft(2, '0')}-${createdDate.day.toString().padLeft(2, '0')}",
      };

  @override
  fromJson(Map<String, Object> json) => Recipe.fromJson(json);
}

class Category {
  Category({
    this.id,
    this.name,
    this.imageUrl,
  });

  final int id;
  final String name;
  final String imageUrl;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image_url": imageUrl,
      };
}

class Difficulty {
  Difficulty({
    this.id,
    this.name,
  });

  final int id;
  final String name;

  factory Difficulty.fromJson(Map<String, dynamic> json) => Difficulty(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Ingredient {
  Ingredient({
    this.id,
    this.quantity,
    this.name,
  });

  final int id;
  final Quantity quantity;
  final String name;

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        id: json["id"],
        quantity: Quantity.fromJson(json["quantity"]),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "quantity": quantity.toJson(),
        "name": name,
      };
}

class Quantity {
  Quantity({
    this.id,
    this.name,
    this.amount,
  });

  final int id;
  final String name;
  final String amount;

  factory Quantity.fromJson(Map<String, dynamic> json) => Quantity(
        id: json["id"],
        name: json["name"],
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "amount": amount,
      };
}
