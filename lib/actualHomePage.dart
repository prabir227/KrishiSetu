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
      appBar: AppBar(),
      body: Column(

        children: [
          Container(
            height: 540,
            child: Image.asset("asset/images/homeImage.png"),
          ),
          Row(
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
      )
    );
  }

}