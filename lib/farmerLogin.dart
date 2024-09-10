import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FarmerLoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => FarmerLoginPageState();

}
class FarmerLoginPageState extends State<FarmerLoginPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Login"),),
      body: Center(
        child: Text("Farmer Login"),
      ),
    );
  }

}