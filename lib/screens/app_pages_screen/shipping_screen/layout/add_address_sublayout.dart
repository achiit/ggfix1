import '../../../../config.dart';
import '../../../../plugin_list.dart';

class AddAddressSubLayout extends StatelessWidget {
  const AddAddressSubLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AddressProvider>(builder: (context1, address, child) {
      return Row(children: [
        Expanded(
            child: Column(children: [
          //common text
          ShippingWidget()
              .textCommon(language(context, appFonts.city), false, context),
          const VSpace(Sizes.s6),
          //textfield
          CommonTextFieldAddress(
              hintText: language(context, appFonts.hintCity),
              controller: address.cityController,
              keyboardType: TextInputType.text,
              focusNode: address.cityFocus,
              /*validator: (value) => Validation().nameValidation(context, value)*/)
        ])),
        const HSpace(Sizes.s15),
        Expanded(
            child: Column(children: [
          //common text
          ShippingWidget()
              .textCommon(language(context, appFonts.zipCode), false, context),
          const VSpace(Sizes.s6),
          //text field
          CommonTextFieldAddress(
              hintText: language(context, appFonts.hintZipCode),
              controller: address.zipCodeController,
              keyboardType: TextInputType.number,
              focusNode: address.zipCodeFocus,
             /* validator: (value) => Validation().nameValidation(context, value)*/)
        ]))
      ]);
    });
  }
}
