import 'package:axionkey/models/password_model.dart';
import 'package:axionkey/providers/password_provider.dart';
import 'package:axionkey/screens/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditPassword extends StatefulWidget {
  const EditPassword({super.key});

  @override
  State<EditPassword> createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
  bool _ispasswordvisible = false;
  bool loading = false;
  bool deleting = false;

  TextEditingController website = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController note = TextEditingController();
  String? documentId;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final Map<String, dynamic>? args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    if (args != null && documentId == null) {
      documentId = args['id'];
      website.text = args['website'] ?? '';
      email.text = args['email'] ?? '';
      password.text = args['password'] ?? '';
      note.text = args['note'] ?? '';
    }
  }

  void updateData() async {
    if (documentId == null) return;

    setState(() {
      loading = true;
    });

    final updatedPassword = PasswordModel(
      id: documentId!,
      website: website.text,
      email: email.text,
      password: password.text,
      note: note.text,
    );

    await context.read<PasswordProvider>().updatePassword(updatedPassword);

    setState(() {
      loading = false;
    });
    if (mounted) Navigator.pop(context);
  }

  void deleteData() async {
    if (documentId == null) return;

    setState(() {
      deleting = true;
    });

    await context.read<PasswordProvider>().deletePassword(documentId!);

    setState(() {
      deleting = false;
    });
    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Edit Credentials'),
          backgroundColor: Colors.indigo,
          actions: [
            IconButton(
              onPressed: deleting ? null : () => _showDeleteDialog(),
              icon: deleting 
                ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                : const Icon(Icons.delete_outline, color: Colors.white),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20,),
              const Center(
                child: CircleAvatar(
                  backgroundColor: AppColors.primaryColor,
                  radius: 60,
                  child: Icon(Icons.edit_note, size: 60, color: Colors.white),
                ),
              ),
              const SizedBox(height: 20,),
              const Text('Update Entry', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
              const Text('Keep your digital accounts updated', style: TextStyle(fontSize: 18,),),
              const SizedBox(height: 20,),
              
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Row(
                  children: const [
                    Text('Website / App Name', style: TextStyle(fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextFormField(
                  controller: website,
                  decoration: const InputDecoration(
                    hintText: 'e.g Facebook',
                    prefixIcon: Icon(Icons.language_rounded)
                  ),
                ),
              ),
              
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Row(
                  children: const [
                    Text('User name / Email', style: TextStyle(fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextFormField(
                  controller: email,
                  decoration: const InputDecoration(
                      hintText: 'user@example.com',
                      prefixIcon: Icon(Icons.person_outline)
                  ),
                ),
              ),
              
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Row(
                  children: const [
                    Text('Password', style: TextStyle(fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextFormField(
                  controller: password,
                  obscureText: !_ispasswordvisible,
                  decoration: InputDecoration(
                    hintText: '*******',
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _ispasswordvisible
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                      ),
                      onPressed: () {
                        setState(() {
                          _ispasswordvisible = !_ispasswordvisible;
                        });
                      },
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Row(
                  children: const [
                    Text('Notes', style: TextStyle(fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextFormField(
                  controller: note,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    hintText: 'Add notes...',
                  ),
                ),
              ),
              
              const SizedBox(height: 30,),
              SizedBox(
                height: 56,
                width: 300,
                child: loading 
                  ? const Center(child: CircularProgressIndicator(),) 
                  : ElevatedButton.icon(
                      onPressed: updateData,
                      icon: const Icon(Icons.check_circle_outline),
                      label: const Text('Update Credentials', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                    ),
              ),
              const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }

  void _showDeleteDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Entry'),
        content: const Text('Are you sure you want to delete this password entry?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              deleteData();
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      )
    );
  }
}
