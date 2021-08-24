
import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// 新規ユーザー登録画面用Widget
class CreateUserPage extends StatefulWidget {
  @override
  _CreateUserPageState createState() => _CreateUserPageState();
}

class _CreateUserPageState extends State<CreateUserPage> {
  // 入力されたメールアドレス
  String newUserEmail = "";
  // 入力されたパスワード
  String newUserPassword = "";
  // 登録に関する情報を表示
  String infoText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('新規ユーザー登録'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            children: <Widget>[
              // 新規ユーザー登録
              // メールアドレス入力用テキストボックス
              TextFormField(
                // テキスト入力のラベルを設定
                decoration: InputDecoration(labelText: "メールアドレス"),
                onChanged: (String value) {
                  setState(() {
                    newUserEmail = value;
                  });
                },
              ),
              // 空白スペース
              const SizedBox(height: 8),
              // パスワード入力用テキストボックス
              TextFormField(
                decoration: InputDecoration(labelText: "パスワード（6文字以上）"),
                obscureText: true,
                onChanged: (String value){
                  setState(() {
                    newUserPassword = value;
                  });
                },
              ),
              // 空白スペース
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () async {
                  try {
                    // メール/パスワードでユーザー登録
                    final FirebaseAuth auth = FirebaseAuth.instance;
                    final UserCredential result =
                      await auth.createUserWithEmailAndPassword(
                          email: newUserEmail,
                          password: newUserPassword
                      );

                    // 登録したユーザー情報
                    final User user = result.user!;
                    setState(() {
                      infoText = "登録OK： ${user.email}";
                    });
                  } catch(e) {
                    // 登録に失敗した場合
                    setState(() {
                      infoText = "登録NG: ${e.toString()}";
                    });
                  }
                },
                child: Text("登録🌟"),
              ),
             const SizedBox(height: 8),
              Text(infoText),

              Container(
                padding: EdgeInsets.only(top: 32),
                child: Center(
                  child: ElevatedButton(
                    child: const Text('ログイン画面に戻る🐳'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
