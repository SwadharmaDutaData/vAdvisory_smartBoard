part of 'shared.dart';

const double defaultMargin = 24;
Color mainColor = const Color(0xFF045f6b);
Color minorColor = const Color(0xFF29c0d3);
Color secondaryColor = const Color(0xFFf26426);
Color thirdColor = const Color(0xFFf89b51);
Color errorColor = const Color(0xFFD9435E);
Color backgroundColor = const Color(0xFFFFFFFF);
Color darkGrey = const Color(0xFF343434);
Color deepGrey = const Color(0xFF878787);
Color borderGrey = const Color(0xFFEFEFEF);
Color greyBackground = const Color(0xFFF3F5FF);
Color redColor = const Color(0xFFE22727);
Color lineColor = const Color(0xFFF4F4F4);
Color successColor = const Color(0xFF00CA71);
Color statusOkColor = const Color(0xFF1c8014);
Color filter = const Color(0xFFFCEEEE);

TextStyle primaryTextFont = GoogleFonts.montserrat()
    .copyWith(color: Colors.black, fontWeight: FontWeight.normal);
TextStyle secondaryTextFont = GoogleFonts.montserrat()
    .copyWith(color: secondaryColor, fontWeight: FontWeight.normal);

Widget loadingIndicator = SpinKitFadingCircle(
  size: 45,
  color: Colors.white,
);

Widget smallLoadingIndicator = SpinKitFadingCircle(
  size: 45,
  color: secondaryColor,
);

Map<int, Color> color =
{
  50:const Color.fromRGBO(136,14,79, .1),
  100:const Color.fromRGBO(136,14,79, .2),
  200:const Color.fromRGBO(136,14,79, .3),
  300:const Color.fromRGBO(136,14,79, .4),
  400:const Color.fromRGBO(136,14,79, .5),
  500:const Color.fromRGBO(136,14,79, .6),
  600:const Color.fromRGBO(136,14,79, .7),
  700:const Color.fromRGBO(136,14,79, .8),
  800:const Color.fromRGBO(136,14,79, .9),
  900:const Color.fromRGBO(136,14,79, 1),
};
