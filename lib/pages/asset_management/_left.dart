import 'package:flutter/material.dart';

class _MenuContent {
  const _MenuContent({
    required this.title,
    this.icon = null,
    this.action,
    this.background = false,
    this.children,
  });

  final String title;
  final IconData? icon;
  final Widget? action;
  final bool? background;
  final List<String>? children;
}

class PageLeft extends StatelessWidget {
  PageLeft({super.key});

  final List<_MenuContent> _menuContent = [
    const _MenuContent(
      icon: Icons.grid_view_rounded,
      title: 'Overview',
      background: true,
    ),
    const _MenuContent(
      icon: Icons.analytics_outlined,
      title: 'Analytics',
    ),
    const _MenuContent(
      icon: Icons.wallet_outlined,
      title: 'Transaction',
    ),
    const _MenuContent(
      icon: Icons.add_card_outlined,
      title: 'Card',
      children: [
        'Personal card',
        'Business card',
      ],
    ),
    const _MenuContent(
      icon: Icons.money,
      title: 'Payment',
    ),
    const _MenuContent(
      icon: Icons.currency_exchange_rounded,
      title: 'Currency exchange',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.secondary,
      padding: const EdgeInsets.only(left: 32, right: 24, top: 32),
      child: ListView.builder(
        itemCount: _menuContent.length,
        itemExtent: 82,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            children: [
              Offstage(
                offstage: _menuContent[index].icon == null,
                child: Icon(
                  _menuContent[index].icon,
                  size: Theme.of(context).textTheme.headline6!.fontSize,
                  color: Theme.of(context).textTheme.headline6!.color,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  _menuContent[index].title,
                  style: Theme.of(context).textTheme.headline6,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
