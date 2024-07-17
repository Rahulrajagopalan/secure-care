import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:secure_kare/view/manager/screen_employee_details.dart';
import 'package:secure_kare/view/manager/screen_yourproject.dart';

class ScreenProjectDetails extends StatelessWidget {
  ScreenProjectDetails({super.key});
  final project = FirebaseFirestore.instance
      .collection("Work Assign")
      .where("workid", isEqualTo: FirebaseAuth.instance.currentUser!.uid);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: project.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        var projectname = snapshot.data!.docs.first['workename'];
        var projectplace = snapshot.data!.docs.first['placework'];
        var projectManager = snapshot.data!.docs.first['manager'];

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) {
                      return ScreenYourProjects();
                    },
                  ));
                },
                icon: const Icon(
                  Icons.arrow_circle_left_outlined,
                  color: Colors.black,
                )),
            backgroundColor: Colors.white,
            title: Text(
              "Project Details",
              style: GoogleFonts.amaranth(color: Colors.black),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.question_mark,
                    color: Colors.black,
                  ))
            ],
            elevation: 0,
          ),
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    projectname,
                    style:
                        GoogleFonts.amaranth(color: Colors.black, fontSize: 22),
                  ),
                  Text(
                    "(${projectplace})",
                    style:
                        GoogleFonts.amaranth(color: Colors.black, fontSize: 22),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "(Manager: ${projectManager.toString().toUpperCase()})",
                    style:
                        GoogleFonts.amaranth(color: Colors.black, fontSize: 15),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: Container(
                  width: 400,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                      child: Text(
                    "Employees included in this project",
                    style:
                        GoogleFonts.amaranth(color: Colors.black, fontSize: 15),
                  )),
                ),
              ),
              const Icon(
                Icons.arrow_drop_down,
                size: 30,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    var worktype = snapshot.data!.docs[index]['workertype'];
                    var projectname = snapshot.data!.docs[index]['workername'];
                    return ListTile(
                      leading: SizedBox(
                          width: 150,
                          child:
                              // worktype == ""?
                              const Icon(
                            CupertinoIcons.person_alt_circle_fill,
                            size: 60,
                          )
                          // : SizedBox(
                          //     height: 130,
                          //     child: Image.network(
                          //       worktype,
                          //     ),
                          //   )
                          ),
                      title: Text(
                        projectname,
                        style: GoogleFonts.amaranth(color: Colors.black),
                      ),
                      subtitle: Text(
                        worktype,
                        style: GoogleFonts.amaranth(fontSize: 10),
                      ),
                      trailing: SizedBox(
                        height: 30,
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                backgroundColor:
                                    Color.fromARGB(255, 21, 41, 153)),
                            onPressed: () {
                              log(projectname);
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                builder: (context) => ScreenEmployeeDetails(
                                  workerName: projectname.toString(),
                                ),
                              ));
                            },
                            child: Text(
                              "View",
                              style: GoogleFonts.amaranth(color: Colors.white),
                            )),
                      ),
                    );
                  },
                  itemCount: snapshot.data!.docs.length,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
