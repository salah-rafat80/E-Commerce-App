import 'package:flutter/material.dart';
import '../../../core/localization/en.dart';
import '../../../core/resources_manager/constant/images/images.dart';
import '../../../core/resources_manager/shared_styles/colors.dart';
import '../../../core/resources_manager/text_style.dart';
import 'default_category_order.dart';

Widget defaultPageOrder({required BuildContext context, required String satuesTitle}) {
  return  Column(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${AppTextEn.numberOrd} 005",
                style: AppTextStyles.numberOrderDetails,
              ),
              Text(
                satuesTitle,
                style: AppTextStyles.orderDetails,
              ),
            ],
          ),
          Text(
            "29 Nov, 01:20 pm ",
            style: AppTextStyles.orderTime,
          ),
        ],
      ),
      SizedBox(height: 20),
      SizedBox(
        height: 450,
        child: ListView(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            defaultCategoryOrder(),
          ],
        ),
      ),
      SizedBox(height: 15),
      Column(
        spacing: 12,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppTextEn.subtotal,
                style: AppTextStyles.subTitleOrder,
              ),
              Text(
                  "\$ 79.00",
                  style: AppTextStyles.price
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  AppTextEn.taxAndFeeds,
                  style: AppTextStyles.subTitleOrder
              ),
              Text(
                  "\$ 79.00",
                  style: AppTextStyles.price
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppTextEn.deliveryFee,
                style: AppTextStyles.subTitleOrder,
              ),
              Text(
                "\$ 79.00",
                style:AppTextStyles.price,
              ),
            ],
          ),
        ],
      ),
      SizedBox(height: 16),
      Divider(color: AppColors.dividerColor, thickness: 1),
      SizedBox(height: 19),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
              AppTextEn.orderTotal,
              style: AppTextStyles.finalOrder
          ),
          Text(
              "\$ 84.00",
              style: AppTextStyles.priceRedColor
          ),
        ],
      ),
    ],
  );
}