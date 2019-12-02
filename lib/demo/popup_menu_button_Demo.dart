import 'package:flutter/material.dart';

class PopupMenuButtonDemo extends StatefulWidget {
  @override
  _PopupMenuButtonDemoState createState() => _PopupMenuButtonDemoState();
}

class _PopupMenuButtonDemoState extends State<PopupMenuButtonDemo> {
  String _currentMenuItem = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PopupMenuButtonDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(_currentMenuItem),
                PopupMenuButton(
                  onSelected: (value){
                    debugPrint(value);

                    setState(() {
                      _currentMenuItem = value;
                    });
                  },
                  itemBuilder: (BuildContext contex) => [
                    PopupMenuItem(
                      value: 'home',
                      child: Text('home'),
                    ),
                    PopupMenuItem(
                      value: 'discover',
                      child: Text('discover'),
                    ),
                    PopupMenuItem(
                      value: 'main',
                      child: Text('main'),
                    ),
                  ],
                )

              ],
            ),
          ],
        ),
      ),
    );
  }
}
