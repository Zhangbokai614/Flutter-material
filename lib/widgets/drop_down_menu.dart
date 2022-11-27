import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class MenuContent {
  const MenuContent({
    required this.title,
    this.icon,
    this.messages = 0,
    this.background = false,
    this.separateHeadings = false,
    this.children = const <String>[],
  });

  final String title;
  final IconData? icon;
  final int messages;
  final bool background;
  final bool separateHeadings;
  final List<String> children;
}

class DropDownMenu extends StatelessWidget {
  const DropDownMenu({
    super.key,
    required this.menu,
  });

  final List<MenuContent> menu;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints containers) {
        return Container(
          padding: const EdgeInsets.only(top: 32),
          color: Theme.of(context).colorScheme.secondary,
          child: ListView.builder(
            itemCount: menu.length,
            itemBuilder: (BuildContext context, int index) {
              return menu[index].separateHeadings
                  ? _Separate(
                      containers: containers,
                      title: menu[index].title,
                    )
                  : Flex(
                      direction: Axis.vertical,
                      children: [
                        _Menu(
                          containers: containers,
                          menu: menu[index],
                        ),
                        Offstage(
                          offstage: menu[index].children.isEmpty,
                          child: _SecondaryMenu(
                            containers: containers,
                            secondaryMenu: menu[index].children,
                          ),
                        ),
                      ],
                    );
            },
          ),
        );
      },
    );
  }
}

class _Separate extends StatelessWidget {
  const _Separate({
    required this.containers,
    required this.title,
  });

  final BoxConstraints containers;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, bottom: 12),
      padding: EdgeInsets.only(left: containers.maxWidth * 0.1),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .headline6!
            .copyWith(color: Theme.of(context).textTheme.subtitle1!.color),
      ),
    );
  }
}

class _Menu extends StatelessWidget {
  const _Menu({
    required this.containers,
    required this.menu,
  });

  final BoxConstraints containers;
  final MenuContent menu;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: menu.background
            ? Theme.of(context).colorScheme.secondaryContainer
            : const Color.fromARGB(0, 0, 0, 0),
      ),
      padding: const EdgeInsets.all(8),
      margin: EdgeInsets.only(
        top: 8,
        bottom: 8,
        left: (containers.maxWidth * 0.12),
        right: (containers.maxWidth * 0.09),
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 12),
            child: Offstage(
              offstage: menu.icon == null,
              child: Icon(
                menu.icon,
                size: Theme.of(context).textTheme.headline6!.fontSize,
                color: Theme.of(context).textTheme.headline6!.color,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Offstage(
              offstage: containers.maxWidth < 120,
              child: AutoSizeText(
                menu.title,
                style: Theme.of(context).textTheme.headline6,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ),
          Offstage(
            offstage: menu.children.isEmpty && menu.messages == 0,
            child: Align(
              alignment: Alignment.centerRight,
              child: menu.children.isEmpty
                  ? Container(
                      padding: const EdgeInsets.all(1),
                      width: Theme.of(context).textTheme.headline6!.fontSize,
                      height: Theme.of(context).textTheme.headline6!.fontSize,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16)),
                          color: Theme.of(context).colorScheme.tertiary),
                      child: Text(
                        '${menu.messages}',
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    )
                  : Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Theme.of(context).colorScheme.primary,
                      size: Theme.of(context).textTheme.headline6?.fontSize,
                    ),
            ),
          )
        ],
      ),
    );
  }
}

class _SecondaryMenu extends StatelessWidget {
  const _SecondaryMenu({
    required this.containers,
    required this.secondaryMenu,
  });

  final BoxConstraints containers;
  final List<String> secondaryMenu;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(left: containers.maxWidth * 0.25),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: secondaryMenu.length,
      itemBuilder: (BuildContext context, int item) {
        return Container(
          margin: const EdgeInsets.all(12),
          child: AutoSizeText(
            secondaryMenu[item],
            style: Theme.of(context).textTheme.subtitle1,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        );
      },
    );
  }
}
