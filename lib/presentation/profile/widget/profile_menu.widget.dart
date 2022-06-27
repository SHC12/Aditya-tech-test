import 'package:aditya_movie/infrastructure/theme/colors.dart';
import 'package:aditya_movie/infrastructure/theme/fonts.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

class ProfileMenuWidget extends StatelessWidget {
  final String? title;
  final String? desc;
  final IconData? icon;
  const ProfileMenuWidget({Key? key, this.title, this.desc, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            width: 12.w,
            height: 6.h,
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Icon(
              icon,
              color: whiteColor,
            )),
        SizedBox(
          width: 2.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title!,
              style: defaultTextStyle.copyWith(color: secondaryColor),
            ),
            Text(
              desc!,
              style: defaultTextStyle.copyWith(fontSize: 10.sp),
            ),
          ],
        )
      ],
    );
  }
}
