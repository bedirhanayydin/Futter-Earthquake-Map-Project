import 'package:flutter/material.dart';

import '../../../view/home/home_repository/home_repository.dart';
import '../../init/constant_manager/constant_manager.dart';
import '../../init/navigation/navigation_manager.dart';
import '../../init/network/network_manager.dart';
import '../../utility/locator.dart';

abstract class BaseViewModel {
  BuildContext? ctx;

  final navigationManager = locator<NavigationManager>();
  final networkManager = locator<NetworkManager>();
  final homeRepository = locator<HomeRepository>();
  final constantManager = locator<ConstantManager>();

  void setContext(BuildContext context);
  void init();
}
