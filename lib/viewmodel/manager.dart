import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:secure_kare/model/projectmodel.dart';

class Maneger with ChangeNotifier {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;

  List<ProjectDetailsModel> project = [];
  Future fetchCompany() async {
    final snapshot = await db.collection('PROJECT').get();

    project = snapshot.docs.map((e) {
      return ProjectDetailsModel.fromJson(e.data());
    }).toList();





    



    // snapshot.listen((snapshot) {
    //   project = snapshot.docs.map((e) {
    //     return ProjectDetailsModel.fromJson(e.data() as Map<String, dynamic>);
    //   }).toList();
    // });
    // notifyListeners();
  }
    
    List<ProjectDetailsModel> projects = [];
    Future getprojects()async{
     final snapshot=await db.collection('PROJECT') .get();

    project= snapshot.docs.map((e){
      return ProjectDetailsModel.fromJson(e.data());
     }).toList();
    }
}
