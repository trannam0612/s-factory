import 'package:json_annotation/json_annotation.dart';
import 'package:s_factory/data/datasource/remote/responses/base_response.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  LoginResponse({
    this.accessToken,
    this.refreshToken,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
  @JsonKey(name: 'accessToken')
  String? accessToken;
  @JsonKey(name: 'refreshToken')
  String? refreshToken;

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
