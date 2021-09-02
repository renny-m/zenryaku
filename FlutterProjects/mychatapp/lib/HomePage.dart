import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mychatapp/main.dart';

import 'ChatPage.dart';
import 'LoginPage.dart';
import 'Provider.dart';

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
       child: Container(
         padding: EdgeInsets.all(24),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             // タイトル
             Container(
               child: Text(
                 "前略プロフィール",
                 style: TextStyle(
                   color: kTextColorPrimary,
                   fontSize: 30
                 ),
               ),
             ),

             // 空白
             SizedBox(height: 30),

             // ログイン画面へボタン
             Container(
               width: double.infinity,
               // ログインボタン
               child: ElevatedButton(
                 child: Text('ログイン画面へ'),
                 onPressed: () async {
                   await Navigator.of(context).push(
                       MaterialPageRoute(builder: (context) {
                         return LoginPage();
                       }),
                   );
                 },
               ),
             ),

           ],
         ),
       ),
      ),
    );
  }
}
