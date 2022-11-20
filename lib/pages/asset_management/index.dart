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
          onSecondary: const Color(0xff181818),
          tertiary: const Color(0xffff2424),
          onTertiary: const Color(0xff54b992),
          background: const Color(0xfff7f7f7),
        ),
        textTheme: const TextTheme(
          headline3: TextStyle(
            color: Color(0xff101828),
          ),
          headline5: TextStyle(
            color: Color(0xff101828),
          ),
          headline6: TextStyle(
            color: Color(0xffe6e6e6),
          ),
          subtitle1: TextStyle(
            color: Color(0xff9b9b9b),
          ),
          subtitle2: TextStyle(
            color: Color(0xff5b606b),
          ),
        ),
      ),
      child: HeadRowThreeParts(
        top: PageTop(),
        left: PageLeft(),
        middle: PageMiddle(),
        right: PageRight(),
      ),
    );
  }
}
