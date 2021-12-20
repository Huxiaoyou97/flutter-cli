import 'package:flutter/material.dart';
import 'package:flutter_demo/navigator/hi_navigator.dart';
import 'package:flutter_demo/util/view_util.dart';
import 'package:flutter_demo/widget/loading_container.dart';
import 'package:flutter_demo/widget/navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin, WidgetsBindingObserver {
  var listener;

  bool _isLoading = true;

  Widget _currentPage;

  @override
  void initState() {
    super.initState();

    /// 监听生命周期变化
    WidgetsBinding.instance.addObserver(this);

    HiNavigator.getInstance().addListener(listener = (current, pre) {
      _currentPage = current.page;
      print("homePage:current---:${current.page}");
      print("homePage:pre---:${pre?.page}");

      if (widget == current.page || current.page is HomePage) {
        print("打开了首页, onResume");
      } else if (widget == pre?.page || pre?.page is HomePage) {
        print("首页被压后台, onPause");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LoadingContainer(
      cover: true,
      isLoading: _isLoading,
      child: Column(
        children: [
          _buildNavigationBar(),
        ],
      ),
    );
  }

  _buildNavigationBar() {
    return NavigatorBar(
      child: Container(
        alignment: Alignment.center,
        child: const Text(
          "首页",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        decoration: bottomBoxShadow(context),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
