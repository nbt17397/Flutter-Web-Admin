import 'package:admin/bloc/menu/menu.dart';
import 'package:admin/constants.dart';
import 'package:admin/models/drawer_item.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          InkWell(
            onTap: () => context
                .read<MenuBloc>()
                .add(DrawerEvent(type: 0, title: 'Action')),
            child: DrawerHeader(
              child: Image.asset("assets/images/logo.png"),
            ),
          ),
          BlocBuilder<MenuBloc, MenuState>(
            builder: (context, state) {
              if (state is MenuSuccess) {
                return _menu(context, state.type);
              }
              return _menu(context, -1);
            },
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: ExpansionTileCard(
              elevation: 0,
              title: Text(
                'Action',
                style: TextStyle(color: Colors.white54),
                maxLines: 1,
              ),
              expandedTextColor: Colors.white54,
              expandedColor: bgColor,
              leading: SvgPicture.asset(
                "assets/icons/menu_doc.svg",
                color: Colors.white54,
                height: 16,
              ),
              children: [
                DrawerListTile(
                    title: "Xuất excel",
                    isSelected: false,
                    svgSrc: "assets/icons/menu_dashbord.svg",
                    press: () {
                      context
                          .read<MenuBloc>()
                          .add(DrawerEvent(type: 11, title: 'Xuất excel'));
                    }),
                DrawerListTile(
                    title: "Action",
                    isSelected: false,
                    svgSrc: "assets/icons/menu_dashbord.svg",
                    press: () => context
                        .read<MenuBloc>()
                        .add(DrawerEvent(type: 1, title: 'Action'))),
                DrawerListTile(
                    title: "Action",
                    isSelected: false,
                    svgSrc: "assets/icons/menu_dashbord.svg",
                    press: () => context
                        .read<MenuBloc>()
                        .add(DrawerEvent(type: 1, title: 'Action'))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _menu(BuildContext context, int type) {
    return Column(
      children: [
        ...listMenuItem
            .map((e) => DrawerListTile(
                isSelected: (e.type == type) ? true : false,
                title: e.title,
                svgSrc: e.svgSrc,
                press: () => context
                    .read<MenuBloc>()
                    .add(DrawerEvent(type: e.type, title: e.title))))
            .toList(),
      ],
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.svgSrc,
    required this.press,
    required this.isSelected,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListTile(
        selected: isSelected,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        selectedTileColor: Colors.blue,
        onTap: press,
        horizontalTitleGap: 0.0,
        leading: SvgPicture.asset(
          svgSrc,
          color: Colors.white54,
          height: 16,
        ),
        title: Text(
          title,
          style: TextStyle(color: Colors.white54),
          maxLines: 1,
        ),
      ),
    );
  }
}
