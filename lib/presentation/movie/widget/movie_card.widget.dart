import 'package:aditya_movie/domain/movie/model/box_office_movice.model.dart';
import 'package:aditya_movie/infrastructure/theme/colors.dart';
import 'package:aditya_movie/infrastructure/theme/fonts.dart';
import 'package:aditya_movie/presentation/movie/controllers/movie.controller.dart';

import 'package:flutter/material.dart';

import 'package:remixicon/remixicon.dart';
import 'package:sizer/sizer.dart';

class MovieCardWidget extends StatelessWidget {
  final List<BoxOfficeMovieModel>? listMovie;
  final String? categoryMovie;
  const MovieCardWidget({Key? key, this.categoryMovie, this.listMovie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MovieController movieController = MovieController();
    return listMovie!.length == 0
        ? Container()
        : GestureDetector(
            onTap: () {
              movieController.toDetailMovieScreen(listMovie![0].items![0].id!);
            },
            child: Container(
              padding: EdgeInsets.only(left: 4.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        categoryMovie!,
                        style: defaultTextStyle.copyWith(fontSize: 14.sp),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 4.w),
                        child: Text(
                          'See All',
                          style: primaryTextStyle,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    height: 40.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: listMovie![0].items!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 50.w,
                          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                          margin: EdgeInsets.only(right: 2.w),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: whiteColor),
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 20.h,
                                  width: 100.w,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      listMovie![0].items![index].image!,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        listMovie![0].items![index].title!,
                                        style: defaultTextStyle,
                                      ),
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            flex: 2,
                                            child: Text(
                                              listMovie![0].items![index].weekend ?? '',
                                              style: defaultTextStyle.copyWith(fontSize: 10.sp),
                                            ),
                                          ),
                                          Flexible(
                                              flex: 2,
                                              child: CircleAvatar(
                                                radius: 15.sp,
                                                child: Icon(
                                                  Remix.play_fill,
                                                  color: whiteColor,
                                                ),
                                              )),
                                          Flexible(
                                            flex: 1,
                                            child: Row(
                                              children: [
                                                Text(
                                                  '9.5',
                                                  style: defaultTextStyle.copyWith(fontSize: 10.sp),
                                                ),
                                                Icon(
                                                  Remix.star_fill,
                                                  color: yellowColor,
                                                  size: 10.sp,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
