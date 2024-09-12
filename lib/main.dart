import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:krishi_setu/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KrishiSetu',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff1A6158)),
        useMaterial3: true,
      ),
      home: const UserSelectPage(title: "This is user selection page"),
    );
  }
}

class UserSelectPage extends StatefulWidget {
  const UserSelectPage({super.key, required this.title});

 

  final String title;

  @override
  State<UserSelectPage> createState() => MyHomeState();
}

class MyHomeState extends State<UserSelectPage>{
  bool fCheck=false;
  bool cCheck=false;
  int pageRoute=0;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: FractionalOffset(0.5,0.7),
              colors: [Color(0xff76C92B),Color(0xffffffff)],

            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Text("LOGO",style: TextStyle(fontSize: 24),),
            flex: 125,),
            Expanded(child: Text("Choose Your Category",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Color(0xff266116)),),flex:63),
            Expanded(child: Text("Select one option from below",style: TextStyle(fontSize: 15),),flex:32),
            Expanded(
              child: InkWell(
                child: Container(
                  child: CircleAvatar(
                    radius: 70,
                    child: Image.asset("asset/images/kisan.png"),
                  ),
                ),onTap: (){
                  setState(() {
                    cCheck=false;
                    fCheck=true;
                    pageRoute=1;
                  });
              },
              ),flex: 219,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                 children: fCheck? <Widget>[
                   Text("Farmer",style: TextStyle(color: Color(0xff1A6158),fontSize: 20,fontWeight: FontWeight.bold),),
                   SizedBox(width: 10,),
                   Icon(Icons.check_circle_rounded,
                   color: Color(0xff1A6158),)
                 ]: <Widget>[Text("Farmer",style: TextStyle(fontSize: 20,color: Colors.grey),)],
              ),flex: 50,
            ),
            Expanded(
              child: InkWell(
                child: Container(
                  child: CircleAvatar(
                    radius: 70,
                    child: Image.asset("asset/images/contractor.png"),
                  ),
                ),onTap: (){
                  setState(() {
                    cCheck=true;
                    fCheck=false;
                    pageRoute=2;
                  });
              },
              ),flex: 219,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: cCheck? <Widget>[
                  Text("Contractor",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color(0xff1A6158)),),
                  SizedBox(width: 10,),
                  Icon(Icons.check_circle_rounded,
                    color: Color(0xff1A6158),)
                ]:<Widget>[Text("Contractor",style: TextStyle(fontSize: 20,color: Colors.grey),)],
              ),flex: 50,
            ),
            Expanded(child: SizedBox(),flex: 69,),
            Expanded(child: pageRoute<=0?OutlinedButton(onPressed: (){},
                child: Text("NEXT",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 21),),
              style:OutlinedButton.styleFrom(
                minimumSize: Size(300, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)
                )
              )
            ):ElevatedButton(onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage(user: pageRoute)));
            },
              child: Text("NEXT",style: TextStyle(fontSize: 21,color: Colors.white),),

              style: ElevatedButton.styleFrom(backgroundColor: Color(0xff1A6158),
                minimumSize: Size(300, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)
                )
              ),

            ),
              flex: 63,),
            Expanded(
              child: SizedBox(),
              flex: 110,)
          ],
        ),

      ),
    );
  }
  
}
