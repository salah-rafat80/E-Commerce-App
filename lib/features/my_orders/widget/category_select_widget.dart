import 'package:ecommerce_app/core/localization/en.dart';
import 'package:flutter/material.dart';

import '../../../core/helper/navigatot_page.dart';
import '../../../core/resources_manager/shared_styles/colors.dart';
import '../my_order_cancel_view.dart';
import '../my_order_compelet_view.dart';
import '../my_order_active_view.dart';
import 'default_elevated_button_category.dart';

Widget categorySelectWidget(
  BuildContext context, {
  bool isActive = false,
  bool isCompleted = false,
  bool isCancelled = false,
}) {
  return Padding(
    padding: const EdgeInsetsDirectional.only(start: 26, end: 26, top: 40),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 6,
      children: [
        DefaultElevatedButton(
          title: AppTextEn.active,
          textColor:
              isActive ? AppColors.white : AppColors.containColCateSelect,
          onPressed: () {
            AppNavigatorPage.navigateToPage(context: context,route: MyOrdersActiveViews());

          },
          containerColor:
              isActive
                  ? AppColors.containColCateSelect
                  : AppColors.containColCateNonSelect,
        ),
        DefaultElevatedButton(
          title: AppTextEn.complete,
          textColor:
              isCompleted ? AppColors.white : AppColors.containColCateSelect,
          onPressed: () {
            AppNavigatorPage.navigateToPage(context: context,route: MyOrdersComplView());
          },
          containerColor:
              isCompleted
                  ? AppColors.containColCateSelect
                  : AppColors.containColCateNonSelect,
        ),
        DefaultElevatedButton(
          title: AppTextEn.cancel,
          textColor:
              isCancelled ? AppColors.white : AppColors.containColCateSelect,
          onPressed: () {
            AppNavigatorPage.navigateToPage(context: context, route: MyOrdersCancelView());
          },
          containerColor:
              isCancelled
                  ? AppColors.containColCateSelect
                  : AppColors.containColCateNonSelect,
        ),
      ],
    ),
  );
}
