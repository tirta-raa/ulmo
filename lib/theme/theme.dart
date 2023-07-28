import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle boldDisplay = const TextStyle(
  fontFamily: 'SF UI Display',
  fontWeight: FontWeight.w700,
);

TextStyle semiBoldDisplay = const TextStyle(
  fontFamily: 'SF UI Display',
  fontWeight: FontWeight.w600,
);

TextStyle regularDisplay = const TextStyle(
  fontFamily: 'SF UI Display',
  fontWeight: FontWeight.w400,
);

TextStyle lightDisplay = const TextStyle(
  fontFamily: 'SF UI Display',
  fontWeight: FontWeight.w300,
);

Color blueColor = const Color(0xFF69BCFC);

class MyThemes {
  static final darkTheme = ThemeData(
    colorScheme: const ColorScheme.dark(),
    scaffoldBackgroundColor: const Color(0xFF0D111F),
    primaryColor: Colors.white,
    cardColor: const Color(0xFF1A2035),
  );

  static final lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(),
    scaffoldBackgroundColor: Colors.white,
    primaryColor: const Color(0xFF152354),
    cardColor: const Color(0xFFF8F8FA),
  );
}

//sizebox
extension SizeBoxExtension on int {
  Widget get widthBox => SizedBox(width: w);

  Widget get heightBox => SizedBox(height: h);
}
