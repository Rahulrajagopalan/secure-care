import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:secure_kare/model/report_model.dart';

class UserReportService with ChangeNotifier {
  final db = FirebaseFirestore.instance;
  final  auth = FirebaseAuth.instance;
  String id = randomAlphaNumeric(10);
  Future addUserreports(Reports userreportModel, uid, id) async {
    final doc = db.collection("Reports").doc(id);

    doc.set(userreportModel.toJson(doc.id));
  }


  List<Reports> rprot = [];
  Future getreport()async{
   final snapshot=await db.collection('Reports')
   .where('reportid',isEqualTo: auth.currentUser!.uid)
   .get();
     

    rprot= snapshot.docs.map((e){
      return Reports.fromJson(e.data());
     }).toList();

  }
}
// 
