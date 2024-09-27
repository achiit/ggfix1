import '../../../../config.dart';
import '../../../../plugin_list.dart';

class AddressTextLayout extends StatelessWidget {
  const AddressTextLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AddressProvider>(builder: (context1, address, child) {
      return Stack(children: [
        Column(children: [
          //appbar for add address layout
          ShippingWidget().appbarAddAddress(context),
          //common text
          ShippingWidget()
              .textCommon(language(context, appFonts.name), false, context),
          const VSpace(Sizes.s6),
          //textfield
          CommonTextFieldAddress(
              hintText: language(context, appFonts.hintName),
              controller: address.nameController,
              keyboardType: TextInputType.text,
              focusNode: address.nameFocus,
              /*validator: (value) =>
                  Validation().nameValidation(context, value)*/),
          const VSpace(Sizes.s15),
          //common text
          ShippingWidget().textCommon(
              language(context, appFonts.phoneNumberAddress), false, context),
          const VSpace(Sizes.s6),
          //textfield
          CommonTextFieldAddress(
              hintText: language(context, appFonts.hintPhoneNumber),
              controller: address.phoneNumberController,
              keyboardType: TextInputType.number,
              focusNode: address.phoneNumberFocus,
              /*validator: (value) =>
                  Validation().nameValidation(context, value)*/),
          const VSpace(Sizes.s15),
          //common text
          ShippingWidget().textCommon(
              language(context, appFonts.streetAddress), false, context),
          const VSpace(Sizes.s6),
          //textfield
          CommonTextFieldAddress(
              hintText: language(context, appFonts.hintStreetAddress),
              controller: address.streetController,
              keyboardType: TextInputType.streetAddress,
              focusNode: address.streetFocus,
              /*validator: (value) =>
                  Validation().nameValidation(context, value)*/),
          const VSpace(Sizes.s15),
          //common text
          ShippingWidget()
              .textCommon(language(context, appFonts.landMark), false, context),
          const VSpace(Sizes.s6),
          //textfield
          CommonTextFieldAddress(
              hintText: language(context, appFonts.hintLandMark),
              controller: address.landMarkController,
              keyboardType: TextInputType.text,
              focusNode: address.landMarkFocus,
              /*validator: (value) => Validation().nameValidation(context, value)*/)
        ])
      ]);
    });
  }
}
