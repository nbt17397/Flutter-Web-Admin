import 'package:equatable/equatable.dart';

class MenuEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class DrawerEvent extends MenuEvent {
  final int type;
  final String title;
  DrawerEvent({required this.type,required this.title});
}
