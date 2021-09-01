import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'HomePage.dart';

const Color kAccentColor = Color(0xFFFE7C64);
const Color kBackgroundColor = Colors.black;
const Color kTextColorPrimary = Color(0xFFECEFF1);
const Color kTextColorSecondary = Color(0xFFB0BEC5);
const Color kButtonColorPrimary = Colors.pink;
const Color kButtonTextColorPrimary = Color(0xF6AFC8FF);
const Color kIconColor = Colors.pink;


void main() async {
  // 初期化処理
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // 最初に表示するWidget
  runApp(
    // Riverpodでデータを受け渡しできる状態にする
    ProviderScope(
      child: MyZenryakuApp(),
    ),
  );
}

class MyZenryakuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyZenryakuApp',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      // ログイン画面を表示
      home: HomePage(),
    );
  }
}
