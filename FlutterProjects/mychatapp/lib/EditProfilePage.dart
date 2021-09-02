import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mychatapp/EditIntroductionPage.dart.dart';
import 'package:mychatapp/Provider.dart';

import 'AddPostPage.dart';
import 'ChatPage.dart';
import 'LoginPage.dart';

class EditProfilePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    // Providerから値を受け取る
    final User user = watch(userProvider).state!;
    final AsyncValue<QuerySnapshot> asyncPostQuery =watch(postsQueryProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('プロフィール編集ページ'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () async {
              // ログアウト処理
              // 内部で保持しているログイン情報等が初期化される
              await FirebaseAuth.instance.signOut();

              // ログイン画面に遷移 + チャット画面を破棄
              await  Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) {
                  return LoginPage();
                }),
              );
            },
          )
        ],
      ),

      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(8),
              // ユーザー情報を表示
              child: Text('ログイン情報：${user.email}'
              ),
            ),
            const SizedBox(height: 16),

            Container(
              child: Text('プロフィールを編集する画面'),
            ),
            Container(
              child: Text('トップ画を変更可能（写真を撮る、カメラロールから選択）'),
            ),
            Container(
              child: Text('表示する項目一覧を表示'),
            ),
            Container(
              child: Text('項目の隣のチェックボタンを押すとテキストボックスと「編集完了」ボタンが表示されて文字を入力できる'),
            ),
            const SizedBox(height: 32),

            ElevatedButton(
              child: Text('編集完了'),
              onPressed: () {
                Navigator.of(context).pop();              },
            ),
            const SizedBox(height: 16),

          ],
        ),
      ),
    );
  }
}