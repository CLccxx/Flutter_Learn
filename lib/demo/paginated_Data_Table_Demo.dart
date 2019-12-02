import 'package:flutter/material.dart';
import '../model/post.dart';

class PostDataSource extends DataTableSource {
  final List<Post> _posts = posts;
  int _selectedCount = 0;
  @override
  int get rowCount => _posts.length;
  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => _selectedCount;

  @override
  DataRow getRow(int index) {
    final Post indexPost = _posts[index];
    // TODO: implement getRow
    return DataRow.byIndex(index: index, cells: <DataCell>[
      DataCell(Text(indexPost.title)),
      DataCell(Text(indexPost.author)),
      DataCell(Image.network(indexPost.imageUrl)),
    ]);
  }

  void _sort(getField(post), bool ascending) {
    _posts.sort((a, b) {
      if (!ascending) {
        final c = a;
        a = b;
        b = c;
      }

      final aValue = getField(a);
      final bValue = getField(b);

      return Comparable.compare(aValue, bValue);
    });

    notifyListeners();
  }
}

class PaginatedDataTableDemo extends StatefulWidget {
  @override
  _PaginatedDataTableDemoState createState() => _PaginatedDataTableDemoState();
}

class _PaginatedDataTableDemoState extends State<PaginatedDataTableDemo> {
  int _sortColumnIndex = 0;
  bool _sortAscending = true;

  final PostDataSource _postDataSource = PostDataSource();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DataTableDemo'),
        elevation: 0.0,
      ),
      body: Container(
          padding: EdgeInsets.all(16.0),
          child: PaginatedDataTable(
            header: Text('Posts'),
            source: _postDataSource,
            rowsPerPage: 5,
            sortColumnIndex: _sortColumnIndex, // 排序的列的索引号
            sortAscending: _sortAscending, // true 表示当前按照列表的升序排列
            // onSelectAll: (bool value){},
            columns: [
              DataColumn(
                  label: Text('title'), // 如果需要设置宽度可以使用Container
                  onSort: (int columnIndex, bool ascending) {
                    setState(() {
                      _sortAscending = ascending;
                      _sortColumnIndex = columnIndex;

                      _postDataSource._sort(
                          (post) => post.title.length, ascending);
                    });
                  }),
              DataColumn(
                label: Text('author'),
              ),
              DataColumn(
                label: Text('Image'),
              )
            ],
          )),
    );
  }
}
