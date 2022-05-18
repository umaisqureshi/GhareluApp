import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';

import 'package:gharelu_app/ModelClass/addressModel.dart';
import 'package:gharelu_app/ModelClass/user_model.dart';

import 'package:gharelu_app/Screens/GareluScreen/Screen/welcome_Screen.dart';
import 'package:gharelu_app/Services/Auth_service.dart';

import 'ModelClass/OrderModel.dart';
import 'package:gharelu_app/ModelClass/UserModel.dart';
import 'package:gharelu_app/ModelClass/locationModel.dart';

import 'package:provider/provider.dart';

import 'ModelClass/cartModel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MultiProvider(
      providers: [
        StreamProvider<UserModel>.value(value: Authentication().userStream),
        ChangeNotifierProvider.value(
          value: CardsProviders(),
        ),
        ChangeNotifierProvider.value(
          value: UserProvider(),
        ),
        ChangeNotifierProvider.value(
          value: Getlocation(),
        ),
        ChangeNotifierProvider.value(
          value: OrderProvider(),
        ),
        ChangeNotifierProvider.value(
          value: AddressProvider(),
        )
      ],
      child: MaterialApp(
        darkTheme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        title: 'Gharelu',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: WelcomeScreen(),
      ),
    );
  }
}
