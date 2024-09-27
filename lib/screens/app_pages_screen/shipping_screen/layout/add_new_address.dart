import 'package:fuzzy/plugin_list.dart';

import '../../../../config.dart';

class AddNewAddress extends StatelessWidget {
  const AddNewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AddressProvider>(builder: (context, address, child) {
      //direction layout
      return DirectionLayout(
          dChild: Scaffold(
              backgroundColor: appColor(context).appTheme.backGroundColorMain,
              resizeToAvoidBottomInset: false,
              body: SafeArea(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    SingleChildScrollView(
                        child: Form(
                            key: address.addressKey,
                            child: const Stack(children: [
                              Column(children: [
                                //address sub layout
                                AddressTextLayout(),
                                VSpace(Sizes.s15),
                                //add address sub layout
                                AddAddressSubLayout(),
                                //address type layout
                                AddressTypeLayout()
                              ])
                            ]))).paddingSymmetric(horizontal: Insets.i20),
                    //add address bottom button layout
                    const AddAddressButtonSubLayout()
                  ]))));
    });
  }
}
