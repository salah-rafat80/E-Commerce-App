import 'package:ecommerce_app/core/localization/en.dart';
import 'package:ecommerce_app/core/resources_manager/text_style.dart';
import 'package:ecommerce_app/features/my_orders/my_order_compelet_view.dart';
import 'package:ecommerce_app/features/my_orders/widget/default_evel_butt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/helper/navigatot_page.dart';
import '../../../core/resources_manager/constant/images/images.dart';
import '../../../core/resources_manager/shared_styles/colors.dart';
import '../../../core/resources_manager/shared_styles/icons.dart';
import '../my_order_cancel_view.dart';
import '../order_details_views.dart';

class DefaultInfoOrder extends StatelessWidget {
  const DefaultInfoOrder({
    super.key,
    this.isActive = false,
    this.isCancel = false,
    this.isCompleted = false,
  });

  final bool isActive;

  final bool isCancel;

  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AppNavigatorPage.navigateToPage(context: context,route: OrderDetailsView()),
      child: Container(
        margin: const EdgeInsetsDirectional.only(start: 20,end: 20,bottom: 23),
        width: 350,
        height: 106,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.25),
              offset: Offset(0, 4),
              blurRadius: 4,
            ),
          ],
        ),
        child: Row(
          textDirection: TextDirection.ltr,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 106,
              width: 103,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.containColCateNonSelect,
              ),
              child: Image.asset(AppImages.categoryOrder),
            ),
            Padding(
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: 11,
                vertical: 13,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 235,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Mens Starry",
                          style: AppTextStyles.nameCategory,
                        ),
                        Text(
                          "\$ 50",
                          style: AppTextStyles.priceFinal
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 235,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "15/05/2005 1:30 pm",
                          style: AppTextStyles.orderTime
                        ),
                        Text(
                          "1 item",
                          style: AppTextStyles.rateOrItemOrTitleOeder
                        ),
                      ],
                    ),
                  ),
                  isActive
                      ? defaultInfoOrderActive(context)
                      : isCompleted
                      ? defaultInfoOrderComplet()
                      : defaultInfoOrderCancel(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget defaultInfoOrderActive(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Row(
        spacing: 7,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          defaultEvelButt(title: AppTextEn.cancel, onPress: (){
            AppNavigatorPage.navigateToPage(context: context,route: MyOrdersCancelView());

          },),
          defaultEvelButt(title: AppTextEn.trackDriver, onPress: (){
            AppNavigatorPage.navigateToPage(context: context,route: MyOrdersComplView());

          }),

        ],
      ),
    );
  }

  Widget defaultInfoOrderComplet() {
    return Row(
      spacing: 5,
      children: [
        SvgPicture.asset(
          width: 12,
          height: 12,
          fit: BoxFit.fill,
          AppIcons.iconCorrect,
        ),
        Text(
          AppTextEn.deleveryOrder,
          style:AppTextStyles.cancelOrDelevery,
        ),
      ],
    );
  }

  Widget defaultInfoOrderCancel() {
    return Row(
      spacing: 5,
      children: [
        SvgPicture.asset(
          width: 12,
          height: 12,
          fit: BoxFit.fill,
          AppIcons.iconCancel,
        ),
        Text(
          AppTextEn.orderCancel,
          style:AppTextStyles.cancelOrDelevery,
        ),
      ],
    );
  }
}
