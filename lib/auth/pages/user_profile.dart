import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProfileScreen(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'User Profile',
          style: GoogleFonts.poppins(
            color: const Color(0xFF354F52),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      providers: [
        EmailAuthProvider(),
      ],
      actions: [
        SignedOutAction(
          (context) {
            Navigator.of(context).pop();
          },
        ),
      ],
      avatarSize: 170,
    );
  }
}
