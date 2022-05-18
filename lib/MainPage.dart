import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:gharelu_app/Screens/Cart/Cart.dart';
import 'package:gharelu_app/Screens/Explore/Explore.dart';
import 'package:gharelu_app/Screens/Home/Home.dart';


class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentindex;

  @override
  void initState() {
    super.initState();
    currentindex = 0;
  }

  changepage(int index) {
    setState(() {
      currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BubbleBottomBar(
          elevation: 50,
          opacity: 0.6,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
          backgroundColor: Colors.blue.withOpacity(0.6),
          currentIndex: currentindex,
          hasInk: true,
          inkColor: Colors.white,
          hasNotch: true,
          onTap: changepage,
          items: <BubbleBottomBarItem>[
            BubbleBottomBarItem(
                backgroundColor: Color(0xff0f54a3),
                icon: Icon(
                  Icons.home_outlined,
                  color: Color(0xff0f54a3),
                ),
                activeIcon: Icon(
                  Icons.home_outlined,
                  color: Colors.white,
                ),
                title: Text(
                  "Home",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                )),
            BubbleBottomBarItem(
                backgroundColor: Color(0xff0f54a3),
                icon: Icon(
                  Icons.explore,
                  color: Color(0xff0f54a3),
                ),
                activeIcon: Icon(
                  Icons.explore,
                  color: Colors.white,
                ),
                title: Text(
                  "Explore",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                )),
            BubbleBottomBarItem(
                backgroundColor: Color(0xff0f54a3),
                icon: Icon(
                  Icons.shopping_cart,
                  color: Color(0xff0f54a3),
                ),
                activeIcon: Icon(
                  Icons.local_offer,
                  color: Colors.white,
                ),
                title: Text(
                  "Cart",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                )),
          ],
        ),
        body: (currentindex == 0)
            ? Container(color: Colors.white, child: Homepage())
            : currentindex == 1
                ? Container(color: Colors.blue, child: ExplorePage())
                : currentindex == 2
                    ? Container(child: AddToCart())
                    : currentindex);
  }
}
