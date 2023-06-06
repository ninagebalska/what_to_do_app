import 'package:get_it/get_it.dart';
import 'package:what_to_do_app/auth/cubit/auth_cubit.dart';
import 'package:what_to_do_app/features/add/cubit/add_cubit.dart';
import 'package:what_to_do_app/features/home/cubit/home_cubit.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  getIt.registerFactory(() => HomeCubit(getIt()));
  getIt.registerFactory(() => AddCubit(getIt()));
  getIt.registerFactory(() => AuthCubit(getIt()));
}
