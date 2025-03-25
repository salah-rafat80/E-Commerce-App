import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/resources_manager/shared_styles/colors.dart';
import '../../../core/resources_manager/shared_styles/icons.dart';
import '../resource/text_style.dart';

AppBar defaultAppBar(BuildContext context, {required String title}) {
  return AppBar(
    elevation: 0,
    scrolledUnderElevation: 0,
    leading: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1),
        color: AppColors.scaffoldColor,
        backgroundBlendMode: BlendMode.lighten,
      ),
      width: 10,
      height: 19,
      child: IconButton(
        icon: SvgPicture.asset(AppIcons.iconPop),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ),
    title: Text(title, style: AppTextStyles.appBar),
  );
}
