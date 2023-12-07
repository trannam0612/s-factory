import 'package:json_annotation/json_annotation.dart';
import 'package:s_factory/data/datasource/remote/responses/test_base_response.dart';

part 'verify_otp_response.g.dart';

@JsonSerializable()
class VerifyOTPResponse extends BaseResponse2 {
  VerifyOTPResponse({
    this.accessToken,
    this.refreshToken,
  });

  factory VerifyOTPResponse.fromJson1(Map<String, dynamic> json) =>
      _$VerifyOTPResponseFromJson(json);
  @JsonKey(name: 'accessToken')
  String? accessToken;
  @JsonKey(name: 'refreshToken')
  String? refreshToken;

  Map<String, dynamic> toJson() => _$VerifyOTPResponseToJson(this);

  @override
  T fromJson<T extends BaseResponse2>(Map<String, dynamic> json) {
    return VerifyOTPResponse.fromJson1(json) as T;
  }

  // BaseResponse2<VerifyOTPResponse> fromJson(Map<String, dynamic> json) {
  //   return Ba.fromJson1(json);
  // }
}
