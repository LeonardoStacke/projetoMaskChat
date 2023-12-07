import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:calculadora/models/user.dart';

class FirebaseProvider extends ChangeNotifier{
  List<UserModel>users = [];

  List<UserModel>getAllUsers(){
    FirebaseFirestore.instance
    .collection('users')
    .orderBy('lastActivate', descending: true)
    .snapshots(includeMetadataChanges: true)
    .listen((users) {
      this.users = users.docs
      .map((doc) => UserModel.fromJson(doc.data()))
      .toList();
      notifyListeners();
     });
     return users;
  }

  UserModel? getUserById(String userId){
    
  }
}

