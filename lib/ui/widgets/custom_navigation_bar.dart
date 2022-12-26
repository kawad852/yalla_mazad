import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:yalla_mazad/controller/home/home/home_controller.dart';
import 'package:yalla_mazad/ui/screens/add_auction/screens/add_auction_screen.dart';
import 'package:yalla_mazad/ui/screens/home/home/screens/home_screen.dart';
import 'package:yalla_mazad/ui/screens/home/search/search_screen.dart';
import 'package:yalla_mazad/ui/screens/home/trending/screens/trending_auction_screen.dart';
import 'package:yalla_mazad/utils/images.dart';

import '../../controller/home/custom_navigation_bar_controller.dart';
import '../../utils/colors.dart';
import '../screens/profile/screens/my_account/my_account_screen.dart';

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
      const SearchScreen(),
      const AddAuctionScreen(),
      const TrendingAuctionScreen(),
      const MyAccountScreen(),
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
    navBarController = CustomNavigationBarController.find.tabController;
    super.initState();
  }

  final controller = HomeController.find;

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      controller: controller.advancedDrawerController,
      backdropColor: MyColors.primary,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: Get.locale == const Locale('ar') ? true : false,
      disabledGestures: true,
      childDecoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.5),
            blurRadius: 0,
            spreadRadius: 30,
          ),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(25)),
      ),
      drawer: SafeArea(
        child: ListTileTheme(
          textColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 35,
                    height: 35,
                    padding: const EdgeInsets.only(
                      left: 3,
                      right: 3,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(
                        0xffD3CFDC,
                      ),
                      borderRadius: BorderRadius.circular(
                        7,
                      ),
                    ),
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          controller.advancedDrawerController.hideDrawer();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: MyColors.primary,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    'menu'.tr,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                ],
              ),
              Container(
                width: 128.0,
                height: 128.0,
                margin: const EdgeInsets.only(
                  top: 30.0,
                  bottom: 5.0,
                ),
                child: Image.asset(
                  'assets/images/logo.png',
                ),
              ),
              ListTile(
                visualDensity: const VisualDensity(vertical: -4),
                onTap: () {},
                title: Text(
                  'subscriptions'.tr,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              ListTile(
                visualDensity: const VisualDensity(vertical: -4),
                onTap: () {},
                title: Text(
                  'terms and conditions'.tr,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              ListTile(
                visualDensity: const VisualDensity(vertical: -4),
                onTap: () {},
                title: Text(
                  'privacy policy'.tr,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              ListTile(
                visualDensity: const VisualDensity(vertical: -4),
                onTap: () {},
                title: Text(
                  'call us'.tr,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              ListTile(
                visualDensity: const VisualDensity(vertical: -4),
                onTap: () {},
                title: Text(
                  'who we are'.tr,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      child: PersistentTabView(
        context,
        margin: const EdgeInsets.only(
          bottom: 30,
          left: 30,
          right: 30,
        ),
        navBarHeight: 67,
        controller: navBarController,
        screens: _buildScreens(),
        onItemSelected: (value) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        bottomScreenMargin: 0,
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
      ),
    );
  }
}
