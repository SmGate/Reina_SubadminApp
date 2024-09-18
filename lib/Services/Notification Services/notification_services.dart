import 'package:app_settings/app_settings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import '../../Model/User.dart';
import '../../Routes/set_routes.dart';
import '../Shared Preferences/MySharedPreferences.dart';

class NotificationServices {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  initFlutterNotificationPlugin(RemoteMessage message) async {
    var androidInitialization =
        AndroidInitializationSettings("@mipmap/ic_launcher");
    var initializeSetting =
        InitializationSettings(android: androidInitialization);

    await flutterLocalNotificationsPlugin.initialize(initializeSetting,
        onDidReceiveNotificationResponse: (payload) async {
      handleMessages(message);
    });
  }

  fireBaseInit() {
    FirebaseMessaging.onMessage.listen((message) {
      initFlutterNotificationPlugin(message);
      showNotificationFlutter(message);
    });
  }

  Future<void> showNotificationFlutter(RemoteMessage message) async {
    // Android Channel Initialization
    AndroidNotificationChannel androidNotificationChannel =
        AndroidNotificationChannel(
      "high_importance_channel",
      "high_importance_channel",
      description: "smart-gate-notification",
      importance: Importance.max,
    );

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
            androidNotificationChannel.id, androidNotificationChannel.name,
            channelDescription: androidNotificationChannel.description,
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');

    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    Future.delayed(Duration.zero, () {
      flutterLocalNotificationsPlugin.show(
          0,
          message.notification!.title.toString(),
          message.notification!.body.toString(),
          notificationDetails);
    });
  }

  requestNotification() async {
    NotificationSettings settings = await firebaseMessaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        sound: true,
        carPlay: true,
        criticalAlert: true,
        provisional: true);
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('permission granted');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('permission denied');
      AppSettings.openAppSettings();
    }
  }

  Future<String?> getDeviceToken() async {
    String? deviceToken = await firebaseMessaging.getToken();

    return deviceToken;
  }

  refreshDeviceToken() async {
    firebaseMessaging.onTokenRefresh.listen((event) {
      event.toString();
    });
  }

  Future<void> setupInteractMessage() async {
    // when app is terminated
    RemoteMessage? message =
        await FirebaseMessaging.instance.getInitialMessage();

    if (message != null) {
      handleMessages(message);
    }

    // when app is running in background then this function is call
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      handleMessages(event);
    });
  }

  handleMessages(RemoteMessage message) async {
    User user = await MySharedPreferences.getUserData();

    if (message.data['type'] == 'ReportNotification') {
      Get.toNamed(reportnotificationsscreen, arguments: user);
    } else if (message.data['type'] == 'Emergency') {
      Get.toNamed(residentialEmergencyScreen, arguments: user);
    } else if (message.data['type'] == 'Report') {
      Get.toNamed(viewreportscreen, arguments: user);
    } else if (message.data['type'] == 'Verification') {
      Get.toNamed(unverifiedresident, arguments: user);
    }
  }
}
