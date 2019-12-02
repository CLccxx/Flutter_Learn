import 'package:flutter/material.dart';
import 'package:flutter_learn/demo/Slider_Demo.dart';
import 'package:flutter_learn/demo/bottom_sheet_demo.dart';
import 'package:flutter_learn/demo/datetime_Demo.dart';
import 'package:flutter_learn/demo/simple_dialog_Demo.dart';
import './button_Demo.dart';
import './floating_action_button_Demo.dart';
import './popup_menu_button_Demo.dart';
import './form_Demo.dart';
import './CheckBoxDemo.dart';
import './radio_demo.dart';
import './Switch_Demo.dart';
import './alert_dialog_Demo.dart';
import './snack_bar_Demo.dart';
import './expansionPane_Demo.dart';
import './ChipDemo.dart';
import './DataTable_Demo.dart';
import './paginated_Data_Table_Demo.dart';
import './CardDemo.dart';
import './Stepper_demo.dart';

class MaterialComponents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MaterialComponents'),
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          ListItem(title: 'ButtonDemo', page: ButtonDemo()),
          ListItem(
              title: 'FloatingActionButtonDemo',
              page: FloatingActionButtonDemo()),
          ListItem(title: 'PopUpMenuButtonDemo', page: PopupMenuButtonDemo()),
          ListItem(title: 'FormDemo', page: FormDemo()),
          ListItem(title: 'CheckBoxDemo', page: CheckBoxDemo()),
          ListItem(title: 'RadioDemo', page: RadioDemo()),
          ListItem(title: 'SwitchDemo', page: SwitchDemo()),
          ListItem(title: 'SliderDemo', page: SliderDemo()),
          ListItem(title: 'DateTimeDemo', page: DateTimeDemo()),
          ListItem(title: 'SimpleDialogDemo', page: SimpleDialogDemo()),
          ListItem(title: 'AlertDialogDemo', page: AlertDialogDemo()),
          ListItem(title: 'BottomSheetDemo', page: BottomSheetDemo()),
          ListItem(title: 'SnackBarDemo', page: SnackBarDemo()),
          ListItem(title: 'ExpansionPanelDemo', page: ExpansionPaneDemo()),
          ListItem(title: 'ChipDemo', page: ChipDemo()),
          ListItem(title: 'DataTableDemo', page: DataTableDemo()),
          ListItem(title: 'PaginatedDataTableDemo', page: PaginatedDataTableDemo()),
          ListItem(title: 'CardDemo', page: CardDemo()),
          ListItem(title: 'SteepDemo', page: StepperDemo()),
          

        ],
      ),
    );
  }
}

class _WidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('_WidgetDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[],
            ),
          ],
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final Widget page; // 跳转的界面

  ListItem({this.title, this.page});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => page),
        );
        // Navigator.of(context).push(
        //   MaterialPageRoute(builder: (context) => page),
        // );
      },
    );
  }
}
