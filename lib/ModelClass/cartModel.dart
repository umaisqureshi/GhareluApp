import 'package:flutter/cupertino.dart';

class Cards {
  String image;

  String title;
  String subtitle;
  String price;
  String productId;
  int quantity;

  Cards(
      {this.title,
      this.price,
      this.subtitle,
      this.image,
      this.productId,
      this.quantity});
}

class CardsProviders with ChangeNotifier {
  Map<String, Cards> _items = {};

  Map<String, Cards> get items {
    return {..._items};
  }

  void addcart(String image, String title, String subtitle, String price,
      int quantity, String productId) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (value) => Cards(
            image: image,
            price: price,
            subtitle: subtitle,
            title: title,
            productId: productId,
            quantity: value.quantity + quantity),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => Cards(
            image: image,
            price: price,
            subtitle: subtitle,
            title: title,
            productId: productId,
            quantity: quantity),
      );
    }
    notifyListeners();
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, value) {
      total += double.parse(value.price) * value.quantity;
    });
    return total;
  }

  void clearCart() {
    _items = {};
  }
}
