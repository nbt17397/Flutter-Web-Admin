import 'package:admin/bloc/menu/menu_event.dart';
import 'package:admin/bloc/menu/menu_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuBloc(MenuState initialState) : super(initialState);

  @override
  Stream<MenuState> mapEventToState(MenuEvent event) async* {
    if (event is DrawerEvent) {
      yield MenuLoading();
      print("Loading");
      try {
        await Future.delayed(
            Duration(
              milliseconds: 300,
            ),
            () {});
        yield MenuSuccess(type: event.type);
        print("Loaded");
      } catch (e, s) {
        print(e);
        print(s);
        yield MenuFailure(error: e.toString());
      }
    }
  }
}
