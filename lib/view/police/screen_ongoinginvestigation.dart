import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:secure_kare/view/police/screen_complaints.dart';
import 'package:secure_kare/viewmodel/policecontroll.dart';
import 'package:secure_kare/viewmodel/ui_work_provider.dart';

class ScreenOngoingInvestigation extends StatelessWidget {
  ScreenOngoingInvestigation({super.key});

  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<WorkProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return ScreenComplaints();
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
          "Ongoing investigations",
          maxLines: 2,
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
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Expanded(child: Consumer<PoliceControler>(
              builder: (context, instnce, _) {
                return FutureBuilder(
                  future: instnce.fetchCompleint('proceses'),
                  builder: (context, snapshot) {
                    final data = instnce.userreport;
                    return data.isEmpty
                        ? Center(
                            child: Text("No Data"),
                          )
                        : ListView.separated(
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 60, 59, 59),
                                      borderRadius: BorderRadius.circular(10)),
                                  width: 100,
                                  // height: 120,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 5,
                                      ),
                                      CircleAvatar(
                                        radius: 15,
                                        backgroundImage:
                                            AssetImage(workprovider.person),
                                      ),
                                      Text(data[index].reportid.toString(),
                                          style: GoogleFonts.alata(
                                              color: Colors.white,
                                              fontSize: 13)),
                                      // Text(
                                      //   "(Petition for lower wage)",
                                      //   style: GoogleFonts.nunitoSans(
                                      //       fontSize: 12,
                                      //       color: Color.fromARGB(255, 203, 200, 200),
                                      //       fontWeight: FontWeight.bold),
                                      // ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                          data[index]
                                              .reportManagerissues
                                              .toString(),
                                          style: GoogleFonts.alata(
                                              fontSize: 12,
                                              color: Colors.white)),
                                      OutlinedButton(
                                          style: OutlinedButton.styleFrom(
                                              backgroundColor: Colors.indigo,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                          onPressed: () {
                                            FirebaseFirestore.instance
                                                .collection('Reports')
                                                .doc(data[index].id)
                                                .update({
                                              'reportstatus': 'completed',
                                            });
                                          },
                                          child: Text(
                                            "Invsestigation Completed",
                                            style: GoogleFonts.amaranth(
                                                color: Colors.white),
                                          )),
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Divider(
                                color: Colors.white,
                              );
                            },
                          );
                  },
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
