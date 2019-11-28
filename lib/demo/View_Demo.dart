import 'package:flutter/material.dart';
import '../model/post.dart';


class ViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridViewBuilderDemo();
  }
}

class GridViewBuilderDemo extends StatelessWidget {

  Widget _gridItemBuilder(BuildContext context, int index) {
    return Container(
      child: Image.network(
        posts[index].imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(8.0),
      itemCount: posts.length,
      itemBuilder: _gridItemBuilder,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10.0, // 交叉轴
        mainAxisSpacing: 10.0, // 主轴
      ),
    );
  }
}

class GridViewExtendDemo extends StatelessWidget {
  List<Widget> _buildTiles(int length){
    return List.generate(length, (int index) {
      return Container(
        color: Colors.grey[300],
        alignment: Alignment(0.0, 0.0),
        child: Text(
          'Item $index',
          style: TextStyle(fontSize:  18.0, color:  Colors.grey),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 200.0, // 交叉轴上最大的尺寸
      crossAxisSpacing:  16.0, // 间距
      mainAxisSpacing: 16.0,
      scrollDirection: Axis.vertical, // 设置主轴
      children: _buildTiles(100),
    );
  }
}

class GridViewCountDemo extends StatelessWidget {
  List<Widget> _buildTiles(int length){
    return List.generate(length, (int index) {
      return Container(
        color: Colors.grey[300],
        alignment: Alignment(0.0, 0.0),
        child: Text(
          'Item $index',
          style: TextStyle(fontSize:  18.0, color:  Colors.grey),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      // 默认垂直滚动，所以主轴是垂直，交叉轴是横轴
      crossAxisCount: 4, // 横轴3个
      crossAxisSpacing:  16.0, // 间距
      mainAxisSpacing: 16.0,
      scrollDirection: Axis.vertical,
      children: _buildTiles(100),
    );
  }
}

class PageViewBuilderDemo extends StatelessWidget {
  Widget _pageItemBuilder(BuildContext context, int index) {
    return Stack(
      children: <Widget>[
        SizedBox.expand(
          child: Image.network(
            posts[index].imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 8.0,
          left: 8.0,
          child: Column(
            children: <Widget>[
              Text(
                posts[index].title,
                style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
              ),
              Text(
                posts[index].author,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: posts.length,
      itemBuilder: _pageItemBuilder,
    );
  }
}

class PageVeiwDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      pageSnapping: true,
      reverse: true,
      scrollDirection: Axis.horizontal,
      onPageChanged: (currentPage) => debugPrint('Page: $currentPage'), // page界面修改的时候回调用

      controller: PageController(
        initialPage: 1,
        keepPage: false, // 不记录当前显示的那个界面
        viewportFraction: 0.85 // 页面占用整个界面的比例，在滚动方向上
      ),
      children: <Widget>[
        Container(
          color: Colors.lightBlue,
          alignment: Alignment.center,
          child: Text(
            'One',
            style: TextStyle(fontSize: 32,color: Colors.white),
          ),
        ),
        Container(
          color: Colors.yellowAccent,
          alignment: Alignment.center,
          child: Text(
            'Two',
            style: TextStyle(fontSize: 32,color: Colors.white),
          ),
        ),
        Container(
          color: Colors.greenAccent,
          alignment: Alignment.center,
          child: Text(
            'Three',
            style: TextStyle(fontSize: 32,color: Colors.white),
          ),
        ),
      ],
    );
  }
}