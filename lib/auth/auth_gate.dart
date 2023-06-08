import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_to_do_app/auth/cubit/auth_cubit.dart';
import 'package:what_to_do_app/auth/login_page.dart';
import 'package:what_to_do_app/features/home/page/home_page.dart';
import 'package:what_to_do_app/injection_container.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>()..start(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          final user = state.user;
          if (user == null) {
            return LoginPage();
          }
          return const HomePage();
        },
      ),
    );
  }
}
