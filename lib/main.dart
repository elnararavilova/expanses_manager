import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Платформа приложения'),
        ),
        body: Center(
          child: PlatformInfoScreen(),
        ),
      ),
    );
  }
}

class PlatformInfoScreen extends StatelessWidget {
  String getPlatformMessage() {
    if (kIsWeb) {
      return 'Веб-браузер';
    } else if (Platform.isAndroid) {
      return 'Android';
    } else if (Platform.isIOS) {
      return 'iOS';
    } else if (Platform.isWindows) {
      return 'Windows';
    } else if (Platform.isMacOS) {
      return 'macOS';
    } else if (Platform.isLinux) {
      return 'Linux';
    } else {
      return 'Неизвестная платформа';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'Ваша платформа - ${getPlatformMessage()}',
      style: TextStyle(fontSize: 30),
    );
  }
}