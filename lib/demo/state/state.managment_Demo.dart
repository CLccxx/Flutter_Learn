import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

// class StateManagementDemo extends StatefulWidget {
//   StateManagementDemo({Key key}) : super(key: key);

//   @override
//   _StateManagementDemoState createState() => _StateManagementDemoState();
// }

// class _StateManagementDemoState extends State<StateManagementDemo> {

//   int _count = 0;

//   void _increaseCount() {
//     setState(() {
//       _count -= 1;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return CounterProvider(
//       count: _count,
//       increaseCount: _increaseCount,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('StateManagementDemo'),
//           elevation: 0.0,
//         ),
//         body: ConterWrapper(),
//         floatingActionButton: FloatingActionButton(
//           child: Icon(Icons.adb),
//           onPressed: (){
//             setState(() {
//               _count += 1;
//             });
//             debugPrint('$_count');
//           },
//         ),
//       ),
//     );
//   }
// }

// 随着小部件树的层数越老越深，数据传递需要通过每一层来传递，即使中间件不需要这些数据，
// 为了解决这样的问题。

// 直接将数据传递给需要的小部件，InheritedWidget ,可以设置其他小部件需要的数据，然后在把他放在小部件树的某个地方，这样小部件树下的所有小部件都可以使用InheritedWidget包含的数据
// class ConterWrapper extends StatelessWidget {

//   final int countNum;
//   final VoidCallback increaseCount;
//   const ConterWrapper({Key key, this.countNum, this.increaseCount}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Counter(countNum: countNum, increaseCount: increaseCount,),
//     );
//   }
// }
//============ 改造后
class ConterWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Counter(),
    );
  }
}

// class Counter extends StatelessWidget {

//   final int countNum;
//   final VoidCallback increaseCount;
//   const Counter({Key key , this.countNum, this.increaseCount}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ActionChip(
//       label: Text('$countNum'),
//       onPressed: increaseCount,
//     );
//   }
// }
//============ 改造后

// class Counter extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final int count = CounterProvider.of(context).count;
//     final VoidCallback increaseCount =
//         CounterProvider.of(context).increaseCount;

//     return ActionChip(
//       label: Text('$count'),
//       onPressed: increaseCount,
//     );
//   }
// }

//============ scopedModel 改造后
class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<CounterModel>(
      builder: (context, _, model) => ActionChip(
        label: Text('${model.count}'),
        onPressed: model.increaseCount,
      ),
    );
  }
}

// InheritedWidget
class CounterProvider extends InheritedWidget {
  // 里面的数据必须是final
  final int count;
  final VoidCallback increaseCount;
  final Widget child;

  CounterProvider({
    this.count,
    this.increaseCount,
    this.child,
  }) : super(child: child);

// 在使用的时候需要提供 这样就可以在其他小部件里面使用CounterProvider的of方法去得到他的state
  static CounterProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(CounterProvider);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify

    return true;
  }
}

// ScopedModel 也可以直接讲数据传递给需要的小部件
// 先去创建一个model,然后在他里面去创建需要的数据，将model小部件放在小部件树的某个小部件上，去设置一下他的model，这样下面的小部件都可以直接
// 访问model里面的数据，小部件需要使用model里面的数据，需要去用一个。。。包装一下，然后用builder方法返回小部件，这样就可以得到里面的东西了。
class CounterModel extends Model {
  int _count = 0;
  int get count => _count;

  void increaseCount() {
    _count += 1;
    notifyListeners(); // 那些监听model的小部件就会被重建
  }
}

class StateManagementDemo extends StatelessWidget {
  // 类里面的字段的值必须是 final的，
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: CounterModel(),
      child: Scaffold(
          appBar: AppBar(
            title: Text('StateManagementDemo'),
            elevation: 0.0,
          ),
          body: ConterWrapper(),
          floatingActionButton: ScopedModelDescendant<CounterModel>(
            rebuildOnChange: false,
            builder: (context, _, model) => FloatingActionButton(
              child: Icon(Icons.adb),
              onPressed: model.increaseCount,
            ),
          )),
    );
  }
}
