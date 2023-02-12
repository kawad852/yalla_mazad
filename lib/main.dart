import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/binding/authentication/authentication_binding.dart';
import 'package:yalla_mazad/binding/home/home_binding.dart';
import 'package:yalla_mazad/binding/introduction/introduction_binding.dart';
import 'package:yalla_mazad/controller/material_controller.dart';
import 'package:yalla_mazad/translation/translation.dart';
import 'package:yalla_mazad/ui/screens/authentication/screens/authentication_screen.dart';
import 'package:yalla_mazad/ui/screens/internet_screen.dart';
import 'package:yalla_mazad/ui/screens/intro/screens/intro_screen.dart';
import 'package:yalla_mazad/ui/widgets/custom_navigation_bar.dart';
import 'package:yalla_mazad/utils/material_theme.dart';
import 'package:yalla_mazad/utils/shared_prefrences.dart';

Map<String, dynamic> notificationsMap = {};
//.................

Future<void> _onBackgroundMessage(RemoteMessage message) async {
  if (message.notification != null) {
    final data = message.notification;
    log("onBackgroundMessage::\nTitle:: ${data?.title}\nBody:: ${data?.body}\nData:: ${message.data}");
  }
}

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  //FirebaseMessaging.onBackgroundMessage(_onBackgroundMessage);
  await MySharedPreferences.init();
  Get.put(MaterialController());
  if (MySharedPreferences.language.isEmpty) {
    MySharedPreferences.language = Get.deviceLocale!.languageCode;
  }
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  try {
    log('try');
    if (!kIsWeb) {
      await Firebase.initializeApp();
    } else {
      Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: "AIzaSyB2Hr22qEokMKOJr_0_FmSQmYv8soIuOF0",
          authDomain: "yalla-mazad-2c0c2.firebaseapp.com",
          databaseURL: "https://yalla-mazad-2c0c2-default-rtdb.firebaseio.com",
          projectId: "yalla-mazad-2c0c2",
          storageBucket: "yalla-mazad-2c0c2.appspot.com",
          messagingSenderId: "567364200295",
          appId: "1:567364200295:web:cc5caa7b71a1e3c5fb31c2",
          measurementId: "G-G1RH70W4WK",
        ),
      );
    }
    log('could');
    FlutterNativeSplash.remove();
  } catch (e) {
    log('could not');
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final controller = MaterialController.find;

  Widget _toggleScreen() {
    if (MySharedPreferences.isLogIn) {
      return const CustomNavigationBar();
    } else if (!MySharedPreferences.isLogIn &&
        !MySharedPreferences.isPassedIntro) {
      return IntroScreen();
    } else {
      return const AuthenticationScreen();
    }
  }

  Bindings? _initialBinding() {
    if (MySharedPreferences.isLogIn) {
      return HomeBinding();
    } else if (!MySharedPreferences.isLogIn &&
        !MySharedPreferences.isPassedIntro) {
      return IntroductionBinding();
    } else {
      return AuthenticationBinding();
    }
  }

  @override
  void initState() {
    // FirebaseMessaging.instance.getToken().then((value) async {
    //   MySharedPreferences.deviceToken = value!;
    //   log("deviceToken:: $value");
    //   if (MySharedPreferences.accessToken.isNotEmpty) {
    //     DeviceTokenService().updateDeviceToken(value);
    //   }
    // });

    Connectivity().onConnectivityChanged.listen((status) {
      log("internetStatus:: $status");
      if (status == ConnectivityResult.none) {
        setState(() {
          controller.internetConnection = false;
        });
      } else {
        setState(() {
          controller.internetConnection = true;
        });
      }
    });

    // LocalNotificationsService().initialize();
    //
    // FirebaseMessaging.instance.requestPermission();
    //
    // FirebaseMessaging.instance.getInitialMessage().then(CloudMessagingService().terminated);
    // FirebaseMessaging.onMessage.listen(CloudMessagingService().foreground);
    // FirebaseMessaging.onMessageOpenedApp.listen(CloudMessagingService().background);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: _initialBinding(),
      translations: Translation(),
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ar', 'JO'),
      ],
      locale: Locale(MySharedPreferences.language),
      fallbackLocale: Locale(MySharedPreferences.language),
      theme: AppThemeData().materialTheme,
      home: controller.internetConnection
          ? _toggleScreen()
          : const InternetScreen(),
    );
  }
}
