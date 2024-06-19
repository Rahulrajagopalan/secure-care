import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';
import 'package:secure_kare/model/workersmodel.dart';
import 'package:secure_kare/view/agent/screen_homeagent.dart';
import 'package:secure_kare/view/user/screen_user_home.dart';
import 'package:secure_kare/viewmodel/agent_controller.dart';
import 'package:secure_kare/viewmodel/function_provider.dart';
import 'package:secure_kare/viewmodel/manager.dart';

class ScreenAddWorker extends StatelessWidget {
  ScreenAddWorker({super.key});
  final workername = TextEditingController();
  final workerplace = TextEditingController();
  final workerage = TextEditingController();
  final workeremail = TextEditingController();
  final workerpassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String? imageUrl;

  final usertype = {'Male', 'Female', 'others'};
  @override
  Widget build(BuildContext context) {
    String? attendenceValue;

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
              )),
          backgroundColor: Colors.white,
          title: Text(
            "Add Workers",
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
                  controller: workername,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Worker Name";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.name,
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
                  controller: workerplace,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Worker Place";
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
                // ListView.builder(
                //   itemCount: 2,
                //   shrinkWrap: true,
                //   itemBuilder: (context, index) {
                //   return Radio(
                //         value: "absent$index",
                //         groupValue: attendenceValue,
                //         fillColor: MaterialStateColor.resolveWith((states) => Colors.redAccent),
                //         onChanged: (val) {
                //           // setState(() {
                //           //   attendenceValue = val.toString();
                //           // });
                //         },
                //     );
                // },) ,
                Consumer<FunProvider>(
                  builder: (context, instance, child) {
                    return DropdownButtonFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(12)),
                      hint: Text('Select user'),
                      items: usertype.map((e) {
                        return DropdownMenuItem(value: e, child: Text(e));
                      }).toList(),
                      onChanged: (value) {
                        instance.valuechange(value);
                      },
                    );
                  },
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
                  controller: workerage,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter worker age";
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
                  controller: workeremail,
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
                Consumer<FunProvider>(
                  builder: (context, value, child) {
                    return TextFormField(
                      obscureText: value.obscuretext,
                      controller: workerpassword,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter Your Password";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                value.toggle();
                              },
                              icon: Icon(value.obscuretext
                                  ? Icons.visibility_off
                                  : Icons.visibility)),
                          contentPadding: EdgeInsets.all(10),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Consumer<FunProvider>(builder: (context, provider, child) {
                      return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white),
                          onPressed: () async {
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
                                  "Image Uploaded",
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
                    child: Consumer<FunProvider>(
                      builder: (context, funprvdr, child) {
                        return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 13, 42, 91)),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                if (imageUrl != null) {
                                  AgentController()
                                      .addWorkers(WorkersModel(
                                    agencyId:
                                        FirebaseAuth.instance.currentUser!.uid,
                                    workersname: workername.text,
                                    workersplace: workerplace.text,
                                    workersage: workerage.text,
                                    workersemail: workeremail.text,
                                    workerspassword: workerpassword.text,
                                    workerimage: imageUrl,
                                    selectedusertype:
                                        funprvdr.selectedtype.toString(),
                                    // indentity: [''],
                                    workassaign: 'Pending',
                                  ))
                                      .then(
                                    (value) {
                                      final pop = Navigator.of(context);
                                      pop.pop();
                                      pop.pop();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        backgroundColor: Colors.green,
                                        content: Text(
                                          "Registration Success",
                                          style: GoogleFonts.plusJakartaSans(),
                                        ),
                                      ));
                                    },
                                  );
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text(
                                      "Pick Image",
                                      style: GoogleFonts.plusJakartaSans(),
                                    ),
                                  ));
                                }
                              }
                              // if (_formKey.currentState!.validate()) {

                              // }
                            },
                            child: Text(
                              " Update",
                              style: GoogleFonts.manrope(),
                            ));
                      },
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
