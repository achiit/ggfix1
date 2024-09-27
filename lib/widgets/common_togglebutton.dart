import '../../../config.dart';
import '../plugin_list.dart';

class CommonToggleButton extends StatelessWidget {
  final ValueChanged<bool>? onToggle;
  final bool? value;

  const CommonToggleButton({super.key, this.onToggle, this.value});

  @override
  Widget build(BuildContext context) {
    //toggle button
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      FlutterSwitch(
          width: Sizes.s42,
          height: Sizes.s28,
          toggleSize: Sizes.s15,
          value: value!,
          borderRadius: Insets.i15,
          padding: 5,
          toggleColor: appColor(context).appTheme.primaryColor,
          inactiveToggleColor: appColor(context).appTheme.lightText,
          activeColor: appColor(context).appTheme.lightText,
          inactiveColor: appColor(context).appTheme.primaryColor,
          onToggle: onToggle!),
      const VSpace(Sizes.s12)
    ]);
  }
}
