// To parse this JSON data, do
//
//     final userConfigs = userConfigsFromJson(jsonString);

import 'dart:convert';

UserConfigs userConfigsFromJson(String str) =>
    UserConfigs.fromJson(json.decode(str));

String userConfigsToJson(UserConfigs data) => json.encode(data.toJson());

class UserConfigs {
  UserConfigs({
    required this.viewer,
  });

  Viewer viewer;

  factory UserConfigs.fromJson(Map<String, dynamic> json) => UserConfigs(
        viewer: Viewer.fromJson(json["Viewer"]),
      );

  Map<String, dynamic> toJson() => {
        "Viewer": viewer.toJson(),
      };
}

class Viewer {
  Viewer({
    required this.id,
    required this.name,
    required this.about,
    required this.avatar,
    required this.bannerImage,
    required this.unreadNotificationCount,
    required this.donatorTier,
    required this.donatorBadge,
    required this.moderatorStatus,
    required this.options,
    required this.mediaListOptions,
  });

  int id;
  String name;
  dynamic about;
  Avatar avatar;
  dynamic bannerImage;
  int unreadNotificationCount;
  int donatorTier;
  String donatorBadge;
  dynamic moderatorStatus;
  Options options;
  MediaListOptions mediaListOptions;

  factory Viewer.fromJson(Map<String, dynamic> json) => Viewer(
        id: json["id"],
        name: json["name"],
        about: json["about"],
        avatar: Avatar.fromJson(json["avatar"]),
        bannerImage: json["bannerImage"],
        unreadNotificationCount: json["unreadNotificationCount"],
        donatorTier: json["donatorTier"],
        donatorBadge: json["donatorBadge"],
        moderatorStatus: json["moderatorStatus"],
        options: Options.fromJson(json["options"]),
        mediaListOptions: MediaListOptions.fromJson(json["mediaListOptions"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "about": about,
        "avatar": avatar.toJson(),
        "bannerImage": bannerImage,
        "unreadNotificationCount": unreadNotificationCount,
        "donatorTier": donatorTier,
        "donatorBadge": donatorBadge,
        "moderatorStatus": moderatorStatus,
        "options": options.toJson(),
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
    required this.animeList,
    required this.mangaList,
  });

  String scoreFormat;
  String rowOrder;
  AnimeListClass animeList;
  AnimeListClass mangaList;

  factory MediaListOptions.fromJson(Map<String, dynamic> json) =>
      MediaListOptions(
        scoreFormat: json["scoreFormat"],
        rowOrder: json["rowOrder"],
        animeList: AnimeListClass.fromJson(json["animeList"]),
        mangaList: AnimeListClass.fromJson(json["mangaList"]),
      );

  Map<String, dynamic> toJson() => {
        "scoreFormat": scoreFormat,
        "rowOrder": rowOrder,
        "animeList": animeList.toJson(),
        "mangaList": mangaList.toJson(),
      };
}

class AnimeListClass {
  AnimeListClass({
    required this.customLists,
    required this.sectionOrder,
    required this.splitCompletedSectionByFormat,
    required this.advancedScoring,
    required this.advancedScoringEnabled,
  });

  List<dynamic> customLists;
  List<String> sectionOrder;
  bool splitCompletedSectionByFormat;
  List<String> advancedScoring;
  bool advancedScoringEnabled;

  factory AnimeListClass.fromJson(Map<String, dynamic> json) => AnimeListClass(
        customLists: List<dynamic>.from(json["customLists"].map((x) => x)),
        sectionOrder: List<String>.from(json["sectionOrder"].map((x) => x)),
        splitCompletedSectionByFormat: json["splitCompletedSectionByFormat"],
        advancedScoring:
            List<String>.from(json["advancedScoring"].map((x) => x)),
        advancedScoringEnabled: json["advancedScoringEnabled"],
      );

  Map<String, dynamic> toJson() => {
        "customLists": List<dynamic>.from(customLists.map((x) => x)),
        "sectionOrder": List<dynamic>.from(sectionOrder.map((x) => x)),
        "splitCompletedSectionByFormat": splitCompletedSectionByFormat,
        "advancedScoring": List<dynamic>.from(advancedScoring.map((x) => x)),
        "advancedScoringEnabled": advancedScoringEnabled,
      };
}

class Options {
  Options({
    required this.titleLanguage,
    required this.airingNotifications,
    required this.displayAdultContent,
    required this.profileColor,
    required this.notificationOptions,
  });

  String titleLanguage;
  bool airingNotifications;
  bool displayAdultContent;
  String profileColor;
  List<NotificationOption> notificationOptions;

  factory Options.fromJson(Map<String, dynamic> json) => Options(
        titleLanguage: json["titleLanguage"],
        airingNotifications: json["airingNotifications"],
        displayAdultContent: json["displayAdultContent"],
        profileColor: json["profileColor"],
        notificationOptions: List<NotificationOption>.from(
            json["notificationOptions"]
                .map((x) => NotificationOption.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "titleLanguage": titleLanguage,
        "airingNotifications": airingNotifications,
        "displayAdultContent": displayAdultContent,
        "profileColor": profileColor,
        "notificationOptions":
            List<dynamic>.from(notificationOptions.map((x) => x.toJson())),
      };
}

class NotificationOption {
  NotificationOption({
    required this.type,
    required this.enabled,
  });

  String type;
  bool enabled;

  factory NotificationOption.fromJson(Map<String, dynamic> json) =>
      NotificationOption(
        type: json["type"],
        enabled: json["enabled"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "enabled": enabled,
      };
}
