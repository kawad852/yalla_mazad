import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/translation/translation.dart';
import 'package:yalla_mazad/ui/screens/registration/sign_in/sign_in_screen.dart';
import 'package:yalla_mazad/utils/material_theme.dart';
import 'package:yalla_mazad/utils/shared_prefrences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MySharedPreferences.init();
  if (MySharedPreferences.language.isEmpty) {
    MySharedPreferences.language = Get.deviceLocale!.languageCode;
  }
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Widget _toggleScreen() {
  //   if (MySharedPreferences.isLogIn) {
  //     return const BaseNavBar();
  //   } else if (!MySharedPreferences.isLogIn && !MySharedPreferences.isPassedIntro) {
  //     return const IntroScreen();
  //   } else {
  //     return const RegistrationScreen();
  //   }
  // }
  //
  // Bindings? _initialBinding() {
  //   if (MySharedPreferences.isLogIn) {
  //     return NavBarBinding();
  //   } else if (!MySharedPreferences.isLogIn && !MySharedPreferences.isPassedIntro) {
  //     return null;
  //   } else {
  //     return RegistrationBinding();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // Get.to(() => const SignInScreen(), binding: RegistrationBinding());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // initialBinding: _initialBinding(),
      translations: Translation(),
      // localizationsDelegates: GlobalMaterialLocalizations.delegates,
      // supportedLocales: const [
      //   Locale('en', 'US'),
      //   Locale('ar', 'JO'),
      // ],
      // locale: Locale(MySharedPreferences.language),
      locale: Locale(MySharedPreferences.language),
      fallbackLocale: Locale(MySharedPreferences.language),
      theme: AppThemeData().materialTheme,
      home: const SignInScreen(),
      //home: const IntroScreen(),
    );
  }
}
