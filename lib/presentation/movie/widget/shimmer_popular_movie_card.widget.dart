import 'package:aditya_movie/infrastructure/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class ShimmerPopularMovieCardWidget extends StatelessWidget {
  const ShimmerPopularMovieCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 4.w),
      width: 50.w,
      height: 34.h,
      child: Container(
        height: 30.h,
        width: 50.w,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Shimmer.fromColors(
              baseColor: whiteColor,
              highlightColor: borderColor,
              enabled: true,
              child: Container(
                // width: 20.w,
                height: 30.h,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                margin: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
