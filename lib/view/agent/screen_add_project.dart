import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:secure_kare/model/managermodel.dart';
import 'package:secure_kare/model/projectmodel.dart';
import 'package:secure_kare/view/agent/screen_homeagent.dart';
import 'package:secure_kare/viewmodel/agent_controller.dart';
import 'package:secure_kare/viewmodel/function_provider.dart';
import 'package:secure_kare/viewmodel/ui_work_provider.dart';

class ScreenAgentAddProject extends StatefulWidget {
  const ScreenAgentAddProject({super.key});

  @override
  State<ScreenAgentAddProject> createState() => _ScreenAgentAddProjectState();
}

class _ScreenAgentAddProjectState extends State<ScreenAgentAddProject> {
  final formkey = GlobalKey<FormState>();
  String? imageUrl;
  final agentaddprojectname = TextEditingController();
  final agentaddplace = TextEditingController();
  final agentaddstartdate = TextEditingController();
  final agentaddenddate = TextEditingController();
  final agentaddnoworers = TextEditingController();
  final agentaddbudget = TextEditingController();
  final agentaddmanager = TextEditingController();
  ManagerModel? selectedManager;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) {
                    return const ScreenHomeAgent();
                  },
                ));
              },
              icon: const Icon(
                Icons.arrow_circle_left,
                color: Colors.black,
              )),
          backgroundColor: Colors.white,
          title: Text(
            "Add Project",
            style: GoogleFonts.manrope(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0,
          centerTitle: true,
           ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 40),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Project name",
                  style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w500, fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: agentaddprojectname,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter Your Project Name ";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Place",
                  style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w500, fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: agentaddplace,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter Your Place";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Start Date",
                  style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w500, fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  readOnly: true,
                  controller: agentaddstartdate,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter Your project Start date";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      //  hintText: "Project start date",
                      suffixIcon: IconButton(
                          onPressed: () async {
                            final DateTime? selecteddate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2050),
                            );
                            final formatteddate =
                                DateFormat("dd/MM/yyyy").format(selecteddate!);

                            print(formatteddate);

                            // print(selecteddate);
                            agentaddstartdate.text = formatteddate.toString();
                          },
                          icon: const Icon(Icons.calendar_month)),
                      contentPadding: const EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "End Date",
                  style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w500, fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  readOnly: true,
                  controller: agentaddenddate,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter Your project End date";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () async {
                            final DateTime? selecteddate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2050),
                            );
                            final formatteddate =
                                DateFormat("dd/MM/yyyy").format(selecteddate!);
                            agentaddenddate.text = formatteddate;
                            print(formatteddate);
                          },
                          icon: const Icon(Icons.calendar_month)),
                      contentPadding: const EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  " No. of workers",
                  style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w500, fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: agentaddnoworers,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter number of workers";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  " Budget",
                  style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w500, fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: agentaddbudget,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter Your Budget";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  " Manager",
                  style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w500, fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                FutureBuilder(
                    future: AgentController().fechCurrentGanetManager(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return DropdownButtonFormField(
                          validator: (value) {
                            if (value == null) {
                              return "Select Manager";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          items: snapshot.data!
                              .map((e) => DropdownMenuItem(
                                  value: e, child: Text(e.managername!)))
                              .toList(),
                          onChanged: (selected) {
                            selectedManager = selected;
                          });
                    }),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Consumer<FunProvider>(builder: (context, provider, child) {
                      return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(
                                "Wait...",
                                style: GoogleFonts.plusJakartaSans(),
                              ),
                            ));
                            provider.pickimagefromgallery().then((value) {
                              imageUrl = provider.imageurl;
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                backgroundColor: Colors.red,
                                content: Text(
                                  "Image uploaded",
                                  style: GoogleFonts.plusJakartaSans(),
                                ),
                              ));
                            });
                          },
                          child: Text(
                            "Add Image",
                            style: GoogleFonts.manrope(color: Colors.black),
                          ));
                    }),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 130),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 13, 42, 91)),
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          if (imageUrl != null) {
                            AgentController()
                                .addprojectdetails(
                                    ProjectDetailsModel(
                                      agetID: FirebaseAuth
                                          .instance.currentUser!.uid,
                                      projectName: agentaddprojectname.text,
                                      place: agentaddplace.text,
                                      startDate: agentaddstartdate.text,
                                      endDate: agentaddenddate.text,
                                      numberOfWorkers: agentaddnoworers.text,
                                      budget: agentaddbudget.text,
                                      manager: selectedManager,
                                      projectimage: imageUrl,
                                    ),
                                    selectedManager!.id)
                                .then((value) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                backgroundColor: Colors.green,
                                content: Text(
                                  "Success",
                                  style: GoogleFonts.plusJakartaSans(),
                                ),
                              ));
                              final pop = Navigator.of(context);
                              pop.pop();
                              pop.pop();
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(
                                "Upload project image",
                                style: GoogleFonts.plusJakartaSans(),
                              ),
                            ));
                          }
                        }
                      },
                      child: Text(
                        " Update",
                        style: GoogleFonts.manrope(),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
