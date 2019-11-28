import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 200,
              maxWidth: 300.0
            ),
            child: Container(
              color: Color.fromRGBO(2, 53, 215, 1.0),
            ),
          ),

          AspectRatio(
            aspectRatio: 16.0 / 9.0,
            child: Container(
              color: Color.fromRGBO(3, 54, 255, 1.0),
            ),
          ),
        ],
      ),
    );
  }
}

class IconBadge extends StatelessWidget {
  final IconData icon;
  final double size;

  IconBadge(this.icon, {this.size = 32.0 // 可选参数
      });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
        icon,
        size: size,
        color: Colors.white70,
      ),
      width: size + 60,
      height: size + 60,
      color: Color.fromRGBO(3, 54, 255, 1.0),
    );
  }
}

//  Container(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 主轴
//         crossAxisAlignment: CrossAxisAlignment.center, // 交叉轴
//         children: <Widget>[
//           IconBadge(Icons.menu, size: 64),
//           IconBadge(Icons.person_outline, size: 80),
//           IconBadge(Icons.access_alarm, size: 64),
//         ],
//       ),

class StackDemo extends StatelessWidget {
  const StackDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Stack(
            alignment: Alignment.topLeft,
            children: <Widget>[
              SizedBox(
                  // 如果不设置宽高就是child的宽高
                  width: 300,
                  height: 400,
                  child: Container(
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    // child: Icon(Icons.mode_comment,color: Colors.white, size: 90.0),
                  )),
              SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: 100.0,
                height: 100.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    // borderRadius: BorderRadius.circular(10.0),
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors:[
                        Color.fromRGBO(7, 102, 255, 1.0),
                        Color.fromRGBO(3, 54, 255, 1.0),
                      ]
                    ),
                  ),
                  child: Icon(Icons.multiline_chart,
                      color: Colors.white, size: 45.0),
                ),
              ),
              Positioned(
                child: Icon(Icons.star, color:Colors.white, size: 40.0),
                left: 105,
                top: 110,
              ),
              Positioned(
                child: Icon(Icons.star, color:Colors.white, size: 40.0),
                left: 255,
                top: 187,
              ),
              Positioned(
                child: Icon(Icons.star, color:Colors.white, size: 40.0),
                left: 271,
                top: 218,
              ),
              Positioned(
                child: Icon(Icons.star, color:Colors.white, size: 40.0),
                left: 154,
                top: 267,
              ),
              Positioned(
                child: Icon(Icons.star, color:Colors.white, size: 40.0),
                left: 89,
                top: 153,
              ),
              Positioned(
                child: Icon(Icons.star, color:Colors.white, size: 40.0),
                left: 45,
                top: 287,
              ),
              Positioned(
                child: Icon(Icons.star, color:Colors.white, size: 40.0),
                left: 123,
                top: 209,
              ),
              Positioned(
                child: Icon(Icons.star, color:Colors.white, size: 40.0),
                left: 132,
                top: 190,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// sizedBoxDemo
class sizedBoxDemo extends StatelessWidget {
  const sizedBoxDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
              // 如果不设置宽高就是child的宽高
              width: 180,
              height: 180,
              child: Container(
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                  color: Colors.pinkAccent,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child:
                    Icon(Icons.access_alarm, color: Colors.white, size: 90.0),
              )),
          SizedBox(
            height: 20.0,
          ),
          SizedBox(
            width: 100.0,
            height: 100.0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child:
                  Icon(Icons.multiline_chart, color: Colors.white, size: 45.0),
            ),
          )
        ],
      ),
    );
  }
}
