import '../../../../core/params/params.dart';
import '../../domain/repos/auth_repo.dart';
import '../datasources/remote_datasource/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepo {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<bool> isSignedIn() async => await remoteDataSource.isSignedIn();

  @override
  Future<void> googleAuth() async => await remoteDataSource.googleAuth();

  @override
  Future<void> logOut() async => await remoteDataSource.logOut();

  @override
  Future<void> signInWithEmail(AuthParams params) async =>
      await remoteDataSource.signInWithEmail(params);

  @override
  Future<void> signUpWithEmail(AuthParams params) async =>
      await remoteDataSource.signUpWithEmail(params);
}
