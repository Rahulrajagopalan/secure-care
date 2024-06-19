import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:secure_kare/model/agentmodel.dart';
import 'package:secure_kare/model/managermodel.dart';
import 'package:secure_kare/model/report_model.dart';
import 'package:secure_kare/model/workersmodel.dart';

class PoliceControler with ChangeNotifier {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;

  List<Reports> userreport = [];
  Future fetchCompleint(String status) async {
    final snapshot = await db
        .collection('Reports')
        .where('reportstatus', isEqualTo: status)
        .get();

    userreport = snapshot.docs.map((e) {
      return Reports.fromJson(e.data());
    }).toList();
  }

  List<ManagerModel> maneger = [];
  Future getManeger() async {
    final snapshot = db.collection('MANAGER').snapshots();

    snapshot.listen((event) {
      maneger = event.docs.map((e) {
        return ManagerModel.fromJson(e.data());
      }).toList();
    });
  }

  List<WorkersModel> worker = [];
  Future acceptedworkers() async {
    final snapshot = db.collection('ACCEPTED WORKERS').snapshots();

    snapshot.listen((event) {
      worker = event.docs.map((e) {
        return WorkersModel.fromJson(e.data());
      }).toList();
    });
  }

  List<AgentModel> agent = [];
  Future getAgent() async {
    final snapshot = db.collection('AGENT').snapshots();

    snapshot.listen((event) {
      agent = event.docs.map((e) {
        return AgentModel.fromJson(e.data());
      }).toList();
    });
  }
}
