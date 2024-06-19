import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:secure_kare/view/admin/screen_register.dart';
import 'package:secure_kare/view/police/screen_camw.dart';
import 'package:secure_kare/view/user/screen_user_home.dart';
import 'package:secure_kare/viewmodel/function_provider.dart';
import 'package:secure_kare/viewmodel/ui_work_provider.dart';

class PoliceLoggin extends StatelessWidget {
  PoliceLoggin({super.key});

  final policeemail = TextEditingController();
  final policepassword = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<WorkProvider>(context);
    final funprovider = Provider.of<FunProvider>(context);
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 180,
                    ),
                    Image.asset("assets/loginphoto.jpeg"),
                    Text(
                      "Login To Your Account",
                      style: GoogleFonts.sarabun(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: policeemail,
                      decoration: InputDecoration(
                          hintText: "Username",
                          hintStyle: GoogleFonts.sarabun(),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: policepassword,
                      decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: GoogleFonts.sarabun(),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                         if(formkey.currentState!.validate()){
                           if (policeemail.text == 'Police@gmail.com' &&
                            policepassword.text == 'password') {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ScreenCompamw(),
                              ));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("doesn'ot match email password ")));
                        }
                         }else{
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("error ")));
                        
                         }
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(fontSize: 18),
                        )),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.end,
                    //   children: [
                    //     const Text(
                    //       "Dont have an account ?",
                    //       style: TextStyle(fontSize: 18),
                    //     ),
                    //     TextButton(
                    //         onPressed: () {
                    //           Navigator.of(context).push(MaterialPageRoute(
                    //               builder: (context) => ScreenRegister()));
                    //         },
                    //         child: const Text(
                    //           "Create",
                    //           style:  TextStyle(fontSize: 18),
                    //         ))
                    //   ],
                    // )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
