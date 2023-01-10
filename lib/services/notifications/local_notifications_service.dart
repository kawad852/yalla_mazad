import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:yalla_mazad/main.dart';
import 'package:yalla_mazad/utils/colors.dart';

class LocalNotificationsService {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  void initialize() {
    const initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings('@drawable/notifications_icon'),
      iOS: DarwinInitializationSettings(
        requestSoundPermission: false,
        requestBadgePermission: false,
        requestAlertPermission: false,
      ),
    );
    _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (message) {
        if (notificationsMap.isNotEmpty) {
          // RoutesService().toggle(notificationsMap);
        }
      },
    );
  }

  //for notifications in foreground
  void display(RemoteMessage message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      const AndroidNotificationChannel channel = AndroidNotificationChannel(
        'takkehchannel', // id
        'Takkeh channel', // title
        description: 'This channel is used for important notifications.',
        importance: Importance.max,
        playSound: true,
      );

      await _flutterLocalNotificationsPlugin.show(
        id,
        message.notification!.title,
        message.notification!.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            importance: Importance.max,
            playSound: true,
            icon: '@drawable/notifications_icon',
            color: MyColors.primary,
          ),
          iOS: const DarwinNotificationDetails(),
        ),
      );
    } on Exception catch (e) {
      log("Exception:: $e");
    }
  }
}
