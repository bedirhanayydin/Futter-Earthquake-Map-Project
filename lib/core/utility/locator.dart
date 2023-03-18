import 'package:get_it/get_it.dart';

import '../../view/home/home_repository/home_repository.dart';
import '../init/constant_manager/constant_manager.dart';
import '../init/lang/language_manager.dart';
import '../init/navigation/navigation_manager.dart';
import '../init/network/network_manager.dart';

var locator = GetIt.I;

void setupLocator() {
  locator.registerLazySingleton(() => NetworkManager());
  locator.registerLazySingleton(() => NavigationManager());
  locator.registerLazySingleton(() => LanguageManager());
  locator.registerLazySingleton(() => HomeRepository());
  locator.registerLazySingleton(() => ConstantManager());
}
