import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:secure_kare/model/managermodel.dart';
import 'package:secure_kare/view/manager/screen_home_manager.dart';
import 'package:secure_kare/viewmodel/function_provider.dart';

class ScreenManagerProfile extends StatelessWidget {
  ScreenManagerProfile({super.key});
  final manager = FirebaseFirestore.instance
      .collection("MANAGER")
      .doc(FirebaseAuth.instance.currentUser!.uid);

  @override
  Widget build(BuildContext context) {
    final funprovider = Provider.of<FunProvider>(context);
    return FutureBuilder(
      future: funprovider.fetchCurrentmaangerdata(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) {
                        return ScreenHomeManager();
                      },
                    ));
                  },
                  icon: const Icon(
                    Icons.arrow_circle_left_outlined,
                    color: Colors.black,
                  )),
              backgroundColor: Colors.white,
              elevation: 0,
              title: Text(
                "Profile",
                style: GoogleFonts.cambay(color: Colors.black),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.error,
                      color: Colors.black,
                    ))
              ]),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 150,
                  child: funprovider.managerimage == ""
                      ? const Icon(
                          CupertinoIcons.person_alt_circle_fill,
                          size: 60,
                        )
                      : CircleAvatar(
                          radius: 60,
                          // height: 130,
                          child: Image.network(
                            funprovider.managerimage!,
                          ),
                        )),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Container(
                  width: 400,
                  // height: 500,
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
                              funprovider.managername!,
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
                            Text(funprovider.managerplace!),
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
                            Text(funprovider.managerage!),
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
                            Text('funprovider.manageridnumber!'),
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
                            Text(funprovider.manageremail!),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              " ID",
                              style: GoogleFonts.cambay(
                                  color: Colors.indigo,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text('funprovider.managerid!'),
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
                            Text(funprovider.managerpassword!),
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
        );
      },
    );
  }
}
