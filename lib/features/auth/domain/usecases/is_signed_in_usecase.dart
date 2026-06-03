import '../repos/auth_repo.dart';

// Not In Use
class IsSignedInUsecase {
  IsSignedInUsecase(this.repo);

  final AuthRepo repo;

  Future<bool> call() async {
    return await repo.isSignedIn();
  }
}
