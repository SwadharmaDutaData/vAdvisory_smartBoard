part of 'shared.dart';

class Sizes {
  const Sizes._();

  static const double dimen_0 = 0;
  static const double dimen_1 = 1;
  static const double dimen_2 = 2;
  static const double dimen_4 = 4;
  static const double dimen_6 = 6;
  static const double dimen_8 = 8;
  static const double dimen_9 = 9;
  static const double dimen_10 = 10;
  static const double dimen_12 = 12;
  static const double dimen_14 = 14;
  static const double dimen_16 = 16;
  static const double dimen_18 = 18;
  static const double dimen_20 = 20;
  static const double dimen_22 = 22;
  static const double dimen_24 = 24;
  static const double dimen_28 = 28;
  static const double dimen_30 = 30;
  static const double dimen_32 = 32;
  static const double dimen_36 = 36;
  static const double dimen_38 = 38;
  static const double dimen_40 = 40;
  static const double dimen_45 = 45;
  static const double dimen_48 = 48;
  static const double dimen_50 = 50;
  static const double dimen_56 = 56;
  static const double dimen_60 = 60;
  static const double dimen_64 = 64;
  static const double dimen_72 = 72;
  static const double dimen_76 = 72;
  static const double dimen_80 = 80;
  static const double dimen_96 = 96;
  static const double dimen_100 = 100;
  static const double dimen_110 = 110;
  static const double dimen_120 = 120;
  static const double dimen_125 = 125;
  static const double dimen_128 = 128;
  static const double dimen_130 = 130;
  static const double dimen_140 = 140;
  static const double dimen_150 = 150;
  static const double dimen_160 = 160;
  static const double dimen_180 = 180;
  static const double dimen_200 = 200;
  static const double dimen_230 = 230;
  static const double dimen_300 = 300;
}

Size displaySize(BuildContext context) {
  debugPrint('Size = ' + MediaQuery.of(context).size.toString());
  return MediaQuery.of(context).size;
}

double displayHeight(BuildContext context) {
  debugPrint('Height = ' + displaySize(context).height.toString());
  return displaySize(context).height;
}

double displayWidth(BuildContext context) {
  debugPrint('Width = ' + displaySize(context).width.toString());
  return displaySize(context).width;
}
