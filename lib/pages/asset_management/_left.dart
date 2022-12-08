import 'package:flutter/material.dart';

import '../../widgets/drop_down_menu.dart';

class PageLeft extends StatelessWidget {
  PageLeft({super.key});

  final List<MenuContent> _menuContent = [
    const MenuContent(
      icon: Icons.grid_view_rounded,
      title: 'Overview',
      background: true,
    ),
    const MenuContent(
      icon: Icons.analytics_outlined,
      title: 'Analytics',
    ),
    const MenuContent(
      icon: Icons.wallet_outlined,
      title: 'Transaction',
      messages: 2,
    ),
    const MenuContent(
      icon: Icons.add_card_outlined,
      title: 'Card',
      messages: 3,
      children: [
        'Personal card',
        'Business card',
      ],
    ),
    const MenuContent(
      icon: Icons.money,
      title: 'Payment',
    ),
    const MenuContent(
      icon: Icons.currency_exchange_rounded,
      title: 'Currency exchange',
    ),
    const MenuContent(
      title: 'Account',
      separateHeadings: true,
    ),
    const MenuContent(
      icon: Icons.settings,
      title: 'Settings',
    ),
    const MenuContent(
      icon: Icons.manage_accounts_rounded,
      title: 'Manage card',
      children: [
        'Testing',
        'Testing',
        'Testing',
        'Testing',
        'Testing',
        'Testing',
      ],
    ),
    const MenuContent(
      icon: Icons.phone,
      title: 'Call center',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DropDownMenu(
      menu: _menuContent,
      collBack: (item, index) => {print('${item}: ${index}')},
    );
  }
}
