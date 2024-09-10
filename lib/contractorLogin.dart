import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContractorLoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>ContractorLoginPageState();

}
class ContractorLoginPageState extends State<ContractorLoginPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Login"),),
      body: Center(
        child: Text("Contractor Login"),
      ),
    );
  }

}