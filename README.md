# flutter 项目工程

## 目录介绍
    - lib/
    - config 项目配置文件（请求地址 环境...）
    - core 页面异常类
    - dao 网络请求dao层
    - db 项目功能基类封装（缓存管理类....）
    - http 网络请求封装层
        - core 
            - hi_net 底层http请求封装
            - dio 网络层adapter
            - hi_error 异常统一封装
            - hi_net_adapter 防止dio维护中断可以无缝切换至此adapter
        - request
            - base_request request 构造函数 基类
            - ...其余请求 继承至base 实现对应的方法即可
    - i18n 国际化
    - model 数据模型层 用于后端返回的数据对其json转模型
    - navigator 2.0版本导航器 对底部tabbar 以及其余页面的路由封装
    - page App页面
    - provider 状态管理 类似Vuex Redux
    - util 各工具类封装
    - widget 项目所用到的组件 对齐封装
    - main.dart 项目入口文件
    - router.dart 对路由单独抽离提取出来的页面路由文件

## 项目依赖版本
```
cupertino_icons: ^1.0.2
  fluttertoast: ^8.0.8
  cached_network_image: ^2.5.0
  intl: ^0.17.0
  url_launcher: ^6.0.6
  shared_preferences: ^2.0.9
  lottie: ^1.0.1
  dio: ^4.0.4
  provider: ^5.0.0
```

## 项目说明

**1. 已关闭空安全校验**
