import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:secure_kare/view/manager/screen_home_manager.dart';
import 'package:secure_kare/view/user/screen_user_home.dart';
import 'package:secure_kare/viewmodel/agent_controller.dart';
import 'package:secure_kare/viewmodel/function_provider.dart';
import 'package:secure_kare/viewmodel/ui_work_provider.dart';

class ScreenManagernotifications extends StatelessWidget {
  const ScreenManagernotifications({super.key});

  @override
  Widget build(BuildContext context) {
    String? currentuserid = FirebaseAuth.instance.currentUser?.uid;
    final funprovider = Provider.of<FunProvider>(context);
    final workprovider = Provider.of<WorkProvider>(context);
    return FutureBuilder(
        future: funprovider.getreportmanager(),
        builder: (context, snapshot) {
          final data = funprovider.managerreports;

          return Scaffold(
            appBar: AppBar(
              title: Text("Report List"),
              centerTitle: true,
              leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return ScreenHomeManager();
                      },
                    ));
                  },
                  icon: Icon(Icons.arrow_circle_left_outlined)),
            ),
            body: Consumer<AgentController>(builder: (context, controler, child) {
              return FutureBuilder(future: controler.fetchAlert(), builder: (context, snapshot){
                if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              final data = controler.listOfAlert;
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
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    // Text(
                                    //   data[index].id.toString(),
                                    //   style: GoogleFonts.amaranth(
                                    //       fontSize: 12,
                                    //       fontWeight: FontWeight.bold),
                                    // ),
                                    Text(
                                      data[index].subject.toString(),
                                      style: GoogleFonts.amaranth(
                                          color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      data[index]
                                          .description
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
            },)
          );
        });
  }
}
