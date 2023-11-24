

class CoreConstants {
  CoreConstants._();

  static const hyphen = '-';
  static const underline = '_';
  static const plus = '+';
  static const mul = 'x';
  static const mark = '#';
  static const markStar = '*';
  static const colon = ':';
  static const percentage = '%';
  static const dateFormatEEEEddMMyyyy = 'EEEE, dd/MM/yyyy';
  static const dateFormatHHmmaddMMyyyy = 'HH:mm a - dd/MM/yyyy';
  static const dateFormatHHmmddMMyyyy = 'HH:mm dd/MM/yyyy';
  static const dateFormatddMMyyyy = 'dd/MM/yyyy';
  static const dateFormatddMMyyyyWithoutText = '--/--/----';
  static const dateFormatYYYYMMDD = 'yyyy/MM/dd';
  static const dateFormatMMMMyyyy = 'MMMM, yyyy';
  static const dateFormatMMyyyy = 'MM, yyyy';
  static const dateFormatddMMyyyyHHmm = 'dd/MM/yyyy - HH:mm';
  static const timeFormatHHmm = 'HH:mm';
  static const dateFormatddMM = 'dd/MM';
  static const nameOfDay = 'EEE';
  static const decimalFormat = '#,###';
  static const dateFormatDashYYYYMMDD = 'yyyy-MM-dd';
  static const dateFormatDashHHmm = 'HH:mm';
}

class LocaleCodes {
  LocaleCodes._();

  static const vi = 'vi';
  static const en = 'en';
}

class PreferenceKey {
  PreferenceKey._();

  static const theme = 'my_theme';
  static const language = 'app_language';
  static const cacheEmail = 'cache_email';
  static const refreshToken = 'refresh_token';
  static const accessToken = 'access_token';
  static const tempToken = 'temp_token';
  static const expiresIn = 'expires_in';
  static const refreshTokenExpiresIn = 'refresh_token_expires_in';
  static const fcmToken = 'fcm_token';
  static const rooms = 'rooms';
  static const isFirstLaunch = 'is_first_launch';
  static const country = 'app_country';
  static const countdownOTP = 'countdown_otp';
  static const userId = 'user_id';
  static const hasConfigAmplify = 'has_config_amplify';
  static const appVersionRemote = 'app_version_remote';
  static const badge = 'badge';
  static const expiredOnBackground = 'expired_on_background';
  static const currentRoleId = 'app_current_role_id';
  static const phoneNumberDeleted = 'app_phone_number_deleted';
  static const currentStatus = 'app_current_status';
  static const currentShowDialog = 'app_current_show_dialog';
  static const currentRoleName = 'app_current_role';
  static const phoneNumber = 'phone_number';
}

class Regex {
  Regex._();

  static const replaceArg = r'{}';
  static const email = r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$';
  static const password = r'^[A-Za-z\d#`~!@#$%^&*()\-_=+[\]{}\\;:‘’“”"'
      '\''
      ',.<>/?\ ]{6,32}\$';
  static const containsAlphabetAndNumber = r'^(?=.*?[a-z])(?=.*?\d)';
  static const phone = r'(0)(\s|\.)?(\d{2})(\d)(\s|\.)?(\d{3})(\s|\.)?(\d{3})';
  static const fullName = r'^[a-zA-Z]{1,}(?: [a-zA-Z]+){0,}$';
  static const birthDay = r'^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d$';
  static const androidAcceptPickExtension = r'(jpeg|JPEG|jpg|JPG|tif|TIF|png|PNG|tiff|TIFF)$';
  static const iosAcceptPickExtension = r'(jpeg|JPEG|jpg|JPG|tif|TIF|png|PNG|tiff|TIFF|heic|HEIC|heif|HEIF)$';
  static const specialExtension = r'(heic|HEIC|heif|HEIF)$';

  static String imageExtension = r'(jpeg|JPEG|jpg|JPG|tif|TIF|png|PNG|tiff|TIFF|heic|HEIC|heif|HEIF)$';
}

class Symbol {
  static const vi = 'đ';
}

class NetworkConstants {
  NetworkConstants._();

  static const loginInterceptor = 'loginInterceptor';
  static const tempTokenInterceptor = 'tempTokenInterceptor';
  static const newsInterceptor = 'newsInterceptor';
  static const settingNotificationInterceptor = 'settingNotificationInterceptor';

  static const statusCode = 'code';
  static const message = 'message';
  static const data = 'data';
  static const error = 'error';

  static const acceptLanguage = 'Accept-Language';
  static const authorization = 'Authorization';

  static const token = 'token';
  static const status = 'status';
  static const total = 'total';
  static const lastPage = 'lastPage';
  static const currentPage = 'currentPage';
}

class NetworkStatusCode {
  NetworkStatusCode._();

  static const success = 200;
  static const duplicate = 201;
  static const noContentSuccess = 204;
  static const badRequest = 400;
  static const unAuthorized = 401;
  static const forbidden = 403;
  static const connectTimeout = 409;
  static const receiveTimeout = 410;
  static const serverError = 500;
  static const serverTemporarily = 503;
  static const unknown = 9999;
  static const cache = 7777;
  static const noNetwork = 8888;

  static const userMigratedFirstLogin = 423;
  static const newsError = 6666;
  static const registerWithOtherCountry = 426;
  static const parsedResponseError = 5555;
}

class ResultStatus {
  static const String success = 'Success';
  static const String failed = 'Failed';
  static const String newsError = 'error';
  static const String newsSuccess = 'success';
}

class ImagePath {
  ImagePath._();

  static const backgroundHome = 'assets/images/bg4.png';
}
