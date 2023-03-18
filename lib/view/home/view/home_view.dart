import 'package:custom_info_window/custom_info_window.dart';
import 'package:deprem_harita_proje/core/extension/string_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../../core/base/view/base_widget.dart';
import '../../../core/constants/color/color_constants.dart';
import '../../../core/init/lang/language_manager.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../../core/init/theme/light/text_theme_light.dart';
import '../../../core/utility/locator.dart';
import '../home_repository/home_repository.dart';
import '../viewmodel/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) async {
        model.setContext(context);
        model.init();
        await model.homeRepository.fetchEarthquakes();
        await model.constantManager.loadConstants();
        model.setMapLists(mapLists: locator<HomeRepository>().earthquakes);
        model.setMarkers();
      },
      onPageBuilder: (BuildContext context, HomeViewModel viewModel) {
        return _buildPageBuilder(context, viewModel);
      },
    );
  }

  Widget _buildPageBuilder(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.app_home_earthquakes.locale),
        backgroundColor: ColorConstants.instance.primary,
        centerTitle: true,
        actions: [
          Container(
            width: 50,
            alignment: Alignment.center,
            child: DropdownButton<String>(
              isExpanded: true,
              isDense: true,
              iconEnabledColor: ColorConstants.instance.status_green,
              iconDisabledColor: ColorConstants.instance.clared_red,
              icon: Icon(
                Icons.arrow_drop_down_outlined,
                color: ColorConstants.instance.white,
              ),
              hint: Text(
                LocaleKeys.app_en.locale,
                style: TextThemeLight.instance!.dropdownStyle,
              ),
              elevation: 16,
              underline: SizedBox(),
              onChanged: (String? value) async {
                final locale = FactoryOfMyLocale.create(langMap[value]!);
                context.setLocale(locale);
              },
              items: langMap.keys.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
      key: viewModel.scaffoldKey,
      body: _buildMap(viewModel),
    );
  }

  Widget _buildMap(HomeViewModel viewModel) {
    return Observer(
      builder: (_) => Stack(
        children: [
          GoogleMap(
            initialCameraPosition: viewModel.initalCameraPosition,
            markers: Set<Marker>.from(viewModel.markers),
            polygons: Set<Polygon>.from(viewModel.polygons),
            // cameraTargetBounds: CameraTargetBounds(viewModel.bounds),
            onMapCreated: (GoogleMapController controller) {
              viewModel.controller.complete(controller);

              viewModel.customInfoWindowController.googleMapController = controller;
            },
            zoomControlsEnabled: false,
            minMaxZoomPreference: MinMaxZoomPreference(4.8, 17.2),
            onTap: (position) {
              viewModel.customInfoWindowController.hideInfoWindow?.call();
            },
            onCameraMove: (position) {
              viewModel.customInfoWindowController.onCameraMove?.call();
            },
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
          ),
          CustomInfoWindow(
              controller: viewModel.customInfoWindowController,
              height: MediaQuery.of(context).size.width / 3,
              width: MediaQuery.of(context).size.width / 3.5,
              offset: 55),
        ],
      ),
    );
  }
}
