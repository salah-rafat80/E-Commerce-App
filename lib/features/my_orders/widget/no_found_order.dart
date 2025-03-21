import 'package:ecommerce_app/core/AppConst.dart';
import 'package:ecommerce_app/core/localization/en.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/resources_manager/constant/images/images.dart';
import '../../../core/resources_manager/shared_styles/colors.dart';
import '../../../core/resources_manager/text_style.dart';

Widget noFoundOrder(BuildContext context) {
  return Column(
    children: [
      SizedBox(height: 130),
      Column(
        children: [
          SvgPicture.asset(AppImages.notFoundOrder, width: 140, height: 167),
          SizedBox(height: 40),
          SizedBox(
            width: 288,
            child: Text(
              AppTextEn.graphOreder,
              textAlign: TextAlign.center,
              style: AppTextStyles.graphOreder,
            ),
          ),
        ],
      ),
    ],
  );
}
