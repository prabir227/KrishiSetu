import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatRoom extends StatefulWidget {
  final String chatRoomId;
  final Map<String, dynamic> userMap;

  ChatRoom({required this.chatRoomId, required this.userMap});

  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  final TextEditingController _messageController = TextEditingController();
  final TextEditingController _negotiationController = TextEditingController();
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? currentUser = FirebaseAuth.instance.currentUser;
  bool isChatSelected = true; // For switching between "Chats" and "Negotiation"

  void sendMessage() {
    if (_messageController.text.isNotEmpty) {
      Map<String, dynamic> messages = {
        "sender": currentUser!.email,
        "message": _messageController.text,
        "time": FieldValue.serverTimestamp(),
        "type": "message",
      };

      _firestore
          .collection('chatroom')
          .doc(widget.chatRoomId)
          .collection('chats')
          .add(messages);

      _messageController.clear();
    }
  }

  void sendNegotiation() {
    if (_negotiationController.text.isNotEmpty) {
      Map<String, dynamic> messages = {
        "sender": currentUser!.email,
        "message": _negotiationController.text,
        "time": FieldValue.serverTimestamp(),
        "type": "negotiation",
      };

      _firestore
          .collection('chatroom')
          .doc(widget.chatRoomId)
          .collection('chats')
          .add(messages);

      // Update the 'price' document with the new amount
      DocumentReference priceRef = _firestore
          .collection('price')  // Assuming this is the collection for prices
          .doc('OFNWLCVvG7p1Dzv2M3Us');  // The document ID you provided

      _firestore.runTransaction((transaction) async {
        transaction.update(priceRef, {
          "current_price": messages,  // Update the current price with the negotiation amount
        });
      });

      _negotiationController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.userMap['name']),
      ),
      body: Stack(
        children: [
          // Chat messages section
          Positioned.fill(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 270),
                    child: StreamBuilder(
                      stream: _firestore
                          .collection('chatroom')
                          .doc(widget.chatRoomId)
                          .collection('chats')
                          .orderBy('time')
                          .snapshots(),
                      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          return ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              Map<String, dynamic> chatMap = snapshot.data!.docs[index]
                                  .data() as Map<String, dynamic>;

                              bool isNegotiation = chatMap['type'] == 'negotiation';

                              return Align(
                                alignment: chatMap['sender'] == currentUser!.email
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                                child: Container(
                                  constraints: BoxConstraints(maxWidth: 250), // Message box width limit
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 14),
                                  margin: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 8),
                                  decoration: BoxDecoration(
                                    color: isNegotiation ? Colors.green : Colors.blue,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    chatMap['message'],
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Chat & Negotiation tabs and the message input section
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    border: Border.all(color: Colors.grey.shade300, width: 1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // Shadow for the tabs
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isChatSelected = true; // Select "Chats"
                              FocusScope.of(context).unfocus(); // Dismiss keyboard
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            margin: EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: isChatSelected
                                      ? Colors.blue
                                      : Colors.transparent,
                                  width: 2.0,
                                ),
                              ),
                            ),
                            child: Text(
                              "Chats",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: isChatSelected
                                    ? Colors.blue
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      VerticalDivider(
                        color: Colors.grey.shade400,
                        thickness: 1.5,
                        width: 20,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isChatSelected = false; // Select "Negotiation"
                              FocusScope.of(context).unfocus(); // Dismiss keyboard
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: !isChatSelected
                                      ? Colors.blue
                                      : Colors.transparent,
                                  width: 2.0,
                                ),
                              ),
                            ),
                            child: Text(
                              "Negotiation",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: !isChatSelected
                                    ? Colors.blue
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  child: isChatSelected
                      ? Container(
                    color: Colors.white, // Set background color to white
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8.0, bottom: 8.0, top: 0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _messageController,
                            decoration: InputDecoration(
                              labelText: 'Type a message',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        SizedBox(width: 8),
                        IconButton(
                          icon: Icon(Icons.send),
                          onPressed: () {
                            sendMessage();
                            FocusScope.of(context).unfocus(); // Dismiss keyboard after sending
                          },
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  )
                      : Container(
                    color: Colors.white, // Set background color to white
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8.0, bottom: 8.0, top: 0),
                    child: Column(
                      children: [
                        StreamBuilder(
                          stream: _firestore
                              .collection('price')
                              .doc('OFNWLCVvG7p1Dzv2M3Us')
                              .snapshots(),
                          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                            if (!snapshot.hasData) {
                              return Center(child: CircularProgressIndicator());
                            } else {
                              Map<String, dynamic> priceMap = snapshot.data!.data() as Map<String, dynamic>;

                              return Container(
                                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),  // Add padding
                                margin: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,  // Center the text in the row
                                  children: [// Add money icon  // Spacing between icon and text
                                    Text(
                                      'Current price: ${priceMap['current_price']['message']}',
                                      style: TextStyle(
                                        fontSize: 25,  // Larger font size
                                        fontWeight: FontWeight.bold,  // Bold text
                                        color: Colors.black,  // Text color
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,  // Centers the buttons
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                // Handle Accept action
                                print("accepted bro");

                                // Assuming you have the necessary details
                                String personEmail = widget.userMap['email'];
                                String cropName = "Wheat"; // Example crop name
                                Map<String, dynamic> priceMap = (await _firestore.collection('price').doc('OFNWLCVvG7p1Dzv2M3Us').get()).data() as Map<String, dynamic>;
                                // print(priceMap['current_price']['message']);
                                String price = priceMap['current_price']['message'];
                                // String price = "200";
                                String quantity = "100"; // Example quantity

                                // Create a map with the contract details
                                Map<String, dynamic> contractDetails = {
                                  "personEmail": personEmail,
                                  "cropName": cropName,
                                  "price": price,
                                  "quantity": quantity,
                                  "timestamp": FieldValue.serverTimestamp(),
                                };

                                // Store the contract details in Firestore
                                await _firestore.collection('contract_details').add(contractDetails);

                                // Clear the negotiation controller
                                _negotiationController.clear();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,  // Green background for Accept
                                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),  // Increased width and height
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),  // Rounded corners
                                ),
                                // Margin for the bottom
                                elevation: 0, // Removes shadow effect
                              ),
                              child: const Text(
                                'Accept',
                                style: TextStyle(
                                  color: Colors.white,  // Text color
                                  fontSize: 18,  // Font size
                                  fontWeight: FontWeight.bold,  // Bold text
                                ),
                              ),
                            ),
                            SizedBox(width: 20),  // Space between buttons
                            ElevatedButton(
                              onPressed: () {
                                // Handle Reject action
                                print("print pressed reject wala button");
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,  // Red background for Reject
                                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),  // Increased width and height
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),  // Rounded corners
                                ),
                                // Bottom margin
                              ),
                              child: Text(
                                'Reject',
                                style: TextStyle(
                                  color: Colors.white,  // Text color
                                  fontSize: 18,  // Font size
                                  fontWeight: FontWeight.bold,  // Bold text
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10)  ,// Bottom margin of 10px
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _negotiationController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: 'Enter amount',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            IconButton(
                              icon: Icon(Icons.send),
                              onPressed: () {
                                sendNegotiation();
                                FocusScope.of(context).unfocus(); // Dismiss keyboard after sending
                              },
                              color: Colors.blue,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}