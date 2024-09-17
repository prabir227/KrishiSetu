import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:krishi_setu/ReusableWidgets.dart';
import 'package:krishi_setu/marketplace.dart';

// The main LoginPage widget that takes 'user' as a parameter
class SignUpPage extends StatefulWidget {
  final bool user;
  // Constructor requires the 'user' parameter
  SignUpPage({required this.user});

  @override
  State<StatefulWidget> createState() => SignUpPageState(user);
}

// State class for the LoginPage
class SignUpPageState extends State<SignUpPage> {
  // Boolean to differentiate between two types of users

  bool user = true;

  // Constructor that sets the user type
  SignUpPageState(bool user) {
    this.user = user;
  }

  // Controllers for handling text input in text fields
  var userController = TextEditingController();
  var passController = TextEditingController();
  var usernameController = TextEditingController();
  var passverifController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scrollable page content
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top container with AppBar and user avatar
            Container(
              height: 250,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xffB9E591), Colors.white],
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                children: [
                  // Transparent AppBar
                  AppBar(
                    backgroundColor: Colors.transparent,
                  ),
                  // Circular avatar with image based on user type
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Color(0xffA5A5A5),
                      ),
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 65,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Color(0xffDFDFDF)),
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 60,
                          // Display different images for different user types
                          child: user
                              ? Image.asset("asset/images/kisan.png")
                              : Image.asset("asset/images/contractor.png"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Welcome text
            Text(
              "Create your account",
              style: TextStyle(
                color: Color(0xff266116),
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20,),
            reusableTextField("Username", Icon(Icons.person), usernameController),

            SizedBox(height: 27),

            // Email or phone number input field
            reusableTextField("Email or phone number", Icon(Icons.email_outlined), userController),

            SizedBox(height: 27),

            // Password input field
            Container(
              width: 324,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  reusableTextField("Password", Icon(Icons.keyboard_alt_outlined), passController),
                  // Forgot password link
                ],
              ),
            ),
            SizedBox(height: 27,),
            reusableTextField("Reenter password", Icon(Icons.keyboard_alt_outlined), passverifController),

            SizedBox(height: 20),

            // Login button
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MarketplacePage()),
                );
              },
              child: Text(
                "Proceed",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 21,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff1A6158),
                minimumSize: Size(320, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),

            SizedBox(height: 10),

            // Social login option
            // Sign-up option
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?"),
                TextButton(
                  onPressed: () {},
                  child: Text("Log In"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
