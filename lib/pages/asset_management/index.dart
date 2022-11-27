import 'package:flutter/material.dart';

import '../../widgets/layout/head_row_three_parts.dart';
import '_top.dart';
import '_left.dart';
import '_middle.dart';
import '_right.dart';

class AssetManagementPage extends StatelessWidget {
  const AssetManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        colorScheme: const ColorScheme.light().copyWith(
          primary: Colors.white,
          secondary: const Color(0xff1b1b1b),
          secondaryContainer: const Color(0xff323232),
          onSecondary: const Color(0xff181818),
          tertiary: const Color(0xffff2424),
          onTertiary: const Color(0xff54b992),
          background: const Color(0xfff7f7f7),
        ),
        textTheme: const TextTheme(
          headline4: TextStyle(
            color: Color(0xff101828),
            fontWeight: FontWeight.w600,
          ),
          headline5: TextStyle(
            color: Color(0xff101828),
            fontWeight: FontWeight.w600,
          ),
          headline6: TextStyle(
            color: Color(0xffe6e6e6),
            fontWeight: FontWeight.w400,
          ),
          subtitle1: TextStyle(
            color: Color(0xff9b9b9b),
          ),
          subtitle2: TextStyle(
            color: Color(0xff5b606b),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      child: HeadRowThreeParts(
        top: PageTop(),
        left: PageLeft(),
        middle: const PageMiddle(),
        right: PageRight(),
      ),
    );
  }
}
