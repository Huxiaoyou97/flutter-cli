
import 'package:flutter/cupertino.dart';
import 'package:flutter_demo/model/config_model.dart';

class ConfigProvider with ChangeNotifier {
  ConfigModel _config;
  bool loading = true;

  void setConfig(ConfigModel configModel) {
    _config = configModel;
    loading = false;
    print("=============cdn=====${_config.cdn} ===已通知");
    notifyListeners();
  }

  ConfigModel get getConfig => _config;
}
