class UserModel {
  final String name;
  final String email;
  final String phone;
  final String gender;
  final String address;
  final String profilePhotoUrl;
  final int age;
  final String occupation;

  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
    required this.address,
    required this.profilePhotoUrl,
    required this.age,
    required this.occupation,
  });

  UserModel copyWith({
    String? name,
    String? email,
    String? phone,
    String? gender,
    String? address,
    String? profilePhotoUrl,
    int? age,
    String? occupation,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      gender: gender ?? this.gender,
      address: address ?? this.address,
      profilePhotoUrl: profilePhotoUrl ?? this.profilePhotoUrl,
      age: age ?? this.age,
      occupation: occupation ?? this.occupation,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      gender: json['gender'] ?? '',
      address: json['address'] ?? '',
      profilePhotoUrl: json['profilePhotoUrl'] ?? '',
      age: json['age'] ?? 0,
      occupation: json['occupation'] ?? '',
    );
  }
}
