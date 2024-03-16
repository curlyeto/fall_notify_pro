import 'package:fall_notify_pro/constant.dart';
import 'package:fall_notify_pro/pages/bottomNavigation/home/homepage.dart';
import 'package:fall_notify_pro/pages/bottomNavigation/profile/profilepage.dart';
import 'package:fall_notify_pro/pages/bottomNavigation/records/records.dart';
import 'package:fall_notify_pro/pages/deviceUser/homePageHasDevice.dart';
import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AppNavigationPage extends StatefulWidget {
  const AppNavigationPage({Key? key}) : super(key: key);

  @override
  State<AppNavigationPage> createState() => _BattomNavigationBarState();
}

class _BattomNavigationBarState extends State<AppNavigationPage> {
  PageController controller = PageController(initialPage: 0);
  var selected = 0;
  bool? hasDevice=false;
  List<Widget> pagesHasDevice=[
    HomePageHasDevice(),
    ProfilePage(),
  ];
  List<Widget> pagesHasNoDevice=[
    HomePage(),
    RecordsPage(),
    ProfilePage(),
  ];
  List<BottomBarItem> bottomBarItemHasDevice=[
    BottomBarItem(
      icon: const Icon(Icons.home),
      title: const Text('Home',style: TextStyle(color: Colors.white),),
      backgroundColor: AppColor.appColor!,

      // badge: const Badge(),
      // showBadge: true,
    ),
    BottomBarItem(
      icon: const Icon(Icons.person),
      title: const Text('Profile',style: TextStyle(color: Colors.white),),
      backgroundColor: AppColor.appColor!,
    ),
  ];
  List<BottomBarItem> bottomBarItemHasNoDevice=[
    BottomBarItem(
      icon: const Icon(Icons.home),
      title: const Text('Home',style: TextStyle(color: Colors.white),),
      backgroundColor: AppColor.appColor!,
      // badge: const Badge(),
      // showBadge: true,
    ),
    BottomBarItem(
      icon: const Icon(Icons.list),
      title: const Text('Records',style: TextStyle(color: Colors.white),),
      backgroundColor: AppColor.appColor!,
    ),
    BottomBarItem(
      icon: const Icon(Icons.person),
      title: const Text('Profile',style: TextStyle(color: Colors.white),),
      backgroundColor: AppColor.appColor!,
    ),
  ];
  Future<void> getUserType()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    hasDevice= prefs.getBool("hasDevice");
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserType();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: hasDevice! ? pagesHasDevice: pagesHasNoDevice,
      ),
      bottomNavigationBar: StylishBottomBar(
        option: BubbleBarOptions(
          // barStyle: BubbleBarStyle.vertical,
          barStyle: BubbleBarStyle.horizotnal,
          bubbleFillStyle: BubbleFillStyle.fill,
          // bubbleFillStyle: BubbleFillStyle.outlined,
          opacity: 0.3,
        ),
        items: hasDevice! ? bottomBarItemHasDevice: bottomBarItemHasNoDevice,
        // fabLocation: StylishBarFabLocation.end,
        // hasNotch: true,
        currentIndex: selected,
        backgroundColor: Colors.grey.shade300,
        onTap: (index) {
          setState(() {
            selected = index;
            controller.jumpToPage(index);
          });
        },
      ),
    );
  }
}
