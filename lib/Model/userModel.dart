class UserModel {
  String? id;
  String? name;
  String? email;
  String? profileImage;
  String? phoneNumber;

  UserModel({this.id, this.name, this.email, this.profileImage, this.phoneNumber});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json["id"] as String?;
    name = json["name"] as String?;
    email = json["email"] as String?;
    profileImage = json["profileImage"] as String?;
    phoneNumber = json["phoneNumber"] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["email"] = email;
    data["profileImage"] = profileImage;
    data["phoneNumber"] = phoneNumber;
    return data;
  }
}
