

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'get_local.dart';

///自定义多语言处理代理
class MyLocalizationsDelegates
    extends LocalizationsDelegate<GetLocal> {
  ///构造
  const MyLocalizationsDelegates();
  ///静态构造
  static MyLocalizationsDelegates delegate = const MyLocalizationsDelegates();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'zh', 'he'].contains(locale.languageCode);
  }

  @override //是否需要重载
  bool shouldReload(LocalizationsDelegate old) => false;

  ///MyLocalizations就是在此方法内被初始化的
  ///通过方法的 locale 参数，判断需要加载的语言，然后返回自定义好多语言实现类MyLocalizations
  ///最后通过静态 delegate 对外提供 LocalizationsDelegate。
  @override
  Future<GetLocal> load(Locale locale) {
    //加载本地化
    return  SynchronousFuture( GetLocal(locale));
  }
}
