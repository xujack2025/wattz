import '../../../../core/params/params.dart';
import '../repos/auth_repo.dart';

class SignInWithEmailUsecase {
  SignInWithEmailUsecase(this.repo);
  final AuthRepo repo;

  Future<void> call(AuthParams params) async {
    return await repo.signInWithEmail(params);
  }
}
