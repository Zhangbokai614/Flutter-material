import 'package:flutter/material.dart';

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
          secondary: const Color(0x001b1b1b),
          onSecondary: const Color(0x00181818),
          tertiary: const Color(0x00ff2424),
          onTertiary: const Color(0x0054b992),
          background: const Color(0x00f7f7f7),
        ),
        textTheme: const TextTheme(
          headline3: TextStyle(
            color: Color(0x00101828),
          ),
          headline5: TextStyle(
            color: Color(0x00101828),
          ),
          bodyText1: TextStyle(
            color: Color(0x00e6e6e6),
          ),
          bodyText2: TextStyle(
            color: Color(0x009b9b9b),
          ),
          subtitle2: TextStyle(
            color: Color(0x005b606b),
          ),
        ),
      ),
      child: Flex(
        direction: Axis.vertical,
        children: [
          const Expanded(
            flex: 86,
            child: PageTop(),
          ),
          Expanded(
            flex: 914,
            child: Flex(
              direction: Axis.horizontal,
              children: const [
                Expanded(
                  flex: 184,
                  child: PageLeft(),
                ),
                Expanded(
                  flex: 552,
                  child: PageMiddle(),
                ),
                Expanded(
                  flex: 264,
                  child: PageRight(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
