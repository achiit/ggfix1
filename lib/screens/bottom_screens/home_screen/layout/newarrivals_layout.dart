import '../../../../config.dart';
import '../../../../plugin_list.dart';

class NewArrivalLayout extends StatelessWidget {
  const NewArrivalLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<HomeProvider, ThemeService>(
        builder: (context1, home, theme, child) {
      //gridview new arrival layout
      return GridView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: home.newArrivalList.length,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: 0.64,
              crossAxisSpacing: 12.0,
              mainAxisSpacing: 10.0,
              maxCrossAxisExtent: 200),
          itemBuilder: (context, index) {
            return NewArrivalSubLayoutOne(
                index: index, data: home.newArrivalList[index]);
          });
    });
  }
}
