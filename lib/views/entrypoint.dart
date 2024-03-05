// ignore_for_file: must_be_immutable, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:swiftvend/constants/constants.dart';
import 'package:swiftvend/controllers/tab_index_controller.dart';
import 'package:swiftvend/views/cart/cart_page.dart';
import 'package:swiftvend/views/home/home_page.dart';
import 'package:swiftvend/views/profile/profile_page.dart';
import 'package:swiftvend/views/search/search_page.dart';
import 'package:get/get.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  List<Widget> pageList = const [
    HomePage(),
    SearchPage(),
    SearchPage(),
    CartPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TabIndexController());
    return Obx(() => Scaffold(
          body: Stack(
            children: [
              pageList[controller.tabIndex],
              Align(
                alignment: Alignment.bottomCenter,
                child: Theme(
                    data: Theme.of(context).copyWith(canvasColor: kPrimary),
                    child: BottomNavigationBar(
                      showSelectedLabels: false,
                      showUnselectedLabels: false,
                      unselectedIconTheme:
                          const IconThemeData(color: Colors.black38),
                      selectedIconTheme: const IconThemeData(color: kSecondary),
                      onTap: (value) {
                        controller.setTabIndex = value;
                      },
                      currentIndex: controller.tabIndex,
                      items: [
                        BottomNavigationBarItem(
                            icon: controller.tabIndex == 0
                                ? const Icon(AntDesign.appstore1)
                                : const Icon(AntDesign.appstore_o),
                            label: 'Home'),
                        const BottomNavigationBarItem(
                            icon: Icon(Icons.search), label: 'Search'),
                        const BottomNavigationBarItem(
                            icon: Icon(Icons.apps_rounded), label: 'Search'),
                        const BottomNavigationBarItem(
                            icon: Badge(
                                label: Text('1'),
                                child: Icon(FontAwesome.opencart)),
                            label: 'Cart'),
                        BottomNavigationBarItem(
                            icon: controller.tabIndex == 4
                                ? const Icon(FontAwesome.user_circle)
                                : const Icon(FontAwesome.user_circle_o),
                            label: 'Profile'),
                      ],
                    )),
              )
            ],
          ),
        ));
  }
}
