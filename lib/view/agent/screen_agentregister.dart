import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:secure_kare/viewmodel/function_provider.dart';

class ScreenAgentRegister extends StatelessWidget {
  const ScreenAgentRegister({super.key});

  @override
  Widget build(BuildContext context) {
    final funprovider = Provider.of<FunProvider>(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 206, 225, 204),
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.only(top: 300, left: 50),
          child: Icon(
            Icons.camera,
            color: Color.fromARGB(255, 165, 196, 162),
            size: 300,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 60, top: 40),
                  child: Text(
                    "Register Now as an Agent",
                    style: GoogleFonts.permanentMarker(fontSize: 19),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text("Agency Name"),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                    controller: funprovider.agencynamecontroller,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
                const SizedBox(
                  height: 10,
                ),
                Text("Address"),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                    controller: funprovider.agentaddresscontroller,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
                const SizedBox(
                  height: 10,
                ),
                Text("Company Name"),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                    controller: funprovider.agentcompanynamecontroller,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
                const SizedBox(
                  height: 10,
                ),
                Text("Contact Number"),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                    controller: funprovider.agentcontactnumbercontrroller,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
                const SizedBox(
                  height: 10,
                ),
                Text("State"),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                    controller: funprovider.agentstatecontroller,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
                const SizedBox(
                  height: 10,
                ),
                Text("City"),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                    controller: funprovider.agentcitycontroller,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
                const SizedBox(
                  height: 10,
                ),
                Text("Email-ID"),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                    controller: funprovider.agentemailecontroller,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
                const SizedBox(
                  height: 10,
                ),
                Text("Password"),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                    controller: funprovider.agentpasswordcontroller,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
                const SizedBox(
                  height: 10,
                ),
                Text("Confirm Password"),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                    controller: funprovider.agentconfirmpasswordcontroller,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
                const SizedBox(
                  height: 10,
                ),
                Text("Website"),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                    controller: funprovider.agentwebsitecontroller,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
                const SizedBox(
                  height: 10,
                ),
                const Text("Company Logo"),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
                const SizedBox(
                  height: 10,
                ),
                Center(
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.blue[400],
                        ),
                        onPressed: () {
                          
                        },
                        child: Text("Register",
                            style: GoogleFonts.amaranth(
                              color: Colors.white,
                            ))))
              ],
            ),
          ),
        )
      ]),
    );
  }
}
