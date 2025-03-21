// To parse this JSON data, do
//
//     final cart = cartFromJson(jsonString);

import 'dart:convert';

List<Cart> cartFromJson(String str) => List<Cart>.from(json.decode(str).map((x) => Cart.fromJson(x)));

String cartToJson(List<Cart> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cart {
    int? id;
    int? userId;
    DateTime? date;
    List<Prod>? products;
    int? v;

    Cart({
        this.id,
        this.userId,
        this.date,
        this.products,
        this.v,
    });

    factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json["id"],
        userId: json["userId"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        products: json["products"] == null ? [] : List<Prod>.from(json["products"]!.map((x) => Prod.fromJson(x))),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "date": date?.toIso8601String(),
        "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
        "__v": v,
    };
}

class Prod {
    int? productId;
    int? quantity;

    Prod({
        this.productId,
        this.quantity,
    });

    factory Prod.fromJson(Map<String, dynamic> json) => Prod(
        productId: json["productId"],
        quantity: json["quantity"],
    );

    Map<String, dynamic> toJson() => {
        "productId": productId,
        "quantity": quantity,
    };
}
