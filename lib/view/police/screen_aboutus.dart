import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:secure_kare/view/user/screen_user_home.dart';

class ScreenAboutUs extends StatelessWidget {
  const ScreenAboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 255, 222),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return ScreenUserHome();
                },
              ));
            },
            icon: const Icon(
              Icons.keyboard_arrow_left_outlined,
              color: Colors.black,
            )),
        backgroundColor: const Color.fromARGB(255, 247, 255, 222),
        title: Text(
          "About us",
          style: GoogleFonts.quicksand(color: Colors.black),
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
              height: 680,
              decoration: BoxDecoration(
                  boxShadow: [BoxShadow(blurRadius: 1)],
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
