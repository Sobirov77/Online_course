import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_project/core/routes/route_generator.dart';
import 'package:real_project/core/routes/route_names.dart';
import 'package:real_project/features/auth/presentation/bloc/confirm/confirm_bloc.dart';
import 'package:real_project/features/auth/presentation/bloc/register/register_bloc.dart';
import 'package:real_project/features/auth/presentation/bloc/reset_new_password/new_password_bloc.dart';
import 'package:real_project/features/auth/presentation/bloc/reset_password/reset_password_bloc.dart';

import 'core/di/service_locator.dart';
import 'features/home/presentation/bloc/category/category_bloc.dart';
import 'features/home/presentation/bloc/courses/courses_bloc.dart';
import 'features/home/presentation/bloc/mentors/mentors_bloc.dart';
import 'features/home/presentation/bloc/search/search_bloc.dart';
import 'features/home/presentation/bloc/top_mentors/top_mentors_bloc.dart';

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
        BlocProvider<ResetPasswordBloc>(
          create: (context) => sl<ResetPasswordBloc>(),
        ),
        BlocProvider<NewPasswordBloc>(
          create: (context) => sl<NewPasswordBloc>(),
        ),
        BlocProvider<TopMentorsBloc>(create: (context) => sl<TopMentorsBloc>()),
        BlocProvider<MentorBloc>(create: (context) => sl<MentorBloc>()),
        BlocProvider<CoursesBloc>(create: (context) => sl<CoursesBloc>()),
        BlocProvider<CategoryBloc>(create: (context) => sl<CategoryBloc>()),
        BlocProvider<SearchBloc>(create: (context) => sl<SearchBloc>()),
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
