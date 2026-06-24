class AuthModel {
  final String uid;
  final String name;
  final String email;
  final String phone;
  final String birthDate;
  final String image;

  AuthModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.phone,
    required this.birthDate,
    required this.image,
  });

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phone': phone,
      'birthDate': birthDate,
      'image': image,
    };
  }

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      uid: json['uid'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      birthDate: json['birthDate'] ?? '',
      image: json['image'] ?? '',
    );
  }
}