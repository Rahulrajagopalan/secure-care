import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:secure_kare/view/admin/pending_verification.dart';
import 'package:secure_kare/view/admin/verified_registrations.dart';
import 'package:secure_kare/viewmodel/admin_controller.dart';

class AdminVerification extends StatelessWidget {
  const AdminVerification({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AdminController>(context, listen: false);

    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage("assets/cn.jpeg"))),
        // width: 936,
        height: 1000,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
              // width: 250,
              child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: () {
                    controller.changeIndex(4);
                  },
                  child: Text(
                    "Pending verifications",
                    style: GoogleFonts.workSans(
                      fontSize: 20,
                    ),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 40,
              // width: 250,
              child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: () {
                    controller.changeIndex(5);
                  },
                  child: Text(
                    "Verified registrations",
                    style: GoogleFonts.workSans(
                      fontSize: 20,
                    ),
                  )),
            )
          ],
        )

        //  Image.asset(
        //   "",
        //   fit: BoxFit.cover,

        // ),

        );
  }
}
