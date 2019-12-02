import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // FlatButtonDemo
    final Widget flatButtonDemo = Row(
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

    final Widget raisedButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
            buttonColor: Theme.of(context).accentColor,
            buttonTheme: ButtonThemeData(
                textTheme: ButtonTextTheme.primary,
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                )
                // shape: StadiumBorder(),
                ),
          ),
          child: RaisedButton(
            // 文字按钮
            child: Text('button'),
            onPressed: () {},
            splashColor: Colors.blueAccent, // 溅墨效果的颜色
            elevation: 6.0,
            color: Theme.of(context).accentColor,
            textTheme: ButtonTextTheme.primary,
            textColor: Theme.of(context).accentColor, // 字体颜色
          ),
        ),
        SizedBox(
          width: 16.0,
        ),
        RaisedButton.icon(
          icon: Icon(Icons.add),
          label: Text('add'),
          onPressed: () {},
          elevation: 30.0,
          splashColor: Colors.pinkAccent,
        ),
      ],
    );

    final Widget outLineButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
            buttonColor: Theme.of(context).accentColor,
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
              // shape: BeveledRectangleBorder(
              //   borderRadius: BorderRadius.circular(10.0),
              // )
              shape: StadiumBorder(),
            ),
          ),
          child: OutlineButton(
            // 文字按钮
            child: Text('button'),
            onPressed: () {},
            splashColor: Colors.blueAccent[100], // 溅墨效果的颜色
            color: Theme.of(context).accentColor,
            textTheme: ButtonTextTheme.primary,
            textColor: Theme.of(context).accentColor, // 字体颜色
            highlightedBorderColor: Colors.greenAccent, // 按下边框样色
          ),
        ),
        SizedBox(
          width: 16.0,
        ),
        RaisedButton.icon(
          icon: Icon(Icons.add),
          label: Text('add'),
          onPressed: () {},
          elevation: 30.0,
          splashColor: Colors.pinkAccent,
        ),
      ],
    );

    final Widget fixedWidthButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 160.0,
          child: OutlineButton(
            // 文字按钮
            child: Text('button'),
            onPressed: () {},
            splashColor: Colors.blueAccent[100], // 溅墨效果的颜色
            color: Theme.of(context).accentColor,
            textTheme: ButtonTextTheme.primary,
            textColor: Theme.of(context).accentColor, // 字体颜色
            highlightedBorderColor: Colors.greenAccent, // 按下边框样色
          ),
        ),
      ],
    );

    final Widget buttonBarDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ButtonBar(
          children: <Widget>[
            Theme( // 不需要theme，可以直接在buttonbar中设置间距
              data: Theme.of(context).copyWith(
                buttonTheme: ButtonThemeData(
                  padding: EdgeInsets.symmetric(horizontal: 60.0),
                ),
              ),
              child: ButtonBar(
                // buttonPadding: EdgeInsets.symmetric(horizontal: 10.0),
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    child: OutlineButton(
                    child: Text('button'),
                    onPressed: (){},
                    splashColor: Colors.greenAccent,
                    textColor: Colors.black54,
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    child: OutlineButton(
                    child: Text('button'),
                    onPressed: (){},
                    splashColor: Colors.greenAccent,
                    textColor: Colors.black54,
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    child: OutlineButton(
                    child: Text('button'),
                    onPressed: (){},
                    splashColor: Colors.greenAccent,
                    textColor: Colors.black54,
                    ),
                  )
                ],
              ),
            )

          ],
        )
      ],
    );

    final Widget exandedButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          // 沾满可用区域
          child: OutlineButton(
            // 文字按钮
            child: Text('button'),
            onPressed: () {},
            splashColor: Colors.blueAccent[100], // 溅墨效果的颜色
            color: Theme.of(context).accentColor,
            textTheme: ButtonTextTheme.primary,
            textColor: Theme.of(context).accentColor, // 字体颜色
            highlightedBorderColor: Colors.greenAccent, // 按下边框样色
          ),
        ),
        SizedBox(width: 10.0),
        Expanded(
          // 沾满可用区域
          flex: 3, // 占的比例？
          child: OutlineButton(
            // 文字按钮
            child: Text('button'),
            onPressed: () {},
            splashColor: Colors.blueAccent[100], // 溅墨效果的颜色
            color: Theme.of(context).accentColor,
            textTheme: ButtonTextTheme.primary,
            textColor: Theme.of(context).accentColor, // 字体颜色
            highlightedBorderColor: Colors.greenAccent, // 按下边框样色
          ),
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
            flatButtonDemo,
            raisedButtonDemo,
            outLineButtonDemo,
            fixedWidthButton,
            exandedButton,
            buttonBarDemo,
          ],
        ),
      ),
    );
  }
}