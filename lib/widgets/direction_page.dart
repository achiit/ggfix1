import '../config.dart';
import '../plugin_list.dart';

class DirectionLayout extends StatelessWidget {
  final Widget dChild;

  const DirectionLayout({
    super.key,
    required this.dChild,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<DirectionProvider>(builder: (context, direction, child) {
      //direction set
      return Directionality(
          textDirection: direction.getDirection == true || isAr(context)
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: dChild);
    });
  }
}
