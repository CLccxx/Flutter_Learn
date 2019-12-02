import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  List<String> _tags = ['Apple', 'Banana', 'Lemon'];
  String _action = 'Nothing';
  List<String> _select = [];
  String _choice = 'Lemon';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChipDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Wrap(
              spacing: 16.0,
              runSpacing: 16.0,
              children: <Widget>[
                Chip(
                  label: Text('left'),
                ),
                Chip(
                  label: Text('Sunset'),
                  backgroundColor: Colors.orange,
                ),
                Chip(
                  label: Text('Chenglong'),
                  avatar: CircleAvatar(
                    // backgroundImage: Image.network(''),
                    backgroundColor: Colors.grey,
                    child: Text('程'),
                  ),
                ),
                Chip(
                  label: Text('Chenglong'),
                  avatar: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://resources.ninghao.org/images/candy-shop.jpg'),
                  ),
                ),
                Chip(
                  label: Text('delete'),
                  onDeleted: () {},
                  deleteIcon: Icon(Icons.delete),
                  deleteIconColor: Colors.red,
                  deleteButtonTooltipMessage: 'remove this', // 长按提示信息
                ),
                Divider(
                  // 分隔符
                  color: Colors.grey,
                  height: 0.0, // 高度，不是线的高度
                  indent: 50.0, // 左边缩进
                ),
                Wrap(
                  spacing: 16.0,
                  children: _tags.map((tag) {
                    return Chip(
                      label: Text(tag),
                      onDeleted: () {
                        setState(() {
                          _tags.remove(tag);
                        });
                      },
                    );
                  }).toList(),
                ),
                Divider(
                  // 分隔符
                  color: Colors.grey,
                  height: 0.0, // 高度，不是线的高度
                  indent: 50.0, // 左边缩进
                ),
                Container(
                  width: double.infinity,
                  child: Text('ActionChip: $_action'),
                ),
                Wrap(
                  spacing: 16.0,
                  children: _tags.map((tag) {
                    return ActionChip(
                      label: Text(tag),
                      onPressed: () {
                        setState(() {
                          _action = tag;
                        });
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
            Divider(
              // 分隔符
              color: Colors.grey,
              height: 30.0, // 高度，不是线的高度
              indent: 50.0, // 左边缩进
            ),
            Container(
              width: double.infinity,
              child: Text('ActionChip: $_select'),
            ),
            Wrap(
              spacing: 16.0,
              children: _tags.map((tag) {
                return FilterChip(
                  label: Text(tag),
                  selected: _select.contains(tag),
                  onSelected: (value){
                    setState(() {
                      if (_select.contains(tag)){
                        _select.remove(tag);
                      }else{
                        _select.add(tag);
                      }
                    });
                  },
                );
              }).toList(),
            ),
            Divider(
              // 分隔符
              color: Colors.grey,
              height: 30.0, // 高度，不是线的高度
              indent: 50.0, // 左边缩进
            ),
            Container(
              width: double.infinity,
              child: Text('ChoiceChip: $_choice'),
            ),
            Wrap(
              spacing: 16.0,
              children: _tags.map((tag) {
                return ChoiceChip(
                  label: Text(tag),
                  selectedColor: Colors.black87,
                  selected: _choice == tag,
                  onSelected: (value){
                    setState(() {
                      _choice = tag;
                    });
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.restore),
        onPressed: () {
          setState(() {
            _tags = [
              'Apple',
              'Banana',
              'Lemon',
            ];
            _select = [];
            _choice = 'Lemon';
          });
        },
      ),
    );
  }
}
