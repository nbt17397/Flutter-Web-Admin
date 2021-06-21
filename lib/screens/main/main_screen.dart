import 'package:admin/bloc/menu/menu.dart';
import 'package:admin/common/my_progress_loading.dart';
import 'package:admin/controllers/MenuController.dart';
import 'package:admin/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'components/side_menu.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MenuBloc>().add(DrawerEvent(type: 0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
          child: Row(
        children: [
          Expanded(
            child: SideMenu(),
          ),
          Expanded(
            flex: 5,
            child: BlocBuilder<MenuBloc, MenuState>(
              builder: (context, state) {
                if (state is MenuLoading) {
                  return MyProgressLoading.loading;
                }
                if (state is MenuSuccess) {
                  return Builder(builder: (context) {
                    switch (state.type) {
                      case 1:
                        return Center(child: Text('11111'));
                      case 2:
                        return Center(child: Text('22222'));
                      case 3:
                        return Center(
                          child: Text('3333'),
                        );
                      default:
                        return DashboardScreen();
                    }
                  });
                }
                return SizedBox();
              },
            ),
          ),
        ],
      )),
    );
  }
}
