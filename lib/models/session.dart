// To parse this JSON data, do
//
//     final session = sessionFromJson(jsonString);

import 'dart:convert';

Session sessionFromJson(String str) => Session.fromJson(json.decode(str));

String sessionToJson(Session data) => json.encode(data.toJson());

class Session {
  Session({
    required this.sessionId,
    required this.courseId,
    required this.categoryType,
    required this.title,
    required this.description,
    required this.status,
    required this.image,
    required this.video,
    required this.link,
    required this.videoImage,
    required this.linkImage,
    required this.url,
    required this.videoLink,
    required this.coverUrl,
    required this.isYoutubeLink,
    required this.mediaType,
    required this.filename,
    required this.createdAt,
    required this.updatedAt,
    required this.course,
  });

  int sessionId;
  int courseId;
  int categoryType;
  String title;
  String description;
  int status;
  String image;
  dynamic video;
  dynamic link;
  dynamic videoImage;
  dynamic linkImage;
  String url;
  dynamic videoLink;
  String coverUrl;
  bool isYoutubeLink;
  int mediaType;
  String filename;
  DateTime createdAt;
  DateTime updatedAt;
  SessionCourse course;

  factory Session.fromJson(Map<String, dynamic> json) => Session(
        sessionId: json["session_id"],
        courseId: json["course_id"],
        categoryType: json["category_type"],
        title: json["title"],
        description: json["description"],
        status: json["status"],
        image: json["image"],
        video: json["video"],
        link: json["link"],
        videoImage: json["video_image"],
        linkImage: json["link_image"],
        url: json["url"],
        videoLink: json["video_link"],
        coverUrl: json["cover_url"],
        isYoutubeLink: json["is_youtube_link"],
        mediaType: json["media_type"],
        filename: json["filename"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        course: SessionCourse.fromJson(json["course"]),
      );

  Map<String, dynamic> toJson() => {
        "session_id": sessionId,
        "course_id": courseId,
        "category_type": categoryType,
        "title": title,
        "description": description,
        "status": status,
        "image": image,
        "video": video,
        "link": link,
        "video_image": videoImage,
        "link_image": linkImage,
        "url": url,
        "video_link": videoLink,
        "cover_url": coverUrl,
        "is_youtube_link": isYoutubeLink,
        "media_type": mediaType,
        "filename": filename,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "course": course.toJson(),
      };
}

class SessionCourse {
  SessionCourse({
    required this.title,
    required this.description,
    required this.featuredImage,
    required this.genre,
  });

  String title;
  String description;
  String featuredImage;
  String genre;

  factory SessionCourse.fromJson(Map<String, dynamic> json) => SessionCourse(
        title: json["title"],
        description: json["description"],
        featuredImage: json["featured_image"],
        genre: json["genre"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "featured_image": featuredImage,
        "genre": genre,
      };
}
