import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../HomePage.dart';
import 'SecondPage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<IndexController>(
            create: (context) => IndexController(),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: BottomTabScreen(),
        ),
    );
  }
}

class IndexController with ChangeNotifier {
  bool viewing = true;

  void setIndex(bool i) {
    print(viewing);
    print("ð");
    viewing = i;
    notifyListeners();
  }
}

class BottomTabScreen extends StatefulWidget {
  @override
  _BottomTabScreenState createState() => _BottomTabScreenState();
}

class _BottomTabScreenState extends State<BottomTabScreen> {
  final List<GlobalKey<NavigatorState>> _tabNavKeyList =
      List.generate(5, (index) => index)
          .map((e) => GlobalKey<NavigatorState>())
          .toList();

  final CupertinoTabController _controller = CupertinoTabController();
  int _oldIndex = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final IndexController provider =
        Provider.of<IndexController>(context, listen: true);
    return ChangeNotifierProvider<IndexController>(
      create: (_) => IndexController(),
      child: provider.viewing
          ? CupertinoTabScaffold(
              controller: _controller,
              tabBar: CupertinoTabBar(
                backgroundColor: Colors.white,
                onTap: (index) => _onTapItem(index),
                items: const <BottomNavigationBarItem>[
                  // ホーム
                  BottomNavigationBarItem(
                    icon: Icon(Icons.favorite),
                  ),
                  // お気に入り
                  BottomNavigationBarItem(
                    icon: Icon(Icons.access_time_filled_sharp),
                  ),
                ],
              ),
              tabBuilder: (BuildContext context, int index) {
                return CupertinoTabView(
                  navigatorKey: _tabNavKeyList[index],
                  builder: (BuildContext context) {
                    switch (index) {
                      case 0:
                        // ホーム
                        return const MyHomePage();
                      case 1:
                        // お気に入り
                        return const MySecondPage();
                    }
                    // error
                    print('ああああああ');
                    return Container();
                  },
                );
              },
            )
          : Scaffold(),
    );
  }

  void _onTapItem(int index) {
    print('_onTapItem index $index');
    print('oldIndex $_oldIndex');

    // _home = 'unselected';
    // _favorite = 'unselected';
    // _barcode_scan = 'unselected';
    // _member = 'unselected';
    // _news = 'unselected';
    //
    // switch (index) {
    //   case 0:
    //   // ホーム
    //     setState(() {
    //       _home = 'selected';
    //     });
    //     break;
    //   case 1:
    //   // お気に入り
    //     setState(() {
    //       _favorite = 'selected';
    //     });
    //     break;
    //   case 2:
    //   // バーコードスキャン
    //     setState(() {
    //       _barcode_scan = 'selected';
    //     });
    //     break;
    //   case 3:
    //   // お知らせ
    //     setState(() {
    //       _news = 'selected';
    //     });
    //     break;
    //   case 4:
    //   // 会員証
    //     setState(() {
    //       _member = 'selected';
    //     });
    //     break;
    // }

    if (index != _oldIndex) {
      _oldIndex = index;
      return;
    }
  }
}
