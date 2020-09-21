import '../../../../core/base/model/base_model.dart';

class BitarifUser extends BaseModel {
  BitarifUser(
      {this.id,
      this.follower,
      this.firebaseId,
      this.email,
      this.password,
      this.name,
      this.profilePic,
      this.createdDate,
      this.token});

  final int id;
  final List<Follower> follower;
  final String firebaseId;
  final String email;
  final String password;
  final String name;
  final dynamic profilePic;
  final DateTime createdDate;
  final String token;

  Map<String, dynamic> toJson() => {
        "id": id,
        "follower": List<dynamic>.from(follower.map((x) => x.toJson())),
        "firebase_id": firebaseId,
        "email": email,
        "password": password,
        "name": name,
        "profile_pic": profilePic,
        "token": token,
        "created_date": createdDate.toIso8601String(),
      };

  fromJson(Map<String, dynamic> json) => BitarifUser(
        id: json["id"],
        follower: List<Follower>.from(
            json["follower"].map((x) => Follower.fromJson(x))),
        firebaseId: json["firebase_id"],
        email: json["email"],
        password: json["password"],
        name: json["name"],
        profilePic: json["profile_pic"],
        token: json["token"],
        createdDate: DateTime.parse(json["created_date"]),
      );
}

class Follower {
  Follower({
    this.firebaseId,
  });

  final String firebaseId;

  factory Follower.fromJson(Map<String, dynamic> json) => Follower(
        firebaseId: json["firebase_id"],
      );

  Map<String, dynamic> toJson() => {
        "firebase_id": firebaseId,
      };
}
