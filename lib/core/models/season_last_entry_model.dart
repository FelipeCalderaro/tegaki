// To parse this JSON data, do
//
//     final LastEntryModel = LastEntryModelFromJson(jsonString);

import 'dart:convert';

LastEntryModel lastEntryModelFromJson(String str) =>
    LastEntryModel.fromJson(json.decode(str));

String lastEntryModelToJson(LastEntryModel data) => json.encode(data.toJson());

class LastEntryModel {
  LastEntryModel({
    required this.typename,
    required this.page,
  });

  String typename;
  Page page;

  factory LastEntryModel.fromJson(Map<String, dynamic> json) => LastEntryModel(
        typename: json["__typename"],
        page: Page.fromJson(json["Page"]),
      );

  Map<String, dynamic> toJson() => {
        "__typename": typename,
        "Page": page.toJson(),
      };
}

class Page {
  Page({
    required this.typename,
    required this.media,
  });

  String typename;
  List<Media> media;

  factory Page.fromJson(Map<String, dynamic> json) => Page(
        typename: json["__typename"],
        media: List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "__typename": typename,
        "media": List<dynamic>.from(media.map((x) => x.toJson())),
      };
}

class Media {
  Media({
    required this.typename,
    required this.coverImage,
  });

  String typename;
  CoverImage coverImage;

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        typename: json["__typename"],
        coverImage: CoverImage.fromJson(json["coverImage"]),
      );

  Map<String, dynamic> toJson() => {
        "__typename": typename,
        "coverImage": coverImage.toJson(),
      };
}

class CoverImage {
  CoverImage({
    required this.typename,
    required this.large,
    required this.medium,
  });

  String typename;
  String large;
  String medium;

  factory CoverImage.fromJson(Map<String, dynamic> json) => CoverImage(
        typename: json["__typename"],
        large: json["large"],
        medium: json["medium"],
      );

  Map<String, dynamic> toJson() => {
        "__typename": typename,
        "large": large,
        "medium": medium,
      };
}
