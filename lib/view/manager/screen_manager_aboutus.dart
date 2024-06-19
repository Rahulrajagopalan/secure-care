import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:secure_kare/view/manager/screen_home_manager.dart';

class ScreenManagerAboutUs extends StatelessWidget {
  const ScreenManagerAboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
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
        title: Text(
          "About us",
          style: GoogleFonts.nunitoSans(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 500,
              height: 650,
              decoration: BoxDecoration(
                  boxShadow: [BoxShadow(blurRadius: 3)],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  '''Thank you for considering [Company Name] for your career path. We're excited about the opportunity to learn more about you through your registration application.
                  
                  At [Company Name], we're driven by innovation, collaboration, and a commitment to excellence. Our mission is to [briefly state mission], and our culture is built on values like [list key values].
                  
                  We believe in creating a workplace where every individual's talents are recognized and nurtured, and where diversity and inclusion are celebrated.
                  
                  We look forward to reviewing your application and potentially welcoming you to our team.
                  
                  Best regards,
                  
                  [Your Name]
                  
                  [Your Position/Department]
                  
                  [Company Name]''',
                  style: GoogleFonts.nunitoSans(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
