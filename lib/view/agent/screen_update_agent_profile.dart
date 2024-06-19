import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:secure_kare/view/agent/screen_agent_profile.dart';

// ignore: must_be_immutable
class ScreenUpdateAgentProfile extends StatelessWidget {
  ScreenUpdateAgentProfile({super.key});


  final CollectionReference agent =
      FirebaseFirestore.instance.collection("AGENT");

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: agent.snapshots(),
      builder: (context, snapshot) {
        var agentfirstname = snapshot.data!.docs.first['agencyname'];
        var agentaddress = snapshot.data!.docs.first['agentaddress'];
        var agentcity = snapshot.data!.docs.first['agentcity'];
        var agentcontactnumber = snapshot.data!.docs.first['contactnumber'];
        var agentstate = snapshot.data!.docs.first['agentstate'];

        var agentemail = snapshot.data!.docs.first['agentemail'];
        var agentrgpassword = snapshot.data!.docs.first['password'];
        var agentphoto = snapshot.data!.docs.first['image'];

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) {
                      return ScreenAgentProfile();
                    },
                  ));
                },
                icon: const Icon(
                  Icons.arrow_circle_left,
                  color: Colors.black,
                )),
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(
              "Update Profile",
              style: GoogleFonts.overpass(color: Colors.black),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                    width: 150,
                    child: agentphoto == ""
                        ? const Icon(
                            CupertinoIcons.person_alt_circle,
                            size: 100,
                          )
                        : SizedBox(
                            height: 130,
                            child: Image.network(
                              agentphoto,
                            ),
                          )),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Edit Picture",
                      style: GoogleFonts.overpass(),
                    )),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Container(
                    height: 700,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 25, right: 25, top: 25),
                      child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Agency Name",
                                style: GoogleFonts.hind(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: agentfirstname,
                                  contentPadding: EdgeInsets.all(5),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Address",
                                style: GoogleFonts.hind(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: agentaddress,
                                  contentPadding: EdgeInsets.all(5),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Contact Number",
                                style: GoogleFonts.hind(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: agentcontactnumber,
                                  contentPadding: EdgeInsets.all(5),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "State",
                                style: GoogleFonts.hind(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: agentstate,
                                  contentPadding: EdgeInsets.all(5),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "City",
                                style: GoogleFonts.hind(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: agentcity,
                                  contentPadding: EdgeInsets.all(5),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Email ID",
                                style: GoogleFonts.hind(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: agentemail,
                                  contentPadding: EdgeInsets.all(5),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Password",
                                style: GoogleFonts.hind(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: agentrgpassword,
                                  contentPadding: EdgeInsets.all(5),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 100),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 19, 34, 119)),
                                  onPressed: () {},
                                  child: Text(
                                    "Update",
                                    style: GoogleFonts.andika(),
                                  ),
                                ),
                              )
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
