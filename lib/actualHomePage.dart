import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:krishi_setu/firestorelistview.dart';

class ActualHomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => ActualHomePageState();

}
class ActualHomePageState extends State<ActualHomePage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu), // Hamburger menu icon
          onPressed: () {
            // Handle menu press
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello Prabir',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600),),
            Text("Welcome Back",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.black54),),
          ],
        ), // Welcome text in the center
        actions: [
          IconButton(
            icon: Icon(Icons.notifications), // Notification icon
            onPressed: () {
              // Handle notification press
            },
          ),
        ],
        backgroundColor: Color(0xFFAEDC81),
      ),
      body: SingleChildScrollView(
        child: Column(
          
          children: [
            Container(
              color: Color(0xFFAEDC81),
              child: Column(
                children: [
                SizedBox(height: 10),
                Container(
                  child: FractionallySizedBox(
                    // widthFactor: 0.8, // Covers 80% of the screen width
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.all(6.0), // Padding around the container
                        decoration: BoxDecoration(
                          color: Colors.white, // Background color of the search bar
                          borderRadius: BorderRadius.circular(30), // Rounded corners
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2), // Shadow color
                              spreadRadius: 2, // Shadow spread radius
                              blurRadius: 5, // Shadow blur radius
                              offset: Offset(0, 2), // Shadow offset
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.search, // Search icon
                              color: Colors.grey, // Icon color
                              size: 20.0, // Icon size
                            ),
                            SizedBox(width: 12.0), // Space between icon and text field
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search...', // Placeholder text
                                  hintStyle: TextStyle(color: Colors.grey[600]), // Placeholder text color
                                  border: InputBorder.none, // No border for TextField
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                  SizedBox(height: 10),
                      ]
              ),

            ),

            Column(

              children: [

                SizedBox(height: 10),
                Container(
                  height: 167,decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage('asset/images/homeImage2.png'), // Replace with your image path
                    fit: BoxFit.cover, // Ensures sthe image covers the entire container
                  ),
                ),

                ),
                SizedBox(height: 20),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text("New Method of Agriculture",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600,),),
                ),
                SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(width: 5),
                      Container(
                        height: 350,
                        width: 280,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: AssetImage('asset/images/DashboardImage1.jpg'), // Replace with your image path
                            fit: BoxFit.cover, // Ensures sthe image covers the entire container
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        height: 350,
                        width: 280,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: AssetImage('asset/images/DashboardImage2.jpg'), // Replace with your image path
                            fit: BoxFit.cover, // Ensures sthe image covers the entire container
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        height: 350,
                        width: 280,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: AssetImage('asset/images/DashboardImage3.jpg'), // Replace with your image path
                            fit: BoxFit.cover, // Ensures sthe image covers the entire container
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        height: 350,
                        width: 280,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: AssetImage('asset/images/DashboardImage4.jpg'), // Replace with your image path
                            fit: BoxFit.cover, // Ensures sthe image covers the entire container
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                    ],
                  ),
                )
              ],
            ),
            Center(
              child: Row(
                children: [

                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      height: 80,
                      width: 190,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)
                              )
                          ),
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FirestoreListView()),
                            );
                          }, child: Text("Agreement List")),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      height: 80,
                      width: 190,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)
                              )
                          ),
                          onPressed: (){}, child: Text("pest and soil solution")),),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    height: 75,
                    width: 190,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)
                            )
                        ),
                        onPressed: (){}, child: Text("Cultivation Tips")),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    height: 75,
                    width: 190,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)
                        )
                      ),
                        onPressed: (){}, child: Text("Seed Export")),

                  ),
                )
              ],
            ),
          ],
        ),
      )
    );
  }

}