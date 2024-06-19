import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secure_kare/model/Assign_work.dart';
import 'package:secure_kare/model/agentmodel.dart';
import 'package:secure_kare/model/managermodel.dart';
import 'package:secure_kare/model/report_model.dart';
import 'package:secure_kare/model/usermodel.dart';
import 'package:secure_kare/model/workersmodel.dart';
import 'package:secure_kare/view/admin/admin_login.dart';

class AdminController with ChangeNotifier {
  int selectedIndex = 0;
  final auth = FirebaseAuth.instance;
  final myAuth = EmailOTP();

  changeIndex(index) {
    selectedIndex = index;
    notifyListeners();
  }

  //  ------------Auth

  // Future emailotp(context, email) async {
  //   try {
  //     await myAuth.setConfig(
  //         appEmail: "Firebasehub@gmail.com",
  //         appName: "OTP VERIFICATION",
  //         userEmail: email,
  //         otpLength: 6,
  //         otpType: OTPType.digitsOnly);
  //     myAuth.sendOTP();
  //     if (await myAuth.sendOTP() == true) {
  //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //         content: Text("OTP has been sent"),
  //       ));
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //         content: Text("Oops, OTP send failed"),
  //       ));
  //     }
  //   } catch (error) {
  //     log(error.toString());
  //   }
  // }

  // verifyOTP(context, String otp, UserModel userModel, passowrd) async {
  //   if (await myAuth.verifyOTP(otp: otp) == true) {
  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //       content: Text("OTP is verified"),
  //     ));
  //     await signUp(userModel.email!.trim(), passowrd, context).then((value) {

  //     });
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //       content: Text("Invalid OTP"),
  //     ));
  //   }
  // } //          Screen USER signup (signup with google)

  Future<UserCredential?> signUp(email, password, context) async {
    try {
      return auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error.toString()),
      ));
    }
  }

  //-------------------Data Base
  final db = FirebaseFirestore.instance;

  Future addUser(UserModel userModel, uid) async {
    final doc = db.collection("USER").doc(uid);

    doc.set(userModel.toJson(uid));
  }

  Future addAgent(AgentModel agentModel, uid) async {
    final doc = db.collection("AGENT").doc(uid);

    doc.set(agentModel.toJson(uid));
  }

//  ----------------USER
  List<UserModel> userList = [];
  getAllUserData() async {
    final snapshot = await db.collection("USER").get();
    userList = snapshot.docs.map((e) => UserModel.fromJson(e.data())).toList();
  }

  deleteUser(id) async {
    await db.collection("USER").doc(id).delete();
    notifyListeners();
  }

  //   -----------AGENT

  List<AgentModel> agentList = [];
  getAllAgentsData() async {
    final snapshot = await db.collection("AGENT").get();
    agentList =
        snapshot.docs.map((e) => AgentModel.fromJson(e.data())).toList();
  }

  deleteAgent(id) async {
    await db.collection("AGENT").doc(id).delete();
    notifyListeners();
  }

  //--------------MANAGER
  List<ManagerModel> managerList = [];
  getAllManagersData() async {
    final snapshot = await db.collection("MANAGER").get();
    managerList =
        snapshot.docs.map((e) => ManagerModel.fromJson(e.data())).toList();
  }

  deleteManager(id) async {
    await db.collection("MANAGER").doc(id).delete();
    notifyListeners();
  }

  // Eployees
  List<WorkersModel> listOfPendingWorkers = [];
  Future<List<WorkersModel>> getPendingEMployees() async {
    final snapshot = await db.collection("NEW WORKERS").get();

    return listOfPendingWorkers =
        snapshot.docs.map((e) => WorkersModel.fromJson(e.data())).toList();
  }

  Future rejectNewWorker(id) async {
    db.collection("NEW WORKERS").doc(id).delete();
  }

  Future acceptNewWorker(WorkersModel workersModel, context) async {
    try {
      auth
          .createUserWithEmailAndPassword(
              email: workersModel.workersemail!,
              password: workersModel.workerspassword!)
          .then((value) async {
        await db
            .collection("ACCEPTED WORKERS")
            .doc(value.user!.uid)
            .set(workersModel.toJson(value.user!.uid))
            .then((value) async {
          await rejectNewWorker(workersModel.id!);
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Successful!")));
        });
      });
    } catch (error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error: ${error.toString()}")));
    }
  }

  List<WorkersModel> listOfAccepetdWorkers = [];

  Future<List<WorkersModel>> getAllVerifiedWorkers() async {
    final snapshot = await db.collection("ACCEPTED WORKERS").get();

    return listOfAccepetdWorkers = snapshot.docs
        .map((e) => WorkersModel.fromJson(e.data() as Map<String, dynamic>))
        .toList();
  }

  List<WorkersModel> workdd = [];
  Future getacceptworker() async {
    final snapshot = await db.collection("ACCEPTED WORKERS").get();

    workdd = snapshot.docs.map((e) {
      return WorkersModel.fromJson(e.data());
    }).toList();
  }

  Future removeacceptedWorkers(id) async {
    db.collection("ACCEPTED WORKERS").doc().delete();
  }

  List<Reports> listofReporst = [];
  fetchAllReports() async {
    final snapsht =
        await FirebaseFirestore.instance.collection("Reports").get();
    listofReporst =
        snapsht.docs.map((e) => Reports.fromJson(e.data())).toList();
  }

  Future logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut().then((value) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AdminLogin(),
        ),
      );
    });
  }

  List<WorkAssign> workassign = [];
  Future gettworkssign() async {
    final snapshot = await db.collection('Work Assign').snapshots();

    snapshot.listen((event) {
      workassign = event.docs.map((e) {
        return WorkAssign.fromjsone(e.data());
      }).toList();
    });
  }
}
