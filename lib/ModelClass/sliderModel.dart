import 'dart:convert';

List<Items> itemsFromJson(String str) =>
    List<Items>.from(json.decode(str).map((x) => Items.fromJson(x)));

String itemsToJson(List<Items> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Items {
  Items({
    this.image,
    this.title,
  });

  String image;
  String title;

  factory Items.fromJson(Map<String, dynamic> json) => Items(
        image: json["image"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "title": title,
      };
}
