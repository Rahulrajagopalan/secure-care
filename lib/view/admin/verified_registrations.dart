import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:secure_kare/viewmodel/admin_controller.dart';

class ScreenVerifiedRegisstrations extends StatefulWidget {
  const ScreenVerifiedRegisstrations({super.key});

  @override
  State<ScreenVerifiedRegisstrations> createState() =>
      _ScreenVerifiedRegisstrationsState();
}

class _ScreenVerifiedRegisstrationsState
    extends State<ScreenVerifiedRegisstrations> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AdminController>(context, listen: false);
    return FutureBuilder(
        future: provider.getacceptworker(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          // final data = snapshot.data;
          final data = provider.workdd;
          log('accespted worker    ${data.length}');
          return data.isEmpty
              ? Center(
                  child: Text("No Verified Workders"),
                )
              : ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                      height: 300,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 20,
                              ),
                              SizedBox(
                                width: 60,
                                height: 60,
                                child: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(data[index].workerimage!)),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                data[index].workersname!,
                                style: GoogleFonts.signikaNegative(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                data[index].workersname!,
                                style: GoogleFonts.signikaNegative(
                                    fontWeight: FontWeight.w800, fontSize: 18),
                              ),
                              Text(
                                " has registered as an employee to ",
                                style: GoogleFonts.signikaNegative(),
                              ),
                              Text(
                                "SECURE KARE",
                                style: GoogleFonts.signikaNegative(
                                    fontWeight: FontWeight.w800, fontSize: 16),
                              ),
                              Text(
                                ":",
                                style: GoogleFonts.tajawal(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 340, top: 20, bottom: 15),
                            child: Text(
                              "Details",
                              style: GoogleFonts.tajawal(
                                  fontWeight: FontWeight.w800, fontSize: 20),
                            ),
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 60,
                                      ),
                                      Text(
                                        "Name",
                                        style: GoogleFonts.inter(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        ":",
                                        style: GoogleFonts.inter(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        data[index].workersname!,
                                        style: GoogleFonts.inter(fontSize: 15),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 150,
                              ),
                              Text(
                                "Postion",
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                ":",
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Employee",
                                style: GoogleFonts.inter(fontSize: 15),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  // Row(
                                  //   children: [
                                  //     const SizedBox(
                                  //       width: 60,
                                  //     ),
                                  //     Text(
                                  //       "Department",
                                  //       style: GoogleFonts.inter(
                                  //           fontWeight: FontWeight.bold),
                                  //     ),
                                  //     Text(
                                  //       ":",
                                  //       style: GoogleFonts.inter(
                                  //           fontWeight: FontWeight.bold),
                                  //     ),
                                  //     Text(
                                  //       " Electrician",
                                  //       style: GoogleFonts.inter(fontSize: 15),
                                  //     )
                                  //   ],
                                  // )
                                ],
                              ),
                              const SizedBox(
                                width: 300,
                              ),
                              Text(
                                "Location",
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                ":",
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                data[index].workersplace!,
                                style: GoogleFonts.inter(fontSize: 15),
                              ),
                              Text(' Work Assaign :${data[index].workassaign}'),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 330),
                            child: SizedBox(
                              height: 30,
                              width: 130,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      backgroundColor: Colors.red),
                                  onPressed: () {
                                    AdminController()
                                        .removeacceptedWorkers(data[index].id)
                                        .then((value) {
                                      setState(() {});
                                    });
                                  },
                                  child: Text("Remove",
                                      style:
                                          GoogleFonts.tajawal(fontSize: 15))),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      endIndent: 25,
                      indent: 25,
                      color: Colors.black,
                    );
                  },
                  itemCount: data.length,
                );
        });
  }
}
