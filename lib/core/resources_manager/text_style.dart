import 'package:ecommerce_app/core/resources_manager/shared_styles/colors.dart';
import 'package:flutter/material.dart';

import '../AppConst.dart';

abstract class AppTextStyles {
  static  TextStyle appBar =  TextStyle(
    color: AppColors.black,
    fontFamily: AppConst.fontFamilyMont,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  static  TextStyle numberOrderDetails = TextStyle(
    fontFamily: AppConst.fontFamilyMont,
    color: AppColors.textBlackColorOrder,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );
  static  TextStyle orderDetails = TextStyle(
    fontFamily: AppConst.fontFamilyMont,
    color: AppColors.containColCateSelect,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );
  static  TextStyle orderTime =TextStyle(
    fontFamily: AppConst.fontFamilyMont,
    color: AppColors.textBlackColorOrder,
    fontSize: 14,
    fontWeight: FontWeight.w300,
  );
  static  TextStyle nameCategory =TextStyle(
    fontFamily: AppConst.fontFamilyMont,
    color: AppColors.black,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
  static  TextStyle rateOrItemOrTitleOeder =TextStyle(
    fontFamily: AppConst.fontFamilyMont,
    color: AppColors.black,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
  static  TextStyle price =TextStyle(
    color: AppColors.black,
    fontFamily: AppConst.fontFamilyMont,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static  TextStyle priceRedColor =TextStyle(
    color: AppColors.containColCateSelect,
    fontFamily: AppConst.fontFamilyMont,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static  TextStyle priceFinal =TextStyle(
    fontFamily: AppConst.fontFamilyMont,
    color: AppColors.black,
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );
  static  TextStyle priceOffer =TextStyle(
    fontFamily: AppConst.fontFamilyMont,
    color: AppColors.offerColor,
    fontSize: 12,
    decoration: TextDecoration.lineThrough,
    decorationColor: AppColors.textBlackColorOrder,
    fontWeight: FontWeight.w500,
  );
  static  TextStyle subTitleOrder =TextStyle(
    fontFamily: AppConst.fontFamilyMont,
    color: AppColors.black,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static  TextStyle finalOrder =TextStyle(
    fontFamily: AppConst.fontFamilyMont,
    color: AppColors.black,
    fontSize: 17,
    fontWeight: FontWeight.w600,
  );
  static  TextStyle elevatedButton =TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    fontFamily: AppConst.fontFamilyLeague,
    color: Colors.white,
  );
  static  TextStyle graphOreder =TextStyle(
    fontFamily: AppConst.fontFamilyLeague,
    color: AppColors.containColCateSelect,
    fontSize: 30,
    fontWeight: FontWeight.w500,
  );
  static  TextStyle cancelOrDelevery =TextStyle(
    fontFamily: AppConst.fontFamilyLeague,
    color: AppColors.containColCateSelect,
    fontSize: 14,
    fontWeight: FontWeight.w300,
  );

}