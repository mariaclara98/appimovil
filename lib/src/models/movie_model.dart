class Movie {
  Movie({
    required this.rank,
    required this.title,
    required this.description,
    required this.image,
    required this.bigImage,
    required this.genre,
    required this.thumbnail,
    required this.rating,
    required this.id,
    required this.year,
    required this.imdbid,
    required this.imdbLink,
  });
  late final int rank;
  late final String title;
  late final String description;
  late final String image;
  late final String bigImage;
  late final List<String> genre;
  late final String thumbnail;
  late final String rating;
  late final String id;
  late final int year;
  late final String imdbid;
  late final String imdbLink;

  Movie.fromJson(Map<String, dynamic> json) {
    rank = json['rank'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    bigImage = json['big_image'];
    genre = List.castFrom<dynamic, String>(json['genre']);
    thumbnail = json['thumbnail'];
    rating = json['rating'];
    id = json['id'];
    year = json['year'];
    imdbid = json['imdbid'];
    imdbLink = json['imdb_link'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['rank'] = rank;
    _data['title'] = title;
    _data['description'] = description;
    _data['image'] = image;
    _data['big_image'] = bigImage;
    _data['genre'] = genre;
    _data['thumbnail'] = thumbnail;
    _data['rating'] = rating;
    _data['id'] = id;
    _data['year'] = year;
    _data['imdbid'] = imdbid;
    _data['imdb_link'] = imdbLink;
    return _data;
  }
}
