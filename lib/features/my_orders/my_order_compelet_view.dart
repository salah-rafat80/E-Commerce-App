import 'package:ecommerce_app/core/localization/en.dart';
import 'package:ecommerce_app/core/resources_manager/shared_styles/colors.dart';
import 'package:ecommerce_app/core/resources_manager/shared_styles/icons.dart';
import 'package:ecommerce_app/features/my_orders/widget/category_select_widget.dart';
import 'package:ecommerce_app/features/my_orders/widget/default_app_bar.dart';
import 'package:ecommerce_app/features/my_orders/widget/default_info_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyOrdersComplView extends StatelessWidget {
  const MyOrdersComplView({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isComplete = true;
    return SafeArea(
      child: Scaffold(
        appBar: defaultAppBar(context, title: AppTextEn.myOrders),
        body: Column(
          children: [
            categorySelectWidget(context, isCompleted: isComplete),
            SizedBox(height: 44),
            Expanded(
              child: ListView(
                children: [
                  DefaultInfoOrder(isCompleted: isComplete,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
