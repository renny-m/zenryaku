import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mychatapp/main.dart';

import 'ChatPage.dart';
import 'LoginPage.dart';
import 'Provider.dart';

class PasscodeResetPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    // Providerから値を受け取る
    final infoText = watch(infoTextProvider).state;
    final email = watch(emailProvider).state;
    final password = watch(passwordProvider).state;

    return Scaffold(
      appBar: AppBar(
        title: Text('アカウント登録画面'),
      ),

      body: Center(
       child: Container(
         padding: EdgeInsets.all(24),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[

             // メールアドレス入力
             TextFormField(
               decoration: InputDecoration(
                   labelText: '登録しているメールアドレスを入力',
               ),
               onChanged: (String value) {
                 // Providerから値を更新
                 context.read(emailProvider).state = value;
                 },
             ),
             const SizedBox(height: 8),

             Container(
               // パスワード再設定メール送信ボタン
               child: ElevatedButton(
                 child: Text('送信'),
                 onPressed: () {},
               ),
             ),
             const SizedBox(height: 16),

             Container(
               padding: EdgeInsets.all(8),
               // メッセージ表示
               child: Text('↓「送信」ボタンを押したあとの条件によってメッセージ表示'),
             ),
             Container(
               padding: EdgeInsets.all(8),
               // メッセージ表示
               child: Text('メールアドレスが登録されていた場合：パスワード再設定用のメールを送信しました。'),
             ),
             Container(
               padding: EdgeInsets.all(8),
               // メッセージ表示
               child: Text('メールアドレスが登録されていない場合：アカウントが存在しません'),
             ),
             const SizedBox(height: 32),


             ElevatedButton(
               child: Text('ログイン画面へ'),
               onPressed: () {
                 // ログイン画面に戻る
                 Navigator.of(context).pushReplacement(
                   MaterialPageRoute(builder: (context) {
                     return LoginPage();
                   }),
                 );
               },
             )

           ],
         ),
       ),
      ),
    );
  }
}
