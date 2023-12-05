const int kDefaultDebounceTimeInMilliSecond = 800;
const int kDefaultDelayTimeForCallingApi = 250;
const int kConnectionTimeOutInMilliSecond = 30000;
const int kReceivingTimeOutInMilliSecond = 30000;
// const String baseUrl = 'http://34.125.92.171:8181/';
// const String baseUrl = 'http://3.80.177.10:8181/';
const String devBaseUrl = 'https://stg-factory-api.smarthiz.vn/graphql/';
const String stagingBaseUrl = 'https://stg-factory-api.smarthiz.vn/graphql';
const String prodBaseUrl = 'https://srt-factory-api.smarthiz.vn/graphql';

// const String googlePhotosKey = 'AIzaSyCsFgfQzAdrmYlmJBckoRFzGGRA35lCR0M';

const String signature =
    'ts0ZzBoogjDvgO+UR6bGyUtf8GVr01Fn6TxXwLcqcAib5OV3Xc2OTz+w+DZoJHseoSiKrwdqituT1Ay9d5aZFBx47Md3rU/FXMcpTNeaHPBJu3XHCAmjJwZI45A3iQPPbKEnHvuYOnANQxzBtzYqvq9s8Xt/PBpBq7TxNetf+pRe0J0tz6jR8b03DDms+F0cKsRYIjIWWP4VZM0n9H4g+S0Jrj3ryJHH6M9uEv3FK6Su/a23tVkCoZJERSzMQBt4NhROHoCcv3iituWdARlXyzKk8VVUx9sCXkfopPq4iLw6VLfBI+zBaVWacqJt1AEeO9ls0WsNPTUm/WmKVoUVxg==';

// String getGooglePhotosUrl(String photoRef, {double? maxWidth}) {
//   final String url =
//       'https://maps.googleapis.com/maps/api/place/photo?maxwidth=${maxWidth ?? '200'}&photo_reference=$photoRef&key=$googlePhotosKey';
//   return url;
// }