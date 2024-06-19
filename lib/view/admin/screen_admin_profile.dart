import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:secure_kare/viewmodel/ui_work_provider.dart';

class ScreenAdminProfile extends StatelessWidget {
  const ScreenAdminProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(alignment: Alignment.center, children: [
        Column(
          children: [
            Container(
              // width: 1600,
              height: 350,
              color: const Color.fromARGB(255, 243, 186, 101),
            ),
            Expanded(
              child: Container(
                // width: 1600,
                height: 500,
                color: const Color.fromARGB(255, 73, 72, 72),
              ),
            ),
          ],
        ),
        Container(
          width: size.width / 2,
          height: size.height * .7,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [BoxShadow(blurRadius: 1)]),
          child: Padding(
            padding: const EdgeInsets.only(left: 100, right: 100),
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                const SizedBox(
                    width: 100,
                    height: 100,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/abb.webp"),
                    )),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Roshan sharma",
                  style: GoogleFonts.libreFranklin(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Name", hintStyle: GoogleFonts.hind()),
                ),
                const SizedBox(
                  height: 13,
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: "E-mail", hintStyle: GoogleFonts.hind()),
                ),
                const SizedBox(
                  height: 13,
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Address", hintStyle: GoogleFonts.hind()),
                ),
                const SizedBox(
                  height: 13,
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Contact number",
                      hintStyle: GoogleFonts.hind()),
                ),
                const SizedBox(
                  height: 13,
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: "City",
                      hintStyle: GoogleFonts.hind(),
                      suffix: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black,
                          ))),
                ),
                const SizedBox(
                  height: 13,
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: "State",
                      hintStyle: GoogleFonts.hind(),
                      suffix: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black,
                          ))),
                ),
                const SizedBox(
                  height: 25,
                ),
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3)),
                        backgroundColor:
                            const Color.fromARGB(255, 33, 44, 111)),
                    onPressed: () {},
                    child: Text(
                      "Update",
                      style: GoogleFonts.montserrat(color: Colors.white),
                    ))
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
