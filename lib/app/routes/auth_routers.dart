import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:vakinha_burger_mobile/app/modules/auth/login/login_binding.dart';
import 'package:vakinha_burger_mobile/app/modules/auth/login/login_page.dart';
import 'package:vakinha_burger_mobile/app/modules/auth/register/register_bindins.dart';
import 'package:vakinha_burger_mobile/app/modules/auth/register/register_page.dart';

class AuthRouters{
  AuthRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: '/auth/login',
      binding: LoginBinding(),
      page: () => const LoginPage(),
    ),
    GetPage(
      name: '/auth/register',
      binding: RegisterBindins(),
      page: () => const RegisterPage(),
    )
  ];
}