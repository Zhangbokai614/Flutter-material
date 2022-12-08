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

class DropDownMenu extends StatefulWidget {
  const DropDownMenu({
    super.key,
    required this.menu,
    this.collBack,
  });

  final List<MenuContent> menu;
  final Function(String item, int index)? collBack;

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  int _currentIndex = 0;
  int _selectedIndex = 0;
  String _selectedItem = '';

  @override
  Widget build(BuildContext context) {
    final menu = widget.menu;

    open(int index) {
      setState(() {
        index == _currentIndex ? _currentIndex = -1 : _currentIndex = index;
        _selectedItem = menu[index].title;
        _selectedIndex = -1;
      });
    }

    selected(String item, int index) {
      setState(() {
        _selectedItem = item;
        _selectedIndex = index;
      });
      if (widget.collBack != null) {
        widget.collBack!(item, index);
      }
    }

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          padding: const EdgeInsets.only(top: 32),
          color: Theme.of(context).colorScheme.secondary,
          child: ListView.builder(
            itemCount: menu.length,
            itemBuilder: (BuildContext context, int index) {
              return menu[index].separateHeadings
                  ? _Separate(
                      constraints: constraints,
                      title: menu[index].title,
                    )
                  : Flex(
                      direction: Axis.vertical,
                      children: [
                        Material(
                          color: Theme.of(context).colorScheme.secondary,
                          child: InkWell(
                            onTap: () => open(index),
                            child: _Menu(
                              constraints: constraints,
                              menu: menu[index],
                              open: index == _currentIndex,
                            ),
                          ),
                        ),
                        _SecondaryMenu(
                          constraints: constraints,
                          secondaryMenu: menu[index].children,
                          height: !(index == _currentIndex)
                              ? 0
                              : (constraints.maxHeight * 0.048) *
                                  menu[index].children.length,
                          open: index == _currentIndex,
                          selectedItem: _selectedItem,
                          selectedIndex: _selectedIndex,
                          itemOnTap: selected,
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

class _Menu extends StatelessWidget {
  const _Menu({
    required this.constraints,
    required this.menu,
    this.open = false,
  });

  final BoxConstraints constraints;
  final MenuContent menu;
  final bool open;

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
        left: (constraints.maxWidth * 0.12),
        right: (constraints.maxWidth * 0.09),
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
              offstage: constraints.maxWidth < 120,
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
                      open
                          ? Icons.keyboard_arrow_down_rounded
                          : Icons.keyboard_arrow_up_rounded,
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
    required this.constraints,
    required this.secondaryMenu,
    required this.height,
    required this.open,
    required this.selectedItem,
    required this.selectedIndex,
    required this.itemOnTap,
  });

  final BoxConstraints constraints;
  final List<String> secondaryMenu;
  final double height;
  final bool open;
  final String selectedItem;
  final int selectedIndex;
  final Function(String, int) itemOnTap;

  @override
  Widget build(BuildContext context) {
    final unSelectedColor = Theme.of(context).colorScheme.secondary;
    final selectedColor = Theme.of(context).colorScheme.onTertiary;
    final fontUnSelectedColor = Theme.of(context).textTheme.subtitle1!.color;
    final fontSelectedColor = Theme.of(context).colorScheme.primary;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 240),
      height: height,
      child: ListView.builder(
        padding: EdgeInsets.only(left: constraints.maxWidth * 0.25),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: secondaryMenu.length,
        itemBuilder: (BuildContext context, int index) {
          final item = secondaryMenu[index];
          return AnimatedContainer(
            duration: const Duration(milliseconds: 240),
            margin: EdgeInsets.only(right: constraints.maxWidth * 0.12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: open && selectedIndex == index
                  ? selectedColor
                  : unSelectedColor,
            ),
            child: Material(
              color: const Color.fromARGB(0, 0, 0, 0),
              child: InkWell(
                onTap: () => itemOnTap(selectedItem, index),
                child: Container(
                  margin: const EdgeInsets.all(12),
                  child: AutoSizeText(
                    item,
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: open && selectedIndex == index
                              ? fontSelectedColor
                              : fontUnSelectedColor,
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _Separate extends StatelessWidget {
  const _Separate({
    required this.constraints,
    required this.title,
  });

  final BoxConstraints constraints;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, bottom: 12),
      padding: EdgeInsets.only(left: constraints.maxWidth * 0.1),
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
