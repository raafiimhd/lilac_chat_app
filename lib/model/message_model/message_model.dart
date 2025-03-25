class MessageModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String gender;
  final String address;
  final String profilePhotoUrl;
  final int age;
  final String occupation;
  final bool isOnline; // Add this field

  MessageModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
    required this.address,
    required this.profilePhotoUrl,
    required this.age,
    required this.occupation,
    required this.isOnline, // Add this field
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      gender: json['gender'] ?? '',
      address: json['address'] ?? '',
      profilePhotoUrl: json['profile_photo_url'] ?? '',
      age: json['age'] ?? 0,
      occupation: json['bio_intro_text'] ?? '',
      isOnline: json['is_online'] ?? false, // Map 'is_online' field
    );
  }
}
