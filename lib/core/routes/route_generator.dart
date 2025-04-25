import 'package:flutter/material.dart';
import 'package:real_project/core/routes/route_names.dart';
import 'package:real_project/features/auth/presentation/pages/forgot_password.dart';
import 'package:real_project/features/auth/presentation/pages/lets_in.dart';
import 'package:real_project/features/auth/presentation/pages/otp_code_confirmation.dart';
import 'package:real_project/features/auth/presentation/pages/profile.dart';
import 'package:real_project/features/auth/presentation/pages/sign_up.dart';
import 'package:real_project/features/home/presentation/pages/home/home.dart';
import 'package:real_project/features/home/presentation/pages/home/home_search.dart';
import 'package:real_project/features/splash/splash_page.dart';

import '../../features/auth/presentation/pages/create_new_password.dart';
import '../../features/auth/presentation/pages/finger_print.dart';
import '../../features/auth/presentation/pages/forgot_password_code.dart';
import '../../features/auth/presentation/pages/pin.dart';
import '../../features/auth/presentation/pages/sign_in.dart';
import '../../features/splash/images_page.dart';

class AppRoutes {
  BuildContext context;

  AppRoutes({required this.context});

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteNames.splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case RouteNames.splash_images:
        return MaterialPageRoute(builder: (_) => ImageSliderPage());
      case RouteNames.sign_in:
        return MaterialPageRoute(builder: (_) => LetsIn());
      case RouteNames.sign_up:
        return MaterialPageRoute(builder: (_) => SignUp());
      case RouteNames.sign_in_login:
        return MaterialPageRoute(builder: (_) => SignIn());
      case RouteNames.profile:
        return MaterialPageRoute(builder: (_) => Profile());
      case RouteNames.otp_confirm:
        final user_id = routeSettings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => OtpCodeConfirmation(user_id: user_id),
        );
      case RouteNames.finger_print:
        return MaterialPageRoute(builder: (_) => FingerPrint());
      case RouteNames.forgot_password:
        return MaterialPageRoute(builder: (_) => ForgotPassword());
      case RouteNames.home:
        return MaterialPageRoute(builder: (_) => Home());
      case RouteNames.forgot_password_code:
        return MaterialPageRoute(builder: (_) => ForgotPasswordCode());
      case RouteNames.create_new_password:
        return MaterialPageRoute(builder: (_) => CreateNewPassword());
      case RouteNames.home_search:
        return MaterialPageRoute(builder: (_) => HomeSearch());
      case RouteNames.pin:
        return MaterialPageRoute(builder: (_) => Pin());
      default:
        return _errorRoute();
    }
  }

  Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder:
          (_) => Scaffold(
            appBar: AppBar(title: const Text('Error')),
            body: const Center(child: Text('Page not found')),
          ),
    );
  }
}
