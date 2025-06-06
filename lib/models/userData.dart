class UserData {
  final String id;
  final String name;
  final String email;

  UserData({required this.id, required this.name, required this.email});

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(id: map["id"], name: map["name"], email: map["email"]);
  }

  Map<String, dynamic> toMap() {
    return {"id": id, "name": name, "email": email};
  }
}
