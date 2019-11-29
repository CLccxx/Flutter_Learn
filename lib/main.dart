import 'package:flutter/material.dart';
import 'package:flutter_learn/model/post.dart';
import './demo/Bottom_Navigation_Bar_Demo.dart';
import './demo/Drawer_Demo.dart';
import './demo/ListView_Demo.dart';
import './demo/Basic_Demo.dart';
import './demo/Layout_Demo.dart';
import './demo/View_Demo.dart';
import './demo/Sliver_Demo.dart';
import './demo/navigator_Demo.dart';
import './demo/post_Show.dart';


void main() => runApp(App());

// void main() {
//   runApp(
//     App()
//   );
// }

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: NavigatorDemo(),//Home(),
      initialRoute: '/', // 初始界面
      routes: {
        '/' : (context) => Home(),//NavigatorDemo(),
        '/about' : (context) => Page(title: 'About'),
        '/postShow' : (context) => PostShow(post: posts[1]),
      },
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        // 水波纹效果，定制MaterialApp样式 
        highlightColor: Color.fromRGBO(255,255,255,0.5), // 高亮颜色
        splashColor: Colors.white70 // 水波纹颜色
      ),
    );
  }
}

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // 设置标签的数量
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigration',
            onPressed: () => debugPrint('Navigration button is pressed'), // 设置为null则表示禁用
          ),
          title: Text('ChengLong'),
          actions: <Widget>[
            IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: () => debugPrint('search button is pressed'), // 设置为null则表示禁用
          ),
          ],
          elevation: 30.0,
          bottom: TabBar(
            unselectedLabelColor: Colors.black38, // 未选中的颜色
            indicatorColor: Colors.black54, // TabBar选中指示线的颜色
            indicatorSize: TabBarIndicatorSize.label, // 标签的长度
            indicatorWeight: 5.0, // 标签的宽度
            tabs: <Widget>[ // 设置一组标签
              Tab(icon: Icon(Icons.local_florist),),
              Tab(icon: Icon(Icons.change_history),),
              Tab(icon: Icon(Icons.directions_bike),),
              Tab(icon: Icon(Icons.view_quilt),),
            ],
          ),
        ),
        body: TabBarView( // 标签的内容
          children: <Widget>[
            // Icon(Icons.access_alarm, size: 128.0, color: Colors.black12),
            ListViewDemo(),
            BasicDemo(),
            LayoutDemo(),
            SliverDemo(),
            // ViewDemo(),
            // Icon(Icons.change_history, size: 128.0, color: Colors.black12),
            // Icon(Icons.directions_bike, size: 128.0, color: Colors.black12),
          ],
        ),
        drawer: DrawerDemo(),
        bottomNavigationBar: BottomNavigationBarDemo(),
      ),
    );
  }
}
