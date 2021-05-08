// To parse this JSON data, do
//
//     final userInfo = userInfoFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UserInfo userInfoFromJson(String str) => UserInfo.fromJson(json.decode(str));

String userInfoToJson(UserInfo data) => json.encode(data.toJson());

class UserInfo {
  UserInfo({
    required this.user,
  });

  User user;

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        user: User.fromJson(json["User"]),
      );

  Map<String, dynamic> toJson() => {
        "User": user.toJson(),
      };
}

class User {
  User({
    required this.id,
    required this.name,
    required this.avatar,
    required this.bannerImage,
    required this.about,
    required this.isFollowing,
    required this.isFollower,
    required this.donatorTier,
    required this.donatorBadge,
    required this.moderatorStatus,
    required this.isBlocked,
    required this.bans,
    required this.options,
    required this.mediaListOptions,
    required this.statistics,
    required this.stats,
    required this.favourites,
  });

  int id;
  String name;
  Avatar avatar;
  dynamic bannerImage;
  dynamic about;
  bool isFollowing;
  bool isFollower;
  int donatorTier;
  String donatorBadge;
  dynamic moderatorStatus;
  bool isBlocked;
  List<dynamic> bans;
  Options options;
  MediaListOptions mediaListOptions;
  Statistics statistics;
  Stats stats;
  Favourites favourites;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        avatar: Avatar.fromJson(json["avatar"]),
        bannerImage: json["bannerImage"],
        about: json["about"],
        isFollowing: json["isFollowing"],
        isFollower: json["isFollower"],
        donatorTier: json["donatorTier"],
        donatorBadge: json["donatorBadge"],
        moderatorStatus: json["moderatorStatus"],
        isBlocked: json["isBlocked"],
        bans: List<dynamic>.from(json["bans"].map((x) => x)),
        options: Options.fromJson(json["options"]),
        mediaListOptions: MediaListOptions.fromJson(json["mediaListOptions"]),
        statistics: Statistics.fromJson(json["statistics"]),
        stats: Stats.fromJson(json["stats"]),
        favourites: Favourites.fromJson(json["favourites"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "avatar": avatar.toJson(),
        "bannerImage": bannerImage,
        "about": about,
        "isFollowing": isFollowing,
        "isFollower": isFollower,
        "donatorTier": donatorTier,
        "donatorBadge": donatorBadge,
        "moderatorStatus": moderatorStatus,
        "isBlocked": isBlocked,
        "bans": List<dynamic>.from(bans.map((x) => x)),
        "options": options.toJson(),
        "mediaListOptions": mediaListOptions.toJson(),
        "statistics": statistics.toJson(),
        "stats": stats.toJson(),
        "favourites": favourites.toJson(),
      };
}

class Avatar {
  Avatar({
    required this.large,
  });

  String large;

  factory Avatar.fromJson(Map<String, dynamic> json) => Avatar(
        large: json["large"],
      );

  Map<String, dynamic> toJson() => {
        "large": large,
      };
}

class Favourites {
  Favourites({
    required this.anime,
    required this.manga,
    required this.characters,
    required this.staff,
    required this.studios,
  });

  CharactersClass anime;
  CharactersClass manga;
  CharactersClass characters;
  CharactersClass staff;
  CharactersClass studios;

  factory Favourites.fromJson(Map<String, dynamic> json) => Favourites(
        anime: CharactersClass.fromJson(json["anime"]),
        manga: CharactersClass.fromJson(json["manga"]),
        characters: CharactersClass.fromJson(json["characters"]),
        staff: CharactersClass.fromJson(json["staff"]),
        studios: CharactersClass.fromJson(json["studios"]),
      );

  Map<String, dynamic> toJson() => {
        "anime": anime.toJson(),
        "manga": manga.toJson(),
        "characters": characters.toJson(),
        "staff": staff.toJson(),
        "studios": studios.toJson(),
      };
}

class CharactersClass {
  CharactersClass({
    required this.edges,
  });

  List<Edge> edges;

  factory CharactersClass.fromJson(Map<String, dynamic> json) =>
      CharactersClass(
        edges: List<Edge>.from(json["edges"].map((x) => Edge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "edges": List<dynamic>.from(edges.map((x) => x.toJson())),
      };
}

class Edge {
  Edge({
    required this.favouriteOrder,
    required this.node,
  });

  int favouriteOrder;
  Node node;

  factory Edge.fromJson(Map<String, dynamic> json) => Edge(
        favouriteOrder: json["favouriteOrder"],
        node: Node.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "favouriteOrder": favouriteOrder,
        "node": node.toJson(),
      };
}

class Node {
  Node({
    required this.id,
    required this.name,
    required this.image,
    required this.type,
    required this.status,
    required this.format,
    required this.isAdult,
    required this.bannerImage,
    required this.title,
    required this.coverImage,
    required this.startDate,
  });

  int id;
  Name? name;
  Avatar? image;
  String? type;
  String? status;
  String? format;
  bool? isAdult;
  String? bannerImage;
  Title? title;
  Avatar? coverImage;
  StartDate? startDate;

  factory Node.fromJson(Map<String, dynamic> json) => Node(
        id: json["id"],
        name: json["name"] == null ? null : Name.fromJson(json["name"]),
        image: json["image"] == null ? null : Avatar.fromJson(json["image"]),
        type: json["type"] == null ? null : json["type"],
        status: json["status"] == null ? null : json["status"],
        format: json["format"] == null ? null : json["format"],
        isAdult: json["isAdult"] == null ? null : json["isAdult"],
        bannerImage: json["bannerImage"] == null ? null : json["bannerImage"],
        title: json["title"] == null ? null : Title.fromJson(json["title"]),
        coverImage: json["coverImage"] == null
            ? null
            : Avatar.fromJson(json["coverImage"]),
        startDate: json["startDate"] == null
            ? null
            : StartDate.fromJson(json["startDate"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name == null ? null : name!.toJson(),
        "image": image == null ? null : image!.toJson(),
        "type": type == null ? null : type,
        "status": status == null ? null : status,
        "format": format == null ? null : format,
        "isAdult": isAdult == null ? null : isAdult,
        "bannerImage": bannerImage == null ? null : bannerImage,
        "title": title == null ? null : title!.toJson(),
        "coverImage": coverImage == null ? null : coverImage!.toJson(),
        "startDate": startDate == null ? null : startDate!.toJson(),
      };
}

class Name {
  Name({
    required this.full,
  });

  String full;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        full: json["full"],
      );

  Map<String, dynamic> toJson() => {
        "full": full,
      };
}

class StartDate {
  StartDate({
    required this.year,
  });

  int year;

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

class MediaListOptions {
  MediaListOptions({
    required this.scoreFormat,
  });

  String scoreFormat;

  factory MediaListOptions.fromJson(Map<String, dynamic> json) =>
      MediaListOptions(
        scoreFormat: json["scoreFormat"],
      );

  Map<String, dynamic> toJson() => {
        "scoreFormat": scoreFormat,
      };
}

class Options {
  Options({
    required this.profileColor,
  });

  String profileColor;

  factory Options.fromJson(Map<String, dynamic> json) => Options(
        profileColor: json["profileColor"],
      );

  Map<String, dynamic> toJson() => {
        "profileColor": profileColor,
      };
}

class Statistics {
  Statistics({
    required this.anime,
    required this.manga,
  });

  StatisticsAnime anime;
  Manga manga;

  factory Statistics.fromJson(Map<String, dynamic> json) => Statistics(
        anime: StatisticsAnime.fromJson(json["anime"]),
        manga: Manga.fromJson(json["manga"]),
      );

  Map<String, dynamic> toJson() => {
        "anime": anime.toJson(),
        "manga": manga.toJson(),
      };
}

class StatisticsAnime {
  StatisticsAnime({
    required this.count,
    required this.meanScore,
    required this.standardDeviation,
    required this.minutesWatched,
    required this.episodesWatched,
    required this.genrePreview,
  });

  int count;
  int meanScore;
  int standardDeviation;
  int minutesWatched;
  int episodesWatched;
  List<dynamic> genrePreview;

  factory StatisticsAnime.fromJson(Map<String, dynamic> json) =>
      StatisticsAnime(
        count: json["count"],
        meanScore: json["meanScore"],
        standardDeviation: json["standardDeviation"],
        minutesWatched: json["minutesWatched"],
        episodesWatched: json["episodesWatched"],
        genrePreview: List<dynamic>.from(json["genrePreview"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "meanScore": meanScore,
        "standardDeviation": standardDeviation,
        "minutesWatched": minutesWatched,
        "episodesWatched": episodesWatched,
        "genrePreview": List<dynamic>.from(genrePreview.map((x) => x)),
      };
}

class Manga {
  Manga({
    required this.count,
    required this.meanScore,
    required this.standardDeviation,
    required this.chaptersRead,
    required this.volumesRead,
    required this.genrePreview,
  });

  int count;
  int meanScore;
  int standardDeviation;
  int chaptersRead;
  int volumesRead;
  List<dynamic> genrePreview;

  factory Manga.fromJson(Map<String, dynamic> json) => Manga(
        count: json["count"],
        meanScore: json["meanScore"],
        standardDeviation: json["standardDeviation"],
        chaptersRead: json["chaptersRead"],
        volumesRead: json["volumesRead"],
        genrePreview: List<dynamic>.from(json["genrePreview"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "meanScore": meanScore,
        "standardDeviation": standardDeviation,
        "chaptersRead": chaptersRead,
        "volumesRead": volumesRead,
        "genrePreview": List<dynamic>.from(genrePreview.map((x) => x)),
      };
}

class Stats {
  Stats({
    required this.activityHistory,
  });

  List<ActivityHistory>? activityHistory;

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        activityHistory: json["activityHistory"] == null
            ? null
            : List<ActivityHistory>.from(json["activityHistory"]
                .map((x) => ActivityHistory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "activityHistory":
            List<dynamic>.from(activityHistory!.map((x) => x.toJson())),
      };
}

class ActivityHistory {
  ActivityHistory({
    required this.date,
    required this.amount,
    required this.level,
  });

  int date;
  int amount;
  int level;

  factory ActivityHistory.fromJson(Map<String, dynamic> json) =>
      ActivityHistory(
        date: json["date"],
        amount: json["amount"],
        level: json["level"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "amount": amount,
        "level": level,
      };
}
