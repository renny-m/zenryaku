
import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// 新規ユーザー登録画面用Widget
class MyFirestorePage extends StatefulWidget {
  @override
  _MyFirestorePageState createState() => _MyFirestorePageState();
}

class _MyFirestorePageState extends State<MyFirestorePage> {
  // 指定したユーザーID
  String orderUserID = '';
  // 指定したユーザーIDの名前
  String name = '';
  // 指定したユーザーIDの年齢
  int age = 0;

  // 作成したドキュメント一覧
  List<DocumentSnapshot> documentList = [];
  // 指定したドキュメントの情報
  String orderDocumentInfo = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DBアクセスページ'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            // ユーザーID入力用テキストボックス
            TextFormField(
              // テキスト入力のラベルを設定
              decoration: InputDecoration(labelText: "ユーザーID"),
              onChanged: (String value) {
                setState(() {
                  orderUserID = value;
                });
              },
            ),
            // 名前入力用テキストボックス
            TextFormField(
              // テキスト入力のラベルを設定
              decoration: InputDecoration(labelText: "名前"),
              onChanged: (String value) {
                setState(() {
                  name = value;
                });
              },
            ),
            // 年齢入力用テキストボックス
            TextFormField(
              // テキスト入力のラベルを設定
              decoration: InputDecoration(labelText: "年齢"),
              onChanged: (int value) {
                setState(() {
                  age = value;
                });
              },
            ),

            // 空白スペース
            const SizedBox(height: 8),

            ElevatedButton(
              child: Text('コレクション+ドキュメント作成'),
              onPressed: () async {
                // ドキュメント作成
                await FirebaseFirestore.instance
                    .collection('users') // コレクションID
                    .doc(orderUserID) //ドキュメントID << ユーザーID
                    .set({'name': name, 'age': age}); // データ
              },
            ),
            ElevatedButton(
              child: Text('サブコレクション+ドキュメント作成'),
              onPressed: () async {
                // サブコレクション内にドキュメント作成
                await FirebaseFirestore.instance
                    .collection('users') // コレクションID
                    .doc('id_abc') //ドキュメントID << usersコレクション内のドキュメント
                    .collection('orders') // サブコレクションID
                    .doc('id_123') // ドキュメントID << サブコレクション内のドキュメント
                    .set({'price': 600, 'date': '9/13'}); // データ
              },
            ),
            ElevatedButton(
              child: Text('ドキュメント一覧取得'),
              onPressed: () async {
                // コレクション内のドキュメント一覧を取得
                final snapshot =
                    await FirebaseFirestore.instance.collection('users').get();
                // 取得したドキュメント一覧をUIに反映
                setState(() {
                  documentList = snapshot.docs;
                });
              },
            ),
            // コレクション内のドキュメント一覧を表示
            Column(
              children: documentList.map((document) {
                return ListTile(
                  title: Text('${document['name']}さん'),
                  subtitle: Text('${document['age']}歳'),
                );
              }).toList(),
            ),

            ElevatedButton(
              child: Text('ドキュメントを指定して取得'),
              onPressed: () async {
                // コレクションIDとドキュメントIDを指定して取得
                final document = await FirebaseFirestore.instance
                    .collection('users')
                    .doc('id_abc')
                    .collection('orders')
                    .doc('id_123')
                    .get();
                await FirebaseFirestore.instance.collection('users').get();
                // 取得したドキュメントの情報をUIに反映
                setState(() {
                  orderDocumentInfo =
                      '${document['date']} ${document['price']}円';
                });
              },
            ),
            // ドキュメントの情報を表示
            ListTile(title: Text(orderDocumentInfo)),

            ElevatedButton(
              child: Text('ドキュメント更新'),
              onPressed: () async {
                // ドキュメント更新
                await FirebaseFirestore.instance
                    .collection('users')
                    .doc('id_abc')
                    .update({'age': 21});
              },
            ),

            ElevatedButton(
              child: Text('ドキュメント削除'),
              onPressed: () async {
                // ドキュメント削除
                await FirebaseFirestore.instance
                    .collection('users')
                    .doc('id_abc')
                    .collection('orders')
                    .doc('id_123')
                    .delete();
              },
            ),

          ],
        ),
      ),
    );
  }
}
