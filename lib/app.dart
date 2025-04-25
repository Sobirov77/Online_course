import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_project/core/routes/route_generator.dart';
import 'package:real_project/core/routes/route_names.dart';
import 'package:real_project/features/auth/presentation/bloc/confirm/confirm_bloc.dart';
import 'package:real_project/features/auth/presentation/bloc/register/register_bloc.dart';

import 'core/di/service_locator.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RegisterBloc>(create: (context) => sl<RegisterBloc>()),
        BlocProvider<ConfirmEmailBloc>(
          create: (context) => sl<ConfirmEmailBloc>(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(428, 926), // Figma dizayn o‘lchami
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: RouteNames.splash,
            onGenerateRoute: AppRoutes(context: context).onGenerateRoute,
          );
        },
      ),
    );
  }
}
