import '../../../../config.dart';
import '../../../../plugin_list.dart';

class WriteReviewLayout extends StatelessWidget {
  const WriteReviewLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<DetailsProvider, DirectionProvider>(
        builder: (context1, details, direction, child) {
      //direction layout
      return DirectionLayout(
          dChild: SingleChildScrollView(
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: Insets.i20),
                  //decoration box
                  decoration: ReviewWidget().decoration(context),
                  child: Column(children: [
                    Stack(children: [
                      //text widget
                      ShippingWidget()
                          .textCommon(language(context, appFonts.createReview),
                              false, context)
                          .paddingOnly(top: Insets.i20),
                      //align set
                      CommonWidget()
                          .topAlign(
                              context,
                              //svg image
                              CommonWidget()
                                  .svgAssets(context, svgAssets.iconClose))
                          .inkWell(onTap: () => route.pop(context))
                          .paddingOnly(top: Insets.i15)
                    ]),
                    //divider
              CommonWidget().commonDivider(context)
                        .paddingOnly(top: Insets.i15, bottom: Insets.i20),
                    //text widget
                    ShippingWidget().textCommon(
                        language(context, appFonts.name), true, context),
                    const VSpace(Sizes.s6),
                    CommonTextFieldAddress(
                        hintText: language(context, appFonts.hintCity),
                        controller: details.nameController,
                        keyboardType: TextInputType.text,
                        focusNode: details.nameFocus,
                        /*validator: (value) =>
                            Validation().nameValidation(context, value)*/),
                    const VSpace(Sizes.s15),
                    //text widget
                    ShippingWidget().textCommon(
                        language(context, appFonts.email), true, context),
                    const VSpace(Sizes.s6),
                    CommonTextFieldAddress(
                        hintText: language(context, appFonts.hintEmail),
                        controller: details.emailController,
                        keyboardType: TextInputType.text,
                        focusNode: details.emailFocus,
                       /* validator: (value) =>
                            Validation().emailValidation(context, value)*/),
                    const VSpace(Sizes.s15),
                    //sub layout
                    const WriteReviewSubLayout()
                  ]))));
    });
  }
}
