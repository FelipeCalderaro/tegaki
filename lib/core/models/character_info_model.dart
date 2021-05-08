// To parse this JSON data, do
//
//     final characterInfoModel = characterInfoModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CharacterInfoModel characterInfoModelFromJson(String str) =>
    CharacterInfoModel.fromJson(json.decode(str));

String characterInfoModelToJson(CharacterInfoModel data) =>
    json.encode(data.toJson());

class CharacterInfoModel {
  CharacterInfoModel({
    required this.character,
  });

  Character character;

  factory CharacterInfoModel.fromJson(Map<String, dynamic> json) =>
      CharacterInfoModel(
        character: Character.fromJson(json["Character"]),
      );

  Map<String, dynamic> toJson() => {
        "Character": character.toJson(),
      };
}

class Character {
  Character({
    required this.name,
    required this.image,
    required this.favourites,
    required this.isFavourite,
    required this.description,
    required this.age,
    required this.gender,
    required this.dateOfBirth,
    required this.media,
  });

  Name name;
  CharacterImage image;
  int favourites;
  bool isFavourite;
  String? description;
  dynamic age;
  dynamic gender;
  DateOfBirth dateOfBirth;
  Media media;

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        name: Name.fromJson(json["name"]),
        image: CharacterImage.fromJson(json["image"]),
        favourites: json["favourites"],
        isFavourite: json["isFavourite"],
        description: json["description"],
        age: json["age"],
        gender: json["gender"],
        dateOfBirth: DateOfBirth.fromJson(json["dateOfBirth"]),
        media: Media.fromJson(json["media"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name.toJson(),
        "image": image.toJson(),
        "favourites": favourites,
        "isFavourite": isFavourite,
        "description": description,
        "age": age,
        "gender": gender,
        "dateOfBirth": dateOfBirth.toJson(),
        "media": media.toJson(),
      };
}

class DateOfBirth {
  DateOfBirth({
    required this.year,
    required this.month,
    required this.day,
  });

  dynamic year;
  dynamic month;
  dynamic day;

  factory DateOfBirth.fromJson(Map<String, dynamic> json) => DateOfBirth(
        year: json["year"],
        month: json["month"],
        day: json["day"],
      );

  Map<String, dynamic> toJson() => {
        "year": year,
        "month": month,
        "day": day,
      };
}

class CharacterImage {
  CharacterImage({
    required this.large,
  });

  String large;

  factory CharacterImage.fromJson(Map<String, dynamic> json) => CharacterImage(
        large: json["large"],
      );

  Map<String, dynamic> toJson() => {
        "large": large,
      };
}

class Media {
  Media({
    required this.pageInfo,
    required this.edges,
  });

  PageInfo pageInfo;
  List<Edge> edges;

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        pageInfo: PageInfo.fromJson(json["pageInfo"]),
        edges: List<Edge>.from(json["edges"].map((x) => Edge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pageInfo": pageInfo.toJson(),
        "edges": List<dynamic>.from(edges.map((x) => x.toJson())),
      };
}

class Edge {
  Edge({
    required this.id,
    required this.characterRole,
    required this.voiceActorRoles,
    required this.node,
  });

  int id;
  String characterRole;
  List<dynamic> voiceActorRoles;
  Node node;

  factory Edge.fromJson(Map<String, dynamic> json) => Edge(
        id: json["id"],
        characterRole: json["characterRole"],
        voiceActorRoles:
            List<dynamic>.from(json["voiceActorRoles"].map((x) => x)),
        node: Node.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "characterRole": characterRole,
        "voiceActorRoles": List<dynamic>.from(voiceActorRoles.map((x) => x)),
        "node": node.toJson(),
      };
}

class Node {
  Node({
    required this.id,
    required this.type,
    required this.bannerImage,
    required this.title,
    required this.coverImage,
    required this.startDate,
    required this.mediaListEntry,
  });

  int id;
  String type;
  String? bannerImage;
  Title title;
  CharacterImage coverImage;
  StartDate startDate;
  dynamic mediaListEntry;

  factory Node.fromJson(Map<String, dynamic> json) => Node(
        id: json["id"],
        type: json["type"],
        bannerImage: json["bannerImage"],
        title: Title.fromJson(json["title"]),
        coverImage: CharacterImage.fromJson(json["coverImage"]),
        startDate: StartDate.fromJson(json["startDate"]),
        mediaListEntry: json["mediaListEntry"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "bannerImage": bannerImage,
        "title": title.toJson(),
        "coverImage": coverImage.toJson(),
        "startDate": startDate.toJson(),
        "mediaListEntry": mediaListEntry,
      };
}

class StartDate {
  StartDate({
    required this.year,
  });

  int? year;

  factory StartDate.fromJson(Map<String, dynamic> json) => StartDate(
        year: json["year"],
      );

  Map<String, dynamic> toJson() => {
        "year": year,
      };
}

class Title {
  Title({
    required this.userPreferred,
  });

  String userPreferred;

  factory Title.fromJson(Map<String, dynamic> json) => Title(
        userPreferred: json["userPreferred"],
      );

  Map<String, dynamic> toJson() => {
        "userPreferred": userPreferred,
      };
}

class PageInfo {
  PageInfo({
    required this.total,
    required this.perPage,
    required this.currentPage,
    required this.lastPage,
    required this.hasNextPage,
  });

  int total;
  int perPage;
  int currentPage;
  int lastPage;
  bool hasNextPage;

  factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
        total: json["total"],
        perPage: json["perPage"],
        currentPage: json["currentPage"],
        lastPage: json["lastPage"],
        hasNextPage: json["hasNextPage"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "perPage": perPage,
        "currentPage": currentPage,
        "lastPage": lastPage,
        "hasNextPage": hasNextPage,
      };
}

class Name {
  Name({
    required this.first,
    required this.middle,
    required this.last,
    required this.full,
    required this.native,
    required this.alternative,
    required this.alternativeSpoiler,
  });

  String? first;
  dynamic? middle;
  String? last;
  String full;
  String native;
  List<String> alternative;
  List<String> alternativeSpoiler;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        first: json["first"],
        middle: json["middle"],
        last: json["last"],
        full: json["full"],
        native: json["native"],
        alternative: List<String>.from(json["alternative"].map((x) => x)),
        alternativeSpoiler:
            List<String>.from(json["alternativeSpoiler"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "first": first,
        "middle": middle,
        "last": last,
        "full": full,
        "native": native,
        "alternative": List<dynamic>.from(alternative.map((x) => x)),
        "alternativeSpoiler":
            List<dynamic>.from(alternativeSpoiler.map((x) => x)),
      };
}
