import '../../../../core/params/params.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repos/auth_repo.dart';

class AuthFirebaseRepositoryImpl extends AuthRepo {
  final AuthFirebaseRepositoryImpl remoteDataSource;

  AuthFirebaseRepositoryImpl({required this.remoteDataSource});
  
  @override
  Future<void> googleAuth() async => await remoteDataSource.googleAuth();

  @override
  Future<void> logOut() async => await remoteDataSource.logOut();

  @override
  Future<UserEntity> signInWithEmail(AuthParams params) async =>
      await remoteDataSource.signInWithEmail(params);

  @override
  Future<UserEntity> signUpWithEmail(AuthParams params) async =>
      await remoteDataSource.signUpWithEmail(params);
}
