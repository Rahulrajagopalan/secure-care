import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:secure_kare/view/police/screen_camw.dart';

class ScreenAlert extends StatelessWidget {
  const ScreenAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => ScreenCompamw()));
            },
            icon:const Icon(
              Icons.arrow_circle_left_outlined,
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Alert",
          style: GoogleFonts.nunitoSans(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Subject",
              style: GoogleFonts.nunitoSans(
                  fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.white,
                  boxShadow: [BoxShadow(blurRadius: 1)]),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Please enter the subject",
                    hintStyle: GoogleFonts.firaSans(),
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Descrption",
              style: GoogleFonts.nunitoSans(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.white,
                  boxShadow: [BoxShadow(blurRadius: 1)]),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Enter the alert message",
                    hintStyle: GoogleFonts.firaSans(),
                    contentPadding: const EdgeInsets.all(80),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "Agencies",
                  style: GoogleFonts.nunitoSans(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                const SizedBox(
                  width: 10,
                ),
                RoundCheckBox(
                  size: 20,
                  onTap: (p0) {},
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "Managers",
                  style: GoogleFonts.nunitoSans(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                const SizedBox(
                  width: 6,
                ),
                RoundCheckBox(
                  size: 20,
                  onTap: (p0) {},
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "Workers",
                  style: GoogleFonts.nunitoSans(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                const SizedBox(
                  width: 15,
                ),
                RoundCheckBox(
                  size: 20,
                  onTap: (p0) {},
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 30,
              child: Padding(
                padding: const EdgeInsets.only(left: 140),
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: Color.fromARGB(255, 54, 70, 172)),
                    onPressed: () {},
                    child: Text(
                      "Send Alert",
                      style: GoogleFonts.raleway(color: Colors.white),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
