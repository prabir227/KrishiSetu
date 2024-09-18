import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:krishi_setu/homepage.dart';

class MarketplacePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MarketplacePageState();
}

class MarketplacePageState extends State<MarketplacePage> {
  var searchController = TextEditingController();

  // List of items to display with diverse details
  final List<Map<String, String>> items = [
    {"name": "Tomatoes", "image": "asset/images/tomato.png", "price": "30/Kg", "land": "5 Acres", "description": "Fresh, juicy tomatoes grown organically.", "rating": "4.5", "state": "Karnataka, Bengaluru"},
    {"name": "Potatoes", "image": "asset/images/potatoes.jpg", "price": "25/Kg", "land": "6 Acres", "description": "Starchy and versatile, perfect for all dishes.", "rating": "4.2", "state": "Uttar Pradesh, Kanpur"},
    {"name": "Onions", "image": "asset/images/onions.jpg", "price": "20/Kg", "land": "4 Acres", "description": "Crisp and aromatic onions for your kitchen.", "rating": "4.0", "state": "Maharashtra, Nashik"},
    {"name": "Carrots", "image": "asset/images/carrots.jpeg", "price": "40/Kg", "land": "3 Acres", "description": "Sweet and crunchy carrots, ideal for salads.", "rating": "4.7", "state": "Himachal Pradesh, Shimla"},
    {"name": "Bananas", "image": "asset/images/banana.jpg", "price": "15/Kg", "land": "7 Acres", "description": "Ripe and nutritious bananas for a healthy snack.", "rating": "4.3", "state": "Kerala, Thrissur"},
    {"name": "Oranges", "image": "asset/images/oranges.jpg", "price": "35/Kg", "land": "8 Acres", "description": "Juicy oranges with a tangy flavor, freshly picked.", "rating": "4.8", "state": "Madhya Pradesh, Indore"},
    {"name": "Mangoes", "image": "asset/images/mangoes.jpg", "price": "50/Kg", "land": "10 Acres", "description": "Sweet and aromatic mangoes, the king of fruits.", "rating": "4.3", "state": "Maharashtra, Ratnagiri"},
    {"name": "Wheat", "image": "asset/images/wheat.jpg", "price": "40/Kg", "land": "20 Acres", "description": "High-quality wheat for your daily bread.", "rating": "4.1", "state": "Punjab, Amritsar"},
    {"name": "Rice", "image": "asset/images/rice.jpg", "price": "45/Kg", "land": "25 Acres", "description": "Basmati rice with a rich aroma and long grains.", "rating": "4.4", "state": "West Bengal, Kolkata"},
    {"name": "Apples", "image": "asset/images/apples.jpeg", "price": "60/Kg", "land": "12 Acres", "description": "Crisp and sweet apples, perfect for any occasion.", "rating": "4.2", "state": "Jammu & Kashmir, Srinagar"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Marketplace'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 50,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      ),
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 50,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.search_rounded, color: Colors.white),
                    ),
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
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: items.map((item) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10), // Adjust the radius as needed
                              child: Container(
                                width: 120, // Adjust width
                                height: 120, // Adjust height
                                child: Image.asset(
                                  item["image"]!,
                                  fit: BoxFit.cover, // Ensures the image fits without padding
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(item["name"]!,
                                      style: TextStyle(fontWeight: FontWeight.bold)),
                                  StarRating(
                                    rating: double.parse(item["rating"]!),
                                    color: Colors.orange,
                                    size: 20.0, // Size of the stars
                                  ),
                                  SizedBox(height: 4), // A small space between the rating and description
                                  Text(item["description"]!,
                                      style: TextStyle(fontSize: 14)),
                                  Text("State: ${item["state"]}",
                                      style: TextStyle(fontSize: 12)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Price: Rs ${item["price"]}",
                                          style: TextStyle(fontSize: 12)),
                                      Text("Land: ${item["land"]}",
                                          style: TextStyle(fontSize: 12)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}