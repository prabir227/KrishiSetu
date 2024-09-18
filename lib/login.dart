import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:krishi_setu/ReusableWidgets.dart';
import 'package:krishi_setu/homepage.dart';
import 'package:krishi_setu/signUp.dart';
import 'package:krishi_setu/home_page.dart'; // Import the homepage file
import 'package:krishi_setu/marketplace.dart';

// The main LoginPage widget that takes 'user' as a parameter
class LoginPage extends StatefulWidget {
  final int user;
  // Constructor requires the 'user' parameter
  LoginPage({required this.user});

  @override
  State<StatefulWidget> createState() => LoginPageState(user);
}

// State class for the LoginPage
class LoginPageState extends State<LoginPage> {
  final FirebaseAuth authInstance = FirebaseAuth.instance;

  // Constructor that sets the user type
  LoginPageState(int user) {
    if (user == 2) this.user = false;
  }

  // Controllers for handling text input in text fields
  final userController = TextEditingController();
  final passController = TextEditingController();

  // Boolean to differentiate between two types of users
  bool user = true;

  // Function to handle login
  Future<void> logIn() async {
    try {
      UserCredential userCredential = await authInstance.signInWithEmailAndPassword(
        email: userController.text,
        password: passController.text,
      );
      // If login is successful, navigate to the homepage
      if (userCredential.user != null) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HousePage()),
              (Route<dynamic> route) => false,// Replace with your homepage widget
        );
      }
    } catch (e) {
      // Handle error
      print("Error logging in: $e");
      // Optionally show an alert or error message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed. Please try again.')),
      );
    }
  }

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
              "Welcome back! Glad",
              style: TextStyle(
                color: Color(0xff266116),
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "to see you, Again!",
              style: TextStyle(
                color: Color(0xff266116),
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 50),

            // Email or phone number input field
            reusableTextField("Email or phone number", Icon(Icons.email_outlined), userController),

            SizedBox(height: 30),

            // Password input field
            Container(
              width: 324,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  reusableTextField("Password", Icon(Icons.keyboard_alt_outlined), passController),
                  // Forgot password link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text("Forgot Password?"),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Login button
            ElevatedButton(
              onPressed: () {
                logIn(); // Call the login function
              },
              child: Text(
                "LOGIN",
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
            Text("or login with"),
            SizedBox(height: 8),
            OutlinedButton(
              onPressed: () {},
              child: FaIcon(FontAwesomeIcons.google),
            ),

            // Sign-up option
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SignUpPage(user: user)),
                    );
                  },
                  child: Text("Sign Up"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
