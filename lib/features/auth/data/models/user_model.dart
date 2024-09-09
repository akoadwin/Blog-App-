import 'package:blog_app/core/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.email,
    required super.id,
    required super.name,
  });

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] ?? '',
      id: map['id'] ?? '',
      name: map['name'] ?? '',
    );
  }

  UserModel copyWith({
    String? id,
    String? email,
    String? name,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
    );
  }
}
