import 'dart:ui';

import 'package:flutter/material.dart';

class BasicDemo extends StatelessWidget {
  const BasicDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // 默认沾满整个屏幕
      // color: Colors.grey[100],
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3276179142,1686381254&fm=26&gp=0.jpg'),
            alignment: Alignment.topCenter,
            // repeat: ImageRepeat.repeat,
            fit: BoxFit.cover, // 填充方式
            colorFilter: ColorFilter.mode(
              // 滤镜
              Colors.indigoAccent[400].withOpacity(0.6),
              BlendMode.lighten,
            )),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Icon(Icons.pool, size: 32.0, color: Colors.white),
            // color: Color.fromRGBO(3, 54, 255, 1.0),
            padding: EdgeInsets.all(16.0), // 内边距
            margin: EdgeInsets.all(8.0), // 外边距
            width: 90.0,
            height: 90.0,
            decoration: BoxDecoration(
              color: Color.fromRGBO(3, 54, 255, 1.0),
              border: Border.all(
                color: Colors.black,
                width: 3.0,
                style: BorderStyle.solid,
              ),
              // borderRadius: BorderRadius.circular(9.0),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0.0, 16.0),
                    color: Color.fromRGBO(16, 20, 188, 1.0),
                    blurRadius: 25.0, // 模糊程度
                    spreadRadius: -9.0 // 正数扩大阴影效果，负数减小阴影效果
                    )
              ],
              shape: BoxShape.circle, // 圆角效果中不能使用 border圆角
              // gradient: RadialGradient( // 镜像渐变
              //   colors: [
              //     Color.fromRGBO(7, 102, 255, 1.0),
              //     Color.fromRGBO(3, 28, 128, 1.0),
              //   ],
              //   ),

              gradient: LinearGradient(
                // 线性渐变
                colors: [
                  Color.fromRGBO(7, 102, 255, 1.0),
                  Color.fromRGBO(3, 28, 128, 1.0),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RichTextDemo extends StatelessWidget {
  const RichTextDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'chenglong',
        style: TextStyle(
            color: Colors.deepOrangeAccent,
            fontSize: 34.0,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w100),
        children: [
          TextSpan(
            text: '.net',
            style: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}

class TextDemo extends StatelessWidget {
  const TextDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle _textStyle = TextStyle(
      fontSize: 16.0,
    );

    final String _author = '李白';
    final String _title = '将进酒';

    return Text(
      '《$_title》 - $_author CL Hello world 都是开发斯柯达福建省快递费甲骨文欧日我额SDK就开始搞水电费决胜巅峰精神层面迅速的反馈三等奖各位偶然上岛咖啡速度快放假查询打开文件认为欧日多斯拉克讲故事的看法市房管局圣诞节防沉迷vn',
      textAlign: TextAlign.center, // 对齐方式
      style: _textStyle,
      maxLines: 3, // 最多显示3行
      overflow: TextOverflow.ellipsis, // 溢出显示 省略
    );
  }
}

// 设置单独边框
// border: Border( // 设置边框
//   top: BorderSide(
//     color: Colors.black,
//     width: 3.0,
//     style: BorderStyle.solid,
//   ),
//   bottom: BorderSide(
//     color: Colors.black,
//     width: 3.0,
//     style: BorderStyle.solid,
//   )
// )

// 单独设置圆角
// borderRadius: BorderRadius.only(
//   topLeft: Radius.circular(10.0),
//   topRight: Radius.circular(20.0),
// )
