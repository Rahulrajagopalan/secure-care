import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:secure_kare/model/agentmodel.dart';
import 'package:secure_kare/model/alertmodel.dart';
import 'package:secure_kare/model/managermodel.dart';
import 'package:secure_kare/model/projectmodel.dart';
import 'package:secure_kare/model/report_model.dart';
import 'package:secure_kare/model/workersmodel.dart';
import 'package:secure_kare/view/agent/screen_homeagent.dart';

class AgentController with ChangeNotifier {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  // List<AgentModel> agentList = [];
  // getAllAgentsData() async {
  //   final snapshot = await db.collection("AGENT").get();
  //   agentList =
  //       snapshot.docs.map((e) => AgentModel.fromJson(e.data())).toList();
  // }
  List<Alertmodel> listOfAlert = [];
  Future<List<Alertmodel>> fetchAlert() async {
    final snapshot = await db.collection("Alert").get();
    return listOfAlert =
        snapshot.docs.map((e) => Alertmodel.fromJson(e.data()!)).toList();
  }

  AgentModel? currentAgent;
  Future fetchCurrentagentData() async {
    final snapshot = await db
        .collection("AGENT")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (snapshot.exists) {
      currentAgent = AgentModel.fromJson(snapshot.data()!);
    }
  }

  loginwithAgent(context, email, password) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then(
        (credential) async {
          String id = credential.user!.uid;

          final snaps = await db.collection("AGENT").doc(id).get();
          if (snaps.exists) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: const Color.fromARGB(255, 0, 0, 0),
              content: Text(
                "Login Succesfully",
                style: GoogleFonts.sarabun(),
              ),
            ));
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
              builder: (context) {
                return ScreenHomeAgent();
              },
            ), (route) => false);
          } else {
            auth.signOut();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                "User not Found in this email address",
                style: GoogleFonts.plusJakartaSans(),
              ),
              action: SnackBarAction(
                label: 'Undo',
                textColor: const Color.fromARGB(255, 0, 0, 0),
                onPressed: () {
                  // Some code to undo the change.
                },
              ),
            ));
          }

          // Display the Snackbar
        },
      );
    } catch (e) {
      print(e.toString());

      // Display the Snackbar
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          "Check Your Emai and Password",
          style: GoogleFonts.plusJakartaSans(),
        ),
        action: SnackBarAction(
          label: 'Undo',
          textColor: const Color.fromARGB(255, 0, 0, 0),
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      ));
    }
  }

  // ------------------Manager

  Future addManager(ManagerModel managerModel, uid) async {
    final doc = db.collection("MANAGER").doc(uid);
    doc.set(managerModel.toJson(uid));
  }

  List<ManagerModel> listOfManager = [];
  Future<List<ManagerModel>> fechCurrentGanetManager() async {
    final snapshot = await db
        .collection("MANAGER")
        .where("agencyId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    return listOfManager =
        snapshot.docs.map((e) => ManagerModel.fromJson(e.data()!)).toList();
  }

  Future signupwithmanager(context, ManagerModel managerModel) async {
    try {
      await auth
          .createUserWithEmailAndPassword(
              email: managerModel.manageremail!,
              password: managerModel.managerpassword!)
          .then((value) {
        String uid = value.user!.uid;

        addManager(managerModel, uid).then((value) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              "Successful",
              style: GoogleFonts.plusJakartaSans(),
            ),
          ));
        });
      });
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          e.toString(),
          style: GoogleFonts.plusJakartaSans(),
        ),
      ));
    }
  }

  //-------------------WORKER------------------

  Future addWorkers(
    WorkersModel workersModel,
  ) async {
    final doc = db.collection("NEW WORKERS").doc();
    doc.set(workersModel.toJson(doc.id));
  }

  //  ------------PROJECT

  Future addprojectdetails(ProjectDetailsModel projectModel, managerID) async {
    final doc = db.collection("PROJECT").doc(managerID);

    doc.set(projectModel.toJson(doc.id, managerID));
  }

  List<Reports> listofReporst = [];
  fetchAllReports() async {
    final snapsht =
        await FirebaseFirestore.instance.collection("Reports").get();
    listofReporst =
        snapsht.docs.map((e) => Reports.fromJson(e.data())).toList();
  }
}
