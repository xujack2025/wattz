import '../repos/auth_repo.dart';

class GoogleAuthUsecase {
  GoogleAuthUsecase(this.repo);

  final AuthRepo repo;
  Future<void> call() async {
    return await repo.googleAuth();
  }
}
