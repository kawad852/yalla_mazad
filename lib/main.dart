import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/binding/authentication/authentication_binding.dart';
import 'package:yalla_mazad/binding/profile/profile_binding.dart';
import 'package:yalla_mazad/translation/translation.dart';
import 'package:yalla_mazad/ui/screens/auth/screens/authentication_screen.dart';
import 'package:yalla_mazad/ui/screens/intro/screens/intro_screen.dart';
import 'package:yalla_mazad/ui/screens/profile/screens/account_screen.dart';
import 'package:yalla_mazad/ui/screens/profile/screens/edit_profile_screen.dart';
import 'package:yalla_mazad/utils/material_theme.dart';
import 'package:yalla_mazad/utils/shared_prefrences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MySharedPreferences.init();
  if (MySharedPreferences.language.isEmpty) {
    MySharedPreferences.language = Get.deviceLocale!.languageCode;
  }
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget _toggleScreen() {
    if (MySharedPreferences.isLogIn) {
      return const AuthenticationScreen();
      //return const BaseNavBar();
    } else if (!MySharedPreferences.isLogIn &&
        !MySharedPreferences.isPassedIntro) {
      return IntroScreen();
    } else {
      ///TODO: change to home
      return IntroScreen();
    }
  }

  Bindings? _initialBinding() {
    // if (MySharedPreferences.isLogIn) {
    //   ///TODO: change to home
    //   //return NavBarBinding();
    // } else if (!MySharedPreferences.isLogIn &&
    //     !MySharedPreferences.isPassedIntro) {
    //   ///TODO: make sure
    //   return null;
    // } else {
    return AuthenticationBinding();
    //}
  }

  @override
  Widget build(BuildContext context) {
    // Get.to(() => const SignInScreen(), binding: RegistrationBinding());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: _initialBinding(),
      // initialBinding: ProfileBinding(),
      translations: Translation(),
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ar', 'JO'),
      ],
      //locale: Locale('ar'),
      locale: Locale(MySharedPreferences.language),
      fallbackLocale: Locale(MySharedPreferences.language),
      theme: AppThemeData().materialTheme,
      home: _toggleScreen(),
      // home: EditProfileScreen(),
    );
  }
}
