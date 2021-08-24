import 'package:flutter/material.dart';

class EditPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('編集画面🌟'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 32),
            child: Text('Text Button'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextButton(
                  onPressed: null,
                  child: Text('disabled'),
              ),
              TextButton(
                  onPressed: (){},
                  child: Text('enabled'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.blue,
                ),
                onPressed: (){},
                child: Text('enabled'),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 32),
            child: Text('OutlineButton'),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                OutlinedButton(
                  onPressed: null,
                  child: Text('disabled'),
                ),
                OutlinedButton(
                  onPressed: (){},
                  child: Text('enabled'),
                ),
                OutlinedButton(
                  style: TextButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  onPressed: (){},
                  child: Text('enabled'),
                ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 32),
            child: Text('ElevatedButton'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
                ElevatedButton(
                  onPressed: null,
                  child: Text('disabled'),
                ),
                ElevatedButton(
                  onPressed: (){},
                  child: Text('enabled'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    elevation: 16
                  ),
                  onPressed: (){},
                  child: Text('enabled'),
                ),
              ],
          ),
          Container(
            padding: EdgeInsets.only(top: 32),
            child: Text('IconButton'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                onPressed: (){},
                icon: Icon(Icons.thumb_up),
              ),
              IconButton(
                color: Colors.pink,
                onPressed: (){},
                icon: Icon(Icons.favorite),
              ),
              IconButton(
                iconSize: 45,
                color: Colors.blue,
                onPressed: (){},
                icon: Icon(Icons.verified),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 32),
            child: Text('IconButton + text'),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton.icon(
                  onPressed: (){},
                  icon: Icon(Icons.thumb_up),
                  label: Text('Good'),
                ),
                OutlinedButton.icon(
                  onPressed: (){},
                  icon: Icon(Icons.favorite),
                  label: Text('Like'),
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  onPressed: (){},
                  icon: Icon(Icons.verified),
                  label: Text('official'),
                ),

              ],
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
