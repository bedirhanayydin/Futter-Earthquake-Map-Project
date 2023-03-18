import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/constants/color/color_constants.dart';
import '../../../core/constants/image/image_constants.dart';
import '../../../core/init/navigation/navigation_manager.dart';
import '../../../core/utility/locator.dart';
import '../../app/app_view.dart';
import '../../home/home_repository/home_repository.dart';

class SplashScreenPage extends StatefulWidget {
  final String title;
  const SplashScreenPage({super.key, required this.title});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  final controller = PageController();
  bool isLastPage = false;
  @override
  void initState() {
    super.initState();
    locator<HomeRepository>().fetchEarthquakes();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: const EdgeInsets.only(bottom: 80),
          child: PageView(
            controller: controller,
            onPageChanged: (value) {
              setState(() {
                isLastPage = value == 2;
              });
            },
            children: [
              Image(
                image: AssetImage(
                  ImageConstants.instance.splash_1,
                ),
                fit: BoxFit.contain,
              ),
              Image(
                image: AssetImage(
                  ImageConstants.instance.splash_2,
                ),
                fit: BoxFit.contain,
              ),
              Image(
                image: AssetImage(
                  ImageConstants.instance.splash_3,
                ),
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
        bottomSheet: isLastPage
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 182, 5, 5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    backgroundColor: ColorConstants.instance.primary,
                    minimumSize: const Size.fromHeight(70),
                  ),
                  child: const Text('Get Started'),
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
                    prefs.setBool('onBoard', true);

                    locator<NavigationManager>().pushToAndRemoveUntil(AppView());
                  },
                ),
              )
            : Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          controller.jumpToPage(2);
                        },
                        child: const Text('Skip')),
                    Center(
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: 3,
                        effect: WormEffect(
                          spacing: 16,
                          dotColor: Colors.black26,
                          activeDotColor: Colors.teal.shade700,
                        ),
                        onDotClicked: (index) {
                          controller.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: const Text('Next')),
                  ],
                ),
              ),
      ),
    );
  }
}
