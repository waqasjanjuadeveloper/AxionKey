import 'dart:async';
import 'package:axionkey/screens/auth/login/login_screen.dart';
import 'package:axionkey/screens/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseAuth auth =FirebaseAuth.instance;
  
  
  void nextScreen()async{
    await Future.delayed(Duration(seconds: 3));
    if(auth.currentUser==null){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginScreen()),(value)=>false);
    }else{
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>MainScreen()), (value)=>false);

    }
  }
  @override
  void initState(){
      super.initState();
    nextScreen();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Image.asset('lib/assets/icons/icon.png',width: 150,height: 150,),
            SizedBox(height: 50,),
            Text('AxionKey',style: TextStyle(fontSize: 30,color: Colors.indigo),),
            Text('Secure Your Digital Life',style: TextStyle(fontSize: 20,color: Colors.black54),)
          ],
        )
      ),
    );
  }
}
