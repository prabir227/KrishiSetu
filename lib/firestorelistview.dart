import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreListView extends StatefulWidget {
  @override
  _FirestoreListViewState createState() => _FirestoreListViewState();
}

class _FirestoreListViewState extends State<FirestoreListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("contracts",)),
      body: StreamBuilder<QuerySnapshot>(
        // Fetching the collection from Firestore
        stream: FirebaseFirestore.instance.collection('contracts').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          // Fetch the documents from Firestore and map them to a list
          final List<DocumentSnapshot> documents = snapshot.data!.docs;

          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              // Extracting data from each document
              final Map<String, dynamic> data = documents[index].data() as Map<String, dynamic>;
              String contractorName = data['name'];
              String crop = data['crop_type'];
              String price = data['price'];
              String quantity = data['quantity'];

              // Returning each ListTile with an icon
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 110,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                      color: Color(0xffAEDC81)
                  ),
                  child: Container(



                    child: ListTile(
                      leading: Column(

                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 25,
                            child: Image.asset("asset/images/contractor.png"),
                          ),
                        ],
                      ),  // Icon on the left side
                      title: Text(contractorName),       // Contractor name
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Crop: $crop"),
                          Text("Price: $price"),
                          Text("Quantity: $quantity"),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
