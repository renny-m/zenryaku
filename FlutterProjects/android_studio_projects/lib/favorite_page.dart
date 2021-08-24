import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ファボ画面🌟'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 32),
              child: Favorite(),
            ),

            Container(
              padding: EdgeInsets.only(top: 32),
              child: Center(
                child: ElevatedButton(
                  // Within the SecondScreen widget
                  onPressed: () {
                    // Navigate back to the first screen by popping the current route
                    // off the stack.
                    Navigator.pop(context);
                  },
                  child: const Text('ホーム画面に戻る🐳'),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

// StatefulWidgetを継承するとStateを扱える
// このWidgetを表示すると、Stateを元にUIが作成される
class Favorite extends StatefulWidget {
  // 使用するStateを指定
  @override
  _FavoriteState createState() => _FavoriteState();
}

// Stateを継承して使う
class _FavoriteState extends State<Favorite>{
  // データを宣言
  int count = 0;

  // データを元にWidgetを作る
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(count.toString()),
        TextButton(
          onPressed: () {
            // データを更新する時は SetState を呼ぶ
            setState(() {
              // データを更新
              count = count + 1;
            });
          },
          child: Text('ファボ祭り💖💖💖'),
        ),
      ],
    );
  }
}


