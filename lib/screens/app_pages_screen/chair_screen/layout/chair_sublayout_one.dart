import 'package:fuzzy/plugin_list.dart';
import '../../../../config.dart';

class ChairSubLayoutOne extends StatelessWidget {
  final int index;
  final dynamic data;

  const ChairSubLayoutOne({super.key, required this.index, this.data});

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(builder: (context1, category, child) {
      return GestureDetector(
          onTap: () => route.pushNamed(context, routeName.detailsScreen),
          child: Stack(children: [
            //grid view layout
            CommonContainerGrid(
                imagePath: data['image'].toString(),
                //cart button layout and click event
                widget: CommonCartButton(
                  imagePath: svgAssets.iconCart,
                  onTap: () => category.moveToCart(
                      index,
                      category.chairList as List<Map<String, dynamic>>,
                      context),
                ).paddingOnly(right: Insets.i9)),
            //chair page sub layout
            ChairSubLayout(index: index, data: data)
          ]));
    });
  }
}
