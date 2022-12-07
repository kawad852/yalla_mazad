// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
//
// bool isHidden = false;
//
// late PersistentTabController navBarController;
//
// class BaseNavBar extends StatefulWidget {
//   const BaseNavBar({Key? key}) : super(key: key);
//
//   @override
//   State<BaseNavBar> createState() => BaseNavBarState();
// }
//
// class BaseNavBarState extends State<BaseNavBar> {
//   void toggleGuestUser(int index) {
//     if (GuestUserHelper.check(Get.currentRoute, context)) {
//       navBarController.index = index;
//     }
//   }
//
//   List<Widget> _buildScreens() {
//     return [
//       const HomeScreen(),
//       const MyOrdersScreen(),
//       const HelpScreen(),
//       const ProfileScreen(),
//     ];
//   }
//
//   List<PersistentBottomNavBarItem> _navBarsItems() {
//     return [
//       PersistentBottomNavBarItem(
//         icon: CustomNavBaaButton(icon: MyIcons.home, isChosen: navBarController.index == 0 ? true : false),
//       ),
//       PersistentBottomNavBarItem(
//         onPressed: (value) {
//           // if (!Get.isRegistered<MyOrdersCtrl>()) {
//           //   Get.put(MyOrdersCtrl());
//           // }
//           // MyOrdersCtrl.find.pagingController.refresh();
//           // toggleGuestUser(1);
//         },
//         icon: CustomNavBaaButton(icon: MyIcons.timePast, isChosen: navBarController.index == 1 ? true : false),
//       ),
//       PersistentBottomNavBarItem(
//         onPressed: (value) {
//           toggleGuestUser(2);
//         },
//         icon: CustomNavBaaButton(icon: MyIcons.headset, isChosen: navBarController.index == 2 ? true : false),
//       ),
//       PersistentBottomNavBarItem(
//         onPressed: (value) {
//           toggleGuestUser(3);
//         },
//         icon: CustomNavBaaButton(icon: MyIcons.user, isChosen: navBarController.index == 3 ? true : false),
//       ),
//     ];
//   }
//
//   @override
//   void initState() {
//     navBarController = PersistentTabController(initialIndex: 0);
//     navBarController.addListener(() {
//       setState(() {});
//     });
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<NavBarCtrl>(builder: (controller) {
//       return PersistentTabView(
//         context,
//         controller: navBarController,
//         screens: _buildScreens(),
//         items: _navBarsItems(),
//         hideNavigationBar: false,
//         confineInSafeArea: true,
//         navBarHeight: controller.isHidden.value ? 0 : 70,
//         backgroundColor: MyColors.primary, // Default is Colors.white.
//         handleAndroidBackButtonPress: true, // Default is true.
//         resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
//         stateManagement: true, // Default is true.
//         hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
//         decoration: const NavBarDecoration(
//           colorBehindNavBar: Colors.white,
//         ),
//         popAllScreensOnTapOfSelectedTab: true,
//         popActionScreens: PopActionScreensType.all,
//         itemAnimationProperties: const ItemAnimationProperties(
//           // Navigation Bar's items animation properties.
//           duration: Duration(milliseconds: 200),
//           curve: Curves.ease,
//         ),
//         screenTransitionAnimation: const ScreenTransitionAnimation(
//           // Screen transition animation on change of selected tab.
//           animateTabTransition: true,
//           curve: Curves.ease,
//           duration: Duration(milliseconds: 200),
//         ),
//         navBarStyle: NavBarStyle.style6, // Choose the nav bar style with this property.
//       );
//     });
//   }
// }
