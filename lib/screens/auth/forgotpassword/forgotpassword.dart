import 'package:axionkey/screens/theme/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  bool loading=false;
  TextEditingController email= TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FirebaseAuth auth=FirebaseAuth.instance;

  void sendResetPassword() async{
    setState(() {
      loading=true;
    });
     await auth.sendPasswordResetEmail(email: email.text);
    if(mounted){
      Navigator.pushReplacementNamed(context, '/login');
    }
    setState(() {
      loading=false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading? Center(child: CircularProgressIndicator(),):Form(
        key: formKey,
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(height: 60,),
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: AppColors.primaryColor,
                    child: Icon(Icons.lock_reset,color: AppColors.whiteColor,size: 60),
                  ),
                  SizedBox(height: 50,),
                  Text('Forgot Password',style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  SizedBox(
                    width: 320,
                    child: Text('Enter a email address associated with your wallet to receive a secure recovery link.',style: TextStyle(fontSize: 14,color: Colors.grey.shade600),),
                  ),
                  SizedBox(height: 40,),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16,0,0,0),
                        child: _buildLabel('Email Address')),],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      controller: email,
                      validator: ((value) {
                        if(value==null||value.isEmpty){
                          return 'Please enter reset email';
                        }
                            return null;
                      }
                        ),
                      keyboardType: TextInputType.emailAddress,
                      autovalidateMode: AutovalidateMode.onUnfocus,
                      decoration: InputDecoration(
                        hintText: 'Enter your email',
                        prefixIcon: Icon(Icons.email_outlined),
                      ),

                    ),
                  ),
                  SizedBox(height: 60,),
                  SizedBox(
                      height: 56,
                    child: ElevatedButton(
                      onPressed: (){
                        if(formKey.currentState!.validate()){
                          sendResetPassword();
                        }
                      },
                      child: Text('Send Reset Link',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: AppColors.whiteColor),)),
                  ),
                  SizedBox(height: 20,),
                  TextButton(
                    onPressed: (){
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.arrow_back,color: Colors.grey.shade500,),
                        SizedBox(width: 6,),
                        Text('Back to Login',style: TextStyle(color: AppColors.blackColor,fontSize: 18),)
                      ]
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildLabel(String text){
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.blackColor
      ),
    );
  }
}
