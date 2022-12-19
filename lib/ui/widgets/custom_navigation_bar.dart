import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../utils/colors.dart';

late PersistentTabController navBarController;

class BaseNavBar extends StatefulWidget {
  const BaseNavBar({Key? key}) : super(key: key);

  @override
  State<BaseNavBar> createState() => _BaseNavBarState();
}

class _BaseNavBarState extends State<BaseNavBar> {
  List<Widget> _buildScreens() {
    return [
      // Home(),
      // Search(),
      // addAuction(),
      // trending(),
      // profile(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(''),
        inactiveIcon: SvgPicture.asset(''),
        title: ("Home"),
        activeColorPrimary: MyColors.primary,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(''),
        inactiveIcon: SvgPicture.asset(''),
        title: ("Search"),
        activeColorPrimary: MyColors.primary,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),

      ///TODO: make sure
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(''),
        inactiveIcon: SvgPicture.asset(''),
        title: ("Add Auction"),
        activeColorPrimary: MyColors.primary,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(''),
        inactiveIcon: SvgPicture.asset(''),
        title: ("Trending"),
        activeColorPrimary: MyColors.primary,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(''),
        inactiveIcon: SvgPicture.asset(''),
        title: ("Profile"),
        activeColorPrimary: MyColors.primary,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  @override
  void initState() {
    navBarController = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: navBarController,
      screens: _buildScreens(),
      onItemSelected: (value) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      items: _navBarsItems(),
      confineInSafeArea: true,
      decoration: const NavBarDecoration(
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style12,
    );
  }
}
