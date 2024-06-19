import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:secure_kare/model/projectmodel.dart';
import 'package:secure_kare/view/manager/screen_home_manager.dart';
import 'package:secure_kare/view/manager/screen_project_details.dart';
import 'package:secure_kare/viewmodel/function_provider.dart';

class ScreenYourProjects extends StatelessWidget {
  ScreenYourProjects({super.key});

  final CollectionReference project =
      FirebaseFirestore.instance.collection("PROJECT");

  @override
  Widget build(BuildContext context) {
    // ProjectDetailsModel projectdetails = ProjectDetailsModel();
    final funprovider = Provider.of<FunProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return ScreenHomeManager();
                },
              ));
            },
            icon: const Icon(
              Icons.arrow_circle_left_outlined,
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Your projects",
          style: GoogleFonts.amaranth(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<ProjectDetailsModel>>(
              stream: funprovider.getInstitutionsStream(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasData) {
                  print(snapshot.error);
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text("No institute"),
                  );
                }
                final projectdata = snapshot.data!;
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final prodata = projectdata[index];
                    return Container(
                      width: 300,
                      height: 190,
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                  width: 100,
                                  child: prodata.projectimage == ""
                                      ? const Icon(
                                          CupertinoIcons.house_fill,
                                          size: 100,
                                        )
                                      : SizedBox(
                                          height: 130,
                                          child: Image.network(
                                            prodata.projectimage!,
                                          ),
                                        )),
                              Row(
                                children: [
                                  Text(
                                    prodata.projectName!,
                                    style: GoogleFonts.mukta(),
                                  ),
                                  Text(
                                    "(${prodata.place!})",
                                    style:
                                        GoogleFonts.mukta(color: Colors.grey),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25),
                            child: Column(
                              children: [
                                Text(
                                  "This project in progress",
                                  style: GoogleFonts.mukta(
                                      color: Colors.black,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Deadlock :   ${prodata.endDate}',
                                      style: GoogleFonts.mukta(
                                        fontSize: 12,
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.keyboard_control))
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 30,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          backgroundColor: Colors.indigo),
                                      onPressed: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) =>
                                              ScreenProjectDetails(),
                                        ));
                                      },
                                      child: Text(
                                        "View Details",
                                        style: GoogleFonts.mukta(
                                            color: Colors.white),
                                      )),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
