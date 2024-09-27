import '../../../../../config.dart';
import '../../../../../plugin_list.dart';

class DetailsTopContainer extends StatelessWidget {
  final dynamic data;

  const DetailsTopContainer({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.s70,
      width: Sizes.s70,
      padding: const EdgeInsets.all(Insets.i10),
      //decoration of container
      decoration: DetailsWidget().decorationTopContainer(context),
      child: Column(children: [
        //svg icon
        SvgPicture.asset(data['icon'], fit: BoxFit.scaleDown),
        const VSpace(Sizes.s4),
        Expanded(
            flex: 2,
            //title name
            child: Text(language(context, data['title']),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: appCss.dmPoppinsRegular12
                    .textColor(isThemeColorReturn(context))))
      ]),
    );
  }
}
