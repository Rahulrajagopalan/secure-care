import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:secure_kare/model/agentmodel.dart';
import 'package:secure_kare/model/usermodel.dart';
import 'package:secure_kare/model/workersmodel.dart';
import 'package:secure_kare/view/admin/screen_otp.dart';
import 'package:secure_kare/viewmodel/admin_controller.dart';
import 'package:secure_kare/viewmodel/function_provider.dart';

class ScreenRegister extends StatelessWidget {
  ScreenRegister({super.key});

  final agentName = TextEditingController();
  final passwordController = TextEditingController();

  // final lastnamecontroller = TextEditingController();
  final addresscontroller = TextEditingController();
  final stateController = TextEditingController();
  final citycontroller = TextEditingController();
  final emailidcontroller = TextEditingController();
  final contactNumber = TextEditingController();
  // final meterialstatuscontroller = TextEditingController();
  // String? maritalStatus;
  final _Key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Form(
          key: _Key,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(
              height: 40,
            ),
            // InkWell(
            //   onTap: () {
            //     //   funprovider.imagePickforregister();
            //   },
            //   child: Container(
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(10),
            //         color: Colors.white,
            //         border: Border.all(color: Colors.black)),
            //     width: 160,
            //     height: 100,
            //     child: Center(
            //       child: Column(
            //         children: [
            //           const SizedBox(
            //             height: 30,
            //           ),
            //           Text(
            //             "Place Your image",
            //             style: GoogleFonts.kanit(
            //                 fontSize: 15, fontWeight: FontWeight.bold),
            //           ),
            //           const Icon(Icons.add_box)
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            Text(
              "Register",
              style:
                  GoogleFonts.kanit(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                textInputAction: TextInputAction.next,
                controller: agentName,
                validator: (value) {
                  if (value!.isNotEmpty) {
                    return null;
                  } else {
                    return "Enter your firstname";
                  }
                },
                decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.only(left: 30, right: 30, top: 30),
                    hintText: "Agency Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            // Container(
            //   decoration: const BoxDecoration(color: Colors.white),
            //   child: TextFormField(
            //     controller: agentName,
            //     validator: (value) {
            //       if (value!.isNotEmpty) {
            //         return null;
            //       } else {
            //         return "Enter your Lastname";
            //       }
            //     },
            //     decoration: InputDecoration(
            //         contentPadding:
            //             const EdgeInsets.only(left: 30, right: 30, top: 30),
            //         hintText: "Last Name",
            //         border: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(10),
            //         )),
            //   ),
            // ),
            // const SizedBox(
            //   height: 15,
            // ),
            Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isNotEmpty) {
                    return null;
                  } else {
                    return "Enter your State";
                  }
                },
                controller: stateController,
                decoration: InputDecoration(
                    // suffixIcon: IconButton(
                    //     onPressed: () {
                    //       // countrypicker(context);
                    //     },
                    //     icon: const Icon(Icons.arrow_drop_down)),
                    contentPadding:
                        const EdgeInsets.only(left: 30, right: 30, top: 30),
                    hintText: "State",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                textInputAction: TextInputAction.next,
                controller: addresscontroller,
                validator: (value) {
                  if (value!.isNotEmpty) {
                    return null;
                  } else {
                    return "Enter your Address";
                  }
                },
                decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.only(left: 30, right: 30, top: 30),
                    hintText: "Address",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                textInputAction: TextInputAction.next,
                controller: citycontroller,
                validator: (value) {
                  if (value!.isNotEmpty) {
                    return null;
                  } else {
                    return "Enter your cityname";
                  }
                },
                decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.only(left: 30, right: 30, top: 30),
                    hintText: "City",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (!(value!.contains("@gmail.com"))) {
                    return "Invalid email";
                  } else {
                    return null;
                  }
                },
                controller: emailidcontroller,
                decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.only(left: 30, right: 30, top: 30),
                    hintText: "E-Mail",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                inputFormatters: [LengthLimitingTextInputFormatter(10)],
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isNotEmpty) {
                    return null;
                  } else {
                    return "Invalid number";
                  }
                },
                controller: contactNumber,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.only(left: 30, right: 30, top: 30),
                    hintText: "Contact Number",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            // DropdownButtonFormField(
            //     validator: (value) {
            //       if (value == null) {
            //         return "Select your marital status";
            //       } else {
            //         return null;
            //       }
            //     },
            //     decoration: InputDecoration(
            //         contentPadding:
            //             const EdgeInsets.only(left: 30, right: 30, top: 30),
            //         hintText: "Martial Status",
            //         border: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(10)),
            //         filled: true,
            //         fillColor: Colors.white),
            //     items: const [
            //       DropdownMenuItem(value: "Married", child: Text("Married")),
            //       DropdownMenuItem(value: "Unmarried", child: Text("Unmarried"))
            //     ],
            //     onChanged: (selected) {
            //       maritalStatus = selected;
            //     }),
            // const SizedBox(
            //   height: 15,
            // ),
            Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "please enter password";
                  } else if (value.length <= 6) {
                    return "add more than 6 characters";
                  }
                  return null;
                },
                controller: passwordController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.only(left: 30, right: 30, top: 30),
                    hintText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.blue[400],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () async {
                  if (_Key.currentState!.validate()) {
                    //  AdminController()
                    //   .emailotp(context, emailidcontroller.text)
                    //   .then((value) {
                    // Navigator.of(context).pushReplacement(MaterialPageRoute(
                    //   builder: (context) => ScreenOtp(
                    //     password: passwordController.text,
                    //     usermodel: UserModel(
                    //       aadharnumber: aadhaarcontroller.text,
                    //       address: addresscontroller.text,
                    //       city: citycontroller.text,
                    //       country: countrycontroller.text,
                    //       email: emailidcontroller.text,
                    //       firstname: firstnamecontroller.text,
                    //       lastname: lastnamecontroller.text,
                    //       martialstatus: maritalStatus,
                    //     ),
                    //   ),
                    // ));
                    // });
                    // UserModel(
                    //   aadharnumber: aadhaarcontroller.text,
                    //   address: addresscontroller.text,
                    //   city: citycontroller.text,
                    //   country: countrycontroller.text,
                    //   email: emailidcontroller.text,
                    //   firstname: firstnamecontroller.text,
                    //   lastname: lastnamecontroller.text,
                    //   martialstatus: maritalStatus,
                    // ),
                    AdminController()
                        .signUp(emailidcontroller.text.trim(),
                            passwordController.text.trim(), context)
                        .then((value) {
                      AdminController()
                          .addAgent(
                              AgentModel(
                                  agencyname: agentName.text,
                                  agentstate: stateController.text,
                                  agentaddress: addresscontroller.text,
                                  agentcity: citycontroller.text,
                                  agentemail: emailidcontroller.text,
                                  contactnumber: contactNumber.text,
                                  password: passwordController.text,
                                  image: ""),
                              value!.user!.uid)
                          .then((value) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Agentcy registration Successful"),
                        ));
                        //   Navigator.of(context).pushAndRemoveUntil(
                        //       MaterialPageRoute(builder: (context) => ScreenUserHome()),
                        //       (route) => false);
                      });
                    });
                  }
                },
                child: Text(
                  "Register Now",
                  style: GoogleFonts.amaranth(color: Colors.black),
                )),
          ]),
        ),
      ),
    );
  }
}
