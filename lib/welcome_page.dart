import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(30),
          children: [
            Text(
              'Manage your tasks with TO-DO app!',
              style: GoogleFonts.poppins(
                color: const Color(0xFF4158D0),
              ),
            ),
            Lottie.network(
              'https://assets7.lottiefiles.com/packages/lf20_vf4s9n4i.json',
              width: 250,
              height: 300,
            ),
            const ElevatedButton(
              onPressed: null,
              child: Text('Let\'s start!'),
            ),
          ],
        ),
      ),
    );
  }
}
