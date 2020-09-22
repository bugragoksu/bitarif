import 'package:json_annotation/json_annotation.dart';

import '../../../../../core/base/model/base_model.dart';

@JsonSerializable()
class BlogPost extends BaseModel {
  BlogPost({
    this.id,
    this.author,
    this.title,
    this.desc,
    this.imageLink,
    this.createdDate,
    this.text,
  });

  final int id;
  final Author author;
  final String title;
  final String desc;
  final String imageLink;
  final DateTime createdDate;
  final String text;

  factory BlogPost.fromJson(Map<String, dynamic> json) => BlogPost(
        id: json["id"],
        author: Author.fromJson(json["author"]),
        title: json["title"],
        desc: json["desc"],
        imageLink: json["image_link"],
        createdDate: DateTime.parse(json["created_date"]),
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "author": author.toJson(),
        "title": title,
        "desc": desc,
        "image_link": imageLink,
        "created_date":
            "${createdDate.year.toString().padLeft(4, '0')}-${createdDate.month.toString().padLeft(2, '0')}-${createdDate.day.toString().padLeft(2, '0')}",
        "text": text,
      };

  @override
  fromJson(Map<String, Object> json) => BlogPost.fromJson(json);
}

class Author {
  Author({
    this.firebaseId,
    this.name,
  });

  final String firebaseId;
  final String name;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        firebaseId: json["firebase_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "firebase_id": firebaseId,
        "name": name,
      };
}
