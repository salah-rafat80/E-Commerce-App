import 'package:ecommerce_app/features/my_orders/widget/category_select_widget.dart';
import 'package:ecommerce_app/features/my_orders/widget/default_app_bar.dart';
import 'package:ecommerce_app/features/my_orders/widget/default_info_order.dart';
import 'package:flutter/material.dart';

import '../../core/localization/en.dart';
class MyOrdersCancelView extends StatelessWidget {
  const MyOrdersCancelView({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isCancel = true;
    return SafeArea(
      child: Scaffold(
        appBar: defaultAppBar(context, title: AppTextEn.myOrders),
        body: Column(
          children: [
            categorySelectWidget(context, isCancelled: isCancel),
            SizedBox(height: 50),
            // noFoundOrder(context),
            Expanded(
              child: ListView(children: [DefaultInfoOrder(isCancel: isCancel)]),
            ),
          ],
        ),
      ),
    );
  }
}
