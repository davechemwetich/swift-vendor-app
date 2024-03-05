// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swiftvend/common/custom_appbar.dart';
import 'package:swiftvend/common/custom_container.dart';
import 'package:swiftvend/common/heading.dart';
import 'package:swiftvend/constants/constants.dart';
import 'package:swiftvend/views/home/all_nearby.dart';
import 'package:swiftvend/views/home/fast_food.dart';
import 'package:swiftvend/views/home/recomend_page.dart';
import 'package:swiftvend/views/home/widgets/category_list.dart';
import 'package:get/get.dart';
import 'package:swiftvend/views/home/widgets/food_list.dart';
import 'package:swiftvend/views/home/widgets/nearby_reast.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(130.h), child: const CustomAppBar()),
      body: SafeArea(
        child: CustomContainer(
          containerContent: Column(
            children: [
              const CategoryList(),
              Heading(
                text: "Nearby Restaurants",
                onTap: () {
                  Get.to(() => const AllNearbyRestaurants(),
                      transition: Transition.cupertino,
                      duration: const Duration(milliseconds: 900));
                },
              ),
              const NearbyRestaurants(),
              Heading(
                text: "Try Something New",
                onTap: () {
                  Get.to(() => const RecommendationsPage(),
                      transition: Transition.cupertino,
                      duration: const Duration(milliseconds: 900));
                },
              ),
              const FoodsList(),
              Heading(
                text: "Food closer to you",
                onTap: () {
                  Get.to(() => const AllFastestFoods(),
                      transition: Transition.cupertino,
                      duration: const Duration(milliseconds: 900));
                },
              ),
              const FoodsList(),
            ],
          ),
        ),
      ),
    );
  }
}
