// To parse this JSON data, do
//
//     final userInProgress = userInProgressFromJson(jsonString);

import 'dart:convert';

UserInProgress userInProgressFromJson(String str) =>
    UserInProgress.fromJson(json.decode(str));

String userInProgressToJson(UserInProgress data) => json.encode(data.toJson());

class UserInProgress {
  UserInProgress({
    required this.page,
  });

  Page page;

  factory UserInProgress.fromJson(Map<String, dynamic> json) => UserInProgress(
        page: Page.fromJson(json["Page"]),
      );

  Map<String, dynamic> toJson() => {
        "Page": page.toJson(),
      };
}

class Page {
  Page({
    required this.mediaList,
  });

  List<MediaList> mediaList;

  factory Page.fromJson(Map<String, dynamic> json) => Page(
        mediaList: List<MediaList>.from(
            json["mediaList"].map((x) => MediaList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "mediaList": List<dynamic>.from(mediaList.map((x) => x.toJson())),
      };
}

class MediaList {
  MediaList({
    required this.id,
    required this.status,
    required this.score,
    required this.progress,
    required this.progressVolumes,
    required this.media,
  });

  int id;
  String status;
  int score;
  int? progress;
  int? progressVolumes;
  Media media;

  factory MediaList.fromJson(Map<String, dynamic> json) => MediaList(
        id: json["id"],
        status: json["status"],
        score: json["score"],
        progress: json["progress"],
        progressVolumes:
            json["progressVolumes"] == null ? null : json["progressVolumes"],
        media: Media.fromJson(json["media"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "score": score,
        "progress": progress,
        "progressVolumes": progressVolumes == null ? null : progressVolumes,
        "media": media.toJson(),
      };
}

class Media {
  Media({
    required this.id,
    required this.type,
    required this.status,
    required this.format,
    required this.episodes,
    required this.bannerImage,
    required this.title,
    required this.coverImage,
    required this.nextAiringEpisode,
  });

  int id;
  String type;
  String status;
  String format;
  int? episodes;
  String? bannerImage;
  Title title;
  CoverImage coverImage;
  NextAiringEpisode? nextAiringEpisode;

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        id: json["id"],
        type: json["type"],
        status: json["status"],
        format: json["format"],
        episodes: json["episodes"] == null ? null : json["episodes"],
        bannerImage: json["bannerImage"],
        title: Title.fromJson(json["title"]),
        coverImage: CoverImage.fromJson(json["coverImage"]),
        nextAiringEpisode: json["nextAiringEpisode"] == null
            ? null
            : NextAiringEpisode.fromJson(json["nextAiringEpisode"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "status": status,
        "format": format,
        "episodes": episodes == null ? null : episodes,
        "bannerImage": bannerImage,
        "title": title.toJson(),
        "coverImage": coverImage.toJson(),
        "nextAiringEpisode":
            nextAiringEpisode == null ? null : nextAiringEpisode!.toJson(),
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

class NextAiringEpisode {
  NextAiringEpisode({
    required this.airingAt,
    required this.timeUntilAiring,
    required this.episode,
  });

  int airingAt;
  int timeUntilAiring;
  int episode;

  factory NextAiringEpisode.fromJson(Map<String, dynamic> json) =>
      NextAiringEpisode(
        airingAt: json["airingAt"],
        timeUntilAiring: json["timeUntilAiring"],
        episode: json["episode"],
      );

  Map<String, dynamic> toJson() => {
        "airingAt": airingAt,
        "timeUntilAiring": timeUntilAiring,
        "episode": episode,
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
