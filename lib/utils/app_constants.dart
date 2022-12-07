import 'package:get/get.dart';

const String kPCurrency = '₪';

const kFakeImage = 'img/sliders/16616866816673.png';

const kHome = 'home';
const kBack = 'back';

const String kFloatSnackBar = 'floatSnackBar';
const String kRawSnackBar = 'rawSnackBar';

const String kMap = 'map';
const String kAddress = 'address';

const kWaiting = 'waiting';
const kHold = 'hold';
const kPending = 'pending';
const kWayToPickUpPoint = 'way_to_pickup_point';
const kArrivedToPickUpPoint = 'arrived_to_pickup_point';
const kAtPickUpPoint = 'at_pickup_point';
const kWayToDropPoint = 'way_to_drop_point';
const kArrivedToDropPoint = 'arrived_to_drop_point';
const kCollectingMoney = 'collecting_money';
const kCompleted = 'completed';
const kCanceled = 'canceled';
const kDenied = 'denied';

class AppConstants {
  static const googleApiKey = 'AIzaSyDSPeDTWmjTol4rLhHw0fT9Nzrb7bAqs2M';

  static const differentCredentialMessage =
      "[firebase_auth/account-exists-with-different-credential] An account already exists with the same email address but different sign-in credentials. Sign in using a provider associated with this email address.";
  static final failedMessage = "Something went Wrong, try again later".tr;
  static String get requiredField => "Field is required";
  static const introText = "Search the world's information, including webpages, images, videos and more. Google has many special features to help you find exactly what you're looking for.";

  static const String facebookUrl = "https://www.facebook.com/Google/";
  static const String instagram = "https://www.instagram.com/google/";
  static const String twitterUrl = "https://twitter.com/Google?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor";
}
