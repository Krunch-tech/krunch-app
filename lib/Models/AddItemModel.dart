import 'dart:convert';

AddItemModel AddItemModelFromJson(String str) =>
    AddItemModel.fromJson(json.decode(str));

String AddItemModelToJson(AddItemModel data) => json.encode(data.toJson());

class AddItemModel {
  AddItemModel(
      {required this.name,
      required this.picture,
      required this.price,
      required this.date,
      this.tags,
      this.liked,
      required this.category,
      this.location});

  String? name;
  String? picture;
  String? price;
  DateTime? date;
  List<String>? tags;
  bool? liked;
  String? category;
  String? location;

  factory AddItemModel.fromJson(Map<String, dynamic> json) => AddItemModel(
      name: json["name"],
      picture: json["picture"],
      price: json["price"],
      date: json["date"],
      tags: json["tags"],
      liked: json["liked"],
      category: json["category"],
      location: json["location"]);

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
