import 'package:flutter/material.dart';
import 'package:krishi_setu/DummyChatPage.dart';

import 'ChatRoom.dart';

class ProductDetailPage extends StatefulWidget {
  final Map<String, String> item;

  ProductDetailPage({required this.item});

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {

  String getChatRoomId(String user1, String user2) {
    if (user1.compareTo(user2) > 0) {
      return "$user1\_$user2";
    } else {
      return "$user2\_$user1";
    }
  }
  bool showAllImages = false;

  // Example farm images list
  final List<String> farmImages = [
    "asset/images/farm1.jpg",
    "asset/images/farm2.jpg",
    "asset/images/farm3.jpg",
    "asset/images/farm4.jpeg",
    "asset/images/farm5.jpg",
    "asset/images/farm6.jpg",
    "asset/images/farm7.jpg",
    "asset/images/farm8.jpg",
    "asset/images/farm9.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    final int initialImageCount = 6;
    final bool showViewMoreButton = farmImages.length > initialImageCount;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item['name']!),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Rounded Image Section
              ClipRRect(
                borderRadius: BorderRadius.circular(15), // Make the main image rounder
                child: Container(
                  height: 200,
                  width: double.infinity,
                  child: Image.asset(
                    widget.item["image"]!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 10),
              // Name and Price
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.item["name"]!,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "₹ ${widget.item['price']}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 5),
              // Rating
              Row(
                children: [
                  Icon(Icons.star, color: Colors.orange, size: 20),
                  Text(
                    widget.item["rating"]!,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 10),
              // Description
              Text(
                widget.item["description"]!,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              // Owner Details
              Text(
                "Owner Details",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              // Owner name and View Profile button in the same line
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Navjot Singh Sidhu", // Hardcoded example name
                    style: TextStyle(fontSize: 16),
                  ),
                  // "View Profile" Button - Rounded and green
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Color(0xffAEDC81), // Green color
                      borderRadius: BorderRadius.circular(10), // Rounded corners
                    ),
                    child: Text(
                      "View Profile",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              // Land Details
              Text(
                "Land Details",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                "Land: ${widget.item['land']}",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 5),
              Text(
                "Location: ${widget.item['state']}",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              // Grid of Land Images (3 images per row)
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 3 images per row
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1, // Keep images square
                ),
                itemCount: showAllImages ? farmImages.length : initialImageCount,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(15), // Make the land images rounder
                    child: Image.asset(farmImages[index], fit: BoxFit.cover),
                  );
                },
              ),
              if (showViewMoreButton && !showAllImages)
                Center(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        showAllImages = true; // Show all images when clicked
                      });
                    },
                    child: Text("View More", style: TextStyle(fontSize: 16)),
                  ),
                ),
              SizedBox(height: 10),
              // Related Crops Section (with horizontal scroll and rounded borders)
              Text(
                "Related Crops",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Container(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    relatedCropImage("asset/images/onions.jpg"),
                    relatedCropImage("asset/images/potatoes.jpg"),
                    relatedCropImage("asset/images/tomato.jpg"),
                    relatedCropImage("asset/images/oranges.jpg"),
                    relatedCropImage("asset/images/cucumber.jpg"),
                  ],
                ),
              ),
              SizedBox(height: 10),
              // Soil Quality Section with additional padding
              Text(
                "Soil Quality",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10), // Increased padding
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  soilQualityItem(Icons.thermostat, "Soil Temp"),
                  soilQualityItem(Icons.air, "Wind"),
                  soilQualityItem(Icons.water_drop, "Precipitation"),
                  soilQualityItem(Icons.grass, "Soil Moisture"),
                ],
              ),
              SizedBox(height: 20),
              // Chat and Deal Buttons with less-rounded corners and white text
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        String user1="abcd1234@gmail.com";
                        String user2="prabirghosh227@gmail.com";
                        String chatRoomId = getChatRoomId(user1, user2);
                        Map<String, dynamic> userMap = {
                          'email': user2,
                          'name': user2.split('@')[0],
                          'uid': 'some_user_id',
                        };
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatRoom(
                              chatRoomId: chatRoomId,
                              userMap: userMap,
                            ),
                          ),
                        );
                      },
                      child: Text(
                        "Chat",
                        style: TextStyle(color: Colors.white), // White text
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5), // Less rounder corners
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Make a Deal",
                        style: TextStyle(color: Colors.white), // White text
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5), // Less rounder corners
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to create the related crop image with rounded corners
  Widget relatedCropImage(String imagePath) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Image.asset(
          imagePath,
          width: 80,
          height: 80,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // Helper method for creating Soil Quality items
  Widget soilQualityItem(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, size: 30),
        SizedBox(height: 5), // Added padding for better spacing
        Text(label),
      ],
    );
  }
}
