import 'package:equatable/equatable.dart';

class Movie extends Equatable{

  final bool? adult;
  final String? backdropPath;
  final int? id;
  final String? originalTitle;
  final String? overview;
  final String? posterPath;
  final String? releaseDate;
  final dynamic voteAverage;
  final int? voteCount;



  Movie({
    this.id,
    this.adult,
    required this.backdropPath,
    this.originalTitle,
    this.overview,
    required this.posterPath,
    this.releaseDate,
    this.voteAverage,
    this.voteCount
});

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
    adult: json['adult'] as bool?,
    backdropPath: json['backdrop_path'] as String?,
    id: json['id'] as int?,
    originalTitle: json['original_title'] as String?,
      overview: json['overview'] as String?,
    posterPath: json['poster_path'] as String?,
    releaseDate: json['release_date'] as String?,
    voteAverage: json['vote_average'] as dynamic,
    voteCount: json['vote_count'] as int?,
  );


  Map<String, dynamic> toJson() => {
    'adult': adult,
    'backdropPath': backdropPath,
    'id': id,
    'originalTitle': originalTitle,
    'overview': overview,
    'posterPath': posterPath,
    'releaseDate': releaseDate,
    'voteAverage': voteAverage,
    'voteCount': voteCount,
  };

  factory Movie.dummy(){
    return Movie(backdropPath: "", posterPath: "");
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    adult,
    backdropPath,
    id,
    originalTitle,
    overview,
    posterPath,
    releaseDate,
    voteAverage,
    voteCount
  ];

}