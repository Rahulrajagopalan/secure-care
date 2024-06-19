import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:secure_kare/view/agent/screen_homeagent.dart';
import 'package:secure_kare/viewmodel/ui_work_provider.dart';

class ScreenOngoingProjectAgent extends StatefulWidget {
  ScreenOngoingProjectAgent({super.key});

  @override
  State<ScreenOngoingProjectAgent> createState() =>
      _ScreenOngoingProjectAgentState();
}

class _ScreenOngoingProjectAgentState extends State<ScreenOngoingProjectAgent> {
  final CollectionReference project =
      FirebaseFirestore.instance.collection("PROJECT");

  @override
  Widget build(BuildContext context) {
    // final workprovider = Provider.of<WorkProvider>(context);
    return StreamBuilder(
      stream: project.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        return Scaffold(
          backgroundColor: Color.fromARGB(255, 255, 248, 248),
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) {
                      return ScreenHomeAgent();
                    },
                  ));
                },
                icon: const Icon(
                  Icons.arrow_circle_left,
                  color: Colors.black,
                )),
            backgroundColor: Color.fromARGB(255, 255, 248, 248),
            elevation: 0,
            title: Text(
              "Work force kerelaa",
              style: GoogleFonts.nunitoSans(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            
          ),
          body: Column(
            children: [
              // Row(
              //   children: [
              //     const SizedBox(
              //       width: 20,
              //     ),
              //     CircleAvatar(backgroundImage: AssetImage(workprovider.mc)),
              //     const SizedBox(
              //       width: 10,
              //     ),
              //     Text(
              //       "MC HOUSE BUILDING",
              //       style: GoogleFonts.nunitoSans(
              //           fontSize: 12, fontWeight: FontWeight.bold),
              //     )
              //   ],
              // ),
              Text(
                "Ongoing Projects",
                style: GoogleFonts.nunitoSans(
                    fontSize: 12, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 239, 240, 239),
                      borderRadius: BorderRadius.circular(15)),
                  width: 400,
                  height: 700,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text("Ongoing Projects",
                          style: GoogleFonts.alata(
                              fontSize: 19, fontWeight: FontWeight.bold)),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.separated(
                            separatorBuilder: (context, index) => Divider(),
                            itemBuilder: (context, index) {
                              final data = snapshot.data!.docs[index];

                              return ExpansionTile(
                                title: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                          width: 150,
                                          child: data['projectimage'] == ""
                                              ? const Icon(
                                                  CupertinoIcons.house_fill,
                                                  size: 100,
                                                )
                                              : SizedBox(
                                                  height: 130,
                                                  child: Image.network(
                                                    data['projectimage'],
                                                  ),
                                                )),
                                      Text(
                                          "Cunstruction work of ${data["projectName"]} is in progress",
                                          style: GoogleFonts.alata(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                ),
                                children: [
                                  Text(
                                      "Manager: ${data["manager"]["managername"]}",
                                      style: GoogleFonts.alata(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600)),
                                  Text(
                                      "Number of Workers: ${data["numberOfWorkers"]}",
                                      style: GoogleFonts.alata(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600)),
                                  Text("Budget: ${data["budget"]}",
                                      style: GoogleFonts.alata(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600)),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Flexible(
                                        child: Text("Start Date: ${data["startDate"]}",
                                            style: GoogleFonts.alata(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600)),
                                      ),
                                      Text("End Date: ${data["endDate"]}",
                                          style: GoogleFonts.alata(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600))
                                    ],
                                  )
                                ],
                              );
                            },
                            itemCount: snapshot.data!.docs.length,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
