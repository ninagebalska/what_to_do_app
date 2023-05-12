import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:what_to_do_app/auth/user_profile.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
          width: 250,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF4158D0),
                Color(0xFFC850C0),
                Color(0xFFFFCC70),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 72.0),
            child: Column(
              children: [
                Container(
                  width: 180,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF6200EE),
                      width: 5.0,
                    ),
                  ),
                  child: const CircleAvatar(
                    radius: 100,
                    backgroundImage: NetworkImage(
                        'https://thumbs.dreamstime.com/b/purple-user-icon-circle-shadow-solid-gradient-thin-linear-sign-136856587.jpg'),
                    backgroundColor: Colors.white,
                  ),
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
                ListTile(
                  leading: const Icon(
                    Icons.calendar_month_rounded,
                    color: Color(0xFFfbfbfb),
                  ),
                  title: Text(
                    'Calendar',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: const Color(0xFFfbfbfb),
                    ),
                  ),
                ),
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
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const UserProfile(),
                      ),
                    );
                  },
                ),
              ],
            ),
          )),
    );
  }
}
