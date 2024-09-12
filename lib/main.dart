import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:krishi_setu/login.dart';
void main() {
  runApp(const MyApp());  // Runs the app
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // The root widget of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KrishiSetu',  // Sets the title of the app
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff1A6158)),  // Sets primary theme color
        useMaterial3: true,  // Enables Material 3 UI components
      ),
      home: const UserSelectPage(title: "This is user selection page"),  // The default page when the app starts
    );
  }
}

class UserSelectPage extends StatefulWidget {
  const UserSelectPage({super.key, required this.title});

  final String title;  // Title property for the page

  @override
  State<UserSelectPage> createState() => MyHomeState();  // Creates state for UserSelectPage
}

class MyHomeState extends State<UserSelectPage> {
  bool fCheck = false;  // Tracks if 'Farmer' is selected
  bool cCheck = false;  // Tracks if 'Contractor' is selected
  int pageRoute = 0;  // Tracks which page to route to (0: none, 1: Farmer, 2: Contractor)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,  // Full height of the screen
        width: double.infinity,  // Full width of the screen
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,  // Start gradient at top center
            end: FractionalOffset(0.5, 0.7),  // End gradient at 50% width and 70% height
            colors: [Color(0xff76C92B), Color(0xffffffff)],  // Gradient colors (green to white)
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,  // Centers the column's content vertically
          children: [
            Expanded(
              child: Text("LOGO", style: TextStyle(fontSize: 24)),  // Displays the "LOGO" text
              flex: 125,  // Sets the flex for this expanded widget
            ),
            Expanded(
              child: Text(
                "Choose Your Category",  // Instructional text
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xff266116)),
              ),
              flex: 63,  // Flex value to control the space it takes
            ),
            Expanded(
              child: Text("Select one option from below", style: TextStyle(fontSize: 15)),  // Instruction text
              flex: 32,
            ),
            Expanded(
              child: InkWell(
                child: Container(
                  child: CircleAvatar(
                    radius: 70,  // Radius for circular image/avatar
                    child: Image.asset("asset/images/kisan.png"),  // Farmer image
                  ),
                ),
                onTap: () {
                  // When farmer option is tapped
                  setState(() {
                    cCheck = false;  // Deselects contractor
                    fCheck = true;  // Selects farmer
                    pageRoute = 1;  // Set route to Farmer login
                  });
                },
              ),
              flex: 219,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,  // Centers the row horizontally
                children: fCheck
                    ? <Widget>[
                  Text(
                    "Farmer",  // Farmer text when selected
                    style: TextStyle(color: Color(0xff1A6158), fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),  // Spacing between text and icon
                  Icon(
                    Icons.check_circle_rounded,  // Checkmark icon when Farmer is selected
                    color: Color(0xff1A6158),
                  ),
                ]
                    : <Widget>[Text("Farmer", style: TextStyle(fontSize: 20, color: Colors.grey))],  // Gray text when Farmer is not selected
              ),
              flex: 50,
            ),
            Expanded(
              child: InkWell(
                child: Container(
                  child: CircleAvatar(
                    radius: 70,  // Radius for circular image/avatar
                    child: Image.asset("asset/images/contractor.png"),  // Contractor image
                  ),
                ),
                onTap: () {
                  // When contractor option is tapped
                  setState(() {
                    cCheck = true;  // Selects contractor
                    fCheck = false;  // Deselects farmer
                    pageRoute = 2;  // Set route to Contractor login
                  });
                },
              ),
              flex: 219,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,  // Centers the row horizontally
                children: cCheck
                    ? <Widget>[
                  Text(
                    "Contractor",  // Contractor text when selected
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xff1A6158)),
                  ),
                  SizedBox(width: 10),  // Spacing between text and icon
                  Icon(
                    Icons.check_circle_rounded,  // Checkmark icon when Contractor is selected
                    color: Color(0xff1A6158),
                  ),
                ]
                    : <Widget>[Text("Contractor", style: TextStyle(fontSize: 20, color: Colors.grey))],  // Gray text when Contractor is not selected
              ),
              flex: 50,
            ),
            Expanded(child: SizedBox(), flex: 69),  // Empty space
            Expanded(
              child: pageRoute <= 0
                  ? OutlinedButton(
                onPressed: () {},  // Disabled next button when no option is selected
                child: Text(
                  "NEXT",
                  style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 21),
                ),
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(300, 0),  // Minimum size for the button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),  // Rounded corners
                  ),
                ),
              )
            ):ElevatedButton(onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage(user: pageRoute)));
            },
              child: Text("NEXT",style: TextStyle(fontSize: 21,color: Colors.white),),

              style: ElevatedButton.styleFrom(backgroundColor: Color(0xff1A6158),
                minimumSize: Size(300, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)
                )

              ),
              flex: 63,
            ),
            Expanded(
              child: SizedBox(),  // Empty space
              flex: 110,
            ),
          ],
        ),
      ),
    );
  }
}
