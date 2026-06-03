import '../../../../../core/params/params.dart';

abstract class AuthRemoteDataSource {
  Future<bool> isSignedIn();
  Future<void> signUpWithEmail(AuthParams params);
  Future<void> signInWithEmail(AuthParams params);
  Future<void> googleAuth();
  Future<void> logOut();
}
