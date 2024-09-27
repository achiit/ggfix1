import 'package:fuzzy/config.dart';
import 'package:fuzzy/plugin_list.dart';

class ProfileListLayout extends StatelessWidget {
  final int index;
  final dynamic data;

  const ProfileListLayout({super.key, this.data, required this.index});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(builder: (context, profile, child) {
      return Column(children: [
        Row(children: [
          Container(
              height: Sizes.s44,
              width: Sizes.s44,
              //decoration
              decoration: ProfileWidget().decor(context),
              padding: const EdgeInsets.all(Insets.i10),
              child:
                  //svg icon
                  CommonWidget().svgAssets(context, data['icon'].toString())),
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            padding: const EdgeInsets.symmetric(horizontal: Insets.i10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //text layout
                  Text(language(context, data['title'].toString()),
                      style: appCss.dmPoppinsMedium15
                          .textColor(isThemeColorReturn(context))),
                  Text(language(context, data['subtitle'].toString()),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: appCss.dmPoppinsRegular13
                          .textColor(appColor(context).appTheme.lightText))
                ]),
          )
        ]),
        VSpace(MediaQuery.of(context).size.height * 0.02),
        if (index != profile.profileListOne.length - 1)
          //divider
          SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Divider(
                  height: 2,
                  color: isTheme(context)
                      ? appColor(context)
                          .appTheme
                          .colorDivider
                          .withOpacity(0.34)
                      : appColor(context).appTheme.colorDivider))
      ]).paddingOnly(top: Insets.i10, left: Insets.i20, right: Insets.i20);
    });
  }
}
