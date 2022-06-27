class UrlListConstants {
  static final apiKey = 'k_mu32xzxj';
  static final baseUrl = 'https://imdb-api.com/en/API/';

  static final urlPopularMovie = 'MostPopularMovies/$apiKey';
  static final urlBoxOfficeMovie = 'BoxOffice/$apiKey';
  static String urlTrailerMovie(String? id) => "Trailer/$apiKey/${id}";
  static String urlPosterMovie(String? id) => "Posters/$apiKey/${id}";
  static String urlDetailMovie(String? id) => "Title/$apiKey/${id}";
  static String urlSearchMovie(String? param) => "SearchTitle/$apiKey/${param}";
}
