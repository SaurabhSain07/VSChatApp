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
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["email"] = email;
    _data["profileImage"] = profileImage;
    _data["phoneNumber"] = phoneNumber;
    return _data;
  }
}
