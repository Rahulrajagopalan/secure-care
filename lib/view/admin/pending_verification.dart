import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:secure_kare/viewmodel/admin_controller.dart';
import 'package:secure_kare/viewmodel/ui_work_provider.dart';

class ScreenPendingVerifications extends StatefulWidget {
  const ScreenPendingVerifications({super.key});

  @override
  State<ScreenPendingVerifications> createState() =>
      _ScreenPendingVerificationsState();
}

class _ScreenPendingVerificationsState
    extends State<ScreenPendingVerifications> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: AdminController().getPendingEMployees(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final data = snapshot.data;
          return data!.isEmpty
              ? Center(
                  child: Text("No New Workers"),
                )
              : ListView.separated(
                  itemBuilder: (context, index) {
                    return SizedBox(
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
                                "has registered as an employee to",
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
                              SizedBox(
                                width: 180,
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
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 150,
                              ),
                              SizedBox(
                                height: 30,
                                width: 130,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        backgroundColor: const Color.fromARGB(
                                            255, 42, 56, 133)),
                                    onPressed: () {
                                      AdminController()
                                          .acceptNewWorker(data[index], context)
                                          .then((value) {
                                        setState(() {});
                                      });
                                    },
                                    child: Text("Accept",
                                        style:
                                            GoogleFonts.tajawal(fontSize: 15))),
                              ),
                              const SizedBox(
                                width: 25,
                              ),
                              SizedBox(
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
                                          .rejectNewWorker(data[index].id)
                                          .then((value) {
                                        setState(() {

                                        });
                                      });
                                    },
                                    child: Text("Reject",
                                        style:
                                            GoogleFonts.tajawal(fontSize: 15))),
                              )
                            ],
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
                  itemCount: data!.length,
                );
        });
  }
}
