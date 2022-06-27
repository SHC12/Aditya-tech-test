import 'package:aditya_movie/infrastructure/theme/colors.dart';
import 'package:aditya_movie/infrastructure/theme/fonts.dart';
import 'package:aditya_movie/presentation/movie/widget/popular.widget.dart';
import 'package:aditya_movie/presentation/movie/controllers/movie.controller.dart';
import 'package:aditya_movie/presentation/movie/widget/movie_card.widget.dart';
import 'package:aditya_movie/presentation/movie/widget/shimmer_movie_card.widget.dart';
import 'package:aditya_movie/presentation/movie/widget/shimmer_popular_movie_card.widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MovieController movieController = MovieController();
  TextEditingController tSearch = TextEditingController();

  @override
  void initState() {
    super.initState();
    movieController.fetchPopularMovie(context);
    movieController.fetchBoxOfficeMovie();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: SafeArea(
            top: false,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 7.h),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 0.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 2,
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/image/ic_avatar.png'),
                          ),
                        ),
                        Flexible(
                            flex: 4,
                            child: Text(
                              'Aditya Movie',
                              style: primaryTextStyle.copyWith(fontSize: 14.sp, color: secondaryColor),
                            )),
                        Flexible(flex: 1, child: Container()),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Obx(() => movieController.isLoading!.value == false
                      ? PopularWidget(
                          data: movieController.listPopularMovie,
                        )
                      : movieController.isShimmerLoad!.value == true
                          ? ShimmerPopularMovieCardWidget()
                          : PopularWidget(
                              data: movieController.listPopularMovie,
                            )),
                  SizedBox(
                    height: 4.h,
                  ),
                  Obx(() => movieController.isLoadingBoxOffice!.value == false
                      ? MovieCardWidget(
                          listMovie: movieController.listBoxOfficeMovie,
                          categoryMovie: 'Box Office',
                        )
                      : movieController.isShimmerLoadBoxOffice!.value == true
                          ? ShimmerMovieCardWidget()
                          : MovieCardWidget(
                              listMovie: movieController.listBoxOfficeMovie,
                              categoryMovie: 'Box Office',
                            )),
                  SizedBox(
                    height: 4.h,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
