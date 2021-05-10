// To parse this JSON data, do
//
//     final mediaListCollection = mediaListCollectionFromJson(jsonString);

import 'dart:convert';

MangaListCollection mediaListCollectionFromJson(String str) =>
    MangaListCollection.fromJson(json.decode(str));

String mediaListCollectionToJson(MangaListCollection data) =>
    json.encode(data.toJson());

class MangaListCollection {
  MangaListCollection({
    required this.mediaListCollection,
  });

  MangaListCollectionClass mediaListCollection;

  factory MangaListCollection.fromJson(Map<String, dynamic> json) =>
      MangaListCollection(
        mediaListCollection:
            MangaListCollectionClass.fromJson(json["MediaListCollection"]),
      );

  Map<String, dynamic> toJson() => {
        "MediaListCollection": mediaListCollection.toJson(),
      };
}

class MangaListCollectionClass {
  MangaListCollectionClass({
    required this.lists,
    required this.user,
  });

  List<ListElement> lists;
  User user;

  factory MangaListCollectionClass.fromJson(Map<String, dynamic> json) =>
      MangaListCollectionClass(
        lists: List<ListElement>.from(
            json["lists"].map((x) => ListElement.fromJson(x))),
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "lists": List<dynamic>.from(lists.map((x) => x.toJson())),
        "user": user.toJson(),
      };
}

class ListElement {
  ListElement({
    required this.name,
    required this.isCustomList,
    required this.isCompletedList,
    required this.entries,
  });

  String name;
  bool isCustomList;
  bool isCompletedList;
  List<Entry> entries;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        name: json["name"],
        isCustomList: json["isCustomList"],
        isCompletedList: json["isCompletedList"],
        entries:
            List<Entry>.from(json["entries"].map((x) => Entry.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "isCustomList": isCustomList,
        "isCompletedList": isCompletedList,
        "entries": List<dynamic>.from(entries.map((x) => x.toJson())),
      };
}

class Entry {
  Entry({
    required this.id,
    required this.mediaId,
    required this.status,
    required this.score,
    required this.progress,
    required this.progressVolumes,
    required this.repeat,
    required this.priority,
    required this.private,
    required this.hiddenFromStatusLists,
    required this.customLists,
    required this.advancedScores,
    required this.notes,
    required this.updatedAt,
    required this.startedAt,
    required this.completedAt,
    required this.media,
  });

  int id;
  int mediaId;
  String status;
  int score;
  int progress;
  dynamic progressVolumes;
  int repeat;
  int priority;
  bool private;
  bool hiddenFromStatusLists;
  dynamic customLists;
  AdvancedScores advancedScores;
  dynamic notes;
  int updatedAt;
  CompletedAt startedAt;
  CompletedAt completedAt;
  Media media;

  factory Entry.fromJson(Map<String, dynamic> json) => Entry(
        id: json["id"],
        mediaId: json["mediaId"],
        status: json["status"],
        score: json["score"],
        progress: json["progress"],
        progressVolumes: json["progressVolumes"],
        repeat: json["repeat"],
        priority: json["priority"],
        private: json["private"],
        hiddenFromStatusLists: json["hiddenFromStatusLists"],
        customLists: json["customLists"],
        advancedScores: AdvancedScores.fromJson(json["advancedScores"]),
        notes: json["notes"],
        updatedAt: json["updatedAt"],
        startedAt: CompletedAt.fromJson(json["startedAt"]),
        completedAt: CompletedAt.fromJson(json["completedAt"]),
        media: Media.fromJson(json["media"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "mediaId": mediaId,
        "status": status,
        "score": score,
        "progress": progress,
        "progressVolumes": progressVolumes,
        "repeat": repeat,
        "priority": priority,
        "private": private,
        "hiddenFromStatusLists": hiddenFromStatusLists,
        "customLists": customLists,
        "advancedScores": advancedScores.toJson(),
        "notes": notes,
        "updatedAt": updatedAt,
        "startedAt": startedAt.toJson(),
        "completedAt": completedAt.toJson(),
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

class CompletedAt {
  CompletedAt({
    required this.year,
    required this.month,
    required this.day,
  });

  int? year;
  int? month;
  int? day;

  factory CompletedAt.fromJson(Map<String, dynamic> json) => CompletedAt(
        year: json["year"] == null ? null : json["year"],
        month: json["month"] == null ? null : json["month"],
        day: json["day"] == null ? null : json["day"],
      );

  Map<String, dynamic> toJson() => {
        "year": year == null ? null : year,
        "month": month == null ? null : month,
        "day": day == null ? null : day,
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
    required this.countryOfOrigin,
    required this.genres,
    required this.bannerImage,
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
  String countryOfOrigin;
  List<String> genres;
  String? bannerImage;
  CompletedAt startDate;

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
        countryOfOrigin: json["countryOfOrigin"],
        genres: List<String>.from(json["genres"].map((x) => x)),
        bannerImage: json["bannerImage"],
        startDate: CompletedAt.fromJson(json["startDate"]),
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
        "countryOfOrigin": countryOfOrigin,
        "genres": List<dynamic>.from(genres.map((x) => x)),
        "bannerImage": bannerImage,
        "startDate": startDate.toJson(),
      };
}

class CoverImage {
  CoverImage({
    required this.extraLarge,
    required this.large,
  });

  String extraLarge;
  String large;

  factory CoverImage.fromJson(Map<String, dynamic> json) => CoverImage(
        extraLarge: json["extraLarge"],
        large: json["large"],
      );

  Map<String, dynamic> toJson() => {
        "extraLarge": extraLarge,
        "large": large,
      };
}

class Title {
  Title({
    required this.userPreferred,
    required this.romaji,
    required this.english,
    required this.native,
  });

  String userPreferred;
  String romaji;
  String? english;
  String native;

  factory Title.fromJson(Map<String, dynamic> json) => Title(
        userPreferred: json["userPreferred"],
        romaji: json["romaji"],
        english: json["english"] == null ? null : json["english"],
        native: json["native"],
      );

  Map<String, dynamic> toJson() => {
        "userPreferred": userPreferred,
        "romaji": romaji,
        "english": english == null ? null : english,
        "native": native,
      };
}

class User {
  User({
    required this.id,
    required this.name,
    required this.avatar,
    required this.mediaListOptions,
  });

  int id;
  String name;
  Avatar avatar;
  MediaListOptions mediaListOptions;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        avatar: Avatar.fromJson(json["avatar"]),
        mediaListOptions: MediaListOptions.fromJson(json["mediaListOptions"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "avatar": avatar.toJson(),
        "mediaListOptions": mediaListOptions.toJson(),
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

class MediaListOptions {
  MediaListOptions({
    required this.scoreFormat,
    required this.rowOrder,
    required this.list,
    required this.mangaList,
  });

  String scoreFormat;
  String rowOrder;
  ListClass? list;
  ListClass mangaList;

  factory MediaListOptions.fromJson(Map<String, dynamic> json) =>
      MediaListOptions(
        scoreFormat: json["scoreFormat"],
        rowOrder: json["rowOrder"],
        list: json["List"] == null ? null : ListClass.fromJson(json["List"]),
        mangaList: ListClass.fromJson(json["mangaList"]),
      );

  Map<String, dynamic> toJson() => {
        "scoreFormat": scoreFormat,
        "rowOrder": rowOrder,
        "List": list!.toJson(),
        "mangaList": mangaList.toJson(),
      };
}

class ListClass {
  ListClass({
    required this.sectionOrder,
    required this.customLists,
    required this.splitCompletedSectionByFormat,
    required this.theme,
  });

  List<String> sectionOrder;
  List<dynamic> customLists;
  bool splitCompletedSectionByFormat;
  Theme theme;

  factory ListClass.fromJson(Map<String, dynamic> json) => ListClass(
        sectionOrder: List<String>.from(json["sectionOrder"].map((x) => x)),
        customLists: List<dynamic>.from(json["customLists"].map((x) => x)),
        splitCompletedSectionByFormat: json["splitCompletedSectionByFormat"],
        theme: Theme.fromJson(json["theme"]),
      );

  Map<String, dynamic> toJson() => {
        "sectionOrder": List<dynamic>.from(sectionOrder.map((x) => x)),
        "customLists": List<dynamic>.from(customLists.map((x) => x)),
        "splitCompletedSectionByFormat": splitCompletedSectionByFormat,
        "theme": theme.toJson(),
      };
}

class Theme {
  Theme({
    required this.themeType,
    required this.theme,
    required this.coverImages,
  });

  String themeType;
  String theme;
  String coverImages;

  factory Theme.fromJson(Map<String, dynamic> json) => Theme(
        themeType: json["themeType"],
        theme: json["theme"],
        coverImages: json["coverImages"],
      );

  Map<String, dynamic> toJson() => {
        "themeType": themeType,
        "theme": theme,
        "coverImages": coverImages,
      };
}
