import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:secure_kare/view/police/screen_aboutus.dart';
import 'package:secure_kare/view/police/screen_changepassword.dart';
import 'package:secure_kare/view/police/screen_settings.dart';
import 'package:secure_kare/view/police/screen_updateprofile.dart';
import 'package:secure_kare/viewmodel/ui_work_provider.dart';

class ScreenUpdtPswdSttngAbt extends StatelessWidget {
  const ScreenUpdtPswdSttngAbt({super.key});

  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<WorkProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "SecureKare",
          style: GoogleFonts.nunitoSans(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.error,
                color: Colors.black,
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 100, top: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(workprovider.person),
            ),
            Text(
              "Police",
              style: GoogleFonts.mukta(),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => ScreenUpdateProfile(),
                ));
              },
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 244, 242, 241),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(children: [
                  const Icon(
                    Icons.arrow_right,
                    size: 50,
                  ),
                  Text(
                    "Update profile",
                    style: GoogleFonts.corben(),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ]),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => ScreenPoliceChangePassword(),
                ));
              },
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 244, 242, 241),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(children: [
                  const Icon(
                    Icons.arrow_right,
                    size: 50,
                  ),
                  Text(
                    "Change password",
                    style: GoogleFonts.corben(
                       fontSize: 10
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ]),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => ScreenSettings(),
                ));
              },
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 244, 242, 241),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(children: [
                  const Icon(
                    Icons.arrow_right,
                    size: 50,
                  ),
                  Text(
                    "Settings",
                    style: GoogleFonts.corben(),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ]),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => ScreenAboutUs(),
                ));
              },
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 244, 242, 241),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(children: [
                  const Icon(
                    Icons.arrow_right,
                    size: 50,
                  ),
                  Text(
                    "About us",
                    style: GoogleFonts.corben(),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ]),
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}
