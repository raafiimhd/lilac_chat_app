class UserModel {
  String id;
  String name;

  UserModel({required this.id, required this.name});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id']??'', // Convert id to int safely
      name: json['name'] ?? '',
    );
  }
}
