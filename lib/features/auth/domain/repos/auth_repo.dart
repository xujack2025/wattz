import '../../../../core/params/params.dart';

abstract class AuthRepo {
  Future<bool> isSignedIn();
  Future<void> signUpWithEmail(AuthParams params);
  Future<void> signInWithEmail(AuthParams params);
  Future<void> googleAuth();
  Future<void> logOut();
}
