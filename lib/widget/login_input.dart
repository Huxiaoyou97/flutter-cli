import 'package:flutter/material.dart';
import 'package:flutter_demo/util/color.dart';

class LoginInput extends StatefulWidget {
  /// 标题
  final String title;

  /// 提示文案
  final String hint;

  /// 内容发生变化 change事件
  final ValueChanged<String> onChanged;

  /// 输入框获取焦点事件
  final ValueChanged<bool> focusChanged;

  /// 输入框底部线条是否撑满整行
  final bool lineStretch;

  /// 是否启用密码输入模式
  final bool obscureText;

  /// 输入框类型 纯数字输入 普通输入
  final TextInputType keyboardType;

  /// 输入框Controller
  final TextEditingController editingController;

  const LoginInput(this.title, this.hint,
      {Key key,
      this.onChanged,
      this.focusChanged,
      this.lineStretch = false,
      this.obscureText = false,
      this.keyboardType,
      this.editingController})
      : super(key: key);

  @override
  _LoginInputState createState() => _LoginInputState();
}

class _LoginInputState extends State<LoginInput> {
  /// 输入框是否获取到光标
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    // 获取光标监听
    _focusNode.addListener(() {
      // hasFocus 获取到光标的时候会执行
      if (widget.focusChanged != null) {
        widget.focusChanged(_focusNode.hasFocus);
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15),
              width: 100,
              child: Text(
                widget.title,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            _input(),
          ],
        )
      ],
    );
  }

  _input() {
    return Expanded(
      child: TextField(
        focusNode: _focusNode,
        onChanged: widget.onChanged,
        obscureText: widget.obscureText,
        keyboardType: widget.keyboardType,
        autofocus: !widget.obscureText,

        // 光标颜色
        cursorColor: primary,
        controller: widget.editingController,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 20, right: 20),
          border: InputBorder.none,
          hintText: widget.hint,
          hintStyle: const TextStyle(fontSize: 15, color: Colors.grey),
        ),
      ),
    );
  }
}
