import 'package:fuzzy/plugin_list.dart';
import '../../../../config.dart';

class DetailsDimensionTableLayout extends StatelessWidget {
  const DetailsDimensionTableLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context1, theme, child) {
      return Center(
          //dimension table layout
          child: Table(
              border: TableBorder.symmetric(
                  inside: BorderSide(
                      width: Sizes.s1,
                      color: isTheme(context)
                          ? appColor(context).appTheme.primaryColor
                          : appColor(context)
                              .appTheme
                              .primaryColor
                              .withOpacity(0.07)),
                  outside: BorderSide.none),
              children: [
            TableRow(children: [
              ...appArray.tableList
                  .asMap()
                  .entries
                  .map(
                    (e) =>
                        //table row title layout
                        TableCell(
                            child: DetailsWidget()
                                .tableHeaderText(context, e.value['title'])
                                .paddingSymmetric(
                                    horizontal: Insets.i15,
                                    vertical: Insets.i8)),
                  )
                  .toList(),
            ]),
            TableRow(children: [
              //title sub layout of table
              TableCell(
                  child: DetailsWidget()
                      .tableText(context, appFonts.heightCm)
                      .paddingSymmetric(
                          horizontal: Insets.i10, vertical: Insets.i10)),
              TableCell(
                  child: DetailsWidget()
                      .tableText(context, appFonts.widthCm)
                      .paddingSymmetric(
                          horizontal: Insets.i13, vertical: Insets.i10)),
              TableCell(
                  child: DetailsWidget()
                      .tableText(context, appFonts.lengthCm)
                      .paddingSymmetric(
                          horizontal: Insets.i20, vertical: Insets.i10)),
              TableCell(
                  child: DetailsWidget()
                      .tableText(context, appFonts.weightCm)
                      .paddingSymmetric(
                          horizontal: Insets.i21, vertical: Insets.i10))
            ])
          ]).paddingSymmetric(horizontal: Insets.i12, vertical: Insets.i15));
    });
  }
}
