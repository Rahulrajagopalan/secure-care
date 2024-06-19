import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:secure_kare/view/police/screen_camw.dart';
import 'package:secure_kare/view/police/screen_closedcomplaints.dart';
import 'package:secure_kare/view/police/screen_newcomplaints.dart';
import 'package:secure_kare/view/police/screen_ongoinginvestigation.dart';
import 'package:secure_kare/viewmodel/admin_controller.dart';
import 'package:secure_kare/viewmodel/policecontroll.dart';

class ScreenComplaints extends StatelessWidget {
  const ScreenComplaints({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              // Navigator.of(context).pushReplacement(MaterialPageRoute(
              //   builder: (context) {
              //     return ScreenCompamw();
              //   },
              // ));

              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_circle_left_outlined,
              color: CupertinoColors.black,
            )),
        backgroundColor: Colors.white,
        title: Text(
          "Complaints",
          style: GoogleFonts.mulish(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 200, left: 40),
        child: Consumer<PoliceControler>(builder: (context, instence, child) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ScreenNewComplaints(),
                  ));
                },
                child: Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 1,
                      )
                    ],
                  ),
                  child: ListTile(
                      title: Text(
                        "New Complaints",
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Consumer<PoliceControler>(
                        builder: (context, instance, _) {
                          return FutureBuilder(
                            future: instance.fetchCompleint('reported'),
                            builder: (context, snapshot) {
                              final data = instance.userreport;
                              return Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child:
                                    Center(child: Text(data.length.toString())),
                              );
                            },
                          );
                        },
                      )),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ScreenClosedComplaints(),
                  ));
                },
                child: Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 1,
                        )
                      ]),
                  child: ListTile(
                    title: Text(
                      "Closed Complaints",
                      style: GoogleFonts.montserrat(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: FutureBuilder(
                        future: instence.fetchCompleint('completed'),
                        builder: (context, snapshot) {
                          final data = instence.userreport;
                          return Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Center(child: Text(data.length.toString())),
                          );
                        }),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ScreenOngoingInvestigation(),
                  ));
                },
                child: Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 1,
                        )
                      ]),
                  child: ListTile(
                      title: Text(
                        "Ongoing Investigations",
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: FutureBuilder(
                          future: instence.fetchCompleint("proceses"),
                          builder: (context, snapshot) {
                            final data = instence.userreport;
                            return Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child:
                                  Center(child: Text(data.length.toString())),
                            );
                          })),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
