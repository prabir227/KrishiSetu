import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:krishi_setu/actualHomePage.dart';
import 'package:krishi_setu/communitypage.dart';
import 'package:krishi_setu/home_page.dart';
import 'package:krishi_setu/marketplace.dart';
import 'package:krishi_setu/profile_page.dart';

class HousePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HousePageState();
}

class HousePageState extends State<HousePage> {
  int currentIndex = 0;

  // List of widgets for the corresponding tabs
  final pages = [
    ActualHomePage(),
    CommunityPage(),
    MarketplacePage(),
    HomePage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],  // Displaying the current page based on the selected index
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;  // Set the new index and rebuild the widget
          });
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: Color(0xffAEDC81),
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xffAEDC81),
            icon: Icon(Icons.forum),
            label: "Community",
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xffAEDC81),
            icon: Icon(Icons.storefront_outlined),
            label: "Marketplace",
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xffAEDC81),
            icon: Icon(Icons.shopping_basket_outlined),
            label: "Mandi",
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xffAEDC81),
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),

    );
  }
}
