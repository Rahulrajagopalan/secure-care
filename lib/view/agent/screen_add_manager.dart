import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:secure_kare/model/managermodel.dart';
import 'package:secure_kare/view/agent/screen_homeagent.dart';
import 'package:secure_kare/viewmodel/agent_controller.dart';
import 'package:secure_kare/viewmodel/function_provider.dart';

class ScreenAddManager extends StatefulWidget {

  ScreenAddManager({super.key});

  @override
  State<ScreenAddManager> createState() => _ScreenAddManagerState();
}
enum Gender { male, female}
String? gender;

class _ScreenAddManagerState extends State<ScreenAddManager> {
  Gender? genderSelect = Gender.male;
  final agentmanagername = TextEditingController();

  final agentmanagerplace = TextEditingController();

  final agentmanagerage = TextEditingController();

  final agentmanageremail = TextEditingController();

  final agentmanagerpassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) {
                  return ScreenHomeAgent();
                },
              ));
            },
            icon: const Icon(
              Icons.arrow_circle_left,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          title: Text(
            "Add Manager",
            style: GoogleFonts.manrope(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0,
          centerTitle: true,
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.error))]),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 45),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name",
                  style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w500, fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: agentmanagername,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter Your name";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
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
                  controller: agentmanagerplace,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter Your Place";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Age",
                  style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w500, fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter your age";
                    } else {
                      return null;
                    }
                  },
                  // validator: (value) {
                  //   int age = int.parse(value!);
                  //   if (age <= 0 || age > 150) {
                  //     return "Please enters a valid age";
                  //   } else {
                  //     return null;
                  //   }
                  // },
                  controller: agentmanagerage,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  " Email",
                  style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w500, fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: agentmanageremail,
                  validator: (value) {
                    if (!(value!.contains("@gmail.com"))) {
                      return "Please enter valid Email";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  " Password",
                  style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w500, fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  obscureText: true,
                  controller: agentmanagerpassword,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter Your Password";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                              children: [
                                const Text(
                                  "Male",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Radio<Gender>(
                                  value: Gender.male,
                                  groupValue: genderSelect,
                                  onChanged: (Gender? value) {
                                    setState(() {
                                      genderSelect = value;
                                      gender= "male";
                                    });
                                  },
                                ),
                              ],
                            ),
                    Column(
                              children: [
                                const Text(
                                  "Female",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Radio<Gender>(
                                  value: Gender.female,
                                  groupValue: genderSelect,
                                  onChanged: (Gender? value) {
                                    setState(() {
                                      genderSelect = value;
                                      gender= "female";
                                    });
                                  },
                                ),
                              ],
                            ),
                            
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Consumer<FunProvider>(builder: (context, funProvider, chuld) {
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
                        funProvider.pickimagefromgallery().then((value) {
                          imageUrl = funProvider.imageurl;
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
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
                Padding(
                  padding: const EdgeInsets.only(
                    left: 130,
                  ),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 13, 42, 91)),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (imageUrl != null) {
                            AgentController()
                                .signupwithmanager(
                                    context,
                                    ManagerModel(
                                        agencyId: FirebaseAuth
                                            .instance.currentUser!.uid,
                                        managername: agentmanagername.text,
                                        managerplace: agentmanagerplace.text,
                                        managerage: agentmanagerage.text,
                                        manageremail: agentmanageremail.text,
                                        managergender: gender,
                                        managerpassword:
                                            agentmanagerpassword.text,
                                        managerimage: imageUrl),)
                                .then((value) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                backgroundColor: Colors.green,
                                content: Text(
                                  "Registration Success",
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
                                "Pick Profile",
                                style: GoogleFonts.plusJakartaSans(),
                              ),
                            ));
                          }
                        }
                      },
                      child: Text(
                        " Add Manager",
                        style: GoogleFonts.manrope(),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
