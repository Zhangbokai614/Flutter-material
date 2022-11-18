import 'package:flutter/material.dart';

class AssetManagementPage extends StatelessWidget {
  const AssetManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        const Flexible(child: Text('top')),
        Flexible(
          child: Flex(
            direction: Axis.horizontal,
            children: const [
              Text('left'),
              Text('middle'),
              Text('Right'),
            ],
          ),
        )
      ],
    );
  }
}
