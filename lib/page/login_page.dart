import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_demo/i18n/get_local.dart';
import 'package:flutter_demo/navigator/hi_navigator.dart';
import 'package:flutter_demo/widget/appbar.dart';
import 'package:flutter_demo/widget/login_input.dart';

import '../main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("密码登录", "注册", () {
        // 跳转注册
        HiNavigator.getInstance().onJumpTo(RouteStatus.register, args: {
          "id": "我是登录页面传到注册页面的id：123456",
        });
      }),
      body: Container(
        child: ListView(
          children: [
            LoginInput(
              GetLocal.of(context).loginInputUsername,
              GetLocal.of(context).loginInputUsernamePlaceholder,
              onChanged: (text) {
                print("text$text");
              },
            ),
            LoginInput(
              GetLocal.of(context).loginInputPassword,
              GetLocal.of(context).loginInputPasswordPlaceholder,
              obscureText: true,
              focusChanged: (focus) {
                print("focus$focus");
              },
              onChanged: (text) {
                print("text$text");
              },
            ),
            InkWell(
              onTap: () {
                changeLocale();
              },
              child: Text(
                "切换语言",
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }

  ///语言切换
  ///这里则是弹框内容了
  void changeLocale() {
    showDialog(
      context: context,
      barrierDismissible: false, //// user must tap button!
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text("请选择语言"),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                switchLanguage(0);
                Navigator.of(context).pop();
              },
              child: const Text("中文"),
            ),
            SimpleDialogOption(
              onPressed: () {
                switchLanguage(1);
                Navigator.of(context).pop();
              },
              child: const Text("英语"),
            ),
            SimpleDialogOption(
              onPressed: () {
                switchLanguage(2);
                Navigator.of(context).pop();
              },
              child: const Text("西班牙语"),
            )
          ],
        );
      },
    );
  }

  ///切换语言
  ///通过 changeLocalizationStateKey 来修改本应用内的 Locale
  void switchLanguage(int index) {
    switch (index) {
      case 0:
        changeLocalizationStateKey.currentState
            .changeLocale(const Locale('zh', 'CH'));
        break;
      case 1:
        changeLocalizationStateKey.currentState
            .changeLocale(const Locale('en', 'US'));
        break;
      case 2:
        changeLocalizationStateKey.currentState
            .changeLocale(const Locale('he', 'IL'));
        break;
    }
  }
}
