import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:s_factory/common/constant/core_constants.dart';
import 'package:s_factory/presentation/screens/report/report_bloc/report_bloc.dart';
import 'package:s_factory/presentation/utils/color_constant.dart';

extension StringNullExtension on String? {
  bool isPhoneNumber() {
    if (this == null) return false;
    final RegExp phoneNumber =
        RegExp(r'^[2-9][0-9][0-9]-[2-9][0-9][0-9]-[0-9]{4}$');
    return phoneNumber.hasMatch(this!);
  }

  String? clearSpace() {
    return this?.replaceAll('\n', ' ');
  }

  bool isVerifyCode() {
    if (this == null) return false;
    final RegExp codeReg = RegExp(r'^[0-9]{6}$');
    return codeReg.hasMatch(this!);
  }

  bool isEmailAddress() {
    if (this == null) return false;
    final RegExp email =
        RegExp(r'^(([\w-\.])*[\w]+){4,}@([\w-]+\.)+[\w-]{2,4}$');
    return email.hasMatch(this!);
  }

  bool isEmptyOrNull() {
    if (this == null) return true;
    return this!.isEmpty;
  }

//
//   String? validateName() {
//     if (this == null) return S().error_required_field;
//     if (this!.isEmpty) return S().error_required_field;
//     final RegExp nameReg = RegExp(r'^([ ]{0,}[A-Za-z]{1,}[ ]{0,})+$');
// // for (String c in this!.split(kEmptyString)) {
// // logi(message: "'${this!.toString().formatName()}'",tag: "validateName");
//     if (!nameReg.hasMatch(this!)) {
//       return S().error_invalid_name;
//     }
// // }
//     return null;
//   }

  // String? validateEmpty() {
  //   if (this != null) {
  //     if (this!.isNotEmpty) {
  //       return null;
  //     }
  //   }
  //   return S().error_required_field;
  // }

  String toReadableAge() {
    if (this == null) return '';
    int? moIndex = this!.indexOf('mo');
    if (moIndex != -1) {
      return '${this!.substring(0, moIndex)} mo';
    }
    return this!;
  }

  String toEncodedEmail() {
    if (isEmptyOrNull()) return '';
    String emailContent = this!.split('@').first;
    String domain = this!.split('@')[1];
    int startIndex = 0;
    int endIndex = emailContent.length;
    if (emailContent.length <= 8) {
      startIndex = 1;
    } else {
      startIndex = 2;
      endIndex -= 2;
    }
    String subEncodeContent = '';
    for (int i = startIndex; i < endIndex; i++) {
      subEncodeContent += '*';
    }
    String encodedEmail = '${emailContent.substring(0, startIndex)}'
        '$subEncodeContent${emailContent.substring(endIndex)}@$domain';
    return encodedEmail;
  }
}

extension StringExtension on String {
  String formatPhoneNumber() {
    String s = toString();
    if (s.isNotEmpty) {
      s = s.replaceAll(RegExp(r'-{2,}'), '-');
      List<String> list = s.split('');
      if (list.last == '-') {
        list.removeLast();
      } else {
        if (list.length == 4) {
          list.insert(3, '-');
        } else if (list.length == 8) {
          list.insert(7, '-');
        } else if (list.length > 12) {
          list.removeLast();
        }
      }
      if (list.length > 3 && list[3] != '-') {
        list.insert(3, '-');
      }
      if (list.length > 7 && list[7] != '-') {
        list.insert(7, '-');
      }
      return list.join();
    }
    return s;
  }

  String formatName() {
    return replaceAll(RegExp(r'[ ]{2,}'), ' ').trim();
  }

  String normalizePhoneNumber() {
    String phoneNumber = toString();
    return phoneNumber.replaceAll('-', '');
  }

  bool isEvenNumber() {
    if (int.tryParse(this) == null) return false;
    return int.parse(this) % 2 == 0;
  }

  bool isOddNumber() {
    if (int.tryParse(this) == null) return false;
    return int.parse(this) % 2 != 0;
  }
}

extension StringPOStatusExtension on String {
  POStatus getPOStatus() {
    if (this == POStatus.failed.value) {
      return POStatus.failed;
    } else if (this == POStatus.pass.value) {
      return POStatus.pass;
    } else if (this == POStatus.processing.value) {
      return POStatus.processing;
    } else {
      return POStatus.unknow;
    }
  }

  Color getColorPOStatus() {
    if (this == POStatus.failed.value) {
      return ColorConstant.kSupportError2;
    } else if (this == POStatus.pass.value) {
      return ColorConstant.kSupportSuccess;
    } else if (this == POStatus.processing.value) {
      return ColorConstant.kSupportWarning;
    } else {
      return ColorConstant.kTextColor;
    }
  }
}

extension StringReportStandardResultExtension on String {
  ReportStandardResult getReportStandardResult() {
    if (this == ReportStandardResult.fail.value) {
      return ReportStandardResult.fail;
    } else if (this == ReportStandardResult.pass.value) {
      return ReportStandardResult.pass;
    } else {
      return ReportStandardResult.unknow;
    }
  }

  Color getColorReportStandardResult() {
    if (this == ReportStandardResult.fail.value) {
      return ColorConstant.kSupportError2;
    } else {
      return ColorConstant.kSupportSuccess;
    }
  }
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((String str) => str.toCapitalized())
      .join(' ');
}

extension StringTimeExtension on String {
  bool has30Days() {
    return <String>[
      '04',
      '05',
      '06',
      '09',
      '11',
    ].contains(this);
  }

  bool has31Days() {
    return <String>[
      '01',
      '03',
      '05',
      '07',
      '08',
      '10',
      '12',
    ].contains(this);
  }

  bool isLeapYear() {
    if (int.tryParse(this) == null) return false;
    int year = int.parse(this);
    return year % 400 == 0 || (year % 4 == 0 && year % 100 != 0);
  }

  String? get getMonthString {
    switch (this) {
      case '1':
        return 'January';
      case '2':
        return 'February';
      case '3':
        return 'March';
      case '4':
        return 'April';
      case '5':
        return 'May';
      case '6':
        return 'June';
      case '7':
        return 'July';
      case '8':
        return 'August';
      case '9':
        return 'September';
      case '10':
        return 'October';
      case '11':
        return 'November';
      case '12':
        return 'December';
    }
    return null;
  }
}

extension StringMessageExtension on String {
  bool isMedia() {
    return isPhoto() || isVideo();
  }

  bool isPhoto() {
    final RegExp photo = RegExp(r'^.*(\.(jpe?g|jpe|png|gif|bmp))$');
    return photo.hasMatch(toLowerCase());
  }

  bool isVideo() {
    final RegExp video = RegExp(r'^.*(\.(mp3|mp4|mkv|mov|3gp))$');
    return video.hasMatch(toLowerCase());
  }

  /// return the normal text, the url text, the mention text
  List<String> getMessageParts() {
    if (length == 1) return <String>[this];
    RegExp exp = RegExp(
        r'(((https?|ftp):\/\/)[\w/\-?=%&.]+\.[\w/\-?=%&.]+)|([\^| ]{1}@{"id":"(\d+)","name":"([a-zA-Z ]+)"}[ ]{1})');
    Iterable<RegExpMatch> matches = exp.allMatches(this);
    final List<RegExpMatch> matchesList = matches.toList()
      ..sort((RegExpMatch a, RegExpMatch b) => a.start - b.start);
    final List<String> res = <String>[];
    int previous = 0;
    int lastIndex = 0;
    for (RegExpMatch match in matchesList) {
      if (previous < match.start - 1) {
        res.add(
          substring(
            previous,
            match.start,
          ),
        );
        previous = match.start;
      }
      if (match.start < match.end - 1) {
        res.add(
          substring(
            match.start,
            match.end,
          ),
        );
        previous = match.end;
      }
      // previous = match.start;
      lastIndex = match.end;
    }
    if (lastIndex < length - 1) res.add(substring(lastIndex));
    return res;
  }

  bool isUrl() =>
      RegExp(r'((https?|ftp):\/\/)[\w/\-?=%&.]+\.[\w/\-?=%&.]+').hasMatch(this);

  String toUrl() {
    if (!RegExp(r'^(https?|ftp)').hasMatch(this)) {
      return 'http://$this';
    }
    return this;
  }

  bool isMentionWord() =>
      RegExp(r' @{"id":"(\d+)","name":"([a-zA-Z ]+)"} ').hasMatch(this);

  String getMentionString() => trim().substring(1);

  bool get isNullOrEmpty => isEmpty;

  bool get isNotNullOrEmpty => !isNullOrEmpty;

  bool get isNullOrWhiteSpace => isNullOrEmpty || trim().isEmpty;

  String? get titleCase => StringUtils(this).titleCase;

  String get capitalizedFirstLetter =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String get markFormat => '${CoreConstants.mark}$this'.trim();

  String get markStarFormat => '${CoreConstants.markStar} $this'.trim();

  String get plusFormat => '${CoreConstants.plus} $this'.trim();

  String get mulFormat => '${CoreConstants.mul}$this'.trim();

  String get colonFormat => '${this}${CoreConstants.colon}'.trim();

  String get unSign {
    String result = this;
    for (int i = 0; i < _vietnamese.length; i++) {
      result = result.replaceAll(_vietnameseRegex[i], _vietnamese[i]);
    }
    return result;
  }

  String get unSignLower => unSign.toUpperCase();

  String hyphenFormat(String str) =>
      '$this ${CoreConstants.hyphen} $str'.trim();

  String closureFormat(String str) => '$this ($str)'.trim();

  String underlineFormat(String str) =>
      '${this}${CoreConstants.underline}$str'.trim();

  int toInt({int defaultValue = 0}) => int.tryParse(this) ?? defaultValue;

  double toDouble({double defaultValue = 0.0}) =>
      double.tryParse(this) ?? defaultValue;

  bool toBool() =>
      trim().toLowerCase() == 'true' || trim().toLowerCase() == '1';

  String get formatCurrencyWithoutSymbol {
    const String defaultValue = '0';
    final NumberFormat formatter = NumberFormat.simpleCurrency(
      locale: LocaleCodes.vi,
      name: '',
      decimalDigits: 0,
    );

    final double? value = double.tryParse(this);
    if (value == null) {
      return defaultValue;
    }
    return formatter.format(value);
  }

  bool get isLocalizeText {
    if (this == null) return false;

    return startsWith('ui.') || startsWith('message.') || startsWith('error.');
  }

  Map<String, dynamic> parseJwtToken() {
    if (isNullOrWhiteSpace) return <String, dynamic>{};

    final List<String> parts = split('.');
    if (parts.length != 3) {
      return <String, dynamic>{};
    }

    final String payload = _decodeBase64(parts[1]);
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      return <String, dynamic>{};
    }

    return payloadMap;
  }

  String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
    }

    return utf8.decode(base64Url.decode(output));
  }
}

const String _vietnamese = 'aAeEoOuUiIdDyY';
final List<RegExp> _vietnameseRegex = <RegExp>[
  RegExp(r'à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ'),
  RegExp(r'À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ'),
  RegExp(r'è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ'),
  RegExp(r'È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ'),
  RegExp(r'ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ'),
  RegExp(r'Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ'),
  RegExp(r'ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ'),
  RegExp(r'Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ'),
  RegExp(r'ì|í|ị|ỉ|ĩ'),
  RegExp(r'Ì|Í|Ị|Ỉ|Ĩ'),
  RegExp(r'đ'),
  RegExp(r'Đ'),
  RegExp(r'ỳ|ý|ỵ|ỷ|ỹ'),
  RegExp(r'Ỳ|Ý|Ỵ|Ỷ|Ỹ')
];

class StringUtils {
  StringUtils(String text) {
    _words = _groupIntoWords(text);
  }
  List<String>? _words;

  List<String>? _groupIntoWords(String text) {
    if (text.isNullOrWhiteSpace) return null;
    return text.split(' ');
  }

  String? get titleCase => _getTitleCase(separator: ' ');

  String? _getTitleCase({String separator = ''}) {
    if (_words == null) return '';
    final List<String>? words = _words?.map(_upperCaseFirstLetter).toList();
    return words?.join(separator);
  }

  String _upperCaseFirstLetter(String word) {
    if (word.isNullOrEmpty) return word;
    String result = word;
    try {
      result = '${word.substring(0, 1).toUpperCase()}${word.substring(1)}';
    } catch (e) {
      print(word);
      print(e);
    }
    return result;
  }
}
