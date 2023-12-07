import 'package:json_annotation/json_annotation.dart';
import 'package:s_factory/data/datasource/remote/responses/test_base_response.dart';

part 'phone_challenge_response.g.dart';

@JsonSerializable()
class PhoneChallegeResponse extends BaseResponse2 {
  PhoneChallegeResponse({
    this.organization,
    this.session,
    this.target,
  });

  factory PhoneChallegeResponse.fromJson1(Map<String, dynamic> json) =>
      _$PhoneChallegeResponseFromJson(json);
  @JsonKey(name: 'organization')
  String? organization;
  @JsonKey(name: 'session')
  String? session;
  @JsonKey(name: 'target')
  String? target;

  Map<String, dynamic> toJson() => _$PhoneChallegeResponseToJson(this);

  @override
  T fromJson<T extends BaseResponse2>(Map<String, dynamic> json) {
    return PhoneChallegeResponse.fromJson1(json) as T;
  }

  // BaseResponse2<PhoneChallegeResponse> fromJson(Map<String, dynamic> json) {
  //   return Ba.fromJson1(json);
  // }
}
