import 'package:ecommerce_app/core/AppConst.dart';
import 'package:ecommerce_app/features/my_orders/order_details_Complete_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'core/resources_manager/shared_styles/colors.dart';
import 'core/resources_manager/text_style.dart';
import 'features/my_orders/my_order_view.dart';
import 'features/my_orders/order_details_views.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConst.appName,
      theme: ThemeData(
        appBarTheme:  AppBarTheme(
          centerTitle: true,
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: AppColors.white,
          titleTextStyle:AppTextStyles.appBar,
        ),
        scaffoldBackgroundColor: AppColors.scaffoldColor,
      ),
      home: Start(),
    );
  }
}

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyOrderView();
  }
}
