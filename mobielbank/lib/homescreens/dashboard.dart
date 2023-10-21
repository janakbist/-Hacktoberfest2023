import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobielbank/homescreens/homescreen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BankingDashboard extends StatefulWidget {
  const BankingDashboard({super.key});

  @override
  State<BankingDashboard> createState() => _BankingDashboard();
}

class _BankingDashboard extends State<BankingDashboard> {
late final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const HomeScreen(),
      const HomeScreen(),
      const HomeScreen(),
      const HomeScreen(),

    ];
}
List<PersistentBottomNavBarItem> _navBarsItems() {
        return [
            PersistentBottomNavBarItem(
                icon: const Icon(CupertinoIcons.home),
                title: ("Home"),
                activeColorPrimary: CupertinoColors.activeBlue,
                inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
            PersistentBottomNavBarItem(
                icon: const Icon(Icons.currency_rupee_outlined),
                title: ("Payments"),
                activeColorPrimary: CupertinoColors.activeBlue,
                inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
            PersistentBottomNavBarItem(
                iconSize: 30,
                icon: const Icon(Icons.qr_code_2,color:Colors.white,),
                activeColorPrimary: CupertinoColors.activeBlue,
                inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
            PersistentBottomNavBarItem(
                icon: const Icon(Icons.payment_rounded),
                title: ("Send Money"),
                activeColorPrimary: CupertinoColors.activeBlue,
                inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
            PersistentBottomNavBarItem(
                icon: const Icon(Icons.more_horiz_rounded),
                title: ("More"),
                activeColorPrimary: CupertinoColors.activeBlue,
                inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
        ];
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        // screenTransitionAnimation: const ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
        //   animateTabTransition: true,
        //   curve: Curves.ease,
        //   duration: Duration(milliseconds: 200),
        // ),
        navBarStyle: NavBarStyle.style15, // Choose the nav bar style with this property.
    ),
    );
  }
}