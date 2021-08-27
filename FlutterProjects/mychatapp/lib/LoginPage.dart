import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mychatapp/main.dart';

import 'ChatPage.dart';
import 'Provider.dart';

class LoginPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    // Providerから値を受け取る
    final infoText = watch(infoTextProvider).state;
    final email = watch(emailProvider).state;
    final password = watch(passwordProvider).state;

    return Scaffold(
      body: Center(
       child: Container(
         padding: EdgeInsets.all(24),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             // メールアドレス入力
             TextFormField(
               decoration: InputDecoration(labelText: 'メールアドレス'),
               onChanged: (String value) {
                 // Providerから値を更新
                 context.read(emailProvider).state = value;
                 },
             ),
             // パスワード入力
             TextFormField(
               decoration: InputDecoration(labelText: 'パスワード'),
               obscureText: true,
               onChanged: (String value) {
                 // Providerから値を更新
                 context.read(passwordProvider).state = value;
               },
             ),

             Container(
               padding: EdgeInsets.all(8),
               // メッセージ表示
               child: Text(infoText),
             ),

             Container(
               width: double.infinity,
               // ユーザー登録ボタン
               child: ElevatedButton(
                 child: Text('ユーザー登録'),
                 onPressed: () async {
                   try {
                     // メール / パスワードでユーザー登録
                     final FirebaseAuth auth = FirebaseAuth.instance;
                     final result = await auth.createUserWithEmailAndPassword(
                       email: email,
                       password: password,
                     );
                     // ユーザー情報を更新
                     context.read(userProvider).state = result.user;

                     // ユーザー登録に成功した場合
                     // チャット画面に遷移 + ログイン画面を破棄
                     await  Navigator.of(context).pushReplacement(
                       MaterialPageRoute(builder: (context) {
                         return ChatPage();
                       }),
                     );
                   } catch (e) {
                     // ユーザー登録に失敗した場合
                     // Providerから値を更新
                     context.read(infoTextProvider).state =
                        "登録に失敗しました：${e.toString()}";
                   }
                 },
               ),
             ),

             const SizedBox(height: 8),
             Container(
               width: double.infinity,
               // ログインボタン
               child: OutlinedButton(
                 child: Text('ログイン'),
                 onPressed: () async {
                   try {
                     // メール / パスワードでログイン
                     final FirebaseAuth auth = FirebaseAuth.instance;
                     final result = await auth.signInWithEmailAndPassword(
                       email: email,
                       password: password,
                     );

                     // ログインに成功した場合
                     // チャット画面に遷移 + ログイン画面を破棄
                     await  Navigator.of(context).pushReplacement(
                       MaterialPageRoute(builder: (context) {
                         return ChatPage();
                       }),
                     );
                   } catch (e) {
                     // ログインに失敗した場合
                     // Providerから値を更新
                     context.read(infoTextProvider).state =
                         "ログインに失敗しました：${e.toString()}";
                   }
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
