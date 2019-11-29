import 'package:flutter/material.dart';
import '../model/post.dart';

class SliverDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 提供了一个界面的结构
      body: CustomScrollView(
        // 继承ScrollView
        slivers: <Widget>[
          // 一组sliver类型的小部件
          SliverAppBar(
            // title: Text('ChengLong'),
            // pinned: true, // 固定在顶部
            floating: true, // 应用工具栏显示
            expandedHeight: 178.0,// 伸展的高度
            flexibleSpace: FlexibleSpaceBar( // 拉伸的内容
              title: Text(
                'chenglong'.toUpperCase(),
                style: TextStyle(
                  fontSize: 15.0,
                  letterSpacing: 3.0,// 字间距
                  fontWeight: FontWeight.w400,
                ),
              ),
              background: Image.network(
                'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3506902483,3066965959&fm=26&gp=0.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverSafeArea(
            // 在安全区显示
            sliver: SliverPadding(
              padding: EdgeInsets.all(10.0), // 添加内边距
              sliver: SliverListDemo(),
            ),
          ),
        ],
      ),
    );
  }
}

// SliverList 列表视图
class SliverListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 36.0),
            child: Material(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                elevation: 14.0,
                shadowColor: Colors.grey.withOpacity(0.5),
                child: Stack(
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Image.network(posts[index].imageUrl,
                          fit: BoxFit.cover),
                    ),
                    Positioned(
                      top: 30.0,
                      left: 30.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            posts[index].title,
                            style: TextStyle(
                              fontSize: 30.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            posts[index].author,
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          );
        },
        childCount: posts.length,
      ),
    );
  }
}

class SliverGridDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.7, // item的宽高比
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            child: Image.network(
              posts[index].imageUrl,
              fit: BoxFit.cover,
            ),
          );
        },
        childCount: posts.length,
      ),
    );
  }
}
