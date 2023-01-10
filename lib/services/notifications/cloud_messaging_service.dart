import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:yalla_mazad/main.dart';
import 'package:yalla_mazad/services/notifications/local_notifications_service.dart';

class CloudMessagingService {
  void terminated(RemoteMessage? message) {
    if (message == null) return;
    if (message.notification != null && message.data.isNotEmpty) {
      final data = message.notification;
      log("terminatedMessage::\nTitle:: ${data?.title}\nBody:: ${data?.body}\nData:: ${message.data}");
      // RoutesService().toggle(message.data);
    }
  }

  void foreground(RemoteMessage? message) {
    if (message == null) return;
    if (message.notification != null) {
      final data = message.notification;
      notificationsMap = message.data;
      log("foregroundMessage::\nTitle:: ${data?.title}\nBody:: ${data?.body}\nData:: ${message.data}");
      LocalNotificationsService().display(message);
    }
  }

  void background(RemoteMessage? message) {
    if (message == null) return;
    if (message.notification != null && message.data.isNotEmpty) {
      final data = message.notification;
      log("backgroundMessage::\nTitle:: ${data?.title}\nBody:: ${data?.body}\nData:: ${message.data}");
      // RoutesService().toggle(message.data);
    }
  }
}
