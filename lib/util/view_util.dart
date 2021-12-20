import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/widget/navigation_bar.dart';

import 'format_util.dart';

// 带缓存的image组件
Widget cachedImage(String url, {double width, double height}) {
  return CachedNetworkImage(
    height: height,
    width: width,
    fit: BoxFit.cover,
    placeholder: (
      BuildContext context,
      String url,
    ) =>
        Container(
      color: Colors.grey[200],
    ),
    errorWidget: (
      BuildContext context,
      String url,
      dynamic error,
    ) =>
        Icon(Icons.error),
    imageUrl: url,
  );
}

// 黑色线性渐变
blackLinearGradient({bool formTop = false}) {
  return LinearGradient(
      begin: formTop ? Alignment.topCenter : Alignment.bottomCenter,
      end: !formTop ? Alignment.topCenter : Alignment.bottomCenter,
      colors: const [
        Colors.black54,
        Colors.black45,
        Colors.black38,
        Colors.black26,
        Colors.transparent,
      ]);
}

// 修改状态栏
void changeStatusBar(
    {color = Colors.white,
    StatusStyle statusStyle = StatusStyle.DARK_CONTENT,
    BuildContext context}) {
  //沉浸式状态栏样式
  Brightness brightness;
  if (Platform.isIOS) {
    brightness = statusStyle == StatusStyle.LIGHT_CONTENT
        ? Brightness.dark
        : Brightness.light;
  } else {
    brightness = statusStyle == StatusStyle.LIGHT_CONTENT
        ? Brightness.light
        : Brightness.dark;
  }
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.transparent,
    statusBarBrightness: brightness,
    statusBarIconBrightness: brightness,
  ));
}

/// 带文字的小图标
smallIconText(IconData iconData, var text) {
  var style = const TextStyle(fontSize: 12, color: Colors.grey);

  if (text is int) {
    text = countFormat(text);
  }

  return [
    Icon(
      iconData,
      color: Colors.grey,
      size: 12,
    ),
    Text(
      " $text",
      style: style,
    )
  ];
}


/// border 线条
borderLine(BuildContext context, {bottom = true, top = false}) {
  BorderSide borderSide = BorderSide(width: 0.5, color: Colors.grey[200]);
  return Border(
    bottom: bottom ? borderSide : BorderSide.none,
    top: top ? borderSide : BorderSide.none,
  );
}

// 间距
SizedBox hiSpace({double height = 1, double width = 1}) {
  return SizedBox(
    height: height,
    width: width,
  );
}

// 底部阴影
BoxDecoration bottomBoxShadow(BuildContext context) {
  // var themeProvider = context.watch<ThemeProvider>();
  //
  // if (themeProvider.isDark()) {
  //   return null;
  // }

  return BoxDecoration(color: Colors.white, boxShadow: [
    BoxShadow(
      color: Colors.grey[100],
      offset: const Offset(0, 5), // x,y轴偏移
      blurRadius: 5, // 阴影模糊程度
      spreadRadius: 1, // 阴影扩散程度
    )
  ]);
}
