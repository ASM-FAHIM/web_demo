import 'dart:convert';

List<MovieListModel> movieListModelFromJson(String str) =>
    List<MovieListModel>.from(
        json.decode(str).map((x) => MovieListModel.fromJson(x)));

String movieListModelToJson(List<MovieListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MovieListModel {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  MovieListModel({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory MovieListModel.fromJson(Map<String, dynamic> json) => MovieListModel(
    albumId: json["albumId"],
    id: json["id"],
    title: json["title"],
    url: json["url"],
    thumbnailUrl: json["thumbnailUrl"],
  );

  Map<String, dynamic> toJson() => {
    "albumId": albumId,
    "id": id,
    "title": title,
    "url": url,
    "thumbnailUrl": thumbnailUrl,
  };
}