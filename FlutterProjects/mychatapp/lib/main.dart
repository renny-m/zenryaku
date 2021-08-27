import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'LoginPage.dart';

void main() async {
  // 初期化処理
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // 最初に表示するWidget
  runApp(MyChatApp());
}

class MyChatApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyChatApp2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // ログイン画面を表示
      home: LoginPage(),
    );
  }
}
