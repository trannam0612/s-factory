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
  // sen otp to phonenumber
  static const String identityPhoneChallenge = r'''
    mutation identityPhoneChallenge($phone: String!){
      identityPhoneChallenge(phone: $phone) 
      {
    organization
    session
    target
      }
    } 
  ''';

  // verify otp
  static const String identityVerifyForgotPassword = r'''
    mutation identityVerifyForgotPassword($session: String!, $otp: Float!){
      identityVerifyForgotPassword(session: $session, otp:$otp) 
      {
    accessToken
      }
    } 
  ''';

  // change pass forgot
  static const String identitySetPassword = r'''
    mutation identitySetPassword($password: String!){
      identitySetPassword(password: $password) 
      {
    accessToken
      }
    } 
  ''';

  // change pass
  static const String identityChangePassword = r'''
    mutation identityChangePassword($arguments: UserPasswordArgs!){
      identityChangePassword(arguments: $arguments) 
      {
    accessToken
      }
    }
  ''';
}
