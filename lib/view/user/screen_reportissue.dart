import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:random_string/random_string.dart';
import 'package:secure_kare/model/report_model.dart';
import 'package:secure_kare/utils/string.dart';
import 'package:secure_kare/view/user/screen_user_home.dart';
import 'package:secure_kare/viewmodel/function_provider.dart';
import 'package:secure_kare/viewmodel/user_report_service.dart';

class ScreenReportIssue extends StatelessWidget {
  const ScreenReportIssue({super.key});

  @override
  Widget build(BuildContext context) {
    UserReportService userReportServicer = UserReportService();
    final funprovider = Provider.of<FunProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) {
                  return ScreenUserHome();
                },
              ));
            },
            icon: const Icon(
              Icons.keyboard_arrow_left_outlined,
              color: Colors.black,
            )),
        backgroundColor: const Color.fromARGB(255, 247, 255, 222),
        elevation: 0,
        title: Text(
          "Report yor problems",
          style: GoogleFonts.caveat(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 247, 255, 222),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.white),
              child: TextField(
                  controller: funprovider.reportproblemcontroller,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(50),
                      hintText:
                          "Briefly describe your problem in your work place ...",
                      hintMaxLines: 2,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)))),
            ),
            const SizedBox(
              height: 10,
            ),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.blue[400],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  String reportid = FirebaseAuth.instance.currentUser!.uid;
                  String id = randomAlphaNumeric(10);
                  userReportServicer.addUserreports(
                      Reports(
                          reportstatus: "reported",
                          reportid: reportid,
                          reportManagerissues:
                              funprovider.reportproblemcontroller.text,
                          id: id,
                          from: "User "
                          // reportname: funprovider.workname.toString(),
                          ),
                      reportid,
                      id);
                  succes(context, 'Add your report success');
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return ScreenUserHome();
                    },
                  ));
                },
                child: Text(
                  "Report the issue",
                  style: GoogleFonts.amaranth(color: Colors.black),
                ))
          ],
        ),
      )),
    );
  }
}
