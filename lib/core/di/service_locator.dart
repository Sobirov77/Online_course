import 'package:get_it/get_it.dart';
import 'package:real_project/core/network/dio_client.dart';
import 'package:real_project/features/auth/data/datasources/auth_dataSource.dart';
import 'package:real_project/features/auth/data/datasources/auth_dataSource_impl.dart';
import 'package:real_project/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:real_project/features/auth/domain/repositories/auth_repository.dart';
import 'package:real_project/features/auth/domain/usecases/register_usecase.dart';
import 'package:real_project/features/auth/presentation/bloc/confirm/confirm_bloc.dart';
import 'package:real_project/features/auth/presentation/bloc/register/register_bloc.dart';
import 'package:real_project/features/auth/presentation/bloc/reset_password/reset_password_bloc.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  sl.registerSingleton<DioClient>(DioClient());

  sl.registerLazySingleton<AuthDataSource>(
    () => AuthDataSourceImpl(dioClient: sl<DioClient>()),
  );

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(authDataSource: sl<AuthDataSource>()),
  );

  sl.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(sl<AuthRepository>()),
  );

  sl.registerFactory<RegisterBloc>(
    () => RegisterBloc(repository: sl<AuthRepository>()),
  );
  sl.registerFactory<ResetPasswordBloc>(
    () => ResetPasswordBloc(repository: sl<AuthRepository>()),
  );
  sl.registerFactory<ConfirmEmailBloc>(
    () => ConfirmEmailBloc(repository: sl<AuthRepository>()),
  );
}
