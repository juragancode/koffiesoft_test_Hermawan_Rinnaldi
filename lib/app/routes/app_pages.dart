import 'package:get/get.dart';

import 'package:test_01_h_r/app/modules/failed/bindings/failed_binding.dart';
import 'package:test_01_h_r/app/modules/failed/views/failed_view.dart';
import 'package:test_01_h_r/app/modules/home/bindings/home_binding.dart';
import 'package:test_01_h_r/app/modules/home/views/home_view.dart';
import 'package:test_01_h_r/app/modules/login/bindings/login_binding.dart';
import 'package:test_01_h_r/app/modules/login/views/login_view.dart';
import 'package:test_01_h_r/app/modules/register/bindings/register_binding.dart';
import 'package:test_01_h_r/app/modules/register/views/register_view.dart';
import 'package:test_01_h_r/app/modules/success/bindings/success_binding.dart';
import 'package:test_01_h_r/app/modules/success/views/success_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.SUCCESS,
      page: () => SuccessView(),
      binding: SuccessBinding(),
    ),
    GetPage(
      name: _Paths.FAILED,
      page: () => FailedView(),
      binding: FailedBinding(),
    ),
  ];
}
