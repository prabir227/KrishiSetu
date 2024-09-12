import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget{
  final int user;
  LoginPage({required this.user});
  @override
  State<StatefulWidget> createState() => LoginPageState(user);

}
class LoginPageState extends State<LoginPage>{
  bool user=true;
  LoginPageState(int user){
    if(user==2) this.user=false;
  }
  var userController= TextEditingController();
  var passController= TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                                        child: user?Image.asset("asset/images/kisan.png"):Image.asset("asset/images/contractor.png"),
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
          Container(
            width: 350,
            child: Column(

            mainAxisSize: MainAxisSize.min,
              children: [
                Text("Email or phone number"),
                TextField(
                  controller: userController,
                  decoration: InputDecoration(
                    hintText: "Type here...",
                    prefixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.email_outlined,),
                        Text("|")
                      ],
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    )

                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 350,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Password"),
                TextField(
                  controller: userController,
                  decoration: InputDecoration(
                      hintText: "Type here...",
                      prefixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.keyboard_alt_outlined,),
                          Text("|")
                        ],
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      )

                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(onPressed: (){}, child: Text("Forgot Password?"))
                  ],
                )
              ],
            ),
          ),
          ElevatedButton(onPressed: (){},
              child: Text("LOGIN",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 21),),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff1A6158),
                minimumSize: Size(300,0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)
                )
              ),

          ),
          Text("or login with"),
          OutlinedButton(onPressed: (){}, child: FaIcon(
            FontAwesomeIcons.google
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account?"),
              TextButton(onPressed: (){}, child: Text("Sign Up"))
            ],
          )

        ],
      ),


    );
  }

}