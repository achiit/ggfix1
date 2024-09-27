import '../config.dart';

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  //offer zone image design
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, 0);
    path_0.lineTo(27, 0);
    path_0.lineTo(27, 21.8139);
    path_0.cubicTo(27, 24.198, 27, 25.3901, 26.2215, 25.9906);
    path_0.cubicTo(25.4429, 26.5911, 24.2899, 26.2883, 21.984, 25.6827);
    path_0.lineTo(14.5161, 23.7214);
    path_0.cubicTo(14.0108, 23.5887, 13.7582, 23.5224, 13.5, 23.5224);
    path_0.cubicTo(13.2418, 23.5224, 12.9892, 23.5887, 12.484, 23.7214);
    path_0.lineTo(5.01605, 25.6827);
    path_0.cubicTo(2.71006, 26.2883, 1.55707, 26.5911, 0.778536, 25.9906);
    path_0.cubicTo(0, 25.3901, 0, 24.198, 0, 21.8139);
    path_0.lineTo(0, 0);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xffF45050).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
