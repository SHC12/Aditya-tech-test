import 'package:aditya_movie/infrastructure/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class ShimmerMovieCardWidget extends StatelessWidget {
  const ShimmerMovieCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
              Shimmer.fromColors(
                baseColor: whiteColor,
                highlightColor: borderColor,
                enabled: true,
                child: Container(
                  width: 30.w,
                  height: 12.sp,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 4.w),
            width: 100.w,
            height: 40.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, __) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
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
                      Shimmer.fromColors(
                        baseColor: whiteColor,
                        highlightColor: borderColor,
                        enabled: true,
                        child: Container(
                          width: 30.w,
                          height: 10.sp,
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
          ),
        ],
      ),
    );
  }
}
