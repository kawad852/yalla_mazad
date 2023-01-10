import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/binding/authentication/authentication_binding.dart';
import 'package:yalla_mazad/binding/home/home_binding.dart';
import 'package:yalla_mazad/binding/introduction/introduction_binding.dart';
import 'package:yalla_mazad/services/notifications/cloud_messaging_service.dart';
import 'package:yalla_mazad/services/notifications/device_token_service.dart';
import 'package:yalla_mazad/services/notifications/local_notifications_service.dart';
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
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(_onBackgroundMessage);
  await MySharedPreferences.init();
  if (MySharedPreferences.language.isEmpty) {
    MySharedPreferences.language = Get.deviceLocale!.languageCode;
  }
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool internetConnection = true;

  Widget _toggleScreen() {
    if (MySharedPreferences.isLogIn) {
      return const CustomNavigationBar();
    } else if (!MySharedPreferences.isLogIn && !MySharedPreferences.isPassedIntro) {
      return IntroScreen();
    } else {
      return const AuthenticationScreen();
    }
  }

  Bindings? _initialBinding() {
    if (MySharedPreferences.isLogIn) {
      return HomeBinding();
    } else if (!MySharedPreferences.isLogIn && !MySharedPreferences.isPassedIntro) {
      return IntroductionBinding();
    } else {
      return AuthenticationBinding();
    }
  }

  @override
  void initState() {
    FirebaseMessaging.instance.getToken().then((value) async {
      MySharedPreferences.deviceToken = value!;
      log("deviceToken:: $value");
      if (MySharedPreferences.accessToken.isNotEmpty) {
        DeviceTokenService().updateDeviceToken(value);
      }
    });

    Connectivity().onConnectivityChanged.listen((status) {
      log("internetStatus:: $status");
      if (status == ConnectivityResult.none) {
        setState(() {
          internetConnection = false;
        });
      } else {
        setState(() {
          internetConnection = true;
        });
      }
    });

    LocalNotificationsService().initialize();

    FirebaseMessaging.instance.requestPermission();

    FirebaseMessaging.instance.getInitialMessage().then(CloudMessagingService().terminated);
    FirebaseMessaging.onMessage.listen(CloudMessagingService().foreground);
    FirebaseMessaging.onMessageOpenedApp.listen(CloudMessagingService().background);

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
      home: internetConnection ? _toggleScreen() : const InternetScreen(),
      //home:CustomNavigationBar(),
    );
  }
}
