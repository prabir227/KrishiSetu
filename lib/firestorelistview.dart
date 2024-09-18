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
      appBar: AppBar(
        title: Text('Contract details'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        // Fetching the collection from Firestore
        stream: FirebaseFirestore.instance.collection('yourCollectionName').snapshots(),
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
              String contractorName = data['contractor_name'];
              String crop = data['crop'];
              String price = data['price'];
              String quantity = data['quantity'];

              // Returning each ListTile with an icon
              return ListTile(
                leading: Icon(Icons.agriculture),  // Icon on the left side
                title: Text(contractorName),       // Contractor name
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Crop: $crop"),
                    Text("Price: $price"),
                    Text("Quantity: $quantity"),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
