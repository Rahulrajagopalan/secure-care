import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:secure_kare/viewmodel/ui_work_provider.dart';

class ScreenUpdateProfile extends StatelessWidget {
  const ScreenUpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<WorkProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: 
           workprovider.isselected? Text("Update Profile", style: GoogleFonts.nunitoSans(color: Colors.black),):  Text(
            "Profile",
            style: GoogleFonts.nunitoSans(color: Colors.black),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.error,
                  color: Colors.black,
                ))
          ]),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(workprovider.person),
          ),
            Text(
            "Police",
            style: GoogleFonts.merienda(fontSize: 15),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 330),
            child: IconButton(
                onPressed: () {
                  workprovider.selectAvailable();
                },
                icon: Icon(Icons.edit_square)),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Container(
              width: 400,
              height: 600,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 246, 244, 244),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(blurRadius: 1)]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Name",
                          style: GoogleFonts.merienda(fontSize: 17),
                        ),
                        TextFormField(
                          readOnly: true,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(15),
                              border: OutlineInputBorder()),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Address",
                          style: GoogleFonts.merienda(fontSize: 17),
                        ),
                        TextFormField(
                          readOnly: true,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(15),
                              border: OutlineInputBorder()),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Contact Number",
                          style: GoogleFonts.merienda(fontSize: 17),
                        ),
                        TextFormField(
                          readOnly: true,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(15),
                              border: OutlineInputBorder()),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "State",
                          style: GoogleFonts.merienda(fontSize: 17),
                        ),
                        TextFormField(
                          readOnly: true,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(15),
                              border: OutlineInputBorder()),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "City",
                          style: GoogleFonts.merienda(fontSize: 17),
                        ),
                        TextFormField(
                          readOnly: true,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(15),
                              border: OutlineInputBorder()),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Email ID",
                          style: GoogleFonts.merienda(fontSize: 17),
                        ),
                        TextFormField(
                          readOnly: true,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(15),
                              border: OutlineInputBorder()),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Password",
                          style: GoogleFonts.merienda(fontSize: 17),
                        ),
                        TextFormField(
                          readOnly: true,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(15),
                              border: OutlineInputBorder()),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Website",
                          style: GoogleFonts.merienda(fontSize: 17),
                        ),
                        TextFormField(
                          readOnly: true,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(15),
                              border: OutlineInputBorder()),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Company Logo",
                          style: GoogleFonts.merienda(fontSize: 17),
                        ),
                        TextFormField(
                          readOnly: true,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(15),
                              border: OutlineInputBorder()),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        workprovider.isselected
                            ? Padding(
                                padding: const EdgeInsets.only(left: 150),
                                child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                        backgroundColor:
                                            Color.fromARGB(255, 57, 73, 163),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    onPressed: () {},
                                    child: Text(
                                      "Update",
                                      style: GoogleFonts.amaranth(
                                          color: Colors.white),
                                    )),
                              )
                            : const SizedBox()
                      ]),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
