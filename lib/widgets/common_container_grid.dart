import '../config.dart';

class CommonContainerGrid extends StatelessWidget {
  final String imagePath;
  final double? height;
  final double? width;
  final Widget? widget;
  final Color? color;

  const CommonContainerGrid(
      {super.key,
      required this.imagePath,
      this.height,
      this.width,
      this.widget,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      //common gridview layout
      Container(
          padding: const EdgeInsets.only(bottom: Insets.i8),
          width: width ?? MediaQuery.of(context).size.width * 0.44,
          decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.all(Radius.circular(AppRadius.r8)),
              color: color ?? appColor(context).appTheme.searchBackground)),
      SizedBox(
          height: height ?? MediaQuery.of(context).size.height * 0.215,
          child: Stack(children: [
            Container(
                padding: const EdgeInsets.all(Insets.i10),
                height: MediaQuery.of(context).size.height * 0.203,
                width: MediaQuery.of(context).size.width * 0.44,
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Insets.i25, vertical: Insets.i20),
                    height: MediaQuery.of(context).size.height * 0.17,
                    width: MediaQuery.of(context).size.width * 0.39,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                            Radius.circular(AppRadius.r6)),
                        color: appColor(context).appTheme.colorContainer),
                    child: Image.asset(imagePath))),
            Container(child: widget),
          ]))
    ]);
  }
}
