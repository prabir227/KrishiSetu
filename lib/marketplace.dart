import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:krishi_setu/homepage.dart';

class MarketplacePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MarketplacePageState();
}

class MarketplacePageState extends State<MarketplacePage> {
  int currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Marketplace'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index; // Call setState to update the index
          });
        },
        backgroundColor: Color(0xffAEDC81), // Background color for the navigation bar
        selectedItemColor: Color(0xff266116), // Color for the selected item
        unselectedItemColor: Colors.black, // Color for unselected items
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
            label: "Profile", // Capitalized for consistency
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 50,
              child: Container(width: 60,

                child: Icon(Icons.search_rounded,
                color: Colors.white,),
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(5),

              ),
            ),
          )
        ],
      )
    );
  }
}