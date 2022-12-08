import 'package:flutter/material.dart';

class HeadRowThreeParts extends StatelessWidget {
  const HeadRowThreeParts({
    super.key,
    this.flex = const [86, 914, 184, 552, 264],
    this.top,
    this.left,
    this.middle,
    this.right,
  });

  final List<int> flex;
  final Widget? top;
  final Widget? left;
  final Widget? middle;
  final Widget? right;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        Expanded(
          flex: flex[0],
          child: _ShadowBox(
            child:
                top ?? Container(color: Theme.of(context).colorScheme.primary),
          ),
        ),
        Expanded(
          flex: flex[1],
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                flex: flex[2],
                child: _ShadowBox(
                  child: left ??
                      Container(color: Theme.of(context).colorScheme.primary),
                ),
              ),
              Expanded(
                flex: flex[3],
                child: _ShadowBox(
                  child: middle ??
                      Container(
                          color: Theme.of(context).colorScheme.background),
                ),
              ),
              Expanded(
                flex: flex[4],
                child: _ShadowBox(
                  child: right ??
                      Container(color: Theme.of(context).colorScheme.primary),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _ShadowBox extends StatelessWidget {
  const _ShadowBox({this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        boxShadow: const [
          BoxShadow(
            offset: Offset(2, 1),
            blurStyle: BlurStyle.normal,
            blurRadius: 2,
            color: Colors.black38,
          ),
        ],
      ),
      child: child ?? Container(),
    );
  }
}
