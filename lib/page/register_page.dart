import 'package:flutter/material.dart';
import 'package:flutter_demo/navigator/hi_navigator.dart';
import 'package:flutter_demo/widget/appbar.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("注册账号", "登录", () {
        // 跳转注册
        HiNavigator.getInstance().onJumpTo(RouteStatus.login);
      }),
      body: Container(
        child: Text("注册"),
      ),
    );
  }
}
