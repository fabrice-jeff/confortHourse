import '../../services/datetime_format.dart';

class User {
  final int id;
  final String code;
  final String password;
  final bool validation;
  final bool deleted;
  final DateTime createdAt;
  final DateTime updtaedAt;
  const User({
    required this.id,
    required this.code,
    required this.password,
    required this.validation,
    required this.deleted,
    required this.createdAt,
    required this.updtaedAt,
  });
  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        code: json['code'],
        password: json['password'],
        validation: (json['validation'] == 0) ? false : true,
        deleted: (json['deleted'] == 0) ? false : true,
        createdAt: dateTimeFormat(json['created_at']),
        updtaedAt: dateTimeFormat(json['updated_at']),
      );
}
