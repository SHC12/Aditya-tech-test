import 'package:aditya_movie/domain/movie/model/detail_movie.model.dart';

import 'package:aditya_movie/domain/movie/model/poster_movie.model.dart';
import 'package:aditya_movie/infrastructure/theme/colors.dart';
import 'package:aditya_movie/infrastructure/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';
import 'package:sizer/sizer.dart';

class MovieDetailScreen extends StatefulWidget {
  final List<DetailMovieModel>? dataMovie;
  final List<Posters>? dataPoster;
  final List? dataTrailer;

  const MovieDetailScreen({Key? key, this.dataTrailer, this.dataPoster, this.dataMovie}) : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  // final DetailMovieModel? dataMovie = DetailMovieModel();

  @override
  Widget build(BuildContext context) {
    print('data model movie : ${widget.dataMovie![0].toJson()}');
    return Scaffold(
      body: Container(
          height: 100.h,
          width: 100.w,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://image.tmdb.org/t/p/w500/${widget.dataPoster![0].id}'),
              fit: BoxFit.fill,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 3.w,
                              vertical: 7.h,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(
                                Remix.arrow_left_s_line,
                                color: whiteColor,
                                size: 25.sp,
                              ),
                            ),
                          ),
                        ],
                      ))),
              Positioned(
                  child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            widget.dataMovie![0].title!,
                            textAlign: TextAlign.center,
                            style: whitetTextStyle.copyWith(fontSize: 20.sp, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                flex: 1,
                                child: Text(
                                  widget.dataMovie![0].stars!,
                                  textAlign: TextAlign.center,
                                  style: whitetTextStyle,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          RatingBar.builder(
                            ignoreGestures: true,
                            initialRating: double.parse(widget.dataMovie![0].imDbRating!) / 2,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          CircleAvatar(
                            radius: 40.sp,
                            backgroundColor: primaryColor,
                            child: Icon(
                              Remix.play_fill,
                              color: whiteColor,
                              size: 40.sp,
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  context: context,
                                  builder: (builder) {
                                    return Container(
                                      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Description',
                                            style: defaultTextStyle.copyWith(fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Text(widget.dataMovie![0].plot!)
                                        ],
                                      ),
                                    );
                                  });
                            },
                            child: Container(
                              child: Column(
                                children: [
                                  Text(
                                    'Show More',
                                    style: whitetTextStyle,
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Icon(
                                    Remix.arrow_down_s_line,
                                    color: whiteColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                        ],
                      ))),
            ],
          )),
    );
  }
}
