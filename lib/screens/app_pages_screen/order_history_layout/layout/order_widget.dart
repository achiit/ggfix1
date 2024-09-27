import '../../../../config.dart';

class OrderWidget {
  //orderDetails decor box
  BoxDecoration deco(context) => BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(AppRadius.r8)),
      color: appColor(context).appTheme.colorContainer);

  //history page decor box
  BoxDecoration decoBorder() => const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(AppRadius.r4)));

  //history Container Decor
  BoxDecoration decorContainer(context, data) => BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(AppRadius.r4)),
      color: data['deliveryStatus'] == appFonts.onGoing
          ? appColor(context).appTheme.highLight.withOpacity(0.12)
          : appColor(context).appTheme.highLightRed.withOpacity(0.12));
//history page decor
  BoxDecoration decorHistory(context) => BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(AppRadius.r6)),
      color: appColor(context).appTheme.searchBackground);
}
