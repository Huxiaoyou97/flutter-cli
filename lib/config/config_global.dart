
import 'config_url.dart';

/// 环境
enum ENV {dev, test, beta, product}

class Global {
  /// 测试服域名列表
  static final List<String> TEST_DOMAINS = [
    'api.devio.org',
  ];

  /// 正式服域名列表
  static final List<String> PRODUCT_DOMAINS = [
    'api.devio.org',
  ];

  /// 环境配置
  static ENV env = ENV.dev;

  ///
  /// API请求地址
  ///
  static String getApiUrl({List<String> domains, int index}) {
    switch (env) {
      case ENV.dev:
        return ApiUrlConfig.API_DEV_URL;
      case ENV.test:
        return ApiUrlConfig.API_TEST_URL;
      case ENV.beta:
        return ApiUrlConfig.API_BETA_URL;
      case ENV.product:
        return ApiUrlConfig.API_PRODUCT_URL;
    }
    return ApiUrlConfig.API_PRODUCT_URL;
  }
}
