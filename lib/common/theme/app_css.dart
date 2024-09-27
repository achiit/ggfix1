import 'package:google_fonts/google_fonts.dart';
import '../../config.dart';

FontWeight thin = FontWeight.w100;
FontWeight extraLight = FontWeight.w200;
FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.normal;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;
FontWeight extraThickBold = FontWeight.bold;

//dmPoppins font
 TextStyle dmPoppins({double? fontsize, fontWeight}) =>
     GoogleFonts.poppins(fontSize: fontsize, fontWeight: fontWeight);

 TextStyle dmArsenal({double? fontsize, fontWeight}) =>
    GoogleFonts.arsenal(fontSize: fontsize, fontWeight: fontWeight);


class AppCss {

//Text Style dmArsenal
  TextStyle dmArsenalSemiBold22= dmPoppins(fontWeight: semiBold,fontsize:FontSizes.f22);

//Text Style dmPoppins extra bold
  TextStyle dmPoppinsExtraBold70 = dmPoppins( fontWeight: extraBold,fontsize:FontSizes.f70);
  TextStyle dmPoppinsExtraBold65 = dmPoppins( fontWeight:extraBold ,fontsize:FontSizes.f65);
  TextStyle dmPoppinsExtraBold60 = dmPoppins( fontWeight: extraBold,fontsize:FontSizes.f60);
  TextStyle dmPoppinsExtraBold40 = dmPoppins( fontWeight: extraBold,fontsize:FontSizes.f40);
  TextStyle dmPoppinsExtraBold20 = dmPoppins( fontWeight: extraBold,fontsize:FontSizes.f20);
  TextStyle dmPoppinsExtraBold25 = dmPoppins( fontWeight:extraBold ,fontsize:FontSizes.f25);
  TextStyle dmPoppinsExtraBold30 = dmPoppins( fontWeight: extraBold,fontsize:FontSizes.f30);


  //Text Style dmPoppins bold
  TextStyle dmPoppinsExtraBold22 = dmPoppins(fontWeight: extraBold,fontsize:FontSizes.f22);
  TextStyle dmPoppinsExtraBold18 = dmPoppins(fontWeight: extraBold,fontsize:FontSizes.f18);
  TextStyle dmPoppinsExtraBold16 = dmPoppins(fontWeight: extraBold,fontsize:FontSizes.f16);
  TextStyle dmPoppinsExtraBold14 = dmPoppins(fontWeight: extraBold,fontsize:FontSizes.f14);
  TextStyle dmPoppinsExtraBold12 = dmPoppins(fontWeight: extraBold,fontsize:FontSizes.f12);

  //Text Style semi dmPoppins bold
  TextStyle dmPoppinsBold50 = dmPoppins(fontWeight: bold,fontsize:FontSizes.f50);
  TextStyle dmPoppinsBold38 = dmPoppins(fontWeight: bold,fontsize:FontSizes.f38);
  TextStyle dmPoppinsBold35 = dmPoppins(fontWeight: bold,fontsize:FontSizes.f35);
  TextStyle dmPoppinsBold24 = dmPoppins(fontWeight: bold,fontsize:FontSizes.f24);
  TextStyle dmPoppinsBold20 = dmPoppins(fontWeight: bold,fontsize:FontSizes.f20);
  TextStyle dmPoppinsBold18 = dmPoppins(fontWeight: bold,fontsize:FontSizes.f18);
  TextStyle dmPoppinsBold16 = dmPoppins(fontWeight: bold,fontsize:FontSizes.f16);
  TextStyle dmPoppinsBold15 = dmPoppins(fontWeight: bold,fontsize:FontSizes.f15);
  TextStyle dmPoppinsBold17 = dmPoppins(fontWeight: bold,fontsize:FontSizes.f17);
  TextStyle dmPoppinsBold14 = dmPoppins(fontWeight: bold,fontsize:FontSizes.f14);
  TextStyle dmPoppinsBold13 = dmPoppins(fontWeight: bold,fontsize:FontSizes.f13);
  TextStyle dmPoppinsBold12 = dmPoppins(fontWeight: bold,fontsize:FontSizes.f12);
  TextStyle dmPoppinsBold10 = dmPoppins(fontWeight: bold,fontsize:FontSizes.f10);

  TextStyle dmPoppinsSemiBold26= dmPoppins(fontWeight: semiBold,fontsize:FontSizes.f26);
  TextStyle dmPoppinsSemiBold24= dmPoppins(fontWeight: semiBold,fontsize:FontSizes.f24);
  TextStyle dmPoppinsSemiBold23= dmPoppins(fontWeight: semiBold,fontsize:FontSizes.f23);
  TextStyle dmPoppinsSemiBold22= dmPoppins(fontWeight: semiBold,fontsize:FontSizes.f22);
  TextStyle dmPoppinsSemiBold20= dmPoppins(fontWeight: semiBold,fontsize:FontSizes.f20);
  TextStyle dmPoppinsSemiBold18= dmPoppins(fontWeight: semiBold,fontsize:FontSizes.f18);
  TextStyle dmPoppinsSemiBold16= dmPoppins(fontWeight: semiBold,fontsize:FontSizes.f16);
  TextStyle dmPoppinsSemiBold15= dmPoppins(fontWeight: semiBold,fontsize:FontSizes.f15);
  TextStyle dmPoppinsSemiBold13= dmPoppins(fontWeight: semiBold,fontsize:FontSizes.f13);
  TextStyle dmPoppinsSemiBold14= dmPoppins(fontWeight: semiBold,fontsize:FontSizes.f14);
  TextStyle dmPoppinsSemiBold12= dmPoppins(fontWeight: semiBold,fontsize:FontSizes.f12);
  TextStyle dmPoppinsSemiBold10= dmPoppins(fontWeight: semiBold,fontsize:FontSizes.f10);
  TextStyle dmPoppinsSemiBold9= dmPoppins(fontWeight: semiBold,fontsize:FontSizes.f9);


  //Text Style dmPoppins medium
  TextStyle dmPoppinsMedium28 = dmPoppins(fontWeight: medium,fontsize:FontSizes.f28);
  TextStyle dmPoppinsMedium22 = dmPoppins(fontWeight: medium,fontsize:FontSizes.f22);
  TextStyle dmPoppinsMedium20 = dmPoppins(fontWeight: medium,fontsize:FontSizes.f20);
  TextStyle dmPoppinsMedium18 = dmPoppins(fontWeight: medium,fontsize:FontSizes.f18);
  TextStyle dmPoppinsMedium16 = dmPoppins(fontWeight: medium,fontsize:FontSizes.f16);
  TextStyle dmPoppinsMedium15 = dmPoppins(fontWeight: medium,fontsize:FontSizes.f15);
  TextStyle dmPoppinsMedium14 = dmPoppins(fontWeight: medium,fontsize:FontSizes.f14);
  TextStyle dmPoppinsMedium13 = dmPoppins(fontWeight: medium,fontsize:FontSizes.f13);
  TextStyle dmPoppinsMedium12 = dmPoppins(fontWeight: medium,fontsize:FontSizes.f12);
  TextStyle dmPoppinsMedium11 = dmPoppins(fontWeight: medium,fontsize:FontSizes.f11);
  TextStyle dmPoppinsMedium10 = dmPoppins(fontWeight: medium,fontsize:FontSizes.f10);
  TextStyle dmPoppinsMedium8 = dmPoppins(fontWeight: medium,fontsize:FontSizes.f8);
  TextStyle dmPoppinsMedium6 = dmPoppins(fontWeight: medium,fontsize:FontSizes.f6);

  //Text Style dmPoppins regular

  TextStyle dmPoppinsRegular18 = dmPoppins(fontWeight: regular,fontsize:FontSizes.f18);
  TextStyle dmPoppinsRegular16 = dmPoppins(fontWeight: regular,fontsize:FontSizes.f16);
  TextStyle dmPoppinsRegular14 = dmPoppins(fontWeight: regular,fontsize:FontSizes.f14);
  TextStyle dmPoppinsRegular13 = dmPoppins(fontWeight: regular,fontsize:FontSizes.f13);
  TextStyle dmPoppinsRegular12 = dmPoppins(fontWeight: regular,fontsize:FontSizes.f12);
  TextStyle dmPoppinsRegular11 = dmPoppins(fontWeight: regular,fontsize:FontSizes.f11);
  TextStyle dmPoppinsRegular10 = dmPoppins(fontWeight: regular,fontsize:FontSizes.f10);


  TextStyle dmPoppinsLight16 = dmPoppins(fontWeight: light,fontsize:FontSizes.f16);
  TextStyle dmPoppinsLight14 = dmPoppins(fontWeight: light,fontsize:FontSizes.f14);
  TextStyle dmPoppinsLight12 = dmPoppins(fontWeight: light,fontsize:FontSizes.f12);

}
