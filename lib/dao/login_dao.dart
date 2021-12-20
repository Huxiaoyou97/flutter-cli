import 'package:flutter_demo/db/hi_cache.dart';
import 'package:flutter_demo/http/core/hi_net.dart';
import 'package:flutter_demo/http/request/base_request.dart';

class LoginDao {
  static const BOARDING_PASS = "boarding-pass";

  static _send(String username, password) async {
    BaseRequest request;

    request.add("username", username).add("password", password);
    var result = await HiNet.getInstance().fire(request);
    if (result["code"] == 0 && result["data"] != null) {
      // 保存登录令牌
      HiCache.getInstance().setString(BOARDING_PASS, result["data"]);
    }
    return result;
  }

  static getBoardingPass() {
    return HiCache.getInstance().get(BOARDING_PASS);
  }
}
