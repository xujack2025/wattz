import '../repos/auth_repo.dart';

class LogOutUsecase {
  LogOutUsecase(this.repo);

  final AuthRepo repo;
  Future<void> call() async {
    return await repo.logOut();
  }
}
