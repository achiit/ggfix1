import 'package:fuzzy/plugin_list.dart';
import '../../../../config.dart';

class LanguageSubLayout extends StatelessWidget {
  final int index;
  final dynamic data;

  const LanguageSubLayout({super.key, required this.index, this.data});

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(builder: (context1, languageCtrl, child) {
      return Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(language(context, data['title'].toString()),
              style: appCss.dmPoppinsMedium14
                  .textColor(isThemeColorReturn(context))),
          //radio button layout
          languageCtrl.getLocal() == data['code']
              ? Container(
                  width: Sizes.s20,
                  height: Sizes.s20,
                  decoration: LanguageWidget().decor(context),
                  child: Icon(Icons.circle,
                      color: appColor(context).appTheme.primaryColor, size: 13))
              : Container(
                  width: Sizes.s20,
                  height: Sizes.s20,
                  decoration: LanguageWidget().decorWithOutColor(context))
        ]).paddingSymmetric(horizontal: Insets.i5),
        const VSpace(Sizes.s10),
        //divider
        if (index != appArray.languageList.length - 1) CommonWidget().commonDivider(context),
      ]).paddingOnly(bottom: Insets.i15);
    });
  }
}
