import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  UserResponse({
    this.fullName,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
  @JsonKey(name: 'fullname')
  String? fullName;

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}
