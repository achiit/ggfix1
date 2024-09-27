import 'package:fuzzy/plugin_list.dart';
import '../../../../config.dart';

class AddressTypeSubLayout extends StatelessWidget {
  final int index;
  final dynamic data;
  const AddressTypeSubLayout({super.key, required this.index, this.data});

  @override
  Widget build(BuildContext context) {
    return Consumer<AddressProvider>(builder: (context1, address, child) {
      return Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const HSpace(Sizes.s10),
        //radio button
        CommonRadio(
            index: index,
            selectedIndex: address.selectRadio,
            onTap: () => address.selectAddressType(data, index)),
        const HSpace(Sizes.s5),
        Text(language(context, data["title"].toString()),
            overflow: TextOverflow.ellipsis,
            style: appCss.dmPoppinsSemiBold14
                .textColor(isThemeColorReturn(context))),
        const HSpace(Sizes.s15),
        if (data['id'] != 3)
          //divider
          ShippingWidget().divider(context)
      ]).inkWell(onTap: () => address.selectAddressType(data, index));
    });
  }
}
