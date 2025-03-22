import 'package:flutter/material.dart';

import '../../../core/localization/en.dart';
import '../../../core/resources_manager/constant/images/images.dart';
import '../../../core/resources_manager/shared_styles/colors.dart';
import '../../../core/resources_manager/text_style.dart';

Widget defaultCategoryOrder() {
  return
    Container(
    padding: const EdgeInsetsDirectional.only(
      start: 10,
      top: 20,
      bottom: 10,
      end: 10,
    ),
    margin: const EdgeInsetsDirectional.only(bottom:23 ) ,
    width: 350,
    height: 200,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(6),
      color: AppColors.white,
      boxShadow: [
        BoxShadow(
          color: AppColors.black.withOpacity(0.25),
          offset: Offset(0, -4),
          blurRadius: 9,
          spreadRadius: -7,
        ),
        BoxShadow(
          color: AppColors.black.withOpacity(0.25),
          offset: Offset(0, 6),
          blurRadius: 14,
          spreadRadius: -8,
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 8,
          children: [
            Image.asset(
              AppImages.categoryOrderAnother,
              width: 130,
              height: 125,
              fit: BoxFit.fill,
            ),
            Column(
              spacing: 14,
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "Women’s Casual Wear",
                    style:AppTextStyles.nameCategory
                ),
                Row(
                  children: [
                    Text(
                      "4.8",
                      style: AppTextStyles.rateOrItemOrTitleOeder,
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.star,
                      color: AppColors.amberColor,
                      size: 20,
                    ),
                  ],
                ),
                Text(
                  "1 ${AppTextEn.item}",
                  style: AppTextStyles.rateOrItemOrTitleOeder,
                ),
                Row(
                  spacing: 120,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$ 34.00",
                      style: AppTextStyles.price,
                    ),
                    Text(
                      "\$ 55.00",
                      textAlign: TextAlign.end,
                      overflow: TextOverflow.ellipsis,
                      textDirection: TextDirection.ltr,
                      style: AppTextStyles.priceOffer,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        Divider(color: AppColors.dividerColor, thickness: 1),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${AppTextEn.totalOrder} (1)   :",
              style: AppTextStyles.rateOrItemOrTitleOeder,
            ),
            Text(
              "\$ 34.00",
              style: AppTextStyles.priceFinal,
            ),
          ],
        ),
      ],
    ),
  );
}