import 'package:fuzzy/widgets/common_loading.dart';

import '../../../config.dart';
import 'package:fuzzy/plugin_list.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RegistrationProvider>(
        builder: (context1, registration, child) {
      //direction layout
      return LoadingOverlay(
        isLoading: registration.isLoading,
        child: DirectionLayout(
            dChild: Scaffold(
                backgroundColor: appColor(context).appTheme.primaryColor,
                body: SafeArea(
                    child: SingleChildScrollView(
                        child: Stack(children: [
                  Stack(
                    children: [
                      Image.asset(
                        imageAssets.background,
                        fit:
                            BoxFit.cover, // Make sure the image covers the area
                        // width: double.infinity,
                        // height: double.infinity,
                      ),
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.3,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              appColor(context)
                                  .appTheme
                                  .backGroundColor, // Bottom color
                              Colors.transparent, // Top color
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Form(
                    key: registration.registrationKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(children: [
                            //top text layout
                            CommonWidget().commonTextLoginRegistration(context),
                            //registration text layout
                            const TextFieldLayoutRegistration()
                          ]),
                          Column(children: [
                            VSpace(MediaQuery.of(context).size.height * 0.055),
                            //registration click event
                            ButtonCommon(
                                title: language(context, appFonts.signUp),
                                onTap: () =>
                                    registration.onRegistration(context)),
                            const VSpace(Sizes.s30),
                            Image.asset(imageAssets.oR),
                            const VSpace(Sizes.s30),
                            //bottom sign in link layout
                            CommonAuthRichText(
                                text: language(context, appFonts.accountCreate),
                                subtext: language(context, appFonts.signIn),
                                onTap: () => route.pop(context))
                          ]).paddingSymmetric(vertical: Insets.i30)
                        ]).paddingSymmetric(horizontal: Insets.i20),
                  )
                ]))))),
      );
    });
  }
}
