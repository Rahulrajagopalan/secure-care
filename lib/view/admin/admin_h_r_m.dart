import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:secure_kare/viewmodel/admin_controller.dart';

class AdminHRM extends StatelessWidget {
  const AdminHRM({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 936,
      height: 800,
      color: const Color.fromARGB(255, 68, 71, 86),
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, border: Border.all(color: Colors.black)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Agencies",
                    style: GoogleFonts.amaranth(
                        fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.arrow_drop_down))
                ],
              ),
              Expanded(child: Consumer<AdminController>(
                  builder: (context, controller, child) {
                return FutureBuilder(
                    future: controller.getAllAgentsData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      final data = controller.agentList;

 
                      return data.isEmpty
                          ? const Center(
                              child: Text("No Managers"),
                            )
                          : ListView.builder(
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                return SizedBox(
                                  height: 70,
                                  child: ListTile(
                                    leading: const CircleAvatar(
                                      backgroundImage:
                                          AssetImage("assets/kanew.jpg"),
                                    ),
                                    title: Text(
                                      data[index].agentemail.toString(),
                                      style: GoogleFonts.amaranth(
                                          color: const Color.fromARGB(
                                              255, 153, 153, 153),
                                          fontWeight: FontWeight.w400),
                                    ),
                                    trailing: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            elevation: 10,
                                            shape: RoundedRectangleBorder(
                                                side: const BorderSide(
                                                  color: Colors.red,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            backgroundColor: Colors.white),
                                        onPressed: () {
                                          controller
                                              .deleteAgent(data[index].id);
                                        },
                                        child: Text(
                                          "Remove",
                                          style: GoogleFonts.amaranth(
                                              color: Colors.black),
                                        )),
                                  ),
                                );
                              },
                            );
                    });
              })),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Managers",
                    style: GoogleFonts.amaranth(
                        fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.arrow_drop_down))
                ],
              ),
              Expanded(child: Consumer<AdminController>(
                  builder: (context, controller, child) {
                return FutureBuilder(
                    future: controller.getAllManagersData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      final data = controller.managerList;
                      return data.isEmpty
                          ? const Center(
                              child: Text("No Managers"),
                            )
                          : ListView.builder(
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                return SizedBox(
                                  height: 70,
                                  child: ListTile(
                                    leading: const CircleAvatar(
                                      backgroundImage:
                                          AssetImage("assets/kanew.jpg"),
                                    ),
                                    title: Text(
                                      data[index].manageremail.toString(),
                                      style: GoogleFonts.amaranth(
                                          color: const Color.fromARGB(
                                              255, 153, 153, 153),
                                          fontWeight: FontWeight.w400),
                                    ),
                                    trailing: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            elevation: 10,
                                            shape: RoundedRectangleBorder(
                                                side: const BorderSide(
                                                    color: Colors.red),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            backgroundColor: Colors.white),
                                        onPressed: () {
                                          controller.deleteUser(data[index].id);
                                        },
                                        child: Text(
                                          "Remove",
                                          style: GoogleFonts.amaranth(
                                              color: Colors.black),
                                        )),
                                  ),
                                );
                              },
                            );
                    });
              }))
            ],
          ),
        ),
      ),
    );
  }
}
