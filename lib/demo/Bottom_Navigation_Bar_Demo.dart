import 'package:flutter/material.dart';

class BottomNavigationBarDemo extends StatefulWidget {
  BottomNavigationBarDemo({Key key}) : super(key: key);

  @override
  _BottomNavigationBarDemoState createState() =>
      _BottomNavigationBarDemoState();
}

class _BottomNavigationBarDemoState extends State<BottomNavigationBarDemo> {
  int _currentIndex = 0;
  void _onTapHandler (int index) {
    setState(() {
      // 更新当前选中状态
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      // 如果超过4个item，BottomNavigationBar的类型会改变
      // 需要重新设置BottomNavigationBar的类型
      type: BottomNavigationBarType.fixed,
      fixedColor: Colors.black,

      // 激活状态：currentIndex  setState设置当前的
      currentIndex: _currentIndex,
      // 点击事件
      onTap: _onTapHandler,

      items: [
        BottomNavigationBarItem(
            title: Text('Explore'), icon: Icon(Icons.explore)),
        BottomNavigationBarItem(
            title: Text('History'), icon: Icon(Icons.history)),
        BottomNavigationBarItem(title: Text('List'), icon: Icon(Icons.list)),
        BottomNavigationBarItem(title: Text('my'), icon: Icon(Icons.person)),
      ],
    );
  }
}
