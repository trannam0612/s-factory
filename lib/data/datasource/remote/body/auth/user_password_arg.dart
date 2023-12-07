import 'package:json_annotation/json_annotation.dart';

part 'user_password_arg.g.dart';

@JsonSerializable()
class UserPasswordArgBody {
  UserPasswordArgBody({
    this.newPassword,
    this.oldPassword,
  });

  factory UserPasswordArgBody.fromJson(Map<String, dynamic> json) =>
      _$UserPasswordArgBodyFromJson(json);
  @JsonKey(name: 'newPassword')
  final String? newPassword;
  @JsonKey(name: 'oldPassword')
  final String? oldPassword;

  Map<String, dynamic> toJson() => _$UserPasswordArgBodyToJson(this);
}
