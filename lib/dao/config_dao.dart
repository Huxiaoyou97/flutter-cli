

import 'package:flutter_demo/http/core/hi_net.dart';
import 'package:flutter_demo/http/request/config_request.dart';
import 'package:flutter_demo/model/config_model.dart';
import 'package:flutter_demo/provider/config_provider.dart';

class ConfigDao {
  static Future<void> get(ConfigProvider configProvider) async {
    ConfigRequest request = ConfigRequest();

    var result = await HiNet.getInstance().fire(request);

    if (result["code"] == 0 && result["data"] != null) {
      ConfigModel configModel = ConfigModel.fromJson(result["data"]);
      configProvider.setConfig(configModel);
    }
  }
}
