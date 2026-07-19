import 'package:axionkey/models/password_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PasswordProvider extends ChangeNotifier {
  final CollectionReference _dbReference =
      FirebaseFirestore.instance.collection('passwords');
  
  List<PasswordModel> _passwords = [];
  bool _isLoading = false;

  List<PasswordModel> get passwords => _passwords;
  bool get isLoading => _isLoading;

  PasswordProvider() {
    fetchPasswords();
  }

  Future<void> fetchPasswords() async {
    _isLoading = true;
    notifyListeners();

    try {
      final snapshot = await _dbReference.get();
      _passwords = snapshot.docs
          .map((doc) => PasswordModel.fromMap(doc.data() as Map<String, dynamic>, doc.id))
          .toList();
    } catch (e) {
      debugPrint("Error fetching passwords: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addPassword(PasswordModel password) async {
    try {
      await _dbReference.doc(password.id).set(password.toMap());
      _passwords.add(password);
      notifyListeners();
    } catch (e) {
      debugPrint("Error adding password: $e");
    }
  }

  Future<void> updatePassword(PasswordModel password) async {
    try {
      await _dbReference.doc(password.id).update(password.toMap());
      int index = _passwords.indexWhere((p) => p.id == password.id);
      if (index != -1) {
        _passwords[index] = password;
        notifyListeners();
      }
    } catch (e) {
      debugPrint("Error updating password: $e");
    }
  }

  Future<void> deletePassword(String id) async {
    try {
      await _dbReference.doc(id).delete();
      _passwords.removeWhere((p) => p.id == id);
      notifyListeners();
    } catch (e) {
      debugPrint("Error deleting password: $e");
    }
  }
}
