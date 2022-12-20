import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:yalla_mazad/ui/screens/add_auction/screens/add_auction_screen.dart';
import 'package:yalla_mazad/ui/screens/home/home/screens/home_screen.dart';
import 'package:yalla_mazad/ui/screens/home/trending/screens/trending_auction_screen.dart';
import 'package:yalla_mazad/ui/screens/profile/screens/edit_profile_screen.dart';
import 'package:yalla_mazad/utils/images.dart';

import '../../utils/colors.dart';

late PersistentTabController navBarController;

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const TrendingAuctionScreen(),
      AddAuctionScreen(),
      const TrendingAuctionScreen(),
      const EditProfileScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          MyImages.navHome,
          color: MyColors.red,
        ),
        inactiveIcon: SvgPicture.asset(
          MyImages.navHome,
          color: Colors.white,
        ),
        title: ("Home"),
        activeColorPrimary: MyColors.primary,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          MyImages.navSearch,
          color: MyColors.red,
        ),
        inactiveIcon: SvgPicture.asset(
          MyImages.navSearch,
          color: Colors.white,
        ),
        title: ("Search"),
        activeColorPrimary: MyColors.primary,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),

      ///TODO: make sure
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          MyImages.navAdd,
          color: MyColors.red,
        ),
        inactiveIcon: SvgPicture.asset(
          MyImages.navAdd,
          color: Colors.white,
        ),
        title: ("Add Auction"),
        activeColorPrimary: MyColors.primary,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          MyImages.navBolt,
          color: MyColors.red,
        ),
        inactiveIcon: SvgPicture.asset(
          MyImages.navBolt,
          color: Colors.white,
        ),
        title: ("Trending"),
        activeColorPrimary: MyColors.primary,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          MyImages.navUser,
          color: MyColors.red,
        ),
        inactiveIcon: SvgPicture.asset(
          MyImages.navUser,
          color: Colors.white,
        ),
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
      margin: const EdgeInsets.only(bottom: 30, left: 10, right: 10),
      controller: navBarController,
      screens: _buildScreens(),
      onItemSelected: (value) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      items: _navBarsItems(),
      confineInSafeArea: false,
      resizeToAvoidBottomInset: true,
      decoration: const NavBarDecoration(
        colorBehindNavBar: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(25)),
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
      backgroundColor: MyColors.primary,
    );
  }
}
