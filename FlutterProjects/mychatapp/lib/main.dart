import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';

import 'LoginPage.dart';

void main() async {
  // 初期化処理
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // 最初に表示するWidget
  runApp(
    // Riverpodでデータを受け渡しできる状態にする
    ProviderScope(
      child: MyChatApp(),
    ),
  );
}

class MyChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyChatApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // ログイン画面を表示
      home: LoginPage(),
    );
  }
}
