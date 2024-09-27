import '../../../config.dart';
import 'package:fuzzy/plugin_list.dart';

class CreatePassword extends StatelessWidget {
  const CreatePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CreatePasswordProvider>(
        builder: (context1, changepassword, child) {
      return DirectionLayout(
          dChild: StatefulWrapper(
        onInit: () => Future.delayed(const Duration(milliseconds: 10))
            .then((_) => changepassword.onReady(context)),
        child: Scaffold(
            backgroundColor: appColor(context).appTheme.primaryColor,
            body: SafeArea(
                child: SingleChildScrollView(
                    child: Form(
                        key: changepassword.changePasswordKey,
                        child: Stack(children: [
                          Image.asset(imageAssets.background),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                VSpace(
                                    MediaQuery.of(context).size.height * 0.23),
                                Text(
                                    language(
                                        context, appFonts.createNewPassword),
                                    style: appCss.dmPoppinsSemiBold22.textColor(
                                        appColor(context).appTheme.whiteColor)),
                                const VSpace(Sizes.s30),
                                //password text field
                                const CreatePasswordTextField(),
                                const VSpace(Sizes.s45),
                                //changepassword button click event
                                ButtonCommon(
                                    title: language(
                                        context, appFonts.resetPassword),
                                    onTap: () => changepassword
                                        .onChangePassword(context)),
                              ]).paddingSymmetric(horizontal: Insets.i20)
                        ]))))),
      ));
    });
  }
}
