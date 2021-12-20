import 'package:flutter/material.dart';
import 'package:flutter_demo/i18n/local/en.dart';
import 'package:flutter_demo/i18n/local/he.dart';
import 'package:flutter_demo/i18n/local/zh.dart';

///Localizations类 用于语言资源整合
class GetLocal {
  ///该Locale类是用来识别用户的语言环境
  /// 在MyLocalizationsDelegates 的load方法中初始化的
  final Locale locale;

  GetLocal(this.locale);

  ///此处通过静态方式来初始化
  static GetLocal of(BuildContext context) {
    ///Localizations 是多国语言资源的汇总
    return Localizations.of(context, GetLocal);
  }

  //根据不同locale.languageCode 加载不同语言对应
  static final Map<String, Map<String, String>> _localizedValues = {
    'en': en,
    'zh': zh,
    'he': he
  };

  get taskTitle {
    Map<String, String> map = _localizedValues[locale.languageCode];
    return map['task title'];
  }

  get titleBarTitle {
    return _localizedValues[locale.languageCode]['titlebar title'];
  }

  get clickButtonTitle {
    return _localizedValues[locale.languageCode]['click button'];
  }

  get clickTop {
    return _localizedValues[locale.languageCode]['click tip'];
  }

  get inc {
    return _localizedValues[locale.languageCode]['inc'];
  }

  get welcomes {
    return _localizedValues[locale.languageCode]['welcomes'];
  }

  get testA1 {
    return _localizedValues[locale.languageCode]['test.a1'];
  }

  get loginInputUsername {
    return _localizedValues[locale.languageCode]['loginInputUsername'];
  }

  get loginInputUsernamePlaceholder {
    return _localizedValues[locale.languageCode]['loginInputUsernamePlaceholder'];
  }

  get loginInputPassword {
    return _localizedValues[locale.languageCode]['loginInputPassword'];
  }

  get loginInputPasswordPlaceholder {
    return _localizedValues[locale.languageCode]['loginInputPasswordPlaceholder'];
  }
}
