import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:krishi_setu/homepage.dart';

class MarketplacePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MarketplacePageState();
}

class MarketplacePageState extends State<MarketplacePage> {
  int currentIndex = 0;
  var searchController = TextEditingController();


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
              child: Row(
                children: [
                  SizedBox(
                    width: 300,
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(

                      ),
                    ),
                  ),
                  Container(width: 60,
                    height: 50,

                    child: IconButton(onPressed: (){}, icon: Icon(Icons.search_rounded,color: Colors.white,)),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5),

                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(5),

              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                  onTap: (){},
                  child: Container(
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey
                      )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(

                              child: Image.asset("asset/images/tomato.png",),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Column(
                                children: [
                                  Text("Tomatoes"),
                                  StarRating(rating: 4,),
                                  Text("Good quality tomatoes are present here."),
                                  Text("All are grown using good seeds"),
                                  Text("State: Karnataka, District, Bengaluru"),
                                  Row(
                                    children: [
                                      Text("Price:Rs 30/Kg"),
                                      Text("Land: 5 Acres")
                                    ],
                                  )

                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
          )
        ],
      )
    );
  }
}