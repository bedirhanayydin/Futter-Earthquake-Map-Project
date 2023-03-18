import 'package:flutter/cupertino.dart';

abstract class INavigationManager {
  Future<void> pushToNamed({required String path, Object? data});
  Future<T?> pushToView<T extends Object?>(Widget view);
  Future<T?> pushToNamedAndRemoveUntil<T extends Object?>(
    String newRouteName, {
    Object? arguments,
  });
  Future<T?> pushToAndRemoveUntil<T extends Object?>(Widget view);
  Route<dynamic> generateRoute(RouteSettings args);
  CupertinoPageRoute normalNavigate(Widget widget);
  Future<bool> popMe<T extends Object?>([T? result]);
}
