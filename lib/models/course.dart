// To parse this JSON data, do
//
//     final course = courseFromJson(jsonString);

import 'dart:convert';

Course courseFromJson(String str) => Course.fromJson(json.decode(str));

String courseToJson(Course data) => json.encode(data.toJson());

class Course {
  Course({
    required this.courseId,
    required this.userId,
    required this.title,
    required this.description,
    required this.status,
    required this.genre,
    required this.createdAt,
    required this.updatedAt,
    required this.image,
    required this.coverUrl,
    required this.sessionCount,
    required this.sessionLevels,
  });

  int courseId;
  int userId;
  String title;
  String description;
  int status;
  String genre;
  DateTime createdAt;
  DateTime updatedAt;
  String image;
  String coverUrl;
  String sessionCount;
  List<SessionLevel> sessionLevels;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        courseId: json["course_id"],
        userId: json["user_id"],
        title: json["title"],
        description: json["description"],
        status: json["status"],
        genre: json["genre"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        image: json["image"],
        coverUrl: json["cover_url"],
        sessionCount: json["sessionCount"],
        sessionLevels: List<SessionLevel>.from(
            json["session_levels"].map((x) => SessionLevel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "course_id": courseId,
        "user_id": userId,
        "title": title,
        "description": description,
        "status": status,
        "genre": genre,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "image": image,
        "cover_url": coverUrl,
        "sessionCount": sessionCount,
        "session_levels":
            List<dynamic>.from(sessionLevels.map((x) => x.toJson())),
      };
}

class SessionLevel {
  SessionLevel({
    required this.id,
    required this.desc,
    required this.count,
  });

  int id;
  String desc;
  int count;

  factory SessionLevel.fromJson(Map<String, dynamic> json) => SessionLevel(
        id: json["id"],
        desc: json["desc"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "desc": desc,
        "count": count,
      };
}
