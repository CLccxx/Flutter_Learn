import 'package:flutter/material.dart';
import 'dart:async';

class BottomSheetDemo extends StatefulWidget {
  BottomSheetDemo({Key key}) : super(key: key);

  @override
  _BottomSheetDemoState createState() => _BottomSheetDemoState();
}

class _BottomSheetDemoState extends State<BottomSheetDemo> {
  final _bottomSheetScaffolKey = GlobalKey<ScaffoldState>();

  _openBottonSheet(){
    _bottomSheetScaffolKey
    .currentState
    .showBottomSheet((BuildContext context){
      return BottomAppBar(
        child: Container(
          height: 90.0,
          width: double.infinity,
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Icon(Icons.pages),
              SizedBox(width: 16.0,),
              Text('sdfsdfsfds'),
              Expanded(
                child: Text('Fix you - clodplay', textAlign: TextAlign.right,),
              )
            ],
          ),
        ),
      );
    }); 
  }

  Future _openModalBottonSheet() async {
     final option = await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200.0,
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text('Open A'),
                onTap: (){
                  Navigator.pop(context, 'A');
                },
              ),
              ListTile(
                title: Text('Open B'),
                onTap: (){
                  Navigator.pop(context, 'B');
                },
              ),
              ListTile(
                title: Text('Open C'),
                onTap: (){
                  Navigator.pop(context, 'C');
                },
              ),
            ],
          ),
        );
      }
    );

    debugPrint(option);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _bottomSheetScaffolKey,
      appBar: AppBar(
        title: Text('BottomSheetDemo'),
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
                FlatButton(
                  child: Text('Open BottomSheet'),
                  onPressed: _openBottonSheet,
                ),
                FlatButton(
                  child: Text('Open ModalBottomSheet'),
                  onPressed: _openModalBottonSheet,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}