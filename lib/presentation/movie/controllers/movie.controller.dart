import 'package:aditya_movie/domain/movie/model/box_office_movice.model.dart';
import 'package:aditya_movie/domain/movie/model/detail_movie.model.dart';
import 'package:aditya_movie/domain/movie/model/popular_movie.model.dart';
import 'package:aditya_movie/domain/movie/model/poster_movie.model.dart';
import 'package:aditya_movie/domain/movie/model/search_movie.model.dart';
import 'package:aditya_movie/domain/movie/model/trailer_movie.model.dart';
import 'package:aditya_movie/infrastructure/dal/services/movie/movie.service.dart';
import 'package:aditya_movie/presentation/movie/movie_detail.screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieController extends GetxController {
  RxList<PopularMovieModel> listPopularMovie = <PopularMovieModel>[].obs;
  RxList<BoxOfficeMovieModel> listBoxOfficeMovie = <BoxOfficeMovieModel>[].obs;
  RxList<TrailerMovieModel> listTrailerMovie = <TrailerMovieModel>[].obs;
  RxList<Posters> listPosterMovie = <Posters>[].obs;
  RxList<DetailMovieModel> listDetailMovie = <DetailMovieModel>[].obs;
  RxList<SearchMovieModel> listSearchMovie = <SearchMovieModel>[].obs;

  RxBool? isSearch = false.obs;

  RxBool? isShimmerLoad = false.obs;
  RxBool? isShimmerLoadBoxOffice = false.obs;

  RxBool? isLoading = false.obs;
  RxBool? isLoadingBoxOffice = false.obs;
  RxBool? isLoadingSearch = false.obs;

  Future<List<PopularMovieModel>> fetchPopularMovie(BuildContext context) async {
    isShimmerLoad!.value = true;
    isLoading!.value = true;

    List<PopularMovieModel> list = await MovieService().getPopularMovie(context);

    listPopularMovie.assignAll(list);
    isShimmerLoadBoxOffice!.value = false;
    isLoading!.value = false;
    return listPopularMovie;
  }

  Future<List<BoxOfficeMovieModel>> fetchBoxOfficeMovie() async {
    isShimmerLoadBoxOffice!.value = true;
    isLoadingBoxOffice!.value = true;
    List<BoxOfficeMovieModel> list = await MovieService().getBoxOfficeMovie();

    listBoxOfficeMovie.assignAll(list);
    isShimmerLoadBoxOffice!.value = false;
    isLoadingBoxOffice!.value = false;
    return listBoxOfficeMovie;
  }

  Future<List<TrailerMovieModel>> toDetailMovieScreen(String id) async {
    isLoading!.value = true;
    isLoading!.value = true;
    List<TrailerMovieModel> list = await MovieService().getTrailerMovie(id);

    List<Posters> dataPoster = await fetchPosterMovie(id);
    List<DetailMovieModel> dataDetail = await fetchDetailMovie(id);
    listTrailerMovie.assignAll(list);
    Get.to(MovieDetailScreen(dataMovie: dataDetail, dataPoster: dataPoster, dataTrailer: listTrailerMovie));

    return list;
  }

  Future<List<Posters>> fetchPosterMovie(String id) async {
    isLoading!.value = true;
    List<PosterMovieModel> list = await MovieService().getPosterMovie(id);

    listPosterMovie.assignAll(list[0].posters!);
    return listPosterMovie.sublist(0, 1);
  }

  Future<List<DetailMovieModel>> fetchDetailMovie(String id) async {
    isLoading!.value = true;
    List<DetailMovieModel> list = await MovieService().getDetailMovie(id);

    listDetailMovie.assignAll(list);
    return listDetailMovie;
  }

  Future<List<SearchMovieModel>> fetchSearchMovie(String param, BuildContext context) async {
    isSearch!.value = true;
    isLoadingSearch!.value = true;
    List<SearchMovieModel> list = await MovieService().getSearchMovie(param, context);

    listSearchMovie.assignAll(list);
    isLoadingSearch!.value = false;
    return listSearchMovie;
  }
}
