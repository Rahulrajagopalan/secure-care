import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:secure_kare/model/report_model.dart';
import 'package:secure_kare/view/police/screen_newcomplaints.dart';
import 'package:secure_kare/viewmodel/policecontroll.dart';
import 'package:secure_kare/viewmodel/ui_work_provider.dart';

class ScreenReadNewComplaints extends StatelessWidget {
  final Reports model;
  ScreenReadNewComplaints({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<WorkProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              // Navigator.of(context).pushReplacement(MaterialPageRoute(
              //   builder: (context) {
              //     return ScreenNewComplaints();
              //   },
              // ));
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_circle_left_outlined,
              color: Colors.black,
            )),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "New Complaints",
          style: GoogleFonts.sourceCodePro(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.error,
                color: Colors.black,
              ))
        ],
      ),
      body: SafeArea(
        child: Column(children: [
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Consumer(
                builder: (context, insatnce, _) {
                  return CircleAvatar(
                    backgroundImage: AssetImage(workprovider.person),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100, left: 10),
                child: Text(
                  "${model.reportid}\n,${model.reportManagerissues}",
                  maxLines: 10,
                  style: GoogleFonts.mukta(),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                    // log(model.);
                    FirebaseFirestore.instance
                        .collection('Reports')
                        .doc(model.id)
                        .update({
                      'reportstatus': 'proceses',
                    });
                  },
                  child: Text(
                    "Accept",
                    style: GoogleFonts.amaranth(color: Colors.white),
                  )),
              const SizedBox(
                width: 20,
              ),
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => ScreenNewComplaints(),
                    ));
                  },
                  child: Text(
                    "Reject",
                    style: GoogleFonts.amaranth(color: Colors.white),
                  )),
            ],
          )
        ]),
      ),
    );
  }
}
