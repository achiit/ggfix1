import '../../../config.dart';
import '../../../plugin_list.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationProvider>(
        builder: (context1, notification, child) {
      //direction layout
      return DirectionLayout(
          //load event
          dChild: StatefulWrapper(
        onInit: () => Future.delayed(const Duration(milliseconds: 10))
            .then((_) => notification.onReady(context)),
        child: Scaffold(
            backgroundColor: appColor(context).appTheme.backGroundColorMain,
            body: SafeArea(
                child: Column(children: [
              //appbar for notification layout
              CommonAppBar(
                      appName: language(context, appFonts.notification),
                      isIcon: true,
                      onPressed: () => notification.onBackArrow(
                          context, notification.isBack))
                  .paddingSymmetric(vertical: Insets.i10),
              //notification list layout
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: appArray.notificationList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return NotificationSubLayout(
                        index: index, data: appArray.notificationList[index]);
                  })
            ]).paddingSymmetric(horizontal: Insets.i20))),
      ));
    });
  }
}
