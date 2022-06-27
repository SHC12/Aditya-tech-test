import 'package:aditya_movie/infrastructure/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class ShimmerSearchMovieWidget extends StatelessWidget {
  const ShimmerSearchMovieWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 100.h,
      child: ListView.builder(
        itemBuilder: (_, __) => Padding(
          padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 0.w),
          child: Container(
            height: 30.h,
            width: 100.w,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                  baseColor: whiteColor,
                  highlightColor: borderColor,
                  enabled: true,
                  child: Container(
                    width: 40.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
                  ),
                ),
                Shimmer.fromColors(
                  baseColor: whiteColor,
                  highlightColor: borderColor,
                  enabled: true,
                  child: Container(
                    width: 30.w,
                    height: 14.sp,
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
        ),
        itemCount: 3,
      ),
    );
  }
}
