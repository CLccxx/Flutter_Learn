import 'package:flutter/material.dart';


class ExpansionPanelItem {
  final String headerText;
  final Widget body;
  bool isExpanded;

  ExpansionPanelItem({
    this.headerText,
    this.body,
    this.isExpanded
  });
}


class ExpansionPaneDemo extends StatefulWidget {
  @override
  _ExpansionPaneDemoState createState() => _ExpansionPaneDemoState();
}

class _ExpansionPaneDemoState extends State<ExpansionPaneDemo> {

  // bool _isExpanded = false;

  List<ExpansionPanelItem> _expansionPanelItems;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _expansionPanelItems = <ExpansionPanelItem> [
      ExpansionPanelItem(
        headerText: 'panal A',
        body: Container(
                      padding: EdgeInsets.all(16.0),
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('content page a'),
                          Text('content page b'),
                          Text('content page c'),
                        ],
                      ),
                    ),
        isExpanded: false,
      ),
      ExpansionPanelItem(
        headerText: 'panal B',
        body: Container(
                      padding: EdgeInsets.all(16.0),
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('content page a'),
                          Text('content page b'),
                          Text('content page c'),
                        ],
                      ),
                    ),
        isExpanded: false,
      ),
      ExpansionPanelItem(
        headerText: 'panal C',
        body: Container(
                      padding: EdgeInsets.all(16.0),
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('content page a'),
                          Text('content page b'),
                          Text('content page c'),
                        ],
                      ),
                    ),
        isExpanded: false,
      )
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExpansionPaneDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ExpansionPanelList(
              expansionCallback: (int panelIndex, bool isExpanded){
                setState(() {
                  _expansionPanelItems[panelIndex].isExpanded = !_expansionPanelItems[panelIndex].isExpanded;
                });
              },
              children: _expansionPanelItems.map(
                (ExpansionPanelItem item) {
                  return ExpansionPanel(
                    isExpanded: item.isExpanded,
                    body: item.body,
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return Container(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          item.headerText,
                          style: Theme.of(context).textTheme.title,
                        ),
                      );
                    },
                  );
                }
              ).toList(),
            )
          ],
        ),
      ),
    );
  }
}
