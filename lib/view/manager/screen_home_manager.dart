 

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:secure_kare/view/manager/screen_manager_reportproblems.dart';
import 'package:secure_kare/view/manager/screen_yourproject.dart';
import 'package:secure_kare/viewmodel/manager.dart';
import 'package:secure_kare/viewmodel/ui_work_provider.dart';

class ScreenHomeManager extends StatefulWidget {
  ScreenHomeManager({super.key});

  @override
  State<ScreenHomeManager> createState() => _ScreenHomeManagerState();
}

class _ScreenHomeManagerState extends State<ScreenHomeManager> {
  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<WorkProvider>(context);
    return Scaffold(
      drawer: workprovider.managerdrawer(context),
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Workforce kerela",
            style: GoogleFonts.overpass(color: Colors.black),
          ),
          centerTitle: true,
          leading: Builder(builder: (context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ));
          }),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.question_mark_outlined,
                  color: Colors.black,
                ))
          ]),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 45, top: 30),
            child: Container(
              width: 300,
              height: 300,
              color: Colors.red,
              child: Image.asset(
                workprovider.homemanager,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 180),
            child: CircleAvatar(
              backgroundImage: AssetImage(workprovider.handshake),
              radius: 200,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 130, left: 135),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ScreenManagerReportProblems(),
                  ));
                },
                child: SizedBox(
                  height: 50,
                  child: Column(
                    children: [
                      Text(
                        "Your problems",
                        style: GoogleFonts.mukta(),
                      ),
                      const Icon(
                        Icons.arrow_drop_down,
                        size: 15,
                      ),
                    ],
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 520, left: 140),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ScreenYourProjects(),
                  ));
                },
                child: SizedBox(
                  height: 50,
                  child: Column(
                    children: [
                      Text(
                        "Your projects",
                        style: GoogleFonts.mukta(color: Colors.black),
                      ),
                      const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                        size: 15,
                      ),
                    ],
                  ),
                )),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 580, right: 250),
                child: Text(
                  "Projects nearby",
                  style: GoogleFonts.chewy(fontSize: 15),
                ),
              ),
              Consumer<Maneger>(
                builder: (context, instance, _) {
                  return FutureBuilder(
                    future: instance.fetchCompany(),
                    builder: (context, snapshot) {
                      final singleproject = instance.project;
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: singleproject.length,
                            itemBuilder: (context, index) {
                              var projectimages =
                                  singleproject[index].projectimage;

                              // =
                              //     snapshot.data!.docs[index]['projectimage'];
                              return singleproject.isEmpty
                                  ? const Center(child: Text("No Project"))
                                  : Container(
                                      width: 200,
                                      height: 10,
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 219, 205, 204),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: SizedBox(
                                            width: 150,
                                            child: projectimages == ""
                                                ? const Icon(
                                                    CupertinoIcons.house_fill,
                                                    size: 100,
                                                  )
                                                : SizedBox(
                                                    height: 130,
                                                    child: Image.network(
                                                      instance.project[index]
                                                          .projectimage
                                                          .toString(),
                                                      fit: BoxFit.cover,
                                                      errorBuilder: (context,
                                                          error, stackTrace) {
                                                        return const Center(
                                                          child:
                                                              Icon(Icons.error),
                                                        );
                                                      },
                                                    ),
                                                  )),
                                      ),
                                    );
                            },
                            separatorBuilder: (context, index) =>
                                const Divider(endIndent: 10),
                          ),
                        ),
                      );
                    },
                  );
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
