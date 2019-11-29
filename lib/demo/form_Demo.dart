import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('cl'),
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Colors.blueAccent,
          accentColor: Colors.greenAccent,
        ), // 部分覆盖
        // data: ThemeData(
        //   primaryColor: Colors.blueAccent,
        // ), // 全部覆盖
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RegisterFormDemo(),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterFormDemo extends StatefulWidget {
  RegisterFormDemo({Key key}) : super(key: key);

  @override
  _RegisterFormDemoState createState() => _RegisterFormDemoState();
}

class _RegisterFormDemoState extends State<RegisterFormDemo> {
  final registerFormKey = GlobalKey<FormState>();
  String Username, Password;
  bool autovalidate = false;

  void submitRegisterForm() {
    if (registerFormKey.currentState.validate()) {
      registerFormKey.currentState.save(); // 保存一下RegisterFormDemo表单里面填写的数据
      // registerFormKey.currentState.validate(); // 验证表单输入内容是否正确
      debugPrint('username: $Username');
      debugPrint('password: $Password');


      // 底部提示栏，Scaffold.of(context)获取最近的Scaffold
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Registering....'),
        )
      );
    } else {

      setState(() {
        autovalidate = true;
      });
    }
  }

  String validatorUsername(value) {
    if (value.isEmpty) {
      return 'Username is required.';
    }
    return null;
  }

  String validatorPassword(value) {
    if (value.isEmpty) {
      return 'Password is required.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Username',
              helperText: '',
            ),
            onSaved: (value) {
              Username = value;
            },
            validator: validatorUsername,
            autovalidate: autovalidate, // 自动验证
          ),
          TextFormField(
            obscureText: autovalidate,
            decoration: InputDecoration(
              labelText: 'Password',
              helperText: '',
            ),
            onSaved: (value) {
              Password = value;
            },
            validator: validatorPassword,
            autovalidate: autovalidate,
          ),
          SizedBox(
            height: 30.0,
          ),
          Container(
            width: double.infinity,
            child: RaisedButton(
              color: Theme.of(context).primaryColor,
              child: Text(
                'Register',
                style: TextStyle(color: Colors.white),
              ),
              elevation: 0.0,
              onPressed: submitRegisterForm,
            ),
          ),
        ],
      ),
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  TextFieldDemo({Key key}) : super(key: key);

  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  final textEditingController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // textEditingController.text = 'hiiiiiii';
    textEditingController.addListener(
        // 文本框上的值有变化的时候就会去执行这个lister
        () {
      debugPrint('input: ${textEditingController.text}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      // 默认的TextField 编辑状态下的下划线颜色是定义的Theme中primaryColor的颜色
      // 定制文本框的样式
      // onChanged: (value) {
      //   // 每次文本框内容变化的时候都会调用这个
      //   debugPrint('onChanged : $value');
      // },
      onSubmitted: (value) {
        // 点击确定之后调用 输入文本框的内容
        debugPrint('onSubmitted : $value');
      },
      decoration: InputDecoration(
        icon: Icon(Icons.subject), // 设置左边图标
        labelText: 'title',
        hintText: 'place Enter Text',
        // border: InputBorder.none, // 无边框
        border: OutlineInputBorder(),

        filled: true, // 背景
        fillColor: Colors.pinkAccent, // 设置背景颜色，默认灰色
      ),
    );
  }
}

class ThemeDemo extends StatelessWidget {
  const ThemeDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).accentColor,
    );
  }
}
