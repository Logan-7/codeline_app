import 'package:codeline_app/widget/app_color.dart';
import 'package:codeline_app/widget/images_path.dart';
import 'package:codeline_app/widget/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

customAppBar({BuildContext? context, onPress}) {
  return AppBar(
    toolbarHeight: 90,
    elevation: 0,
    backgroundColor: AppColor.whiteColor,
    title: Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SvgPicture.asset(AppImages.logo),
    ),
    leading: Responsive.isMobile(context!)
        ? IconButton(
            onPressed: onPress,
            icon: Icon(
              Icons.menu,
              color: AppColor.blackColor,
            ),
          )
        : SizedBox(),
  );
}
