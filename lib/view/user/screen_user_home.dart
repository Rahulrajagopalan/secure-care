import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:secure_kare/view/user/screen_reportissue.dart';
import 'package:secure_kare/viewmodel/ui_work_provider.dart';

class ScreenUserHome extends StatefulWidget {
  const ScreenUserHome({super.key});

  @override
  State<ScreenUserHome> createState() => _ScreenReportProblemsState();
}

class _ScreenReportProblemsState extends State<ScreenUserHome> {
  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<WorkProvider>(context);
    return Scaffold(
      drawer: workprovider.userdrawer(context),
      body: Stack(
        children: [
          Container(
              width: 500,
              height: 900,
              child: Image.asset(
                workprovider.construction2,
                fit: BoxFit.fitHeight,
              )),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Builder(builder: (context) {
              return IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.black,
                  ));
            }),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 120, top: 710),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return ScreenReportIssue();
                    },
                  ));
                },
                child: SizedBox(
                  width:180,
                  child: Row(
                    children: [
                      Text(
                        "Report you problems",
                        style: GoogleFonts.nunitoSans(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 10),
                      ),
                      const Icon(
                        Icons.arrow_right,
                        color: Colors.black,
                        size: 30,
                      )
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
