import 'package:axionkey/models/password_model.dart';
import 'package:axionkey/providers/password_provider.dart';
import 'package:axionkey/screens/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddPassword extends StatefulWidget {
  const AddPassword({super.key});

  @override
  State<AddPassword> createState() => _AddPasswordState();
}

class _AddPasswordState extends State<AddPassword> {
  bool _ispasswordvisible = false;
  bool loading = false;
  TextEditingController website = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController note = TextEditingController();

  void addData() async {
    setState(() {
      loading = true;
    });
    
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    final newPassword = PasswordModel(
      id: id,
      website: website.text,
      email: email.text,
      password: password.text,
      note: note.text,
    );

    await context.read<PasswordProvider>().addPassword(newPassword);

    setState(() {
      loading = false;
    });
    if (mounted) Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add Password'),
          backgroundColor: Colors.indigo,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Center(
                child: CircleAvatar(
                  backgroundColor:AppColors.primaryColor,
                  radius: 60,
                  child: Icon(Icons.shield_outlined,size: 60,color: Colors.white),
                ),
              ),
              SizedBox(height: 20,),
              Text('New Credentials',style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
              Text('Add a secure entry to your digital account',style: TextStyle(fontSize: 18,),),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Row(
                  children: [
                    Text('Website /App Name',style: TextStyle(fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextFormField(
                  controller: website,
                  keyboardType: TextInputType.name,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value){
                    if(value==null||value.isEmpty){
                      return 'Please enter website name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'e.g Facebook',
                    prefixIcon: Icon(Icons.language_rounded)
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Row(
                  children: [
                    Text('User name/Email',style: TextStyle(fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextFormField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value){
                    if(value==null||value.isEmpty){
                      return 'Please enter email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: 'user@example.com',
                      prefixIcon: Icon(Icons.person_outline)
                  ),
                ),
              ),SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Row(
                  children: [
                    Text('Password',style: TextStyle(fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextFormField(
                  controller: password,
                  keyboardType: TextInputType.visiblePassword,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value){
                    if(value==null||value.isEmpty){
                      return 'Please enter password';
                    }
                    return null;
                  },
                  obscuringCharacter: '*',
                  obscureText: !_ispasswordvisible,
                  decoration: InputDecoration(
                      hintText: '*******',
                      prefixIcon: Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _ispasswordvisible
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                      ),
          
                        onPressed: (){
                        setState(() {
                          _ispasswordvisible=!_ispasswordvisible;
                        });
                        },
                  ),
                ),
              ),
          
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Row(
                  children: [
                    Text('Notes',style: TextStyle(fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextFormField(
                  controller: note,
                  keyboardType: TextInputType.multiline,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value){
                    if(value==null||value.isEmpty){
                      return 'Please enter notes';
                    }
                    return null;
                  },
                  maxLines: 6,
                  decoration: InputDecoration(
                      hintText: 'Add yours Security questions,recovery codes....',
                  ),
          
                ),
              ),
              SizedBox(height: 30,),
              SizedBox(
                height: 56,
                child: loading?Center(child: CircularProgressIndicator(),):ElevatedButton.icon(
                    onPressed: () {
                      addData();
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.verified_outlined),
                    label: Text('Save Credentials ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
