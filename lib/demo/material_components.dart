import 'package:flutter/material.dart';

class MaterialComponents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MaterialComponents'),
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          ListItem(title: 'ButtonDemo', page: ButtonDemo()),
          ListItem(
              title: 'FloatingActionButtonDemo',
              page: FloatingActionButtonDemo())
        ],
      ),
    );
  }
}

class FloatingActionButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Widget _floatingActionButton = FloatingActionButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Icon(Icons.adb),
      elevation: 10.0, // 与下层部件的高度，用来控制阴影
      backgroundColor: Colors.black38,
      // shape: BeveledRectangleBorder( // 方形
      //   borderRadius: BorderRadius.circular(20.0),
      // ),
    );

    final Widget _floatingActionButtonExtended = FloatingActionButton.extended(
      // 没有child：可以直接设置icon
      onPressed: () {},
      icon: Icon(Icons.add),
      label: Text('Add'),
      backgroundColor: Colors.pinkAccent,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('FloatingActionButtonDemo'),
        elevation: 0.0,
      ),
      floatingActionButton: _floatingActionButton,
      floatingActionButtonLocation:
          FloatingActionButtonLocation.endDocked, // 设置漂浮按钮的位置
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 70.0,
        ),
        shape: CircularNotchedRectangle(), // bottomAppBar为漂浮按钮流出一个缺口，
      ),
    );
  }
}

class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Widget FlatButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          // 文字按钮
          child: Text('button'),
          onPressed: () {},
          splashColor: Colors.blueAccent, // 溅墨效果的颜色
          textColor: Theme.of(context).accentColor, // 字体颜色
        ),
        FlatButton.icon(
          icon: Icon(Icons.add),
          label: Text('add'),
          onPressed: () {},
          splashColor: Colors.pinkAccent,
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('ButtonDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButtonDemo,
          ],
        ),
      ),
    );
  }
}

class _WidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('_WidgetDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[],
            ),
          ],
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final Widget page; // 跳转的界面

  ListItem({this.title, this.page});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => page),
        );
        // Navigator.of(context).push(
        //   MaterialPageRoute(builder: (context) => page),
        // );
      },
    );
  }
}
