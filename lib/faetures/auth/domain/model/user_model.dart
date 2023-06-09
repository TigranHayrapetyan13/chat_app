import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class NewUser {
  final String name;
  final String email;
  final String avatarUrl;
  final List requests;
  final List friends;

  NewUser({
    required this.friends,
    required this.requests,
    required this.name,
    required this.email,
    required this.avatarUrl,
  });

  factory NewUser.fromJson(Map<String, dynamic> json) =>
      _$NewUserFromJson(json);

  Map<String, dynamic> toJson() => _$NewUserToJson(this);
}
