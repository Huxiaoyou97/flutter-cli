import 'package:flutter/material.dart';
import 'package:flutter_demo/navigator/hi_navigator.dart';
import 'package:flutter_demo/provider/count_provider.dart';
import 'package:flutter_demo/provider/hi_provider.dart';
import 'package:flutter_demo/util/view_util.dart';
import 'package:flutter_demo/widget/loading_container.dart';
import 'package:flutter_demo/widget/navigation_bar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin, WidgetsBindingObserver {
  var listener;

  bool _isLoading = false;

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
          _buildContent(context),
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

  _buildContent(BuildContext context) {
    return MultiProvider(
      providers: hiProviders,
      child: Consumer<CountProvider>(
        builder: (
          BuildContext context,
          CountProvider countProvider,
          Widget child,
        ) {
          return Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const HomeCount(),
                ElevatedButton(
                  onPressed: countProvider.increment,
                  child: const Text("+1"),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.orange),
                    // textStyle: MaterialStateProperty.all(
                    //   const TextStyle(fontSize: 18, color: Colors.red),
                    // ),
                    //设置按钮上字体与图标的颜色
                    // foregroundColor: MaterialStateProperty.all(Colors.white),

                    //更优美的方式来设置
                    foregroundColor: MaterialStateProperty.resolveWith(
                      (states) {
                        if (states.contains(MaterialState.focused) &&
                            !states.contains(MaterialState.pressed)) {
                          //获取焦点时的颜色
                          return Colors.blue;
                        } else if (states.contains(MaterialState.pressed)) {
                          //按下时的颜色
                          return Colors.deepPurple;
                        }
                        //默认状态使用灰色
                        return Colors.white;
                      },
                    ),
                  ),
                )
              ],
            ),
          );
        },

      ),
    );
  }
}

class HomeCount extends StatelessWidget {
  const HomeCount({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '${context.watch<CountProvider>().count}',
      style: Theme.of(context).textTheme.headline2,
    );
  }
}
