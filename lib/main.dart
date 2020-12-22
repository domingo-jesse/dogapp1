import 'NavBar.dart';
import 'package:flutter/material.dart';
import 'PushNotificationManager.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  PushNotificationsManager().init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chart Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomNavigationBarExample(title: 'Flutter Chart Demo'),
    );
  }
}


