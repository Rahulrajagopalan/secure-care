import 'dart:developer';

import 'package:cherry_toast/cherry_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:secure_kare/model/Assign_work.dart';
import 'package:secure_kare/model/projectmodel.dart';
import 'package:secure_kare/screen_splash.dart';
import 'package:secure_kare/utils/string.dart';
import 'package:secure_kare/view/agent/screen_aboutusagent.dart';
import 'package:secure_kare/view/agent/screen_add_manager.dart';
import 'package:secure_kare/view/agent/screen_add_project.dart';
import 'package:secure_kare/view/agent/screen_add_workers.dart';
import 'package:secure_kare/view/agent/screen_agent_profile.dart';
import 'package:secure_kare/view/agent/screen_availablemanagers.dart';
import 'package:secure_kare/view/agent/screen_notificationagent.dart';
import 'package:secure_kare/view/manager/screen_availableworkers.dart';
import 'package:secure_kare/view/agent/screen_ongoingprojectagent.dart';
import 'package:secure_kare/view/manager/screen_manager_aboutus.dart';
import 'package:secure_kare/view/manager/screen_manager_profile.dart';
import 'package:secure_kare/view/manager/screen_managernotifications.dart';
import 'package:secure_kare/view/police/screen_aboutus.dart';
import 'package:secure_kare/view/police/screen_alert.dart';
import 'package:secure_kare/view/police/screen_notification.dart';
import 'package:secure_kare/view/police/screen_upsa.dart';
import 'package:secure_kare/view/user/reoportlist.dart';
import 'package:secure_kare/view/user/screen_personalinfo.dart';
import 'package:secure_kare/view/user/screen_reportissue.dart';
import 'package:secure_kare/view/user/screen_selectidentity.dart';
import 'package:secure_kare/view/user/Screen_Report_list.dart';
import 'package:secure_kare/view/user/screen_user_loginupadate.dart';
import 'package:secure_kare/viewmodel/function_provider.dart';
import 'package:secure_kare/viewmodel/manager.dart';

class WorkProvider extends ChangeNotifier {
  String person = "assets/person.jpeg";
  String construction1 = "assets/construction1.webp";
  String construction2 = "assets/003e4355-1ff1-40bf-a92d-5c1451df9bc4.jpeg";
  String construction3 = "assets/con3.jpeg";
  String construction4 = "assets/con4.jpg";
  String mc = "assets/MC1.jpg";
  String aadharcard = "assets/Aadhar card.png";
  String drivingLicense = "assets/driver license.png";
  String passport = "assets/passport1.jpeg";
  String house = "assets/house.webp";
  String adminlogin = "assets/adminlogin.jpeg";
  String adminprofile = "assets/abb.webp";
  String adminverifyy = "assets/cn.jpeg";
  String kanew = "assets/kanew.jpg";
  String debruyne = "assets/debruyne.jpg";
  String handshake = "assets/handshake.jpeg";
  String homemanager = "assets/homemanager.jpeg";
  // String loginphoto = "assets/loginphoto.jpeg";
  List flats = <String>[
    "assets/flat4.jpeg",
    "assets/flat3.jpeg",
    "assets/flat2.jpeg",
    "assets/flat1.jpeg",
  ];

  List complaints = [
    "New Complaints",
    "Closed Complaints",
    "Ongoing investigations"
  ];
  ProjectDetailsModel? selectedoption;
  String selectedmanager = "salu";

  String? selectedcategory;

  List department = ["Carpenter", "Electrician", "Construction"];
  List manager = ["salu", "sinu", "sachu"];
  bool isselected = false;

  bool isobsucure = false;

  togle() {
    isobsucure = !isobsucure;
    notifyListeners();
  }

  //available workers
  workassigndropdown(context, workerdicid) {
    return showDialog(
      context: context,
      builder: (context) {
        return Consumer<Maneger>(
          builder: (context, instance, _) {
            return FutureBuilder(
              future: instance.getprojects(),
              builder: (context, snapshot) {
                final data = instance.project;

                return AlertDialog(
                  title: Text('Assign Workers'),
                  content: Container(
                    height: 200,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              // left: 25,
                              // right: 25,
                              ),
                          child: Container(
                            // width: 100,
                            // height: 100,
                            color: Colors.white,
                            child: DropdownButtonFormField(
                              items: data.map<DropdownMenuItem>((e) {
                                return DropdownMenuItem(
                                    value: e,
                                    child: Text(e.projectName.toString()));
                              }).toList(),
                              onChanged: (value) {
                                selectedoption = value;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    Consumer<FunProvider>(
                      builder: (context, instance, child) {
                        return TextButton(
                          onPressed: () async {
                            instance.addworkassign(
                              WorkAssign(
                                Workname:
                                    selectedoption!.projectName.toString(),
                                workername: workerdicid['workersname'],
                                Workid: FirebaseAuth.instance.currentUser!.uid,
                                workertype: workerdicid['usertype'],
                                manager: selectedoption!.manager!.managername
                                    .toString(),
                                placework: selectedoption!.place.toString(),
                              ),
                            );
                            Navigator.pop(context);

                            //manager detals
                            // log(selectedoption!.manager!.managername
                            //     .toString());

                            succes(context, 'work assign succes ');
                          },
                          child: Text('assign work '),
                        );
                      },
                    )
                  ],
                );
              },
            );
          },
        );
      },
    );
  }

  selectAvailable() {
    isselected = !isselected;
    notifyListeners();
  } //adminprofile

//agent drawer...

//police

  policehomedrawer(context) {
    return Drawer(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        child: Column(children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, bottom: 3, top: 50),
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ScreenUpdtPswdSttngAbt()));
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.arrow_right,
                      color: Colors.white,
                    ),
                    Text(
                      "Profile",
                      style:
                          GoogleFonts.corben(color: Colors.white, fontSize: 12),
                    ),
                  ],
                )),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 3),
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ScreenNotifications()));
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.arrow_right,
                      color: Colors.white,
                    ),
                    Text(
                      "Notification",
                      style:
                          GoogleFonts.corben(color: Colors.white, fontSize: 12),
                    ),
                  ],
                )),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 3),
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ScreenAlert()));
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.arrow_right,
                      color: Colors.white,
                    ),
                    Text(
                      "Alert",
                      style:
                          GoogleFonts.corben(color: Colors.white, fontSize: 12),
                    ),
                  ],
                )),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 3),
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ScreenSplash()));
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.arrow_right,
                      color: Colors.white,
                    ),
                    Text(
                      "logout",
                      style:
                          GoogleFonts.corben(color: Colors.white, fontSize: 12),
                    ),
                  ],
                )),
          ),
        ]));
  }

  int intexnumber = 0;
  managerdrawer(context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 400, top: 50, right: 150),
      child: Drawer(
        backgroundColor: Colors.black,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        child: Column(children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 25, bottom: 3, top: 90),
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ScreenManagerProfile()));
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.arrow_right,
                      color: Colors.black,
                    ),
                    Text(
                      "Profile",
                      style:
                          GoogleFonts.corben(color: Colors.black, fontSize: 12),
                    ),
                  ],
                )),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, right: 25, top: 2),
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ScreenAgentAvailableWorkers()));
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.arrow_right,
                      color: Colors.black,
                    ),
                    Text(
                      "Work Assign",
                      style:
                          GoogleFonts.corben(color: Colors.black, fontSize: 12),
                    ),
                  ],
                )),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, right: 25, top: 2),
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ScreenManagernotifications(),
                  ));
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.arrow_right,
                      color: Colors.black,
                    ),
                    Text(
                      "Notifications",
                      style:
                          GoogleFonts.corben(color: Colors.black, fontSize: 12),
                    ),
                  ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 25, top: 2),
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ScreenManagerAboutUs()));
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.arrow_right,
                      color: Colors.black,
                    ),
                    Text(
                      "About ",
                      style:
                          GoogleFonts.corben(color: Colors.black, fontSize: 12),
                    ),
                  ],
                )),
          ),
          Padding(
              padding: EdgeInsets.only(left: 15, right: 25, top: 2),
              child: Consumer<FunProvider>(
                builder: (context, Instance, child) {
                  return OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onPressed: () async {
                        await Instance.logout(context).then(
                            (value) => Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => ScreenSplash()),
                                  (route) => false,
                                ));

                        succes(context, 'Logout succes ');
                      },
                      child: Row(
                        children: [
                          const Icon(
                            Icons.arrow_right,
                            color: Colors.black,
                          ),
                          Text(
                            "Logout",
                            style: GoogleFonts.corben(
                                color: Colors.black, fontSize: 12),
                          ),
                        ],
                      ));
                },
              )),
        ]),
      ),
    );
  } /////////////////////////////////////

//USER DRAWER

  userdrawer(context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 300, top: 60, left: 10),
      child: Drawer(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        backgroundColor: Color.fromARGB(255, 9, 17, 61),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, bottom: 3, top: 60),
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ScreenUserPersonalInfo(),
                    ));
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.arrow_right,
                        color: Colors.white,
                      ),
                      Text(
                        "Profile",
                        style: GoogleFonts.corben(
                            color: Colors.white, fontSize: 12),
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 3),
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ScreenSelectIdentity(),
                    ));
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.arrow_right,
                        color: Colors.white,
                      ),
                      Text(
                        "Identity",
                        style: GoogleFonts.corben(
                            color: Colors.white, fontSize: 12),
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 3),
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ScreenUserReportList(),
                    ));
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.arrow_right,
                        color: Colors.white,
                      ),
                      Text(
                        "Notification",
                        style: GoogleFonts.corben(
                            color: Colors.white, fontSize: 12),
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 3),
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ReportView(),
                    ));
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.arrow_right,
                        color: Colors.white,
                      ),
                      Text(
                        " Reports",
                        style: GoogleFonts.corben(
                            color: Colors.white, fontSize: 12),
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 3),
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ScreenAboutUs(),
                    ));
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.arrow_right,
                        color: Colors.white,
                      ),
                      Text(
                        "About ",
                        style: GoogleFonts.corben(
                            color: Colors.white, fontSize: 12),
                      ),
                    ],
                  )),
            ),
            const SizedBox(
              height: 45,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 50,
                ),
                const Icon(
                  Icons.arrow_right,
                  color: Colors.white,
                ),
                TextButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut().then((value) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ScreenSplash(),
                            ),
                            (route) => false);
                      });
                    },
                    child: Text(
                      "Logout",
                      style:
                          GoogleFonts.corben(color: Colors.white, fontSize: 12),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
