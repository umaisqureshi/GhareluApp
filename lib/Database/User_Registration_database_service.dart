import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService(this.uid);

  final CollectionReference userDatabase =
      FirebaseFirestore.instance.collection('User_Detail');

  Future CreateUserData(String name, String phone, String address) async {
    return await userDatabase
        .doc(uid)
        .set({'name': name, 'phone': phone, 'address': address, 'Uid': uid});
  }
}

class OrderData {
  final CollectionReference orderDatabase =
      FirebaseFirestore.instance.collection('Orders');

  Future SubmitOrder(
      String productId,
      String name,
      String venderId,
      String cost,
      int quantity,
      String imageurl,
      String status,
      String userId,
      String address,
      String productname,
      String phone,
      double lati,
      double longi,
      int venderNumber) async {
    return await orderDatabase.add({
      'productId': productId,
      'venderId': venderId,
      'name': name,
      'Cost': cost,
      'Quantity': quantity,
      'Image': imageurl,
      'status': status,
      'UserId': userId,
      'Address': address,
      'ProductName': productname,
      'Phone': phone,
      'Latitude': lati,
      'Longitude': longi,
      'VenderNumber': venderNumber,
      'id': ""
    }).then((value) {
      print(value.id);
      FirebaseFirestore.instance
          .collection('Orders')
          .doc(value.id)
          .update({"id": value.id});
    });
  }
}
