import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:krishi_setu/run.dart';
import 'Dummy_sender.dart';
import 'package:url_launcher/url_launcher.dart';
import 'firestorelistview.dart'; // Import the FirstPage here

class SecondPage extends StatefulWidget {
  final String email;
  final String name;
  final String price;
  final String quantity;
  final String crop_type;

  SecondPage(
      {required this.email,
        required this.name,
        required this.price,
        required this.quantity,
        required this.crop_type});

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  // State variables for checkboxes
  bool _isChecked1 = false;
  bool _isChecked2 = false;
  bool _isChecked3 = false;

  Future<void> _finalize() async {
    // Get a reference to Firestore
    final firestore = FirebaseFirestore.instance;

    // Create a document in the 'contracts' collection
    try {
      await firestore.collection('contracts').add({
        'email': widget.email,
        'name': widget.name,
        'price': widget.price,
        'quantity': widget.quantity,
        'crop_type': widget.crop_type,
        'timestamp': FieldValue.serverTimestamp(), // Add a timestamp for reference
      });
      // Navigate back to FirstPage after finalizing
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => FirestoreListView()),
      );
    } catch (e) {
      // Handle errors, if any
      print('Error adding document: $e');
    }
  }

  // Function to open URL
  void _launchTerms() async {
    const url = 'https://docs.google.com/document/d/1XneS-26JSBIXiR6-xr525sKFSx1tlaY4gvEAM71e5gE/edit?usp=sharing'; // Replace with your actual terms and conditions URL
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contracts'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.center,
                child: Image.asset(
                  'asset/images/emblem.jpeg', // Correct path to your image asset
                  height: 200, // Adjust as needed
                  width: 200, // Adjust as needed
                ),
              ),
            ),
            Expanded(flex: 1, child: Text('Government of India')),
            Expanded(flex: 1, child: Text('Contract Farming Agreement')),
            Expanded(flex: 1, child: Text('Agreement between Farmer and Contractor')),
            Expanded(
              flex: 2,
              child: Text(
                  'for use when a stipulated price forms the basic payment and to be used only with the general conditions of the contract'),
            ),
            Expanded(
              flex: 1,
              child: Text('By Farmer1 and Between ${widget.name}, ${widget.quantity} KG at ₹ ${widget.price}'),
            ),

            // First row with a checkbox and text
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Checkbox(
                    value: _isChecked1,
                    onChanged: (bool? newValue) {
                      setState(() {
                        _isChecked1 = newValue!;
                      });
                    },
                  ),
                  GestureDetector(
                    onTap: _launchTerms, // Open the terms link when tapped
                    child: Text(
                      'I have read and understood the terms',
                      style: TextStyle(
                        color: Colors.blue, // Indicate it's a clickable link
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Second row with a checkbox and text
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Checkbox(
                    value: _isChecked2,
                    onChanged: (bool? newValue) {
                      setState(() {
                        _isChecked2 = newValue!;
                      });
                    },
                  ),
                  Text(
                    'The details I filled are correct.',
                    style: TextStyle(
                      color: _isChecked2 ? Colors.green : Colors.black, // Text color changes based on checkbox state
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Checkbox(
                    value: _isChecked3,
                    onChanged: (bool? newValue) {
                      setState(() {
                        _isChecked3 = newValue!;
                      });
                    },
                  ),
                  Text(
                    'Do you want moderator our side',
                    style: TextStyle(
                      color: _isChecked3 ? Colors.green : Colors.black, // Text color changes based on checkbox state
                    ),
                  ),
                ],
              ),
            ),
            // Finalize Button
            Expanded(
              flex: 1,
              child: ElevatedButton(
                onPressed: () {
                  // Show a confirmation dialog
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Finalize'),
                        content: Text('Are you sure you want to finalize?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close dialog
                            },
                            child: Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close dialog
                              _finalize(); // Call the finalize function
                            },
                            child: Text('Finalize'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Finalize'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}