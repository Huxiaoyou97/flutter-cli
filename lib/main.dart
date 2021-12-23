import 'package:flutter/material.dart';
import 'package:flutter_demo/db/hi_cache.dart';
import 'package:flutter_demo/provider/config_provider.dart';
import 'package:flutter_demo/provider/count_provider.dart';
import 'package:flutter_demo/provider/hi_provider.dart';
import 'package:flutter_demo/router.dart';
import 'package:flutter_demo/util/color.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'i18n/get_local.dart';
import 'i18n/my_localizations_delegates.dart';
import 'i18n/select_language_page.dart';

void main() {
  runApp(const FlutterApp());
}

class FlutterApp extends StatefulWidget {
  const FlutterApp({Key key}) : super(key: key);

  @override
  _FlutterAppState createState() => _FlutterAppState();
}

///创建key值，就是为了调用外部方法
///ChangeLocalizationsState 用来应用内切换语言环境的类
GlobalKey<ChangeLocalizationsState> changeLocalizationStateKey =
    GlobalKey<ChangeLocalizationsState>();

class _FlutterAppState extends State<FlutterApp> {
  final FlutterAppRouteDelegate _routeDelegate = FlutterAppRouteDelegate();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<HiCache>(
      future: _loadMain(),
      builder: (BuildContext context, AsyncSnapshot<HiCache> snapshot) {
        var widget = snapshot.connectionState == ConnectionState.done
            ? Router(
                routerDelegate: _routeDelegate,
              )
            : const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );

        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => CountProvider()),
            ChangeNotifierProvider(create: (_) => ConfigProvider()),
          ],
          child: MaterialApp(
            home: Builder(
              builder: (context) {
                ///通过 Localizations.override 包裹一层。---这里
                ///将 ChangeLocalizations 使用到 MaterialApp 中
                return ChangeLocalizations(
                  key: changeLocalizationStateKey,
                  child: widget,
                );
              },
            ),
            theme: ThemeData(primarySwatch: white),

            /// 此处 配制多语言环境
            ///配置 android 应用任务栏显示的标题 的国际化
            ///因为 DemoLocalizations 使用到了context 所以这里不使用title 属性
            onGenerateTitle: (context) {
              ///根据语言环境来获取 taskTitle
              ///DemoLocalizations 为自定义的语言文字适配中心
              return GetLocal.of(context).taskTitle;
            },

            ///本地化委托，用于更改Flutter Widget默认的提示语，按钮text等
            ///通常我们新建的 Flutter 应用是默认不支持多语言的，即使用户在中文环境下，显示的文字仍然是英文
            localizationsDelegates: [
              ///初始化默认的 Material 组件本地化
              GlobalMaterialLocalizations.delegate,

              ///初始化默认的 通用 Widget 组件本地化
              // GlobalWidgetsLocalizations.delegate,

              ///初始化自定义多语言环境运行
              MyLocalizationsDelegates.delegate,
            ],

            ///当前区域，如果为null则使用系统区域一般用于语言切换
            ///传入两个参数，语言代码，国家代码
            ///这里配制为中国
            locale: Locale('zh', 'CN'),

            ///传入支持的语种数组
            supportedLocales: const [
              Locale('en', 'US'), // English 英文
              Locale('he', 'IL'), // Hebrew 西班牙
              Locale('zh', 'CN'), // 中文，后面的countryCode暂时不指定
            ],

            ///当传入的是不支持的语种，可以根据这个回调，返回相近,并且支持的语种
            localeResolutionCallback: (local, support) {
              ///当前软件支行的语言 也就是[supportedLocales] 中配制的语种
              if (support.contains(local)) {
                print('support  $local');
                return local;
              }

              ///如果当前软件运行的手机环境不在 [supportedLocales] 中配制的语种范围内
              ///返回一种默认的语言环境，这里使用的是中文
              print('no_support local is $local and support is $support');
              return const Locale('zh', 'CN');
            },
          ),
        );
      },
    );
  }

  Future<HiCache> _loadMain() async {
    await HiCache.preInit();
  }
}

class ChangeLocalizations extends StatefulWidget {
  final Widget child;

  ChangeLocalizations({Key key, this.child}) : super(key: key);

  @override
  ChangeLocalizationsState createState() => ChangeLocalizationsState();
}

class ChangeLocalizationsState extends State<ChangeLocalizations> {
  //初始是中文
  Locale _locale = const Locale('zh', 'CH');

  changeLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  //通过Localizations.override 包裹我们需要构建的页面
  @override
  Widget build(BuildContext context) {
    //通过Localizations 实现实时多语言切换
    //通过 Localizations.override 包裹一层。---这里
    return Localizations.override(
      context: context,
      locale: _locale,
      child: widget.child,
    );
  }
}
