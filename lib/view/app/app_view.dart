import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/init/navigation/navigation_manager.dart';
import '../../core/utility/locator.dart';
import '../home/view/home_view.dart';

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        //useInheritedMediaQuery: true, for device preview but it will deny keyboard scroll on column
        builder: ((context, childWidget) {
          childWidget = DevicePreview.appBuilder(context, childWidget);
          return childWidget;
        }),
        title: "Earthquake APP",
        home: HomeView(),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale, //DevicePreview.locale(context),
        onGenerateRoute: locator<NavigationManager>().generateRoute,
        navigatorKey: locator<NavigationManager>().navigatorKey,
      ),
    );
  }
}
