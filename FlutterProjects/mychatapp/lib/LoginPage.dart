import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mychatapp/CreateAccountPage.dart';
import 'package:mychatapp/PasscodeResetPage.dart';
import 'package:mychatapp/ProfilePage.dart';
import 'package:mychatapp/main.dart';

import 'ChatPage.dart';
import 'HomePage.dart';
import 'Provider.dart';

class LoginPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    // Providerから値を受け取る
    final infoText = watch(infoTextProvider).state;
    final email = watch(emailProvider).state;
    final password = watch(passwordProvider).state;

    return Scaffold(
      appBar: AppBar(
        title: Text('ログイン画面'),
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
                   labelText: 'メールアドレス',
               ),
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
               // ログインボタン
               child: ElevatedButton(
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
                         return ProfilePage();
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
             const SizedBox(height: 16),

             Container(
               width: double.infinity,
               // 新規登録ボタン
               child: OutlinedButton(
                 child: Text('アカウントをお持ちでない方はこちらから新規登録'),
                 onPressed: () {
                   Navigator.of(context).pushReplacement(
                     MaterialPageRoute(builder: (context) {
                       return CreateAccountPage();
                     }),
                   );
                 },
               ),
             ),
             const SizedBox(height: 16),

             Container(
               width: double.infinity,
               // パスワード再設定リンク
               child: TextButton(
                 child: Text('パスワードをお忘れですか？'),
                 onPressed: () {
                   Navigator.of(context).pushReplacement(
                     MaterialPageRoute(builder: (context) {
                       return PasscodeResetPage();
                     }),
                   );
                 },
               ),
             ),


             Container(
               padding: EdgeInsets.all(8),
               // メッセージ表示
               child: Text("テストユーザー"),
             ),
             Container(
               padding: EdgeInsets.all(8),
               child: Text("email: test@example.com"),
             ),
             Container(
               child: Text("test123"),
             ),
             const SizedBox(height: 32),

             ElevatedButton(
               child: Text('ホーム画面へ'),
               onPressed: () {
                 // ホーム画面に戻る
                 Navigator.of(context).pushReplacement(
                     MaterialPageRoute(builder: (context) {
                       return HomePage();
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
