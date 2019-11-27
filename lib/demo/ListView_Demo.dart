import 'package:flutter/material.dart';
import '../model/post.dart'; // 两个点一个斜线表示上一级目录

class ListViewDemo extends StatelessWidget {
  const ListViewDemo({Key key}) : super(key: key);

  Widget _listItemBuilder(BuildContext context, int index) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Image.network(posts[index].imageUrl),
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

