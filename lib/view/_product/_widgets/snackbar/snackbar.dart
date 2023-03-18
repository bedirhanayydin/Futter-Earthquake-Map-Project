// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/color/color_constants.dart';

class CustomSnackBar {
  CustomSnackBar(
    BuildContext context,
    Widget content, {
    SnackBarAction? snackBarAction,
    required String assetName,
  }) {
    final SnackBar snackBar = SnackBar(
        action: snackBarAction,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        backgroundColor: ColorConstants.instance.map_bound.withOpacity(0.71),
        content: Row(
          children: [
            SvgPicture.asset(assetName),
            SizedBox(
              width: MediaQuery.of(context).size.width / 15,
            ),
            Expanded(child: content),
          ],
        ),
        behavior: SnackBarBehavior.floating);

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
