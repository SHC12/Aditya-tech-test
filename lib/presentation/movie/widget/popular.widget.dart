import 'package:aditya_movie/domain/movie/model/popular_movie.model.dart';
import 'package:aditya_movie/presentation/movie/controllers/movie.controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PopularWidget extends StatelessWidget {
  final List<PopularMovieModel>? data;
  const PopularWidget({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MovieController movieController = MovieController();
    return data!.length == 0
        ? Container()
        : Container(
            width: 100.w,
            child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2,
                  enlargeCenterPage: true,
                ),
                items: data![0].items?.sublist(0, 4).map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return GestureDetector(
                            onTap: () {
                              movieController.toDetailMovieScreen(i.id!);
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 1.w),
                              decoration: BoxDecoration(
                                color: Colors.amber.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                child: Image.network(
                                  i.image!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }).toList() ??
                    []),
          );
  }
}
