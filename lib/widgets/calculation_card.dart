import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class CalculationData {
  const CalculationData({
    required this.title,
    required this.value,
    required this.yoy,
  });

  final String title;
  final String value;
  final double yoy;
}

class CalculationCard extends StatelessWidget {
  const CalculationCard({super.key, required this.data});

  final CalculationData data;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          padding: EdgeInsets.only(
            left: constraints.maxWidth * 0.1,
            right: constraints.maxWidth * 0.1,
            top: constraints.maxHeight * 0.02,
            bottom: constraints.maxHeight * 0.02,
          ),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            color: Theme.of(context).colorScheme.primary,
          ),
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AutoSizeText(
                      data.title,
                      style: Theme.of(context).textTheme.subtitle2,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Icon(
                      Icons.more_vert_outlined,
                      size: constraints.maxHeight * 0.158,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                      flex: 5,
                      child: AutoSizeText(
                        '\$${data.value}',
                        style: Theme.of(context).textTheme.headline4,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.only(
                          left: constraints.maxWidth * 0.015,
                          right: constraints.maxWidth * 0.015,
                          top: constraints.maxHeight * 0.02,
                          bottom: constraints.maxHeight * 0.02,
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16)),
                          color: data.yoy > 0
                              ? Theme.of(context)
                                  .colorScheme
                                  .onTertiary
                                  .withAlpha(80)
                              : Theme.of(context)
                                  .colorScheme
                                  .tertiary
                                  .withAlpha(80),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                                data.yoy > 0
                                    ? Icons.arrow_upward_rounded
                                    : Icons.arrow_downward_rounded,
                                size: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .fontSize,
                                color: data.yoy > 0
                                    ? Theme.of(context).colorScheme.onTertiary
                                    : Theme.of(context).colorScheme.tertiary),
                            AutoSizeText(
                              '${data.yoy}%',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(
                                      color: data.yoy > 0
                                          ? Theme.of(context)
                                              .colorScheme
                                              .onTertiary
                                          : Theme.of(context)
                                              .colorScheme
                                              .tertiary),
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
