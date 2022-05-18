import 'package:flutter/cupertino.dart';

class Order {
  String name, venderId, productId, username;
  int quantity, vendernumber;

  Order(
      {this.productId,
      this.name,
      this.venderId,
      this.username,
      this.quantity,
      this.vendernumber});
}

class OrderProvider with ChangeNotifier {
  Map<String, Order> _order = {};
  Map<String, Order> get order {
    return {..._order};
  }

  void addOrder(String name, String venderId, String productId, int quantity,
      int vendernumber) {
    _order.putIfAbsent(
        productId,
        () => Order(
            productId: productId,
            venderId: venderId,
            name: name,
            quantity: quantity,
            vendernumber: vendernumber));
  }

  notifyListeners();
}
