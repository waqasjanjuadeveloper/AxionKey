import 'package:axionkey/models/onboarding_model.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingModel data;
  const OnboardingPage({
    super.key, required this.data
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(data.image,height: 250,),
          SizedBox(height: 30,),
          Center(child: Text(data.title,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.fromLTRB(25,0,25,0),
            child: Center(child: Text(data.description,style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal),)),
          )
        ],
      ),
    );
  }
}
