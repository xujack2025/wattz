import '../../../../../core/constants/constant.dart';
import '../../../../../core/service/storage_service.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheLoginStatus(bool isLoggedIn);
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final StorageService storageService;

  AuthLocalDataSourceImpl(this.storageService);

  @override
  Future<void> cacheLoginStatus(bool isLoggedIn) async {
    await storageService.setBool(AppConstants.isLoggedIn, true);
  }
}
