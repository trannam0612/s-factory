import 'package:json_annotation/json_annotation.dart';
import 'package:s_factory/data/datasource/remote/responses/test_base_response.dart';

part 'login_response2.g.dart';

@JsonSerializable()
class LoginResponse2 extends BaseResponse2 {
  LoginResponse2({
    this.accessToken,
    this.refreshToken,
  });

  factory LoginResponse2.fromJson1(Map<String, dynamic> json) =>
      _$LoginResponse2FromJson(json);
  @JsonKey(name: 'accessToken')
  String? accessToken;
  @JsonKey(name: 'refreshToken')
  String? refreshToken;

  Map<String, dynamic> toJson() => _$LoginResponse2ToJson(this);

  @override
  T fromJson<T extends BaseResponse2>(Map<String, dynamic> json) {
    return LoginResponse2.fromJson1(json) as T;
  }

  // BaseResponse2<LoginResponse2> fromJson(Map<String, dynamic> json) {
  //   return Ba.fromJson1(json);
  // }
}
