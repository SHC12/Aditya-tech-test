class SearchMovieModel {
  String? id;
  String? title;
  String? originalTitle;
  String? fullTitle;
  String? type;
  String? year;
  String? image;
  String? releaseDate;
  String? runtimeMins;
  String? runtimeStr;
  String? plot;
  String? plotLocal;
  bool? plotLocalIsRtl;
  String? awards;
  String? directors;
  List<DirectorList>? directorList;
  String? writers;

  String? stars;

  List<ActorList>? actorList;
  String? fullCast;
  String? genres;
  List<GenreList>? genreList;
  String? companies;

  String? countries;

  String? languages;

  String? contentRating;
  String? imDbRating;
  String? imDbRatingVotes;
  String? metacriticRating;
  String? ratings;
  String? wikipedia;
  List? posters;
  String? images;
  String? trailer;
  BoxOffice? boxOffice;
  String? tagline;
  String? keywords;

  List<Similars>? similars;
  // String? tvSeriesInfo;
  String? tvEpisodeInfo;
  String? errorMessage;

  SearchMovieModel(
      {this.id,
      this.title,
      this.originalTitle,
      this.fullTitle,
      this.type,
      this.year,
      this.image,
      this.releaseDate,
      this.runtimeMins,
      this.runtimeStr,
      this.plot,
      this.plotLocal,
      this.plotLocalIsRtl,
      this.awards,
      this.directors,
      this.directorList,
      this.writers,
      this.stars,
      this.actorList,
      this.fullCast,
      this.genres,
      this.genreList,
      this.companies,
      this.countries,
      this.languages,
      this.contentRating,
      this.imDbRating,
      this.imDbRatingVotes,
      this.metacriticRating,
      this.ratings,
      this.wikipedia,
      this.posters,
      this.images,
      this.trailer,
      this.boxOffice,
      this.tagline,
      this.keywords,
      this.similars,
      // this.tvSeriesInfo,
      this.tvEpisodeInfo,
      this.errorMessage});

  SearchMovieModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    originalTitle = json['originalTitle'];
    fullTitle = json['fullTitle'];
    type = json['type'];
    year = json['year'];
    image = json['image'];
    releaseDate = json['releaseDate'];
    runtimeMins = json['runtimeMins'];
    runtimeStr = json['runtimeStr'];
    plot = json['plot'];
    plotLocal = json['plotLocal'];
    plotLocalIsRtl = json['plotLocalIsRtl'];
    awards = json['awards'];
    directors = json['directors'];
    if (json['directorList'] != null) {
      directorList = <DirectorList>[];
      json['directorList'].forEach((v) {
        directorList!.add(new DirectorList.fromJson(v));
      });
    }
    writers = json['writers'];

    stars = json['stars'];

    if (json['actorList'] != null) {
      actorList = <ActorList>[];
      json['actorList'].forEach((v) {
        actorList!.add(new ActorList.fromJson(v));
      });
    }
    fullCast = json['fullCast'];
    genres = json['genres'];
    if (json['genreList'] != null) {
      genreList = <GenreList>[];
      json['genreList'].forEach((v) {
        genreList!.add(new GenreList.fromJson(v));
      });
    }
    companies = json['companies'];

    countries = json['countries'];

    languages = json['languages'];

    contentRating = json['contentRating'];
    imDbRating = json['imDbRating'];
    imDbRatingVotes = json['imDbRatingVotes'];
    metacriticRating = json['metacriticRating'];
    ratings = json['ratings'];
    wikipedia = json['wikipedia'];
    posters = json['posters'];
    images = json['images'];
    trailer = json['trailer'];
    boxOffice = json['boxOffice'] != null ? new BoxOffice.fromJson(json['boxOffice']) : null;
    tagline = json['tagline'];
    keywords = json['keywords'];

    if (json['similars'] != null) {
      similars = <Similars>[];
      json['similars'].forEach((v) {
        similars!.add(new Similars.fromJson(v));
      });
    }
    // tvSeriesInfo = json['tvSeriesInfo'];
    tvEpisodeInfo = json['tvEpisodeInfo'];
    errorMessage = json['errorMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['originalTitle'] = this.originalTitle;
    data['fullTitle'] = this.fullTitle;
    data['type'] = this.type;
    data['year'] = this.year;
    data['image'] = this.image;
    data['releaseDate'] = this.releaseDate;
    data['runtimeMins'] = this.runtimeMins;
    data['runtimeStr'] = this.runtimeStr;
    data['plot'] = this.plot;
    data['plotLocal'] = this.plotLocal;
    data['plotLocalIsRtl'] = this.plotLocalIsRtl;
    data['awards'] = this.awards;
    data['directors'] = this.directors;
    if (this.directorList != null) {
      data['directorList'] = this.directorList!.map((v) => v.toJson()).toList();
    }
    data['writers'] = this.writers;

    data['stars'] = this.stars;

    if (this.actorList != null) {
      data['actorList'] = this.actorList!.map((v) => v.toJson()).toList();
    }
    data['fullCast'] = this.fullCast;
    data['genres'] = this.genres;
    if (this.genreList != null) {
      data['genreList'] = this.genreList!.map((v) => v.toJson()).toList();
    }
    data['companies'] = this.companies;

    data['countries'] = this.countries;

    data['languages'] = this.languages;

    data['contentRating'] = this.contentRating;
    data['imDbRating'] = this.imDbRating;
    data['imDbRatingVotes'] = this.imDbRatingVotes;
    data['metacriticRating'] = this.metacriticRating;
    data['ratings'] = this.ratings;
    data['wikipedia'] = this.wikipedia;
    data['posters'] = this.posters;
    data['images'] = this.images;
    data['trailer'] = this.trailer;
    if (this.boxOffice != null) {
      data['boxOffice'] = this.boxOffice!.toJson();
    }
    data['tagline'] = this.tagline;
    data['keywords'] = this.keywords;

    if (this.similars != null) {
      data['similars'] = this.similars!.map((v) => v.toJson()).toList();
    }
    // data['tvSeriesInfo'] = this.tvSeriesInfo;
    data['tvEpisodeInfo'] = this.tvEpisodeInfo;
    data['errorMessage'] = this.errorMessage;
    return data;
  }
}

class DirectorList {
  String? id;
  String? name;

  DirectorList({this.id, this.name});

  DirectorList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class ActorList {
  String? id;
  String? image;
  String? name;
  String? asCharacter;

  ActorList({this.id, this.image, this.name, this.asCharacter});

  ActorList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    asCharacter = json['asCharacter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    data['asCharacter'] = this.asCharacter;
    return data;
  }
}

class GenreList {
  String? key;
  String? value;

  GenreList({this.key, this.value});

  GenreList.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['value'] = this.value;
    return data;
  }
}

class BoxOffice {
  String? budget;
  String? openingWeekendUSA;
  String? grossUSA;
  String? cumulativeWorldwideGross;

  BoxOffice({this.budget, this.openingWeekendUSA, this.grossUSA, this.cumulativeWorldwideGross});

  BoxOffice.fromJson(Map<String, dynamic> json) {
    budget = json['budget'];
    openingWeekendUSA = json['openingWeekendUSA'];
    grossUSA = json['grossUSA'];
    cumulativeWorldwideGross = json['cumulativeWorldwideGross'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['budget'] = this.budget;
    data['openingWeekendUSA'] = this.openingWeekendUSA;
    data['grossUSA'] = this.grossUSA;
    data['cumulativeWorldwideGross'] = this.cumulativeWorldwideGross;
    return data;
  }
}

class Similars {
  String? id;
  String? title;
  String? image;
  String? imDbRating;

  Similars({this.id, this.title, this.image, this.imDbRating});

  Similars.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    imDbRating = json['imDbRating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['imDbRating'] = this.imDbRating;
    return data;
  }
}
