import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:secure_kare/model/workersmodel.dart';
import 'package:secure_kare/view/user/screen_user_home.dart';
import 'package:secure_kare/viewmodel/function_provider.dart';

class ScreenUserPersonalInfo extends StatefulWidget {
  ScreenUserPersonalInfo();

  @override
  State<ScreenUserPersonalInfo> createState() => _ScreenUserPersonalInfoState();
}

class _ScreenUserPersonalInfoState extends State<ScreenUserPersonalInfo> {
  final user = FirebaseFirestore.instance
      .collection("ACCEPTED WORKERS")
      .doc(FirebaseAuth.instance.currentUser!.uid);

  @override
  Widget build(BuildContext context) {
    final funprovider = Provider.of<FunProvider>(context);

    //      DocumentSnapshot ds=snapshot.data!.docs[id];

    return FutureBuilder(
      future: funprovider.fetchCurrentUserData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: Text('loading.....'),
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (context) => ScreenUserHome(),
                  // ));
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_circle_left_outlined)),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 150,
                    child: funprovider.workimage == ""
                        ? const Icon(
                            CupertinoIcons.person_alt_circle_fill,
                            size: 60,
                          )
                        : CircleAvatar(
                            radius: 60,
                            // height: 130,
                            child: Image.network(funprovider.workimage!),
                          )),
                OutlinedButton(
                    onPressed: () {
                      funprovider.userprofileupdate(
                        context,
                        funprovider.workname!,
                        funprovider.workplace,
                        funprovider.workage,
                      );
                    },
                    child: Text("Edit Profile")),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Container(
                    width: 400,
                    // height: 600,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Name",
                                style: GoogleFonts.cambay(
                                    color: Colors.indigo,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                funprovider.workname!,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Place",
                                style: GoogleFonts.cambay(
                                    color: Colors.indigo,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(funprovider.workplace!),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                " Age",
                                style: GoogleFonts.cambay(
                                    color: Colors.indigo,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(funprovider.workage!),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "ID Number",
                                style: GoogleFonts.cambay(
                                    color: Colors.indigo,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold),
                              ),
                              // Text(funprovider.workidnumber!),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Email",
                                style: GoogleFonts.cambay(
                                    color: Colors.indigo,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(funprovider.workemail!),
                              const SizedBox(
                                height: 15,
                              ),
                              // Text(
                              //   " ID",
                              //   style: GoogleFonts.cambay(
                              //       color: Colors.indigo,
                              //       fontSize: 19,
                              //       fontWeight: FontWeight.bold),
                              // ),
                              // Text('funprovider.workid!'),
                              const SizedBox(
                                height: 15,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Password",
                                style: GoogleFonts.cambay(
                                    color: Colors.indigo,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(funprovider.workpassword!),
                              const SizedBox(
                                height: 15,
                              ),
                            ]),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
