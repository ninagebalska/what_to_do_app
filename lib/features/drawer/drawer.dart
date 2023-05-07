import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 250,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [
              0.2,
              0.6,
              0.8,
            ],
            colors: [
              Color(0xffCAD2C5),
              Color(0xff52796F),
              Color(0xFF2F3E46),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 72.0),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 80,
                backgroundColor: Colors.white,
              ),
              const SizedBox(height: 20),
              Text(
                'Hello!',
                style: GoogleFonts.poppins(
                  fontSize: 36,
                  color: const Color(0xFFfbfbfb),
                ),
              ),
              const SizedBox(height: 100),
              // ListTile(
              //   leading: const Icon(
              //     Icons.calendar_month_rounded,
              //     color: Color(0xFFfbfbfb),
              //   ),
              //   title: Text(
              //     'Calendar',
              //     style: GoogleFonts.poppins(
              //       fontSize: 18,
              //       color: const Color(0xFFfbfbfb),
              //     ),
              //   ),
              // ),
              ListTile(
                leading: const Icon(
                  Icons.manage_accounts_rounded,
                  color: Color(0xFFfbfbfb),
                ),
                title: Text(
                  'Profile settings',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: const Color(0xFFfbfbfb),
                  ),
                ),
                onTap: () => UserProfile(),
              ),
            ],
          ),
        ));
  }
}
