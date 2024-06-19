import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:secure_kare/viewmodel/admin_controller.dart';

class AdminFeedBackAndSupport extends StatelessWidget {
  const AdminFeedBackAndSupport({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Consumer<AdminController>(builder: (context, controler, child) {
      return StreamBuilder(
          stream: controler.gettworkssign().asStream(),
          builder: (context, snapshot) {
            final data = controler.workassign;
            return data.isEmpty
                ? Center(
                    child: Text('No work assinged'),
                  )
                : ListView.separated(
                    itemCount: data.length,
                    separatorBuilder: (context, index) => const Divider(
                      color: Color.fromARGB(255, 255, 217, 104),
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        // width: 200,
                        height: 270,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 236, 226, 134),
                            boxShadow: [BoxShadow(blurRadius: 1)]),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 150,
                              height: 180,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                  boxShadow: [BoxShadow(blurRadius: 1)]),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                      height: 80,
                                      width: 70,
                                      child: CircleAvatar(
                                        backgroundImage:
                                            AssetImage("assets/kanew.jpg"),
                                      )),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    data[index].manager,
                                    style: GoogleFonts.signikaNegative(),
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Text(
                                    "Manager",
                                    style: GoogleFonts.mavenPro(),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                // const SizedBox(
                                //   height: 20,
                                // ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Column(
                                    children: [
                                      Text(
                                          "A building construction work is in progress",
                                          style: GoogleFonts.mavenPro(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                      // const SizedBox(
                                      //   height: 10,
                                      // ),
                                      Text("Workers",
                                          style: GoogleFonts.mavenPro(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  ),
                                ),
                                Text("Male Names :",
                                    style: GoogleFonts.mavenPro(
                                        fontWeight: FontWeight.bold)),
                                Text(data[index].workername,
                                    style: GoogleFonts.kanit(fontSize: 13)),
                              ],
                            ),
                            Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                // Text("Female Names :",
                                //     style: GoogleFonts.mavenPro(
                                //         fontWeight: FontWeight.bold)),
                                // Text("Priya", style: GoogleFonts.kanit()),
                                // Text("Neha", style: GoogleFonts.kanit()),
                                // Text("Pooja", style: GoogleFonts.kanit()),
                                // Text("Arti", style: GoogleFonts.kanit()),
                                // Text("Swati", style: GoogleFonts.kanit()),
                                // Text("Neha", style: GoogleFonts.kanit()),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 220),
                              child: Row(
                                children: [
                                  Icon(CupertinoIcons.location_solid),
                                  Text(
                                    data[index].placework,
                                    style: GoogleFonts.langar(),
                                  ),
                                  Text(","),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
          });
    });
  }
}
