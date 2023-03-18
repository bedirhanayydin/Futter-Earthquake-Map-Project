import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../view/home/view/home_view.dart';
import '../../constants/navigation/navigation_constants.dart';
import 'inavigation_manager.dart';

class NavigationManager implements INavigationManager {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  BuildContext get rootContext => navigatorKey.currentState!.overlay!.context;
  final removeAllOldRoutes = (Route<dynamic> route) => false;

  @override
  Future<T?> pushToView<T extends Object?>(Widget view) async {
    return await navigatorKey.currentState!.push(CupertinoPageRoute(builder: (context) => view));
  }

  @override
  Future<void> pushToNamed({required String path, Object? data}) async {
    await navigatorKey.currentState!.pushNamed(path, arguments: data);
  }

  @override
  Future<T?> pushToNamedAndRemoveUntil<T extends Object?>(
    String newRouteName, {
    Object? arguments,
  }) async {
    return await navigatorKey.currentState!
        .pushNamedAndRemoveUntil(newRouteName, removeAllOldRoutes, arguments: arguments);
  }

  @override
  Future<T?> pushToAndRemoveUntil<T extends Object?>(Widget view, {bool hasBack = false}) async {
    return await navigatorKey.currentState!.pushAndRemoveUntil(
        CupertinoPageRoute(builder: (context) => view), (route) => hasBack /*for back button pop */);
  }

  @override
  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.LOGIN:
        return normalNavigate(const HomeView());

      case NavigationConstants.HOME:
        return normalNavigate(const HomeView());

      default:
        return MaterialPageRoute(
          builder: (context) => const HomeView(),
        );
    }
  }

  @override
  CupertinoPageRoute normalNavigate(Widget widget) {
    return CupertinoPageRoute(
      builder: (context) => widget,
    );
  }

  @override
  Future<bool> popMe<T extends Object?>([T? result]) async {
    return await navigatorKey.currentState!.maybePop(result);
  }
}
