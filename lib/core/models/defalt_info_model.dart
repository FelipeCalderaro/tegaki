// To parse this JSON data, do
//
//     final defaultInfoModel = defaultInfoModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

DefaultInfoModel defaultInfoModelFromJson(String str) =>
    DefaultInfoModel.fromJson(json.decode(str));

String defaultInfoModelToJson(DefaultInfoModel data) =>
    json.encode(data.toJson());

class DefaultInfoModel {
  DefaultInfoModel({
    required this.page,
  });

  Page page;

  factory DefaultInfoModel.fromJson(Map<String, dynamic> json) =>
      DefaultInfoModel(
        page: Page.fromJson(json["Page"]),
      );

  Map<String, dynamic> toJson() => {
        "Page": page.toJson(),
      };
}

class Page {
  Page({
    required this.pageInfo,
    required this.media,
  });

  PageInfo? pageInfo;
  List<Media> media;

  factory Page.fromJson(Map<String, dynamic> json) => Page(
        pageInfo: json["pageInfo"] == null
            ? null
            : PageInfo.fromJson(json["pageInfo"]),
        media: List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pageInfo": pageInfo!.toJson(),
        "media": List<dynamic>.from(media.map((x) => x.toJson())),
      };
}

class Media {
  Media({
    required this.id,
    required this.averageScore,
    required this.popularity,
    required this.genres,
    required this.title,
    required this.bannerImage,
    required this.coverImage,
    required this.airingSchedule,
  });

  int id;
  int? averageScore;
  int popularity;
  List<String> genres;
  Title title;
  String? bannerImage;
  CoverImage coverImage;
  AiringSchedule? airingSchedule;

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        id: json["id"],
        averageScore: json["averageScore"],
        popularity: json["popularity"],
        genres: List<String>.from(json["genres"].map((x) => x)),
        title: Title.fromJson(json["title"]),
        bannerImage: json["bannerImage"] == null ? null : json["bannerImage"],
        coverImage: CoverImage.fromJson(json["coverImage"]),
        airingSchedule: json["airingSchedule"] == null
            ? null
            : AiringSchedule.fromJson(json["airingSchedule"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "averageScore": averageScore,
        "popularity": popularity,
        "genres": List<dynamic>.from(genres.map((x) => x)),
        "title": title.toJson(),
        "bannerImage": bannerImage == null ? null : bannerImage,
        "coverImage": coverImage.toJson(),
        "airingSchedule": airingSchedule!.toJson(),
      };
}

class AiringSchedule {
  AiringSchedule({
    required this.nodes,
  });

  List<Node> nodes;

  factory AiringSchedule.fromJson(Map<String, dynamic> json) => AiringSchedule(
        nodes: List<Node>.from(json["nodes"].map((x) => Node.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "nodes": List<dynamic>.from(nodes.map((x) => x.toJson())),
      };
}

class Node {
  Node({
    required this.episode,
    required this.airingAt,
  });

  int? episode;
  int? airingAt;

  factory Node.fromJson(Map<String, dynamic> json) => Node(
        episode: json["episode"],
        airingAt: json["airingAt"],
      );

  Map<String, dynamic> toJson() => {
        "episode": episode,
        "airingAt": airingAt,
      };
}

class CoverImage {
  CoverImage({
    required this.large,
    required this.medium,
    required this.color,
  });

  String large;
  String medium;
  // String? color;
  Color? color;

  static Color toColor(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  factory CoverImage.fromJson(Map<String, dynamic> json) => CoverImage(
        large: json["large"],
        medium: json["medium"],
        color: json['color'] == null ? null : toColor(json['color']),
      );

  Map<String, dynamic> toJson() => {
        "large": large,
        "medium": medium,
        'color': color,
      };
}

class Title {
  Title({
    required this.romaji,
    required this.english,
    required this.userPreferred,
  });

  String romaji;
  String? english;
  String? userPreferred;

  factory Title.fromJson(Map<String, dynamic> json) => Title(
        romaji: json["romaji"],
        english: json["english"],
        userPreferred: json["userPreferred"],
      );

  Map<String, dynamic> toJson() => {
        "romaji": romaji,
        "english": english,
        "userPreferred": userPreferred,
      };
}

class PageInfo {
  PageInfo({
    required this.total,
    required this.hasNextPage,
  });

  int total;
  bool hasNextPage;

  factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
        total: json["total"],
        hasNextPage: json["hasNextPage"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "hasNextPage": hasNextPage,
      };
}
