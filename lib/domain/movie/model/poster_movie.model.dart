class PosterMovieModel {
  String? imDbId;
  String? title;
  String? fullTitle;
  String? type;
  String? year;
  List<Posters>? posters;

  String? errorMessage;

  PosterMovieModel({this.imDbId, this.title, this.fullTitle, this.type, this.year, this.posters, this.errorMessage});

  PosterMovieModel.fromJson(Map<String, dynamic> json) {
    imDbId = json['imDbId'];
    title = json['title'];
    fullTitle = json['fullTitle'];
    type = json['type'];
    year = json['year'];
    if (json['posters'] != null) {
      posters = <Posters>[];
      json['posters'].forEach((v) {
        posters!.add(new Posters.fromJson(v));
      });
    }

    errorMessage = json['errorMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imDbId'] = this.imDbId;
    data['title'] = this.title;
    data['fullTitle'] = this.fullTitle;
    data['type'] = this.type;
    data['year'] = this.year;
    if (this.posters != null) {
      data['posters'] = this.posters!.map((v) => v.toJson()).toList();
    }

    data['errorMessage'] = this.errorMessage;
    return data;
  }
}

class Posters {
  String? id;
  String? link;
  double? aspectRatio;
  String? language;
  int? width;
  int? height;

  Posters({this.id, this.link, this.aspectRatio, this.language, this.width, this.height});

  Posters.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    link = json['link'];
    aspectRatio = json['aspectRatio'];
    language = json['language'];
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['link'] = this.link;
    data['aspectRatio'] = this.aspectRatio;
    data['language'] = this.language;
    data['width'] = this.width;
    data['height'] = this.height;
    return data;
  }
}
