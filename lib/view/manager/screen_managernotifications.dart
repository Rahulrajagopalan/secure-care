import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:secure_kare/view/manager/screen_home_manager.dart';
import 'package:secure_kare/view/user/screen_user_home.dart';
import 'package:secure_kare/viewmodel/function_provider.dart';
import 'package:secure_kare/viewmodel/ui_work_provider.dart';

class ScreenManagernotifications extends StatelessWidget {
  const ScreenManagernotifications({super.key});

  @override
  Widget build(BuildContext context) {
    String? currentuserid = FirebaseAuth.instance.currentUser?.uid;
    final funprovider = Provider.of<FunProvider>(context);
    final workprovider = Provider.of<WorkProvider>(context);
    return FutureBuilder(
        future: funprovider.getreportmanager(),
        builder: (context, snapshot) {
          final data = funprovider.managerreports;

          return Scaffold(
            appBar: AppBar(
              title: Text("Report List"),
              centerTitle: true,
              leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return ScreenHomeManager();
                      },
                    ));
                  },
                  icon: Icon(Icons.arrow_circle_left_outlined)),
            ),
            body: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                data.isEmpty
                    ? Center(
                        child: Text('No report'),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(4),
                              child: Card(
                                color: const Color.fromARGB(255, 238, 236, 235),
                                child: ListTile(
                                  leading: CircleAvatar(
                                    radius: 5,
                                    backgroundColor: Colors.black,
                                  ),
                                  title: Text(
                                    "Your Complaints (${data[index].reportManagerissues.toString()}) is Registered On nearby Police Station ",
                                    style: GoogleFonts.overpass(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
              ],
            ),
          );
        });
  }
}
