// To parse this JSON data, do
//
//     final infoModel = infoModelFromJson(jsonString);

import 'package:flutter/material.dart';
import 'dart:convert';

InfoModel infoModelFromJson(String str) => InfoModel.fromJson(json.decode(str));

String infoModelToJson(InfoModel data) => json.encode(data.toJson());

class InfoModel {
  InfoModel({
    required this.media,
  });

  Media media;

  factory InfoModel.fromJson(Map<String, dynamic> json) => InfoModel(
        media: Media.fromJson(json["Media"]),
      );

  Map<String, dynamic> toJson() => {
        "Media": media.toJson(),
      };
}

class Media {
  Media({
    required this.isFavourite,
    required this.bannerImage,
    required this.coverImage,
    required this.averageScore,
    required this.popularity,
    required this.genres,
    required this.title,
    required this.airingSchedule,
    required this.description,
    required this.source,
    required this.meanScore,
    required this.relations,
    required this.characters,
    required this.staffPreview,
    required this.stats,
    required this.episodes,
    required this.chapters,
    required this.trailer,
    required this.startDate,
    required this.endDate,
    required this.type,
    required this.season,
    required this.seasonYear,
    required this.recommendations,
    required this.duration,
    required this.format,
    required this.status,
  });

  String? bannerImage;
  MediaCoverImage coverImage;
  int? averageScore;
  int popularity;
  AiringSchedule airingSchedule;
  List<String> genres;
  MediaTitle title;
  String? description;
  String source;
  int? meanScore;
  Relations relations;
  Characters characters;
  StaffPreview staffPreview;
  Stats stats;
  int? episodes;
  int? chapters;
  String? type;
  Trailer? trailer;
  Date startDate;
  Date endDate;
  String? season;
  int? seasonYear;
  Recommendations? recommendations;
  String? format;
  String status;
  int? duration;
  bool isFavourite;

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        isFavourite: json['isFavourite'],
        bannerImage: json["bannerImage"],
        coverImage: MediaCoverImage.fromJson(json["coverImage"]),
        averageScore: json["averageScore"],
        popularity: json["popularity"],
        genres: List<String>.from(json["genres"].map((x) => x)),
        title: MediaTitle.fromJson(json["title"]),
        airingSchedule: AiringSchedule.fromJson(json["airingSchedule"]),
        description: json["description"],
        source: json["source"],
        meanScore: json["meanScore"],
        relations: Relations.fromJson(json["relations"]),
        characters: Characters.fromJson(json["characters"]),
        staffPreview: StaffPreview.fromJson(json["staffPreview"]),
        stats: Stats.fromJson(json["stats"]),
        episodes: json["episodes"],
        chapters: json['chapters'],
        trailer:
            json["trailer"] == null ? null : Trailer.fromJson(json["trailer"]),
        startDate: Date.fromJson(json["startDate"]),
        endDate: Date.fromJson(json["endDate"]),
        type: json["type"],
        season: json["season"],
        seasonYear: json["seasonYear"],
        recommendations: Recommendations.fromJson(json["recommendations"]),
        duration: json['duration'],
        format: json['format'],
        status: json['status'],
      );

  Map<String, dynamic> toJson() => {
        "bannerImage": bannerImage,
        "coverImage": coverImage.toJson(),
        "averageScore": averageScore,
        "popularity": popularity,
        "genres": List<dynamic>.from(genres.map((x) => x)),
        "title": title.toJson(),
        "airingSchedule": airingSchedule.toJson(),
        "description": description,
        "source": source,
        "meanScore": meanScore,
        "relations": relations.toJson(),
        "characters": characters.toJson(),
        "staffPreview": staffPreview.toJson(),
        "stats": stats.toJson(),
        "episodes": episodes,
        "trailer": trailer?.toJson() ?? null,
        "startDate": startDate.toJson(),
        "endDate": endDate.toJson(),
        "type": type,
        "season": season,
        "seasonYear": seasonYear,
        "recommendations": recommendations?.toJson() ?? null,
      };
}

class AiringSchedule {
  AiringSchedule({
    required this.nodes,
  });

  List<AiringScheduleNode> nodes;

  factory AiringSchedule.fromJson(Map<String, dynamic> json) => AiringSchedule(
        nodes: List<AiringScheduleNode>.from(
            json["nodes"].map((x) => AiringScheduleNode.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "nodes": List<dynamic>.from(nodes.map((x) => x.toJson())),
      };
}

class AiringScheduleNode {
  AiringScheduleNode({
    required this.episode,
    required this.airingAt,
  });

  int episode;
  int airingAt;

  factory AiringScheduleNode.fromJson(Map<String, dynamic> json) =>
      AiringScheduleNode(
        episode: json["episode"],
        airingAt: json["airingAt"],
      );

  Map<String, dynamic> toJson() => {
        "episode": episode,
        "airingAt": airingAt,
      };
}

class Characters {
  Characters({
    required this.edges,
  });

  List<CharactersEdge> edges;

  factory Characters.fromJson(Map<String, dynamic> json) => Characters(
        edges: List<CharactersEdge>.from(
            json["edges"].map((x) => CharactersEdge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "edges": List<dynamic>.from(edges.map((x) => x.toJson())),
      };
}

class CharactersEdge {
  CharactersEdge({
    required this.id,
    required this.role,
    required this.voiceActors,
    required this.node,
  });

  int id;
  String role;
  List<VoiceActorClass> voiceActors;
  VoiceActorClass node;

  factory CharactersEdge.fromJson(Map<String, dynamic> json) => CharactersEdge(
        id: json["id"],
        role: json["role"],
        voiceActors: List<VoiceActorClass>.from(
            json["voiceActors"].map((x) => VoiceActorClass.fromJson(x))),
        node: VoiceActorClass.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "role": role,
        "voiceActors": List<dynamic>.from(voiceActors.map((x) => x.toJson())),
        "node": node.toJson(),
      };
}

class VoiceActorClass {
  VoiceActorClass({
    required this.id,
    required this.name,
    required this.image,
    required this.language,
  });

  int id;
  Name name;
  MediaImage image;
  String? language;

  factory VoiceActorClass.fromJson(Map<String, dynamic> json) =>
      VoiceActorClass(
        id: json["id"],
        name: Name.fromJson(json["name"]),
        image: MediaImage.fromJson(json["image"]),
        language: json["language"] == null ? null : json["language"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name.toJson(),
        "image": image.toJson(),
        "language": language == null ? null : language,
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

class MediaCoverImage {
  MediaCoverImage({
    required this.extraLarge,
    required this.large,
    required this.medium,
    required this.color,
  });

  String extraLarge;
  String large;
  String medium;
  Color? color;

  static Color toColor(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  factory MediaCoverImage.fromJson(Map<String, dynamic> json) =>
      MediaCoverImage(
        extraLarge: json["extraLarge"],
        large: json["large"],
        medium: json["medium"],
        color: json['color'] == null ? null : toColor(json['color']),
      );

  Map<String, dynamic> toJson() => {
        "extraLarge": extraLarge,
        "large": large,
        "medium": medium,
      };
}

class Date {
  Date({
    required this.day,
    required this.month,
    required this.year,
  });

  int? day;
  int? month;
  int? year;

  factory Date.fromJson(Map<String, dynamic> json) => Date(
        day: json["day"] == null ? null : json["day"],
        month: json["month"] == null ? null : json["month"],
        year: json["year"] == null ? null : json["year"],
      );

  Map<String, dynamic> toJson() => {
        "day": day == null ? null : day,
        "month": month == null ? null : month,
        "year": year == null ? null : year,
      };
}

class Recommendations {
  Recommendations({
    required this.pageInfo,
    required this.nodes,
  });

  PageInfo pageInfo;
  List<RecommendationsNode> nodes;

  factory Recommendations.fromJson(Map<String, dynamic> json) =>
      Recommendations(
        pageInfo: PageInfo.fromJson(json["pageInfo"]),
        nodes: List<RecommendationsNode>.from(
            json["nodes"].map((x) => RecommendationsNode.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pageInfo": pageInfo.toJson(),
        "nodes": List<dynamic>.from(nodes.map((x) => x.toJson())),
      };
}

class RecommendationsNode {
  RecommendationsNode({
    required this.id,
    required this.rating,
    required this.mediaRecommendation,
  });

  int id;
  int rating;
  MediaRecommendation mediaRecommendation;

  factory RecommendationsNode.fromJson(Map<String, dynamic> json) =>
      RecommendationsNode(
        id: json["id"],
        rating: json["rating"],
        mediaRecommendation:
            MediaRecommendation.fromJson(json["mediaRecommendation"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "rating": rating,
        "mediaRecommendation": mediaRecommendation.toJson(),
      };
}

class MediaRecommendation {
  MediaRecommendation({
    required this.id,
    required this.title,
    required this.format,
    required this.type,
    required this.status,
    required this.coverImage,
  });

  int id;
  MediaRecommendationTitle title;
  String format;
  String type;
  String status;
  MediaImage coverImage;

  factory MediaRecommendation.fromJson(Map<String, dynamic> json) =>
      MediaRecommendation(
        id: json["id"],
        title: MediaRecommendationTitle.fromJson(json["title"]),
        format: json["format"],
        type: json["type"],
        status: json["status"],
        coverImage: MediaImage.fromJson(json["coverImage"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title.toJson(),
        "format": format,
        "type": type,
        "status": status,
        "coverImage": coverImage.toJson(),
      };
}

class MediaRecommendationTitle {
  MediaRecommendationTitle({
    required this.userPreferred,
  });

  String userPreferred;

  factory MediaRecommendationTitle.fromJson(Map<String, dynamic> json) =>
      MediaRecommendationTitle(
        userPreferred: json["userPreferred"],
      );

  Map<String, dynamic> toJson() => {
        "userPreferred": userPreferred,
      };
}

class PageInfo {
  PageInfo({
    required this.total,
  });

  int total;

  factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
      };
}

class Relations {
  Relations({
    required this.edges,
  });

  List<RelationsEdge> edges;

  factory Relations.fromJson(Map<String, dynamic> json) => Relations(
        edges: List<RelationsEdge>.from(
            json["edges"].map((x) => RelationsEdge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "edges": List<dynamic>.from(edges.map((x) => x.toJson())),
      };
}

class RelationsEdge {
  RelationsEdge({
    required this.id,
    required this.relationType,
    required this.node,
  });

  int id;
  String relationType;
  PurpleNode node;

  factory RelationsEdge.fromJson(Map<String, dynamic> json) => RelationsEdge(
        id: json["id"],
        relationType: json["relationType"],
        node: PurpleNode.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "relationType": relationType,
        "node": node.toJson(),
      };
}

class PurpleNode {
  PurpleNode({
    required this.id,
    required this.title,
    required this.format,
    required this.type,
    required this.status,
    required this.bannerImage,
    required this.coverImage,
  });

  int id;
  MediaRecommendationTitle title;
  String? format;
  String type;
  String status;
  String? bannerImage;
  NodeCoverImage coverImage;

  factory PurpleNode.fromJson(Map<String, dynamic> json) => PurpleNode(
        id: json["id"],
        title: MediaRecommendationTitle.fromJson(json["title"]),
        format: json["format"],
        type: json["type"],
        status: json["status"],
        bannerImage: json["bannerImage"],
        coverImage: NodeCoverImage.fromJson(json["coverImage"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title.toJson(),
        "format": format,
        "type": type,
        "status": status,
        "bannerImage": bannerImage,
        "coverImage": coverImage.toJson(),
      };
}

class NodeCoverImage {
  NodeCoverImage({
    required this.large,
    required this.medium,
  });

  String large;
  String medium;

  factory NodeCoverImage.fromJson(Map<String, dynamic> json) => NodeCoverImage(
        large: json["large"],
        medium: json["medium"],
      );

  Map<String, dynamic> toJson() => {
        "large": large,
        "medium": medium,
      };
}

class StaffPreview {
  StaffPreview({
    required this.edges,
  });

  List<StaffPreviewEdge> edges;

  factory StaffPreview.fromJson(Map<String, dynamic> json) => StaffPreview(
        edges: List<StaffPreviewEdge>.from(
            json["edges"].map((x) => StaffPreviewEdge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "edges": List<dynamic>.from(edges.map((x) => x.toJson())),
      };
}

class StaffPreviewEdge {
  StaffPreviewEdge({
    required this.id,
    required this.role,
    required this.node,
  });

  int id;
  String role;
  VoiceActorClass node;

  factory StaffPreviewEdge.fromJson(Map<String, dynamic> json) =>
      StaffPreviewEdge(
        id: json["id"],
        role: json["role"],
        node: VoiceActorClass.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "role": role,
        "node": node.toJson(),
      };
}

class Stats {
  Stats({
    required this.statusDistribution,
    required this.scoreDistribution,
  });

  List<StatusDistribution>? statusDistribution;
  List<ScoreDistribution>? scoreDistribution;

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        statusDistribution: json["statusDistribution"] == null
            ? null
            : List<StatusDistribution>.from(json["statusDistribution"]
                .map((x) => StatusDistribution.fromJson(x))),
        scoreDistribution: json["scoreDistribution"] == null
            ? null
            : List<ScoreDistribution>.from(json["scoreDistribution"]
                .map((x) => ScoreDistribution.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "statusDistribution":
            List<dynamic>.from(statusDistribution!.map((x) => x.toJson())),
        "scoreDistribution":
            List<dynamic>.from(scoreDistribution!.map((x) => x.toJson())),
      };
}

class ScoreDistribution {
  ScoreDistribution({
    required this.score,
    required this.amount,
  });

  int score;
  int amount;

  factory ScoreDistribution.fromJson(Map<String, dynamic> json) =>
      ScoreDistribution(
        score: json["score"],
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "score": score,
        "amount": amount,
      };
}

class StatusDistribution {
  StatusDistribution({
    required this.status,
    required this.amount,
  });

  String status;
  int amount;

  factory StatusDistribution.fromJson(Map<String, dynamic> json) =>
      StatusDistribution(
        status: json["status"],
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "amount": amount,
      };
}

class MediaTitle {
  MediaTitle({
    required this.userPreferred,
    required this.romaji,
    required this.english,
    required this.native,
  });

  String? userPreferred;
  String romaji;
  String? english;
  String native;

  factory MediaTitle.fromJson(Map<String, dynamic> json) => MediaTitle(
        userPreferred: json["userPreferred"],
        romaji: json["romaji"],
        english: json["english"],
        native: json["native"],
      );

  Map<String, dynamic> toJson() => {
        "userPreferred": userPreferred,
        "romaji": romaji,
        "english": english,
        "native": native,
      };
}

class Trailer {
  Trailer({
    required this.site,
    required this.id,
  });

  String site;
  String id;

  factory Trailer.fromJson(Map<String, dynamic> json) => Trailer(
        site: json["site"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "site": site,
        "id": id,
      };
}
