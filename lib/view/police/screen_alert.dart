import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:secure_kare/view/police/screen_camw.dart';
import 'package:secure_kare/viewmodel/policecontroll.dart';

class ScreenAlert extends StatefulWidget {
  const ScreenAlert({super.key});

  @override
  State<ScreenAlert> createState() => _ScreenAlertState();
}

class _ScreenAlertState extends State<ScreenAlert> {
  @override
  Widget build(BuildContext context) {
    TextEditingController subjectController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    bool toAgent = false, toManager = false, toWorker = false;
    PoliceControler policeControler = PoliceControler();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => ScreenCompamw()));
            },
            icon: const Icon(
              Icons.arrow_circle_left_outlined,
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Alert",
          style: GoogleFonts.nunitoSans(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Subject",
                style: GoogleFonts.nunitoSans(
                    fontWeight: FontWeight.bold, color: Colors.black),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white,
                    boxShadow: [BoxShadow(blurRadius: 1)]),
                child: TextFormField(
                  controller: subjectController,
                  decoration: InputDecoration(
                      hintText: "Please enter the subject",
                      hintStyle: GoogleFonts.firaSans(),
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Descrption",
                style: GoogleFonts.nunitoSans(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white,
                    boxShadow: [BoxShadow(blurRadius: 1)]),
                child: TextFormField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                      hintText: "Enter the alert message",
                      hintStyle: GoogleFonts.firaSans(),
                      contentPadding: const EdgeInsets.all(80),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Agencies",
                    style: GoogleFonts.nunitoSans(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  RoundCheckBox(
                    size: 20,
                    onTap: (p0) {
                      setState(() {
                        toAgent = true;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Managers",
                    style: GoogleFonts.nunitoSans(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  RoundCheckBox(
                    size: 20,
                    onTap: (p0) {
                      toManager = true;
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Workers",
                    style: GoogleFonts.nunitoSans(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  RoundCheckBox(
                    size: 20,
                    onTap: (p0) {
                      toWorker = true;
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 30,
                child: Padding(
                  padding: const EdgeInsets.only(left: 140),
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: Color.fromARGB(255, 54, 70, 172)),
                      onPressed: () async {
                        await policeControler.addAlert({
                          "subject": subjectController.text,
                          "description": descriptionController.text,
                          "toAgent": toAgent.toString(),
                          "toManager": toManager.toString(),
                          "toWorker": toWorker.toString(),
                        }).then((value) =>
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.green,
                              content: Text(
                                "Alert created",
                                style: GoogleFonts.plusJakartaSans(),
                              ),
                            )));
                      },
                      child: Text(
                        "Send Alert",
                        style: GoogleFonts.raleway(color: Colors.white),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
