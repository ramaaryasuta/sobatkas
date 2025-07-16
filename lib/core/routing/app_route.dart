import 'package:auto_route/auto_route.dart';
import 'package:sobatkas/core/routing/app_route.gr.dart';

@AutoRouterConfig()
class AppRoute extends RootStackRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: RegisterRoute.page),
  ];
}
