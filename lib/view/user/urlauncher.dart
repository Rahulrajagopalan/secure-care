import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class ScreenurlLauncher extends StatefulWidget {
  const ScreenurlLauncher({super.key});

  @override
  State<ScreenurlLauncher> createState() => _ScreenurlLauncherState();
}

class _ScreenurlLauncherState extends State<ScreenurlLauncher> {
  sendEmail(String subject, String body, String recipientmail) async {
    final Email email = Email(
        body: body,
        subject: subject,
        recipients: [recipientmail],
        isHTML: false);
    await FlutterEmailSender.send(email);
  }

  @override
  Widget build(BuildContext context) {
    final _key = GlobalKey<FormState>();
    TextEditingController mail = TextEditingController();
    TextEditingController subjecct = TextEditingController();
    TextEditingController body = TextEditingController();
    return Scaffold(
      body: Form(
        key: _key,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: mail,
            ),
            TextFormField(
              controller: subjecct,
            ),
            TextFormField(
              controller: body,
            ),
            ElevatedButton(
                onPressed: () async {
                  _key.currentState!.save();
                  print('${mail.text}');
                  sendEmail(subjecct.text, body.text, mail.text);
                },
                child: Text("Send EMail"))
          ],
        ),
      ),
    );
  }
}
