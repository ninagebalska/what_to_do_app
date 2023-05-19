import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:what_to_do_app/auth/auth_gate.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                  'https://cdni.iconscout.com/illustration/free/thumb/free-task-list-2080780-1753768.png'),
              const SizedBox(height: 50),
              Text(
                'Get your things done with TODO',
                style: GoogleFonts.poppins(
                    color: const Color(0xFF4158D0),
                    fontSize: 19,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 25),
              Text(
                'Manage your daily tasks, stay organized and get things done efficiently',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: const Color(0xFF7584D0),
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const AuthGate(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
                child: Text(
                  'Start now!',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 28,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
