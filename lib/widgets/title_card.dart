import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TitleCard extends StatelessWidget {
  const TitleCard({
    super.key,
    required this.child,
    this.action,
    this.title,
    this.color = Colors.white,
    this.margin,
  });

  final Widget child;
  final dynamic action;
  final dynamic title;
  final Color? color;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((BuildContext context, BoxConstraints constraints) {
        return Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          ),
          margin: margin,
          child: Flex(
            direction: Axis.vertical,
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: constraints.maxWidth * 0.03,
                  right: constraints.maxWidth * 0.03,
                  top: constraints.maxHeight * 0.086,
                  bottom: constraints.maxHeight * 0.086,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Offstage(
                      offstage: title == null,
                      child: title.runtimeType == String
                          ? AutoSizeText(
                              title,
                              style: Theme.of(context).textTheme.headline5,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            )
                          : title,
                    ),
                    Offstage(
                      offstage: action == null,
                      child: Container(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        alignment: Alignment.center,
                        height: constraints.maxHeight * 0.086,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                          border: Border.all(
                            width: 1,
                            color: Colors.grey.shade300,
                            style: BorderStyle.solid,
                          ),
                        ),
                        child: action.runtimeType == String
                            ? AutoSizeText(
                                action,
                                style: Theme.of(context).textTheme.bodyText1,
                                maxLines: 1,
                              )
                            : action,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SizedBox(
                  child: child,
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
