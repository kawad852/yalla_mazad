import 'package:get/get.dart';

class AppConstants {
  static const differentCredentialMessage =
      "[firebase_auth/account-exists-with-different-credential] An account already exists with the same email address but different sign-in credentials. Sign in using a provider associated with this email address.";
  static final failedMessage = "Something went Wrong, try again later".tr;
  static String get requiredField => "Field is required";
  static const String facebookUrl = "https://www.facebook.com/Google/";
  static const String instagram = "https://www.instagram.com/google/";
  static const String twitterUrl =
      "https://twitter.com/Google?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor";
}
