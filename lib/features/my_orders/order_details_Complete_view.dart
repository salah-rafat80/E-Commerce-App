import 'package:ecommerce_app/core/localization/en.dart';
import 'package:ecommerce_app/features/my_orders/widget/default_app_bar.dart';
import 'package:flutter/material.dart';

import '../../core/resources_manager/shared_styles/images.dart';
import '../../core/resources_manager/shared_styles/colors.dart';
import 'resource/text_style.dart';

class OrderDetailsCompleteView extends StatelessWidget {
  const OrderDetailsCompleteView({super.key});
  //complete
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context, title: AppTextEn.orderDetails),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.only(
            end: 22,
            start: 22,
            top: 30,
            bottom: 13,
          ),
          child: Column(
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
                        AppTextEn.complete,
                        style: AppTextStyles.orderDetails,
                      ),
                    ],
                  ),
                  Text("29 Nov, 01:20 pm ", style: AppTextStyles.orderTime),
                ],
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 450,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    Container(
                      padding: const EdgeInsetsDirectional.only(
                        start: 10,
                        top: 20,
                        bottom: 10,
                        end: 10,
                      ),
                      margin: const EdgeInsetsDirectional.only(bottom: 23),
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
                                    style: AppTextStyles.nameCategory,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "4.8",
                                        style:
                                            AppTextStyles
                                                .rateOrItemOrTitleOeder,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                              Text("\$ 34.00", style: AppTextStyles.priceFinal),
                            ],
                          ),
                        ],
                      ),
                    ),
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
                      Text("\$ 79.00", style: AppTextStyles.price),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppTextEn.taxAndFeeds,
                        style: AppTextStyles.subTitleOrder,
                      ),
                      Text("\$ 79.00", style: AppTextStyles.price),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppTextEn.deliveryFee,
                        style: AppTextStyles.subTitleOrder,
                      ),
                      Text("\$ 79.00", style: AppTextStyles.price),
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
                  Text(AppTextEn.orderTotal, style: AppTextStyles.finalOrder),
                  Text("\$ 84.00", style: AppTextStyles.priceRedColor),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
