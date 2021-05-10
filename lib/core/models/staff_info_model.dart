// To parse this JSON data, do
//
//     final staffInfo = staffInfoFromJson(jsonString);

import 'dart:convert';

StaffInfoModel staffInfoFromJson(String str) =>
    StaffInfoModel.fromJson(json.decode(str));

String staffInfoToJson(StaffInfoModel data) => json.encode(data.toJson());

class StaffInfoModel {
  StaffInfoModel({
    required this.staff,
  });

  Staff staff;

  factory StaffInfoModel.fromJson(Map<String, dynamic> json) => StaffInfoModel(
        staff: Staff.fromJson(json["Staff"]),
      );

  Map<String, dynamic> toJson() => {
        "Staff": staff.toJson(),
      };
}

class Staff {
  Staff({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.favourites,
    required this.isFavourite,
    required this.age,
    required this.gender,
    required this.yearsActive,
    required this.homeTown,
    required this.primaryOccupations,
    required this.dateOfBirth,
    required this.dateOfDeath,
    required this.characterMedia,
    required this.staffMedia,
  });

  int id;
  StaffName name;
  MediaImage image;
  String? description;
  int favourites;
  bool isFavourite;
  dynamic age;
  dynamic gender;
  List<dynamic> yearsActive;
  dynamic homeTown;
  List<dynamic> primaryOccupations;
  DateOf dateOfBirth;
  DateOf dateOfDeath;
  CharacterMedia characterMedia;
  StaffMedia staffMedia;

  factory Staff.fromJson(Map<String, dynamic> json) => Staff(
        id: json["id"],
        name: StaffName.fromJson(json["name"]),
        image: MediaImage.fromJson(json["image"]),
        description: json["description"],
        favourites: json["favourites"],
        isFavourite: json["isFavourite"],
        age: json["age"],
        gender: json["gender"],
        yearsActive: List<dynamic>.from(json["yearsActive"].map((x) => x)),
        homeTown: json["homeTown"],
        primaryOccupations:
            List<dynamic>.from(json["primaryOccupations"].map((x) => x)),
        dateOfBirth: DateOf.fromJson(json["dateOfBirth"]),
        dateOfDeath: DateOf.fromJson(json["dateOfDeath"]),
        characterMedia: CharacterMedia.fromJson(json["characterMedia"]),
        staffMedia: StaffMedia.fromJson(json["staffMedia"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name.toJson(),
        "image": image.toJson(),
        "description": description,
        "favourites": favourites,
        "isFavourite": isFavourite,
        "age": age,
        "gender": gender,
        "yearsActive": List<dynamic>.from(yearsActive.map((x) => x)),
        "homeTown": homeTown,
        "primaryOccupations":
            List<dynamic>.from(primaryOccupations.map((x) => x)),
        "dateOfBirth": dateOfBirth.toJson(),
        "dateOfDeath": dateOfDeath.toJson(),
        "characterMedia": characterMedia.toJson(),
        "staffMedia": staffMedia.toJson(),
      };
}

class CharacterMedia {
  CharacterMedia({
    required this.pageInfo,
    required this.edges,
    this.byYear,
  });

  PageInfo pageInfo;
  List<CharacterMediaEdge> edges;
  List<SeparatedByYear>? byYear = [];

  factory CharacterMedia.fromJson(Map<String, dynamic> json) => CharacterMedia(
        pageInfo: PageInfo.fromJson(json["pageInfo"]),
        edges: List<CharacterMediaEdge>.from(
            json["edges"].map((x) => CharacterMediaEdge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pageInfo": pageInfo.toJson(),
        "edges": List<dynamic>.from(edges.map((x) => x.toJson())),
      };
}

class CharacterMediaEdge {
  CharacterMediaEdge({
    required this.characterRole,
    required this.characterName,
    required this.node,
    required this.characters,
  });

  String characterRole;
  dynamic characterName;
  PurpleNode node;
  List<Character?> characters;

  factory CharacterMediaEdge.fromJson(Map<String, dynamic> json) =>
      CharacterMediaEdge(
        characterRole: json["characterRole"],
        characterName: json["characterName"],
        node: PurpleNode.fromJson(json["node"]),
        characters: List<Character>.from(
            json["characters"].map((x) => Character.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "characterRole": characterRole,
        "characterName": characterName,
        "node": node.toJson(),
        "characters": List<dynamic>.from(characters.map((x) => x!.toJson())),
      };
}

class Character {
  Character({
    required this.id,
    required this.name,
    required this.image,
  });

  int id;
  CharacterName name;
  MediaImage image;

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        id: json["id"],
        name: CharacterName.fromJson(json["name"]),
        image: MediaImage.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name.toJson(),
        "image": image.toJson(),
      };
}

class MediaImage {
  MediaImage({
    required this.large,
  });

  String large;

  factory MediaImage.fromJson(Map<String, dynamic> json) => MediaImage(
        large: json["large"],
      );

  Map<String, dynamic> toJson() => {
        "large": large,
      };
}

class CharacterName {
  CharacterName({
    required this.full,
  });

  String full;

  factory CharacterName.fromJson(Map<String, dynamic> json) => CharacterName(
        full: json["full"],
      );

  Map<String, dynamic> toJson() => {
        "full": full,
      };
}

class PurpleNode {
  PurpleNode({
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
  MediaImage coverImage;
  StartDate startDate;
  dynamic mediaListEntry;

  factory PurpleNode.fromJson(Map<String, dynamic> json) => PurpleNode(
        id: json["id"],
        type: json["type"],
        bannerImage: json["bannerImage"] == null ? null : json["bannerImage"],
        title: Title.fromJson(json["title"]),
        coverImage: MediaImage.fromJson(json["coverImage"]),
        startDate: StartDate.fromJson(json["startDate"]),
        mediaListEntry: json["mediaListEntry"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "bannerImage": bannerImage == null ? null : bannerImage,
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

  int year;

  factory StartDate.fromJson(Map<String, dynamic> json) => StartDate(
        year: json["year"] == null ? 0 : json["year"],
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

class DateOf {
  DateOf({
    required this.year,
    required this.month,
    required this.day,
  });

  dynamic year;
  dynamic month;
  dynamic day;

  factory DateOf.fromJson(Map<String, dynamic> json) => DateOf(
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

class StaffName {
  StaffName({
    required this.full,
    required this.native,
    required this.alternative,
  });

  String full;
  String native;
  List<String> alternative;

  factory StaffName.fromJson(Map<String, dynamic> json) => StaffName(
        full: json["full"],
        native: json["native"],
        alternative: List<String>.from(json["alternative"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "full": full,
        "native": native,
        "alternative": List<dynamic>.from(alternative.map((x) => x)),
      };
}

class StaffMedia {
  StaffMedia({
    required this.pageInfo,
    required this.edges,
  });

  PageInfo pageInfo;
  List<StaffMediaEdge> edges;

  factory StaffMedia.fromJson(Map<String, dynamic> json) => StaffMedia(
        pageInfo: PageInfo.fromJson(json["pageInfo"]),
        edges: List<StaffMediaEdge>.from(
            json["edges"].map((x) => StaffMediaEdge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pageInfo": pageInfo.toJson(),
        "edges": List<dynamic>.from(edges.map((x) => x.toJson())),
      };
}

class StaffMediaEdge {
  StaffMediaEdge({
    required this.staffRole,
    required this.node,
  });

  String staffRole;
  FluffyNode node;

  factory StaffMediaEdge.fromJson(Map<String, dynamic> json) => StaffMediaEdge(
        staffRole: json["staffRole"],
        node: FluffyNode.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "staffRole": staffRole,
        "node": node.toJson(),
      };
}

class FluffyNode {
  FluffyNode({
    required this.id,
    required this.type,
    required this.title,
    required this.coverImage,
    required this.mediaListEntry,
  });

  int id;
  String type;
  Title title;
  MediaImage coverImage;
  dynamic mediaListEntry;

  factory FluffyNode.fromJson(Map<String, dynamic> json) => FluffyNode(
        id: json["id"],
        type: json["type"],
        title: Title.fromJson(json["title"]),
        coverImage: MediaImage.fromJson(json["coverImage"]),
        mediaListEntry: json["mediaListEntry"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "title": title.toJson(),
        "coverImage": coverImage.toJson(),
        "mediaListEntry": mediaListEntry,
      };
}

class SeparatedByYear {
  int year;
  List<CharacterMediaEdge> edges;
  SeparatedByYear({
    required this.year,
    required this.edges,
  });
}
