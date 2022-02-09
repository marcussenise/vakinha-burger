import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/repositories/auth/auth_repository.dart';
import 'package:vakinha_burger_mobile/app/repositories/auth/auth_repository/auth_repository_impl.dart';

import 'login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
     Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(restClient: Get.find()));

      Get.lazyPut(() => LoginController(authRepository: Get.find()),
      );
  }
}