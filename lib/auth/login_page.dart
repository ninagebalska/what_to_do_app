import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:what_to_do_app/auth/cubit/auth_cubit.dart';
import 'package:what_to_do_app/enums.dart';
import 'package:what_to_do_app/injection_container.dart';

import '../features/home/page/home_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (context) => getIt(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          final errorMessage = state.errorMessage;
          if (state.status == Status.error) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(errorMessage)));
          }
          if (state.status == Status.success) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const HomePage(),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color(0xFFFBFBFB),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Image(
                      image: AssetImage('images/login1.png'),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          state.isCreatingAccount ? 'Register' : 'Welcome back',
                          style: GoogleFonts.poppins(
                            fontSize: 36,
                            color: const Color(0xFF4158D0),
                          ),
                        ),
                        Text(
                          state.isCreatingAccount
                              ? 'Create your account.'
                              : 'Login to your account.',
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
                      onPressed: () {
                        //signing up
                        if (state.isCreatingAccount) {
                          context.read<AuthCubit>().register(
                              email: emailController.text,
                              password: passwordController.text);
                        }
                        //signing in
                        context.read<AuthCubit>().signIn(
                            email: emailController.text,
                            password: passwordController.text);
                      },
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
                            state.isCreatingAccount ? 'SIGN UP' : 'LOGIN',
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
                          state.isCreatingAccount
                              ? 'Already have an account?'
                              : 'Don\'t have an account?',
                          style: GoogleFonts.poppins(color: Colors.black54),
                        ),
                        TextButton(
                          onPressed: () {
                            if (state.isCreatingAccount == false) {
                              context.read<AuthCubit>().createAccount();
                            }
                            if (state.isCreatingAccount) {
                              context.read<AuthCubit>().notCreateAccount();
                            }
                          },
                          style: TextButton.styleFrom(
                              foregroundColor: const Color(0xFF4158D0)),
                          child: Text(
                            state.isCreatingAccount ? 'Sign in' : 'Register',
                            style: GoogleFonts.poppins(),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
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
