import 'package:ecommerce_app/core/localization/en.dart';
import 'package:ecommerce_app/features/my_orders/widget/default_app_bar.dart';
import 'package:ecommerce_app/features/my_orders/widget/default_evel_butt.dart';
import 'package:flutter/material.dart';
import '../../core/helper/navigat_to.dart';
import '../../core/resources_manager/shared_styles/images.dart';
import '../../core/resources_manager/shared_styles/colors.dart';
import 'resource/text_style.dart';
import 'my_order_cancel_view.dart';
import 'order_details_Complete_view.dart';

//Active
class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context, title: AppTextEn.orderDetails),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
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
                              AppTextEn.active,
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(

                              width: MediaQuery.of(context).size.width*0.5,
                              height: MediaQuery.of(context).size.height*0.25,
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
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Image.asset(
                                          AppImages.categoryOrderAnother,
                                          width: 130,
                                          height: 125,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Column(
                                        spacing: 14,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                            style:
                                                AppTextStyles
                                                    .rateOrItemOrTitleOeder,
                                          ),
                                          Row(
                                            spacing: 100,
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
                                  Divider(
                                    color: AppColors.dividerColor,
                                    thickness: 1,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                        Text(
                          AppTextEn.orderTotal,
                          style: AppTextStyles.finalOrder,
                        ),
                        Text("\$ 84.00", style: AppTextStyles.priceRedColor),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.05,
                      width: MediaQuery.of(context).size.width*0.5,
                      child: ElevatedButton(
                        onPressed: (){
                          AppNavigatorPage.navigateToPage(
                            context: context,
                            route: MyOrdersCancelView(),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.containColCateSelect,
                        ),
                        child: Text(
                          textAlign: TextAlign.center,
                          AppTextEn.canceledOrder,
                          style: AppTextStyles.elevatedButton,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.05,
                      width: MediaQuery.of(context).size.width*0.4,
                      child: ElevatedButton(
                        onPressed: (){
                          AppNavigatorPage.navigateToPage(
                            context: context,
                            route: OrderDetailsCompleteView(),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.containColCateSelect,
                        ),
                        child: Text(
                          textAlign: TextAlign.center,
                          AppTextEn.trackDriver,
                          style: AppTextStyles.elevatedButton,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
