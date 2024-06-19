import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:secure_kare/model/agentmodel.dart';
import 'package:secure_kare/view/agent/screen_homeagent.dart';
import 'package:secure_kare/viewmodel/agent_controller.dart';
import 'package:secure_kare/viewmodel/function_provider.dart';
import 'package:secure_kare/viewmodel/ui_work_provider.dart';

class ScreenAgentAvailableManagers extends StatelessWidget {
  ScreenAgentAvailableManagers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
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
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: Text(
          "Work force kerala",
          style: GoogleFonts.nunitoSans(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Consumer<AgentController>(builder: (context, ctl, child) {
        return Column(
          children: [
            FutureBuilder(
              future: ctl.fetchCurrentagentData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircleAvatar(),
                  );
                }
                final data = ctl.currentAgent;
                return ListTile(
                  leading: data!.image! == ""
                      ? CircleAvatar()
                      : CircleAvatar(
                          backgroundImage: NetworkImage(data.image!),
                        ),
                  title: Text(
                    data.agencyname!,
                    style: GoogleFonts.andika(),
                  ),
                );
              },
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [BoxShadow(blurRadius: 1)],
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        " Managers",
                        style: GoogleFonts.balthazar(
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      FutureBuilder(
                          future: ctl.fechCurrentGanetManager(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            final data = ctl.listOfManager;
                            return Expanded(
                              child: data.isEmpty
                                  ? Center(
                                      child: Text("No Managers"),
                                    )
                                  : ListView.builder(
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          leading: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                data[index].managerimage!),
                                          ),
                                          title: Text(data[index].managername!,
                                              style: GoogleFonts.alata()),
                                          subtitle: Text(
                                            data[index].managerplace!,
                                            style: GoogleFonts.libreFranklin(),
                                          ),
                                        );
                                      },
                                      itemCount: data.length,
                                    ),
                            );
                          })
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}
