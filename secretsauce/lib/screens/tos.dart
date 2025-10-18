import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TosPage extends StatelessWidget {
  const TosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 1,
        title: Text(
          "Terms of Service",
          style: TextStyle(
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontSize: 20,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Text(
            '''
Welcome to Secret Sauce App!

This app is a student project created purely for learning and fun. By using this app, you agree to the following:

1. Project Disclaimer
   • This is not a commercial product.
   • All features, content, and services are made for educational purposes only.

2. Data & Privacy
   • I used free tools, libraries, and backend services (FastAPI, etc.) to build this app.
   • While I try to handle data responsibly, I cannot guarantee full security.
   • Any accidental data loss, leaks, or other issues are not my responsibility.

3. Usage
   • You are free to use this app for fun or testing, but do not expect it to be production-ready.
   • I am not liable for any damages or problems caused by using this app.

4. Intellectual Property
   • All code, fonts, and libraries used are either free or open-source.
   • You may learn from this project, but it’s not intended for commercial use.

5. Acknowledgment
   • By using this app, you acknowledge that this is a student-made project and accept that risks exist.

TL;DR:
I made this app for fun using free tools. If something breaks, gets lost, or data leaks, that’s on you, not me.
''',
            style: TextStyle(
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontSize: 14,
              height: 1.6,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
