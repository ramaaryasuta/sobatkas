import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:sobatkas/core/styles/colors.dart';
import 'package:sobatkas/features/home/presentation/screens/tab/home_tab.dart';

import 'tab/analytics_chat_tab.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PersistentTabController _tabController = PersistentTabController(
    initialIndex: 0,
  );

  List<Widget> _buildTabs() => const [
    HomeTabs(),
    SizedBox(), // for middle tab
    AnalyticsChatTabs(),
  ];

  List<PersistentBottomNavBarItem> _navBarItems() => [
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.home),
      title: "Beranda",
      activeColorPrimary: MyColors.primaryColor,
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      iconSize: 28,
      icon: const Icon(Icons.add, color: Colors.white),
      activeColorPrimary: MyColors.primaryColor,
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.analytics_outlined),
      title: "Analisis",
      activeColorPrimary: MyColors.primaryColor,
      inactiveColorPrimary: Colors.grey,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _tabController,
      onItemSelected: (value) {
        if (value == 1) {
          _tabController.jumpToTab(0);
        }
      },
      screens: _buildTabs(),
      items: _navBarItems(),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardAppears: true,
      padding: const EdgeInsets.only(top: 8),
      backgroundColor: Colors.white,
      isVisible: true,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          animateTabTransition: true,
          duration: Duration(milliseconds: 200),
          screenTransitionAnimationType: ScreenTransitionAnimationType.slide,
        ),
      ),
      confineToSafeArea: true,
      navBarHeight: kBottomNavigationBarHeight,
      navBarStyle: NavBarStyle.style15,
    );
  }
}
