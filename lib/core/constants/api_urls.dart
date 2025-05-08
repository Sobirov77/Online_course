abstract class ApiUrls {
  static final baseURL = "https://manuchehra.pythonanywhere.com/api";
  static final login = "$baseURL/auth/login";
  static final register = "$baseURL/auth/register/";
  static final confirmEmail = "$baseURL/auth/confirm-email/";
  static final resetPassword = "$baseURL/auth/reset-password/";
  static final resetPasswordConfirmPassword =
      "$baseURL/auth/reset-password/confirm-password/";
  static final resetPasswordConfirmCode =
      "$baseURL/auth/reset-password/confirm-code/";
  static const String search = '/search/?q=';
  static const String categories = '/categories/?limit=';
  static final String topMentors = '/mentors/top/?limit=';
  static final String mentors = '/mentors/?limit=';
  static final String popularCourses = '/courses/popular/?limit=';
}
