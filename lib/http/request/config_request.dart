import 'package:flutter_demo/http/request/base_request.dart';

class ConfigRequest extends BaseRequest {
  @override
  HttpMethod httpMethod() {
    return HttpMethod.GET;
  }

  @override
  bool needLogin() {
    return false;
  }

  @override
  String path() {
    return "/merchant-business/merchant-config/findConfig";
  }
}
