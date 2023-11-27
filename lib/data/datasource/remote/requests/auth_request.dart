class AuthRequest {
  static const String phoneChallenge = r'''
    mutation phoneChallenge($phone: String!) {
      phoneChallenge(phone: $phone){
          session
          otp
    }
  } 
  ''';

  static const String identityLogin = r'''
    mutation identityLogin($phone: String!,$password: String!) {
      identityLogin(credential: { phone: $phone, password: $password})
      {
    accessToken
    refreshToken
  }
  } 
  ''';
  static const String identityLoginWithBusinessRole = r'''
    mutation identityLoginWithBusinessRole($businessRoleId: String!){
      identityLoginWithBusinessRole(businessRoleId: $businessRoleId) 
      {
    accessToken
    refreshToken
      }
    } 
  ''';
}
