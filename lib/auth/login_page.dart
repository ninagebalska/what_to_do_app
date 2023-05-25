import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(image: AssetImage('images/login.png')),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Login',
                  style: GoogleFonts.poppins(
                    fontSize: 36,
                    color: const Color(0xFF4158D0),
                  ),
                ),
                Text(
                  'Please sign in to continue.',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: const Color(0xFF4158D0),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 36),
            _ThemedTextField(
              controller: emailController,
              hintText: 'example@gmail.com',
              icon: const Icon(
                Icons.email_rounded,
                color: Colors.orange,
              ),
              obscureText: false,
            ),
            const SizedBox(height: 18),
            _ThemedTextField(
              controller: passwordController,
              hintText: 'password',
              icon: const Icon(
                Icons.lock_rounded,
                color: Colors.orange,
              ),
              obscureText: true,
            ),
            const SizedBox(height: 18),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'LOGIN',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_right_alt_rounded,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account?',
                  style: GoogleFonts.poppins(color: Colors.black54),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      foregroundColor: const Color(0xFF4158D0)),
                  child: const Text(
                    'Register',
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _ThemedTextField extends StatelessWidget {
  const _ThemedTextField(
      {required this.controller,
      required this.obscureText,
      required this.hintText,
      required this.icon});
  final TextEditingController controller;
  final bool obscureText;
  final String hintText;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 2,
            color: Colors.orange,
          ),
          borderRadius: BorderRadius.circular(32.0),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 2,
            color: Colors.orange,
          ),
          borderRadius: BorderRadius.circular(32.0),
        ),
        hintText: hintText,
        prefixIcon: icon,
      ),
    );
  }
}
