import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:blocktrade/all_sign_form/routs.dart';
import 'package:blocktrade/all_sign_form/splash/splash_screen.dart';
import 'package:blocktrade/all_sign_form/theme.dart';
import 'package:blocktrade/screen/GraphPage/graph_page.dart';
import 'package:blocktrade/screen/MorePage/more_page.dart';
import 'package:blocktrade/screen/order_history_page.dart';
import 'package:blocktrade/screen/order_page.dart';
import 'package:blocktrade/screen/portfolio_page.dart';
import 'package:blocktrade/store.dart';

import 'custom_AppBar.dart';
import 'drawer_page.dart';

void main() async {
  //setup your app to your use flutter engine
  //so that it can support easylocalization
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  //return the runnable application
  return runApp(
    EasyLocalization(
      //it's so important
      //we have to spacific path of .json clearly
      path: 'assets/languages',
      //what is the default language
      fallbackLocale: Locale('en', 'US'),
      supportedLocales: [
        //US Eng
        Locale('en', 'US'),
        //Thai Language
        Locale('th', "TH"),
        //Chinese Language
        Locale('zh', "CN"),
      ],
      child: ChangeNotifierProvider(
        //register function
        create: (context) => new Store(),
        //hold your app
        child: App(),
      ),
    ),
  );
  // runApp(MyApp());
} //ec

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //remove debug tag
      debugShowCheckedModeBanner: false,
      //include the easylocaization support here
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: theme(),
      initialRoute: SplashScreen.routeName,

      routes: routes,
    );
  } //ef
} //ec

class HomePage extends StatefulWidget {
  static String routeName = "/home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> tabs = [Tab1(), Tab2(), Tab3(), Tab4(), Tab5()];

  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Store store1 = Provider.of<Store>(context);
    return Scaffold(
      //appbar
      appBar: store1.activeTab == 0 & 3 & 4
          ? bar0
          : (store1.activeTab == 1
              ? bar1
              : (store1.activeTab == 2 ? bar2 : bar0)),
      //body
      body: tabs[store1.activeTab],
      bottomNavigationBar: Builder(
        builder: (context) {
          //we want to return the ButtomAppBar with a row
          return CurvedNavigationBar(
            key: _bottomNavigationKey,
            color: Color(0xFFDED7C4),
            backgroundColor: Colors.transparent,
            buttonBackgroundColor: Color(0xFF868F74),
            height: 60,
            items: <Widget>[
              Icon(
                Icons.person,
                size: 25,
                color: store1.activeTab == 0 ? Colors.white : Colors.black,
              ),
              Icon(
                Icons.auto_graph,
                size: 25,
                color: store1.activeTab == 1 ? Colors.white : Colors.black,
              ),
              Icon(
                Icons.add_circle,
                size: 25,
                color: store1.activeTab == 2 ? Colors.white : Colors.black,
              ),
              Icon(
                Icons.list,
                size: 25,
                color: store1.activeTab == 3 ? Colors.white : Colors.black,
              ),
              Icon(
                Icons.more_horiz,
                size: 25,
                color: store1.activeTab == 4 ? Colors.white : Colors.black,
              ),
            ],
            animationDuration: Duration(
              milliseconds: 200,
            ),
            index: store1.activeTab,
            animationCurve: Curves.bounceInOut,
            onTap: (int index) {
              tap(context, index, store1);
              debugPrint("Current index is $index");

              if (index == 0) {}
            },
          );
        },
      ),
      drawer: Drawerpage(),
    );
  }

  void tap(context, index, store1) {
    print(index);
    store1.setActiveTab(index);
  } //ef
}//ec


