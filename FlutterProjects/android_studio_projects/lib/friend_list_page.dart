import 'package:flutter/material.dart';

class FriendListPage extends StatelessWidget {
  final List<Map<String, dynamic>> listItems = [
    {
      'text': 'マブ1',
      'color': Colors.pink[600],
    },
    {
      'text': 'マブ2',
      'color': Colors.pink[300],
    },
    {
      'text': 'マブ3',
      'color': Colors.pink[100],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('友達一覧🌟'),
        actions: <Widget> [
          IconButton(
              onPressed:(){},
              icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 125,
            padding: EdgeInsets.all(4),
            // childrenを指定してリスト表示
            child: ListView(
              children: <Widget>[
                Container(
                  height: 50,
                  color: Colors.blue[600],
                  child: Text('友達1'),
                ),
                Container(
                  height: 50,
                  color: Colors.blue[300],
                  child: Text('友達2'),
                ),
                Container(
                  height: 50,
                  color: Colors.blue[100],
                  child: Text('友達3'),
                ),
              ],
            ),
          ),

          Container(
            height: 125,
            padding: EdgeInsets.all(4),
            // 配列を元にリスト表示
            child: ListView.builder(
              itemCount: listItems.length,
              itemBuilder:  (context, index) {
                return Container(
                  height: 50,
                  color: listItems[index]['color'],
                  child: Text(listItems[index]['text']),
                );
              },
            ),
          ),

          Container(
            height: 125,
            padding: EdgeInsets.all(4),
            // 各アイテムの間にスペースなどを挟みたい場合
            child: ListView.separated(
              itemCount: listItems.length,
              itemBuilder: (context, index){
                return Container(
                  height: 50,
                  color: listItems[index]['color'],
                  child: Text(listItems[index]['text']),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
            ),
          ),
          Container(
            height: 200,
            padding: EdgeInsets.all(4),
            child: ListView(
              children: <Widget>[
                // タイトル・サブタイトル・画像・アイコン等々を含めたアイテムが作れる
                ListTile(
                  leading: Image.network('https://placehold.jp/3d4070/ffffff/150x150.png?text=M'),
                  title: Text('宮下マサシ'),
                  subtitle: Text('ほんとはマサシじゃない'),
                  trailing: Icon(Icons.more_vert),
                ),
                // 影のついたカードUIが作れる
                Card(
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    child: Text('トモキイノウエ'),
                  ),
                ),
                // 組み合わせることもOK
                Card(
                  child: ListTile(
                    leading: Image.network('https://placehold.jp/3d4070/ffffff/150x150.png?text=R'),
                    title: Text('RYOSUI TAKAGI'),
                    subtitle: Text('透明な腕時計はあげないよ'),
                    trailing: Icon(Icons.more_vert),
                  ),
                ),
              ],
            ),
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        onPressed: (){},
        child: Icon(Icons.search),
      ),
    );
  }
}
