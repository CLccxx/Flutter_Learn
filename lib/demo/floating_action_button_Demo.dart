import 'package:flutter/material.dart';

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