import 'package:blog_app/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:blog_app/core/secrets/supabase_secret.dart';
import 'package:blog_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:blog_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:blog_app/features/auth/domain/usecases/current_user.dart';
import 'package:blog_app/features/auth/domain/usecases/user_login.dart';

import 'package:blog_app/features/auth/domain/usecases/user_signup.dart';
import 'package:blog_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  final supabase = await Supabase.initialize(
    anonKey: AppSecrets.anonKey,
    url: AppSecrets.url,
  );

  serviceLocator.registerLazySingleton(() => supabase.client);

  //Core
  serviceLocator.registerLazySingleton(() => AppUserCubit());
}

void _initAuth() {
// DATASOURCE
  serviceLocator
      .registerFactory<AuthRemoteDatasource>(() => AuthRemoteDatasourceImpl(
            serviceLocator(),
          ));
// REPOSITORY
  serviceLocator.registerFactory<AuthRepository>(() => AuthRepositoryImpl(
        serviceLocator(),
      ));
// USECASES
  serviceLocator.registerFactory(() => UserSignup(
        serviceLocator(),
      ));

  serviceLocator.registerFactory(() => UserLogin(
        serviceLocator(),
      ));

  serviceLocator.registerFactory(() => CurrentUser(
        serviceLocator(),
      ));

  // serviceLocator.registerFactory(() => UserLogout(
  //       serviceLocator(),
  //     ));

  // BLOC
  serviceLocator.registerLazySingleton(() => AuthBloc(
        userSignUp: serviceLocator(),
        userLogin: serviceLocator(),
        currentUser: serviceLocator(),
        appUserCubit: serviceLocator(),
        // userLogout: serviceLocator(),
      ));
}
