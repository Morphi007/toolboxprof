import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:toolboxprof/components/AgePredictionComponent.dart';
import 'package:toolboxprof/components/Porfolio.dart';
import 'package:toolboxprof/components/WordpressComponent.dart';
import 'package:toolboxprof/screens/PredicionDeGeneroScreen.dart';
import 'package:toolboxprof/screens/WeatherScreen.dart';

class MenuPrincipalScreen extends StatefulWidget {
  @override
  _MenuPrincipalScreenState createState() => _MenuPrincipalScreenState();
}

class _MenuPrincipalScreenState extends State<MenuPrincipalScreen> {
  int _currentIndex = 0;

  List<Widget> _tabScreens = [
    PrediccionDeGeneroScreen(),
    AgePredictionComponent(),
    WeatherScreen(),
    WordPressNews(),
    PorfolioComponent()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Principal'),
      ),
      body: _tabScreens[_currentIndex],
      bottomNavigationBar: PersistentTabView(
        context,
        controller: PersistentTabController(initialIndex: _currentIndex),
        screens: _tabScreens,
        items: [
          PersistentBottomNavBarItem(
            icon: Icon(Feather.home),
            title: 'Predicción',
            activeColorPrimary: Colors.blue,
            inactiveColorPrimary: Colors.grey,
          ),
          PersistentBottomNavBarItem(
            icon: Icon(Feather.settings),
            title: 'Edad',
            activeColorPrimary: Colors.blue,
            inactiveColorPrimary: Colors.grey,
          ),
          PersistentBottomNavBarItem(
            icon: Icon(Feather.calendar),
            title: 'Clima',
            activeColorPrimary: Colors.blue,
            inactiveColorPrimary: Colors.grey,
          ),
          PersistentBottomNavBarItem(
            icon: Icon(Feather.info),
            title: 'Noticias',
            activeColorPrimary: Colors.blue,
            inactiveColorPrimary: Colors.grey,
          ),
          PersistentBottomNavBarItem(
            icon: Icon(Feather.phone),
            title: 'Contratame',
            activeColorPrimary: Colors.blue,
            inactiveColorPrimary: Colors.grey,
          ),
        ],
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
        margin: EdgeInsets.all(10.0),
        padding: NavBarPadding.symmetric(horizontal: 10), // Añade el padding aquí
        popActionScreens: PopActionScreensType.once,
        bottomScreenMargin: 10,
        hideNavigationBar: false,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        itemAnimationProperties: ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.easeInOut,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style6,
      ),
    );
  }
}

class TabScreen extends StatelessWidget {
  final String title;
  final String message;

  const TabScreen({Key? key, required this.title, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Text(message, style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
