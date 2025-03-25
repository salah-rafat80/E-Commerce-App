import 'package:ecommerce_app/core/resources_manager/constant/images/images.dart';
import 'package:ecommerce_app/core/resources_manager/shared_styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../my_orders/my_order_view.dart';
List<BottomNavigationBarItem> bottomNavItems = [
  BottomNavigationBarItem(

    icon: SvgPicture.asset(AppIcons.home1, fit: BoxFit.fill),
    activeIcon: SvgPicture.asset(AppIcons.home2, fit: BoxFit.fill),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: SvgPicture.asset(AppIcons.cart1, fit: BoxFit.fill),
    activeIcon: SvgPicture.asset(AppIcons.cart2, fit: BoxFit.fill),
    label: 'Items',
  ),
  BottomNavigationBarItem(
    icon: SvgPicture.asset(AppIcons.profile, fit: BoxFit.fill),
    activeIcon: SvgPicture.asset(AppIcons.profile2, fit: BoxFit.fill),
    label: 'Profile',
  ),
];

class FloatingAction extends StatelessWidget {
  const FloatingAction({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 60,
      child: FloatingActionButton(
        shape: CircleBorder(
          side: BorderSide(color:AppColors.sizzlingRed),
          eccentricity: 0.5,
        ),
        onPressed: () {
          Get.to(MyOrderView());
        },
        backgroundColor: AppColors.sizzlingRed,
        child: Center(
          child: SizedBox(
            height: 27,
            width: 24,
            child:  SvgPicture.asset(AppIcons.combined, fit: BoxFit.cover)),

        ),
      ),
    );
  }
}