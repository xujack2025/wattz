import '../../../../core/params/params.dart';
import '../repos/auth_repo.dart';

class SignUpWithEmailUsecase {
  SignUpWithEmailUsecase(this.repo);
  final AuthRepo repo;

  Future<void> call(AuthParams params) async {
    return await repo.signUpWithEmail(params);
  }
}
