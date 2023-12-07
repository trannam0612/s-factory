import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s_factory/common/configs/logger_config.dart';
import 'package:stream_transform/stream_transform.dart';

EventTransformer<E> debounce<E>(Duration duration) {
  return (Stream<E> events, Stream<E> Function(E) mapper) {
    return events.debounce(duration).switchMap(mapper);
  };
}

class ValidatorUtils {
  String? validatorEmpty(String? value, {String? title}) {
    if (value == null || value.isEmpty) {
      return title ?? 'Không được để trống';
    }
    return null;
  }

  String? validatorPassword(String? value, {String? title}) {
    if (value == null || value.isEmpty) {
      return title ?? 'Mật khẩu được để trống';
    }
    if (value.length < 6) {
      return title ?? 'Mật khẩu ít nhất 6 ký tự';
    }
    if (!value.contains(RegExp(r'[a-z A-Z]'))) {
      return title ?? 'Mật khẩu phải bao gồm chữ';
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return title ?? 'Mật khẩu phải bao gồm số';
    }
    return null;
  }

  String? validatorRePassword(
    String? value,
    String? newValue,
  ) {
    logi(message: 'value == newValue:${value} == $newValue');
    if (value != newValue) {
      return 'Mật khẩu không trùng khớp';
    }
    if (value == null || value.isEmpty) {
      return 'Mật khẩu được để trống';
    }

    return null;
  }
}
