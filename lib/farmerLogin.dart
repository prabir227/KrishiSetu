import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FarmerLoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => FarmerLoginPageState();

}
class FarmerLoginPageState extends State<FarmerLoginPage>{
  var userController= TextEditingController();
  var passController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                AppBar(backgroundColor: Colors.transparent,),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Color(0xffA5A5A5)
                    )
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 65,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Color(0xffDFDFDF)
                          )
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                                        child: Image.asset("asset/images/kisan.png"),
                                        radius: 60,
                                      ),
                      )),
                )
              ],
            ),
            height: 300,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xffB9E591),Colors.white],
                begin: Alignment.center,
                end: Alignment.bottomCenter
              )
            ),
          ),
          Text("Welcome back! Glad",style: TextStyle(color: Color(0xff266116), fontSize: 26,fontWeight: FontWeight.bold),),
          Text("to see you , Again!",style: TextStyle(color: Color(0xff266116), fontSize: 26,fontWeight: FontWeight.bold),),
          TextField(
            controller: userController,
            decoration: InputDecoration(
              hintText: "Type here...",
              prefixIcon: Icon(Icons.email_outlined,),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
              )

            ),
          )

        ],
      ),


    );
  }

}