import 'package:android_studio_projects/edit_page.dart';
import 'package:android_studio_projects/friend_list_page.dart';
import 'package:flutter/material.dart';

import 'favorite_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '前略 Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: '平成世代の前略プロフ🌟'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 左側のアイコン
        leading: IconButton(
            onPressed:(){},
            icon: Icon(Icons.search)
        ),
        // タイトルテキスト
        title: Text(widget.title),
        // 右側のアイコン一覧
        actions: <Widget>[
          IconButton(
              onPressed:() {},
              icon: Icon(Icons.menu),
          ),
          IconButton(
            onPressed:() {},
            icon: Icon(Icons.help_outlined)
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            // 背景色
            color: Colors.indigoAccent,
            child: Text('indigoAccent'),
            margin: EdgeInsets.all(8),
          ),
          Container(
            // 内側の余白（パディング）
            color: Colors.pink,
            padding: EdgeInsets.all(8),
            // 外側の余白（マージン）
            margin: EdgeInsets.all(8),
            child: Text('padding / margin'),
          ),
          Container(
            decoration: BoxDecoration(
              // 枠線
              border: Border.all(color: Colors.blue, width: 2),
              // 角丸
              borderRadius: BorderRadius.circular(8),
            ),
              child: Text('border'),
            ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://placehold.jp/200x100.png'),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 60,
            child: Column(
              // 均等配置
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('***'),
                Text('均等配置'),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 60,
            color: Colors.grey,
            child: Column(
              // 左寄せ
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('***'),
                Text('左寄せ'),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 60,
            child: Column(
              // 右寄せ
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text('***', style: TextStyle(color: Colors.red),),
                Text('右寄せ(赤文字)', style: TextStyle(color: Colors.red),),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 60,
            color: Colors.grey,
            child: Row(
              // 中央寄せ
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('***'),
                Text('中央寄せ(fontSize = 30)', style: TextStyle(fontSize: 30),),
            ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 60,
            child: Row(
              // 右寄せ
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text('***'),
                Text('右寄せ(italic)', style: TextStyle(fontStyle: FontStyle.italic)),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 60,
            color: Colors.grey,
            child: Row(
              // 均等配置
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('***'),
                Text('均等配置(太字)', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 60,
            child: Row(
              // 上寄せ
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('***'),
                Text('上寄せ'),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 60,
            color: Colors.grey,
            child: Row(
              // 下寄せ
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('***'),
                Text('下寄せ & 均等配置'),
              ],
            ),
          ),

          Text(
            'いいねの数だけ数字が増えるよ💖',
          ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headline4,
          ),
          // 表示位置を指定
          Container(
            width: double.infinity,
            color: Colors.grey,
            child: Text('TextAlign.right', textAlign: TextAlign.right),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                child: Text('編集画面へ'),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditPage()),
                  );
                },
              ),
              ElevatedButton(
                child: Text('フレンド一覧へ'),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FriendListPage()),
                  );
                },
              ),
              ElevatedButton(
                child: Text('ファボを押しまくる💖'),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FavoritePage()),
                  );
                },
              ),
            ],
          ),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
