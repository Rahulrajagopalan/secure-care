import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:secure_kare/view/user/screen_user_home.dart';
import 'package:secure_kare/viewmodel/function_provider.dart';
import 'package:secure_kare/viewmodel/ui_work_provider.dart';

class ScreenSelectIdentity extends StatelessWidget {
  const ScreenSelectIdentity({super.key});

  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<WorkProvider>(context);
    final funprovider = Provider.of<FunProvider>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 255, 222),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) {
                  return ScreenUserHome();
                },
              ));
            },
            icon: const Icon(
              Icons.keyboard_arrow_left_outlined,
              color: Colors.black,
            )),
        backgroundColor: const Color.fromARGB(255, 247, 255, 222),
        title: Text(
          "Select your identity",
          style: GoogleFonts.nunitoSans(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 100, left: 10, right: 10),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                funprovider.pickimageforadhaar();
                print("Adhaar picker");
              },
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                    boxShadow: [BoxShadow(blurRadius: 3)],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18),
                      child: Image.asset(workprovider.aadharcard),
                    ),
                    Text(
                      "AADHAR CARD",
                      style: GoogleFonts.karla(),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    SizedBox(
                      width: 60,
                      child: funprovider.imageurladhaar == ""
                          ? const Icon(
                              CupertinoIcons.person_alt_circle_fill,
                              size: 60,
                            )
                          :
                          // height: 130,
                          Image.network(funprovider.imageurladhaar!),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                funprovider.pickimageforlicense();
                print("license picker");
              },
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                    boxShadow: [BoxShadow(blurRadius: 3)],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Image.asset(workprovider.drivingLicense),
                    ),
                    Text(
                      "DRIVING LICENSE",
                      style: GoogleFonts.karla(),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: 60,
                      child: funprovider.imageurllicense == ""
                          ? const Icon(
                              CupertinoIcons.person_alt_circle_fill,
                              size: 60,
                            )
                          : Image.network(funprovider.imageurllicense!),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                funprovider.pickimageforpassport();
                print("passport picker");
              },
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                    boxShadow: [BoxShadow(blurRadius: 3)],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18),
                      child: Image.asset(workprovider.passport),
                    ),
                    const SizedBox(
                      width: 80,
                    ),
                    Text(
                      "PASSPORT",
                      style: GoogleFonts.karla(),
                    ),
                    const SizedBox(
                      width: 60,
                    ),
                    SizedBox(
                      width: 60,
                      child: funprovider.imageurlpasspot == ""
                          ? const Icon(
                              CupertinoIcons.person_alt_circle_fill,
                              size: 60,
                            )
                          : Image.network(funprovider.imageurlpasspot!),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            OutlinedButton(
                style: OutlinedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return ScreenUserHome();
                    },
                  ));

                  FirebaseFirestore.instance
                      .collection('ACCEPTED WORKERS')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .update({
                    'indentity': FieldValue.arrayUnion([
                      funprovider.imageurladhaar!,
                      funprovider.imageurllicense!,
                      funprovider.imageurlpasspot!,
                    ])
                  }).then((value) {
 Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return ScreenUserHome();
                    },
                  ));
                  });
                },
                child: Text(
                  "Done",
                  style: GoogleFonts.karla(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
