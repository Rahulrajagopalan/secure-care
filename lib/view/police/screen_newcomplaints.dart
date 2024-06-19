import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:secure_kare/view/police/screen_complaints.dart';
import 'package:secure_kare/view/police/screen_readnewcomplaints.dart';
import 'package:secure_kare/viewmodel/admin_controller.dart';
import 'package:secure_kare/viewmodel/policecontroll.dart';
import 'package:secure_kare/viewmodel/ui_work_provider.dart';

class ScreenNewComplaints extends StatefulWidget {
  const ScreenNewComplaints({super.key});

  @override
  State<ScreenNewComplaints> createState() => _ScreenNewComplaintsState();
}

class _ScreenNewComplaintsState extends State<ScreenNewComplaints> {
  @override
  Widget build(BuildContext context) {
    // final workprovider = Provider.of<WorkProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              // Navigator.of(context).pushReplacement(MaterialPageRoute(
              //   builder: (context) {
              //     return ScreenComplaints();
              //   },
              // ));
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_circle_left_outlined,
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "New Complaints",
          style: GoogleFonts.sourceCodePro(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.error,
                color: Colors.black,
              ))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<PoliceControler>(
              builder: (context, instance, _) {
                return FutureBuilder(
                    future: instance.fetchCompleint('reported'),
                    builder: (context, snapshot) {
                      final data = instance.userreport;
                      return data.isEmpty
                          ? Center(
                              child: Text('No complaint find'),
                            )
                          : ListView.builder(
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                final singledat = snapshot.data;

                                return ListTile(
                                  leading: CircleAvatar(
                                      // backgroundImage:
                                      //     AssetImage('workprovider.person'),
                                      ),
                                  title: Text(data[index].reportid.toString(),
                                      style: GoogleFonts.alata()),
                                  subtitle: Text(
                                    "Reported a new complaint",
                                    style: GoogleFonts.nunitoSans(),
                                  ),
                                  trailing: SizedBox(
                                    height: 30,
                                    child: OutlinedButton(
                                        style: OutlinedButton.styleFrom(
                                            backgroundColor: Colors.indigo,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10))),
                                        onPressed: () {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) =>
                                                ScreenReadNewComplaints(
                                              model: instance.userreport[index],
                                            ),
                                          ));
                                        },
                                        child: Text(
                                          "Read",
                                          style: GoogleFonts.amaranth(
                                              color: Colors.white),
                                        )),
                                  ),
                                );
                              },
                            );
                    });
              },
            ),
          ),
        ],
      ),
    );
  }
}
