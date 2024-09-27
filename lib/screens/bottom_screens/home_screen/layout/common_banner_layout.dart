import 'package:flutter/material.dart';

import '../../../../config.dart';
import '../../../../plugin_list.dart';

class CommonBannerLayout extends StatelessWidget {
  final String? imagePath;
  final GestureTapCallback? onPressed;

  const CommonBannerLayout(
      {super.key, this.imagePath, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(children: [
        //common banner layout
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.2,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(Sizes.s10),
            child: Image.asset(
              imagePath!,
              height: Sizes.s10,
              fit: BoxFit.cover,
            ),
          ),
        ),

      ]),
    );
  }
}
