import 'package:flutter/material.dart';
import '../model/post.dart';

class DataTableDemo extends StatefulWidget {
  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  int _sortColumnIndex = 0;
  bool _sortAscending = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DataTableDemo'),
        elevation: 0.0,
      ),
      body: Container(
          padding: EdgeInsets.all(16.0),
          child: DataTable(
            sortColumnIndex: _sortColumnIndex, // 排序的列的索引号
            sortAscending: _sortAscending, // true 表示当前按照列表的升序排列
            // onSelectAll: (bool value){},
            columns: [
              DataColumn(
                  label: Text('title'), // 如果需要设置宽度可以使用Container
                  onSort: (int index, bool ascending) {
                    setState(() {
                      _sortAscending = ascending;
                      _sortColumnIndex = index;

                      posts.sort((a, b) {
                        if (!ascending) {
                          // 如果降序则交换两个值 ，在对比
                          final c = a;
                          a = b;
                          b = c;
                        }

                        return a.title.length.compareTo(b.title.length);
                      });
                    });
                  }),
              DataColumn(
                label: Text('author'),
              ),
              DataColumn(
                label: Text('Image'),
              )
            ],
            rows: posts.map((post) {
              return DataRow(
                selected: post.selected,
                onSelectChanged: (bool value) {
                  setState(() {
                    if (post.selected != value) {
                      post.selected = value;
                    }
                  });
                },
                cells: [
                  DataCell(Text(post.title)),
                  DataCell(Text(post.author)),
                  DataCell(Image.network(post.imageUrl)),
                ],
              );
            }).toList(),
          )),
    );
  }
}
