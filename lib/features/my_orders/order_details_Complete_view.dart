import 'package:ecommerce_app/core/localization/en.dart';
import 'package:ecommerce_app/features/my_orders/widget/default_app_bar.dart';
import 'package:ecommerce_app/features/my_orders/widget/default_page_order.dart';
import 'package:flutter/material.dart';
class OrderDetailsCompleteView extends StatelessWidget {
  const OrderDetailsCompleteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:defaultAppBar(context, title: AppTextEn.orderDetails,),
      body: SafeArea(
        child:Padding(
          padding: const EdgeInsetsDirectional.only(
            end: 22,
            start: 22,
            top: 30,
            bottom: 13,
          ),
          child: defaultPageOrder(
            context: context, satuesTitle:
          AppTextEn.complete,),
        ),
      ),
    );
  }
}
