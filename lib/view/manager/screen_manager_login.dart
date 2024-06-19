import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:secure_kare/view/manager/screen_home_manager.dart';
import 'package:secure_kare/viewmodel/function_provider.dart';

import '../../viewmodel/ui_work_provider.dart';

class ScreenManagerLogin extends StatelessWidget {
  const ScreenManagerLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<WorkProvider>(context);
    final funprovider = Provider.of<FunProvider>(context);
    return Scaffold(
      
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 150,
                  ),
                  Image.asset("assets/loginphoto.jpeg"),
                  Text(
                    "Login To Your Account",
                    style: GoogleFonts.sarabun(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: funprovider.managerloginemail,
                    decoration: InputDecoration(
                        hintText: "E- Mail",
                        hintStyle: GoogleFonts.sarabun(),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: funprovider.managerloginpassword,
                    decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: GoogleFonts.sarabun(),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: Color.fromARGB(255, 242, 253, 188)),
                      onPressed: () {
                        funprovider.Loginwithmanager(context);
                      },
                      child: Text(
                        "Login",
                        style: GoogleFonts.anekDevanagari(color: Colors.black),
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
