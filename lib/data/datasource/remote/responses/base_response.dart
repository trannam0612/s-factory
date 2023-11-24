class BaseResponse<T> {
  BaseResponse({
    this.errors,
    this.data,
    // this.listData,
  });

  // BaseResponse.fromJson(Map<String, dynamic> json) {
  //   logi(message: 'json:${json.runtimeType}');
  //   logi(message: 'Tjson:${T.toString()}');
  //   if (json['identityLogin'] is List) {
  //     (json['identityLogin'] as List).forEach((item) {
  //       if (T.toString() == 'String') {
  //         listData.add(item.toString() as T);
  //       } else {
  //         // listData.add(EntityFactory.generateOBJ<T>(item));
  //         listData.add(item.toString() as T);
  //       }
  //     });
  //   } else {
  //     if (T.toString() == 'String') {
  //       data = json['identityLogin'].toString() as T;
  //     } else if (T.toString() == 'Map<dynamic, dynamic>') {
  //       data = json['identityLogin'] as T;
  //     } else {
  //       data = json['identityLogin'] as T;
  //     }
  //   }
  // }

  // BaseResponse.fromJson(Map<String, dynamic> json,T Function(Map<String, dynamic> json) fromJsonT) {
  //   logi(message: 'a:${json}');
  //   logi(message: 'a:${json.runtimeType}');
  //   final a = jsonDecode((json).toString());
  //   data = a as T;
  // }

  factory BaseResponse.fromJson(Map<String, dynamic> json,
      T Function(Map<String, dynamic> jsonT) fromJsonT) {
    return BaseResponse<T>(
      data: fromJsonT(json),
      errors: json['errors'] == null
          ? <BaseErrorResponse>[]
          : List<BaseErrorResponse>.from(
              json['errors'].map((x) => BaseErrorResponse.fromJson(x))),
    );
  }
  T? data;
  // List<T?> listData = <T?>[];
  List<BaseErrorResponse>? errors;
}

class BaseErrorResponse {
  BaseErrorResponse({
    this.code,
    this.message,
    this.extensions,
  });

  factory BaseErrorResponse.fromJson(Map<String, dynamic> json) =>
      BaseErrorResponse(
        code: json['code'],
        message: json['message'],
        extensions: json['extensions'] == null
            ? null
            : BaseExtensionsErrorResponse.fromJson(json['extensions']),
      );
  String? code;
  String? message;
  BaseExtensionsErrorResponse? extensions;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'code': code,
        'message': message,
        'extensions': extensions?.toJson(),
      };
}

class BaseExtensionsErrorResponse {
  BaseExtensionsErrorResponse({
    this.code,
    this.message,
  });

  factory BaseExtensionsErrorResponse.fromJson(Map<String, dynamic> json) =>
      BaseExtensionsErrorResponse(
        code: json['code'],
        message: json['message'],
      );
  String? code;
  String? message;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'code': code,
        'message': message,
      };
}
