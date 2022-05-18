import 'package:flutter/cupertino.dart';



class AddressProvider with ChangeNotifier {

  String address;
  void addAddress(String f , String useradress) {
    if (f == null) {
      address = useradress ;
  

    } else {
      address = f;
      notifyListeners();
    }
  }

  String get addressgetter {
    return address;
  }
}
