import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:secure_kare/view/agent/screen_homeagent.dart';
import 'package:secure_kare/viewmodel/agent_controller.dart';
import 'package:secure_kare/viewmodel/ui_work_provider.dart';

class ScreenNotificationAgent extends StatelessWidget {
  const ScreenNotificationAgent({super.key});

  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<WorkProvider>(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 241, 235),
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
        backgroundColor: Color.fromARGB(255, 236, 241, 235),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Notifications",
          style: GoogleFonts.nunitoSans(color: Colors.black),
        ),
      ),
      body: Consumer<AgentController>(builder: (context, controler, child) {
        return FutureBuilder(
            future: controler.fetchCurrentagentData(),
            builder: (context, snpahsot) {
              if (snpahsot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              final data = controler.listofReporst;
              return Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: CircleAvatar(
                                  backgroundImage:
                                      AssetImage(workprovider.person)),
                              title: SizedBox(
                                width: 100,
                                child: Row(
                                  children: [
                                    Text(
                                      data[index].id.toString(),
                                      style: GoogleFonts.amaranth(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      data[index].from,
                                      style: GoogleFonts.nunitoSans(
                                          color: Colors.black, fontSize: 12),
                                    ),
                                    Text(
                                      data[index]
                                          .reportManagerissues
                                          .toString(),
                                      style: GoogleFonts.nunitoSans(
                                          color: Colors.black, fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                              // subtitle: Padding(
                              //   padding: const EdgeInsets.only(left: 210),
                              //   child: Text(
                              //     "10 minutes ago",
                              //     style: GoogleFonts.quicksand(fontSize: 12),
                              //   ),
                              // ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              );
            });
      }),
    );
  }
}
