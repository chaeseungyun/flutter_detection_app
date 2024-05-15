import 'package:detection_app/AccountForm.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'Map.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("백드라운드 메시지 처리.. ${message.notification!.body}");
}

void initializeNotification() async {
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  await flutterLocalNotificationsPlugin
  .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>
    ()?.createNotificationChannel(const AndroidNotificationChannel('high_importance_channel', 'high_importance_notification', importance: Importance.max));

  await flutterLocalNotificationsPlugin.initialize(const InitializationSettings(android: AndroidInitializationSettings("@mipmap/ic_launcher"), ));

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  initializeNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '도로 교통 분석',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '도로 상태 분석 애플리케이션'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var messageString = "";

  void getMyDeviceToken() async {
    final token = await FirebaseMessaging.instance.getToken();
    print("내 디바이스 토큰: $token");
  }

  @override
  void initState() {
    getMyDeviceToken();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      RemoteNotification? notification = message.notification;
      if (notification != null) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              // 5초후 모달 자동 닫기
              Future.delayed(const Duration(seconds: 5), () {
                Navigator.of(context).pop(true);
              });
              return AlertDialog(
                title: Text(notification.title!),
                content: Text(notification.body!),
                actions: <Widget>[
                  TextButton(
                      onPressed: () {
                        () {}; // 신고하기 기능 추가
                        Navigator.of(context).pop(); // 다이얼로그 닫기
                      },
                      child: const Text('예')),
                  TextButton(onPressed: () {
                    Navigator.of(context).pop(); // 다이얼로그 닫기
                  }, child: const Text('아니요'))
                ],
              );
            });
        /*
        FlutterLocalNotificationsPlugin().show(
          notification.hashCode,
          notification.title,
          notification.body,
          const NotificationDetails(
            android: AndroidNotificationDetails(
              'high_importance_channel',
              'high_importance_notification',
              importance: Importance.max,
              priority: Priority.high,
              playSound: true,
              actions: <AndroidNotificationAction>[
                AndroidNotificationAction('id_1', 'Button 1'),
                AndroidNotificationAction('id_2', 'Button 2'),
              ],
            ),
          ),
          payload: 'item id 2'
        );
        */
      }
    });
    super.initState();
  }

  void moveMap() {
    Navigator.push(
      context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
          const Map(),
          transitionsBuilder:
              (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween = Tween(begin: begin, end: end)
                .chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        )
    );
  }

  void moveAccountForm() {
    Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
          const AccountForm(),
          transitionsBuilder:
              (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween = Tween(begin: begin, end: end)
                .chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        foregroundColor: Colors.white,
        title: Text(widget.title),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: moveMap,
                child: const Text('지도로 이동'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white
              ),
            ),
            ElevatedButton(onPressed: moveAccountForm, child: const Text('회원 정보 입력'))
          ],
        ),
      )
    );
  }
}

