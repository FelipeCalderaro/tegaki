// To parse this JSON data, do
//
//     final userActivity = userActivityFromJson(jsonString);

import 'dart:convert';

UserActivity userActivityFromJson(String str) =>
    UserActivity.fromJson(json.decode(str));

String userActivityToJson(UserActivity data) => json.encode(data.toJson());

class UserActivity {
  UserActivity({
    required this.page,
  });

  Page page;

  factory UserActivity.fromJson(Map<String, dynamic> json) => UserActivity(
        page: Page.fromJson(json["Page"]),
      );

  Map<String, dynamic> toJson() => {
        "Page": page.toJson(),
      };
}

class Page {
  Page({
    required this.pageInfo,
    required this.activities,
  });

  PageInfo pageInfo;
  List<Activity> activities;

  factory Page.fromJson(Map<String, dynamic> json) => Page(
        pageInfo: PageInfo.fromJson(json["pageInfo"]),
        activities: List<Activity>.from(
            json["activities"].map((x) => Activity.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pageInfo": pageInfo.toJson(),
        "activities": List<dynamic>.from(activities.map((x) => x.toJson())),
      };
}

class Activity {
  Activity({
    required this.id,
    required this.userId,
    required this.type,
    required this.status,
    required this.progress,
    required this.replyCount,
    required this.isLocked,
    required this.isSubscribed,
    required this.isLiked,
    required this.likeCount,
    required this.createdAt,
    required this.user,
    required this.media,
  });

  int id;
  int userId;
  String type;
  String status;
  dynamic progress;
  int replyCount;
  bool isLocked;
  bool isSubscribed;
  bool isLiked;
  int likeCount;
  int createdAt;
  User user;
  Media media;

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
        id: json["id"],
        userId: json["userId"],
        type: json["type"],
        status: json["status"],
        progress: json["progress"],
        replyCount: json["replyCount"],
        isLocked: json["isLocked"],
        isSubscribed: json["isSubscribed"],
        isLiked: json["isLiked"],
        likeCount: json["likeCount"],
        createdAt: json["createdAt"],
        user: User.fromJson(json["user"]),
        media: Media.fromJson(json["media"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "type": type,
        "status": status,
        "progress": progress,
        "replyCount": replyCount,
        "isLocked": isLocked,
        "isSubscribed": isSubscribed,
        "isLiked": isLiked,
        "likeCount": likeCount,
        "createdAt": createdAt,
        "user": user.toJson(),
        "media": media.toJson(),
      };
}

class Media {
  Media({
    required this.id,
    required this.type,
    required this.status,
    required this.isAdult,
    required this.title,
    required this.bannerImage,
    required this.coverImage,
  });

  int id;
  String type;
  String status;
  bool isAdult;
  Title title;
  String? bannerImage;
  CoverImage coverImage;

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        id: json["id"],
        type: json["type"],
        status: json["status"],
        isAdult: json["isAdult"],
        title: Title.fromJson(json["title"]),
        bannerImage: json["bannerImage"],
        coverImage: CoverImage.fromJson(json["coverImage"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "status": status,
        "isAdult": isAdult,
        "title": title.toJson(),
        "bannerImage": bannerImage,
        "coverImage": coverImage.toJson(),
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
    required this.donatorTier,
    required this.donatorBadge,
    required this.avatar,
  });

  int id;
  String name;
  int donatorTier;
  String donatorBadge;
  CoverImage avatar;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        donatorTier: json["donatorTier"],
        donatorBadge: json["donatorBadge"],
        avatar: CoverImage.fromJson(json["avatar"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "donatorTier": donatorTier,
        "donatorBadge": donatorBadge,
        "avatar": avatar.toJson(),
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
