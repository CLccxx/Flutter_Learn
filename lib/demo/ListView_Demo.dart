
import 'package:flutter/material.dart';
import '../model/post.dart'; // 两个点一个斜线表示上一级目录
import '../demo/post_Show.dart';

class ListViewDemo extends StatelessWidget {
  const ListViewDemo({Key key}) : super(key: key);

  Widget _listItemBuilder(BuildContext context, int index) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(8.0),
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 16/9,
                child: Image.network(posts[index].imageUrl, fit: BoxFit.cover),
              ),
              SizedBox(height: 16.0),
              Text(
                posts[index].title,
                style: Theme.of(context).textTheme.title,
              ),
              Text(
                posts[index].author,
                style: Theme.of(context).textTheme.subhead,
              ),
            ],
          ),
          Positioned.fill( 
            // 默认上下左右都为0
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Colors.white.withOpacity(0.3), // 慢慢展开
                highlightColor: Colors.white.withOpacity(0.1), // 最开始显示
                onTap: (){
                  // debugPrint('tap');
                  Navigator.pushNamed(context, '/postShow');
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => PostShow(post: posts[index]),
                  //   )
                  // );
                },
              ),
            )
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: _listItemBuilder,
    );
  }
}
