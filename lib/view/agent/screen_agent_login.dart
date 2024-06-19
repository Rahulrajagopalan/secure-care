import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:secure_kare/view/agent/screen_homeagent.dart';
import 'package:secure_kare/viewmodel/agent_controller.dart';
import 'package:secure_kare/viewmodel/function_provider.dart';
import 'package:secure_kare/viewmodel/ui_work_provider.dart';

class ScreenAgentLogin extends StatelessWidget {
  ScreenAgentLogin({super.key});
  final agentloginEmail = TextEditingController();
  final agentloginpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final workprovider = Provider.of<WorkProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
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
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Email";
                        } else {
                          return null;
                        }
                      },
                      controller: agentloginEmail,
                      decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: GoogleFonts.sarabun(),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Password";
                        } else {
                          return null;
                        }
                      },
                      controller: agentloginpassword,
                      decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: GoogleFonts.sarabun(),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            AgentController().loginwithAgent(context,
                                agentloginEmail.text, agentloginpassword.text);
                          }
                        },
                        child: Text("Login"))
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
