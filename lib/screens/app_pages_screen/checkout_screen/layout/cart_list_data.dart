import 'package:fuzzy/config.dart';
import 'package:fuzzy/plugin_list.dart';

class CartListData extends StatelessWidget {
  const CartListData({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context1, cart, child) {
      return Column(
        children: [
          const VSpace(Sizes.s25),
          //divider on checkout page
           CommonWidget().commonDivider(context),
          const VSpace(Sizes.s20),
          //cart list on check out page
          ...cart.cartList
              .asMap()
              .entries
              .map((e) => CartSubLayout(
                    index: e.key,
                    data: e.value,
                  ))
              .toList(),
          const VSpace(Sizes.s5),
          //divider on checkout page
          CommonWidget().commonDivider(context),
          const VSpace(Sizes.s20),
          //choose shipping text layout
          CheckOutWidget().mainAllText(context,
              mainText: language(context, appFonts.chooseShipping)),
          const VSpace(Sizes.s15),
        ],
      );
    });
  }
}
