import 'package:aditya_movie/infrastructure/theme/colors.dart';
import 'package:aditya_movie/infrastructure/theme/fonts.dart';
import 'package:aditya_movie/presentation/movie/controllers/movie.controller.dart';
import 'package:aditya_movie/presentation/movie/widget/shimmer_search_movie.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:remixicon/remixicon.dart';

import 'package:sizer/sizer.dart';

class MovieSearchScreen extends StatefulWidget {
  const MovieSearchScreen({Key? key}) : super(key: key);

  @override
  State<MovieSearchScreen> createState() => _MovieSearchScreenState();
}

class _MovieSearchScreenState extends State<MovieSearchScreen> {
  final MovieController movieController = MovieController();
  TextEditingController tSearch = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: SafeArea(
          top: false,
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 7.h),
              child: Column(
                children: [
                  Row(
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
                        child: Container(
                          child: TextField(
                            minLines: 1,
                            controller: tSearch,
                            onChanged: (a) {
                              setState(() {});
                            },
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 0.2.h, horizontal: 4.0.w),
                                hintText: 'Search by title',
                                border: InputBorder.none,
                                fillColor: whiteColor,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: secondaryColor),
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: secondaryColor),
                                    borderRadius: BorderRadius.circular(10.0))),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () async {
                            movieController.fetchSearchMovie(tSearch.text.toString(), context);
                          },
                          child: CircleAvatar(
                            child: Icon(Remix.search_2_line),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Obx(() => movieController.isSearch!.value == false
                      ? Container()
                      : movieController.isLoadingSearch!.value == true
                          ? ShimmerSearchMovieWidget()
                          : Column(
                              children: movieController.listSearchMovie.map((e) {
                                return GestureDetector(
                                  onTap: () {
                                    movieController.toDetailMovieScreen(e.id!);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 2.h),
                                    padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                                    decoration: BoxDecoration(
                                      color: whiteColor,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          flex: 1,
                                          child: Container(
                                            height: 30.h,
                                            width: 40.w,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(10),
                                              child: Image.network(
                                                e.image!,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Flexible(
                                          flex: 1,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(e.title!,
                                                  style: defaultTextStyle.copyWith(fontWeight: FontWeight.bold)),
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                              ReadMoreText(e.plot ?? 'Description Not Available',
                                                  style: defaultTextStyle,
                                                  trimLines: 2,
                                                  colorClickableText: Colors.pink,
                                                  trimMode: TrimMode.Line,
                                                  trimCollapsedText: 'Show more',
                                                  trimExpandedText: 'Show less',
                                                  moreStyle: primaryTextStyle)
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                            ))
                ],
              )),
        ),
      ),
    );
  }
}
