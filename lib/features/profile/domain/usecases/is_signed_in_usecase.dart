import '../../../auth/domain/repos/auth_repo.dart';

class IsSignedInUsecase {
  IsSignedInUsecase(this.repo);

  final AuthRepo repo;

  Future<bool> call() async {
    return await repo.isSignedIn();
  }
}
