import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mychatapp/EditIntroductionPage.dart.dart';
import 'package:mychatapp/EditProfilePage.dart';
import 'package:mychatapp/Provider.dart';

import 'AddPostPage.dart';
import 'ChatPage.dart';
import 'EditSettingPage.dart';
import 'FriendPage.dart';
import 'GuestbookPage.dart';
import 'LoginPage.dart';

class ProfilePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    // Providerから値を受け取る
    final User user = watch(userProvider).state!;
    final AsyncValue<QuerySnapshot> asyncPostQuery =watch(postsQueryProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('プロフィールページ'),
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
              child: Text('トップ画やらプロフィールやら、メインの画面'),
            ),
            const SizedBox(height: 32),

            ElevatedButton(
              child: Text('紹介文を書く'),
              onPressed: () async {
                // 紹介文記載ページ画面に推移
                await  Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return EditIntroductionPage();
                  }),
                );
              },
            ),
            const SizedBox(height: 16),

            ElevatedButton(
              child: Text('リアル'),
              onPressed: () async {
                // リアル画面に推移
                await  Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return ChatPage();
                  }),
                );
              },
            ),
            const SizedBox(height: 16),

            ElevatedButton(
              child: Text('ゲストブック'),
              onPressed: () async {
                // ゲストブック画面に推移
                await  Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return GuestbookPage();
                  }),
                );
              },
            ),
            const SizedBox(height: 16),


            ElevatedButton(
              child: Text('フレンド'),
              onPressed: () async {
                // フレンド一覧画面に推移
                await  Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return FriendPage();
                  }),
                );
              },
            ),
            const SizedBox(height: 16),

            ElevatedButton(
              child: Text('プロフィール編集'),
              onPressed: () async {
                // プロフィール編集画面に推移
                await  Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return EditProfilePage();
                  }),
                );
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              child: Text('設定'),
              onPressed: () async {
                // 設定画面に推移
                await  Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return EditSettingPage();
                  }),
                );
              },
            ),
            const SizedBox(height: 16),

          ],
        ),
      ),
    );
  }
}