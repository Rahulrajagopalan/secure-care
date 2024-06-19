import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:secure_kare/model/report_model.dart';
import 'package:secure_kare/view/police/screen_closedcomplaints.dart';
import 'package:secure_kare/viewmodel/ui_work_provider.dart';

class ScreenReadClosedComplaints extends StatelessWidget {
  Reports model;
  ScreenReadClosedComplaints({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<WorkProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) {
                  return ScreenClosedComplaints();
                },
              ));
            },
            icon: const Icon(
              Icons.arrow_circle_left_outlined,
              color: Colors.black,
            )),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Closed Complaints",
          style: GoogleFonts.sourceCodePro(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.error,
                color: Colors.black,
              ))
        ],
      ),
      body: SafeArea(
        child: Column(children: [
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              CircleAvatar(
                backgroundImage: AssetImage(workprovider.person),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100, left: 10),
                child: Text(
                  model.reportManagerissues.toString(),
                  maxLines: 10,
                  style: GoogleFonts.mukta(),
                ),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 20,
          ),
          OutlinedButton(
              style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.red),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {},
              child: Text(
                "Close",
                style: GoogleFonts.amaranth(color: Colors.red),
              ))
        ]),
      ),
    );
  }
}
