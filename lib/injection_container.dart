import 'package:get_it/get_it.dart';
import 'package:what_to_do_app/auth/cubit/auth_cubit.dart';
import 'package:what_to_do_app/domain/repositories/auth_repository.dart';
import 'package:what_to_do_app/domain/repositories/events_repository.dart';
import 'package:what_to_do_app/features/add/cubit/add_cubit.dart';
import 'package:what_to_do_app/features/home/cubit/home_cubit.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  getIt.registerSingleton<AuthRepository>(AuthRepository());
  getIt.registerSingleton<EventsRepository>(EventsRepository());
  getIt.registerFactory(() => HomeCubit(eventsRepository: getIt()));
  getIt.registerFactory(() => AddCubit(eventsRepository: getIt()));
  getIt.registerFactory(() => AuthCubit(authRepository: getIt()));
}
