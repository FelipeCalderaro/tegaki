// To parse this JSON data, do
//
//     final saveMediaEntry = saveMediaEntryFromJson(jsonString);

import 'dart:convert';

SaveMediaEntry saveMediaEntryFromJson(String str) =>
    SaveMediaEntry.fromJson(json.decode(str));

String saveMediaEntryToJson(SaveMediaEntry data) => json.encode(data.toJson());

class SaveMediaEntry {
  SaveMediaEntry({
    required this.saveMediaListEntry,
  });

  SaveMediaListEntry saveMediaListEntry;

  factory SaveMediaEntry.fromJson(Map<String, dynamic> json) => SaveMediaEntry(
        saveMediaListEntry:
            SaveMediaListEntry.fromJson(json["SaveMediaListEntry"]),
      );

  Map<String, dynamic> toJson() => {
        "SaveMediaListEntry": saveMediaListEntry.toJson(),
      };
}

class SaveMediaListEntry {
  SaveMediaListEntry({
    required this.id,
    required this.mediaId,
    required this.status,
    required this.score,
    required this.advancedScores,
    required this.progress,
    required this.progressVolumes,
    required this.repeat,
    required this.priority,
    required this.private,
    required this.hiddenFromStatusLists,
    required this.customLists,
    required this.notes,
    required this.updatedAt,
    required this.startedAt,
    required this.completedAt,
    required this.user,
    required this.media,
  });

  int id;
  int mediaId;
  String status;
  int score;
  AdvancedScores advancedScores;
  int progress;
  dynamic progressVolumes;
  int repeat;
  int priority;
  bool private;
  bool hiddenFromStatusLists;
  dynamic customLists;
  dynamic notes;
  int updatedAt;
  TedAt startedAt;
  TedAt completedAt;
  User user;
  Media media;

  factory SaveMediaListEntry.fromJson(Map<String, dynamic> json) =>
      SaveMediaListEntry(
        id: json["id"],
        mediaId: json["mediaId"],
        status: json["status"],
        score: json["score"],
        advancedScores: AdvancedScores.fromJson(json["advancedScores"]),
        progress: json["progress"],
        progressVolumes: json["progressVolumes"],
        repeat: json["repeat"],
        priority: json["priority"],
        private: json["private"],
        hiddenFromStatusLists: json["hiddenFromStatusLists"],
        customLists: json["customLists"],
        notes: json["notes"],
        updatedAt: json["updatedAt"],
        startedAt: TedAt.fromJson(json["startedAt"]),
        completedAt: TedAt.fromJson(json["completedAt"]),
        user: User.fromJson(json["user"]),
        media: Media.fromJson(json["media"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "mediaId": mediaId,
        "status": status,
        "score": score,
        "advancedScores": advancedScores.toJson(),
        "progress": progress,
        "progressVolumes": progressVolumes,
        "repeat": repeat,
        "priority": priority,
        "private": private,
        "hiddenFromStatusLists": hiddenFromStatusLists,
        "customLists": customLists,
        "notes": notes,
        "updatedAt": updatedAt,
        "startedAt": startedAt.toJson(),
        "completedAt": completedAt.toJson(),
        "user": user.toJson(),
        "media": media.toJson(),
      };
}

class AdvancedScores {
  AdvancedScores({
    required this.story,
    required this.characters,
    required this.visuals,
    required this.audio,
    required this.enjoyment,
  });

  int story;
  int characters;
  int visuals;
  int audio;
  int enjoyment;

  factory AdvancedScores.fromJson(Map<String, dynamic> json) => AdvancedScores(
        story: json["Story"],
        characters: json["Characters"],
        visuals: json["Visuals"],
        audio: json["Audio"],
        enjoyment: json["Enjoyment"],
      );

  Map<String, dynamic> toJson() => {
        "Story": story,
        "Characters": characters,
        "Visuals": visuals,
        "Audio": audio,
        "Enjoyment": enjoyment,
      };
}

class TedAt {
  TedAt({
    required this.year,
    required this.month,
    required this.day,
  });

  dynamic year;
  dynamic month;
  dynamic day;

  factory TedAt.fromJson(Map<String, dynamic> json) => TedAt(
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

class Media {
  Media({
    required this.id,
    required this.title,
    required this.coverImage,
    required this.type,
    required this.format,
    required this.status,
    required this.episodes,
    required this.volumes,
    required this.chapters,
    required this.averageScore,
    required this.popularity,
    required this.isAdult,
    required this.startDate,
  });

  int id;
  Title title;
  CoverImage coverImage;
  String type;
  String format;
  String status;
  int? episodes;
  dynamic volumes;
  dynamic chapters;
  int averageScore;
  int popularity;
  bool isAdult;
  StartDate startDate;

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        id: json["id"],
        title: Title.fromJson(json["title"]),
        coverImage: CoverImage.fromJson(json["coverImage"]),
        type: json["type"],
        format: json["format"],
        status: json["status"],
        episodes: json["episodes"],
        volumes: json["volumes"],
        chapters: json["chapters"],
        averageScore: json["averageScore"],
        popularity: json["popularity"],
        isAdult: json["isAdult"],
        startDate: StartDate.fromJson(json["startDate"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title.toJson(),
        "coverImage": coverImage.toJson(),
        "type": type,
        "format": format,
        "status": status,
        "episodes": episodes,
        "volumes": volumes,
        "chapters": chapters,
        "averageScore": averageScore,
        "popularity": popularity,
        "isAdult": isAdult,
        "startDate": startDate.toJson(),
      };
}

class CoverImage {
  CoverImage({
    required this.large,
  });

  String large;

  factory CoverImage.fromJson(Map<String, dynamic> json) => CoverImage(
        large: json["large"],
      );

  Map<String, dynamic> toJson() => {
        "large": large,
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

class User {
  User({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
