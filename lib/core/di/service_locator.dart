import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:real_project/core/network/dio_client.dart';
import 'package:real_project/core/network/local_(hive)/hive_database.dart';
import 'package:real_project/features/auth/data/datasources/auth_dataSource.dart';
import 'package:real_project/features/auth/data/datasources/auth_dataSource_impl.dart';
import 'package:real_project/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:real_project/features/auth/domain/repositories/auth_repository.dart';
import 'package:real_project/features/auth/domain/usecases/confirm_email_usecase.dart';
import 'package:real_project/features/auth/domain/usecases/login_usecase.dart';
import 'package:real_project/features/auth/domain/usecases/new_password.dart';
import 'package:real_project/features/auth/domain/usecases/register_usecase.dart';
import 'package:real_project/features/auth/domain/usecases/reset_password_usecase.dart';
import 'package:real_project/features/auth/presentation/bloc/confirm/confirm_bloc.dart';
import 'package:real_project/features/auth/presentation/bloc/register/register_bloc.dart';
import 'package:real_project/features/auth/presentation/bloc/reset_new_password/new_password_bloc.dart';
import 'package:real_project/features/auth/presentation/bloc/reset_password/reset_password_bloc.dart';

import '../../features/home/data/datasources/home_datasource.dart';
import '../../features/home/data/datasources/home_datasource_impl.dart';
import '../../features/home/data/repositories/home_repository_impl.dart';
import '../../features/home/domain/repositories/home_repository.dart';
import '../../features/home/domain/usecases/category_usecase.dart';
import '../../features/home/domain/usecases/courses_usecase.dart';
import '../../features/home/domain/usecases/mentors_usecase.dart';
import '../../features/home/domain/usecases/search_usecase.dart';
import '../../features/home/domain/usecases/top_mentors_usecase.dart';
import '../../features/home/presentation/bloc/category/category_bloc.dart';
import '../../features/home/presentation/bloc/courses/courses_bloc.dart';
import '../../features/home/presentation/bloc/mentors/mentors_bloc.dart';
import '../../features/home/presentation/bloc/search/search_bloc.dart';
import '../../features/home/presentation/bloc/top_mentors/top_mentors_bloc.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  sl.registerSingleton<DioClient>(DioClient());

  //DATA SOURCES
  //AUTH
  sl.registerLazySingleton<AuthDataSource>(
    () => AuthDataSourceImpl(dioClient: sl<DioClient>()),
  );

  sl.registerLazySingleton<AuthLocalDataBase>(
    () => AuthLocalDataBaseImpl(box: Hive.box('authBox')),
  );

  //HOME
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(dioClient: sl<DioClient>()),
  );

  //REPOSITORIES
  //AUTH
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authDataSource: sl<AuthDataSource>(),
      authLocalDataBase: sl<AuthLocalDataBase>(),
    ),
  );
  // HOME
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(homeRemoteDataSource: sl<HomeRemoteDataSource>()),
  );

  //USECASES
  //AUTH
  sl.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(sl<AuthRepository>()),
  );
  sl.registerLazySingleton<LoginUsecase>(
    () => LoginUsecase(sl<AuthRepository>()),
  );

  sl.registerLazySingleton<ConfirmEmailUseCase>(
    () => ConfirmEmailUseCase(sl<AuthRepository>()),
  );

  sl.registerLazySingleton<ResetPasswordUseCase>(
    () => ResetPasswordUseCase(sl<AuthRepository>()),
  );

  sl.registerLazySingleton<NewPasswordUseCase>(
    () => NewPasswordUseCase(authRepository: sl<AuthRepository>()),
  );

  //HOME
  sl.registerLazySingleton<TopMentorsUseCase>(
    () => TopMentorsUseCase(sl<HomeRepository>()),
  );

  sl.registerLazySingleton<MentorsUseCase>(
    () => MentorsUseCase(sl<HomeRepository>()),
  );

  sl.registerLazySingleton<CoursesUseCase>(
    () => CoursesUseCase(sl<HomeRepository>()),
  );

  sl.registerLazySingleton<CategoryUseCase>(
    () => CategoryUseCase(sl<HomeRepository>()),
  );

  sl.registerLazySingleton<SearchUseCase>(
    () => SearchUseCase(sl<HomeRepository>()),
  );

  //BLOCS
  //AUTH
  sl.registerFactory<RegisterBloc>(
    () => RegisterBloc(repository: sl<AuthRepository>()),
  );

  sl.registerFactory<ResetPasswordBloc>(
    () => ResetPasswordBloc(repository: sl<AuthRepository>()),
  );

  sl.registerFactory<ConfirmEmailBloc>(
    () => ConfirmEmailBloc(
      repository: sl<AuthRepository>(),
      authLocalDataBase: sl<AuthLocalDataBase>(),
    ),
  );

  sl.registerFactory<NewPasswordBloc>(
    () => NewPasswordBloc(sl<AuthRepository>()),
  );

  //HOME
  sl.registerLazySingleton<TopMentorsBloc>(
    () => TopMentorsBloc(sl<HomeRepository>()),
  );

  sl.registerLazySingleton<MentorBloc>(() => MentorBloc(sl<HomeRepository>()));

  sl.registerLazySingleton<CoursesBloc>(
    () => CoursesBloc(sl<HomeRepository>()),
  );

  sl.registerLazySingleton<CategoryBloc>(
    () => CategoryBloc(sl<HomeRepository>()),
  );

  sl.registerLazySingleton<SearchBloc>(() => SearchBloc(sl<HomeRepository>()));
}
