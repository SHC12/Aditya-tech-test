import 'package:aditya_movie/domain/core/constants/url_list.constans.dart';
import 'package:aditya_movie/domain/core/utils/exceptions_helper.dart';
import 'package:aditya_movie/domain/core/utils/network_helper.dart';
import 'package:aditya_movie/domain/movie/model/box_office_movice.model.dart';
import 'package:aditya_movie/domain/movie/model/detail_movie.model.dart';
import 'package:aditya_movie/domain/movie/model/popular_movie.model.dart';
import 'package:aditya_movie/domain/movie/model/poster_movie.model.dart';
import 'package:aditya_movie/domain/movie/model/search_movie.model.dart';
import 'package:aditya_movie/domain/movie/model/trailer_movie.model.dart';
import 'package:flutter/material.dart';

class MovieService {
  NetworkHelper networkHelper = NetworkHelper();
  ExceptionsHelper exceptionsHelper = ExceptionsHelper();

  Future<List<PopularMovieModel>> getPopularMovie(BuildContext context) async {
    final dataPopularMovie = <PopularMovieModel>[];

    await networkHelper.get(
        path: UrlListConstants.urlPopularMovie,
        onSuccess: (content) async {
          if (content['errorMessage'] != '') {
            await exceptionsHelper.popUpMessage(content['errorMessage'], context);
            return <DetailMovieModel>[];
          } else {
            dataPopularMovie.add(PopularMovieModel.fromJson(content));
            return dataPopularMovie;
          }
        },
        onError: (content) {
          return <PopularMovieModel>[];
        });

    return dataPopularMovie;
  }

  Future<List<BoxOfficeMovieModel>> getBoxOfficeMovie() async {
    final dataBoxOfficeMovie = <BoxOfficeMovieModel>[];

    await networkHelper.get(
        path: UrlListConstants.urlBoxOfficeMovie,
        onSuccess: (content) async {
          if (content['errorMessage'] != '') {
            return <DetailMovieModel>[];
          } else {
            dataBoxOfficeMovie.add(BoxOfficeMovieModel.fromJson(content));

            print('data box office s : ${dataBoxOfficeMovie[0].toJson()}');

            return dataBoxOfficeMovie;
          }
        },
        onError: (content) {
          return <BoxOfficeMovieModel>[];
        });

    return dataBoxOfficeMovie;
  }

  Future<List<TrailerMovieModel>> getTrailerMovie(String id) async {
    final dataTrailerrMovie = <TrailerMovieModel>[];

    await networkHelper.get(
        path: UrlListConstants.urlTrailerMovie(id),
        onSuccess: (content) {
          dataTrailerrMovie.add(TrailerMovieModel.fromJson(content));

          return dataTrailerrMovie;
        },
        onError: (content) {
          return <TrailerMovieModel>[];
        });

    return dataTrailerrMovie;
  }

  Future<List<PosterMovieModel>> getPosterMovie(String id) async {
    final dataPosterMovie = <PosterMovieModel>[];

    await networkHelper.get(
        path: UrlListConstants.urlPosterMovie(id),
        onSuccess: (content) {
          dataPosterMovie.add(PosterMovieModel.fromJson(content));

          return dataPosterMovie;
        },
        onError: (content) {
          return <PosterMovieModel>[];
        });

    return dataPosterMovie;
  }

  Future<List<DetailMovieModel>> getDetailMovie(String id) async {
    final dataDetailMovie = <DetailMovieModel>[];

    await networkHelper.get(
        path: UrlListConstants.urlDetailMovie(id),
        onSuccess: (content) {
          dataDetailMovie.add(DetailMovieModel.fromJson(content));

          return dataDetailMovie;
        },
        onError: (content) {
          return <DetailMovieModel>[];
        });

    return dataDetailMovie;
  }

  Future<List<SearchMovieModel>> getSearchMovie(String param, BuildContext context) async {
    final dataSearchMovie = <SearchMovieModel>[];

    SearchMovieModel detailSearchMovie = SearchMovieModel();

    await networkHelper.get(
        path: UrlListConstants.urlSearchMovie(param),
        onSuccess: (content) async {
          if (content['errorMessage'] != '') {
            await exceptionsHelper.popUpMessage(content['errorMessage'], context);
            return <DetailMovieModel>[];
          } else {
            var dataMovie = content;

            for (var data in dataMovie['results']) {
              String? id = data['id'];
              detailSearchMovie = await getDetailSearchMovie(id);

              print('list id : ${data['id']}');
              dataSearchMovie.add(detailSearchMovie);
            }

            return dataSearchMovie;
          }
        },
        onError: (content) {
          return <DetailMovieModel>[];
        });

    return dataSearchMovie;
  }

  Future<SearchMovieModel> getDetailSearchMovie(String? id) async {
    return networkHelper.get(
        path: UrlListConstants.urlDetailMovie(id),
        onSuccess: (content) {
          var data = SearchMovieModel.fromJson(content);
          return data;
        },
        onError: (error) {
          return error;
        });
  }
}
