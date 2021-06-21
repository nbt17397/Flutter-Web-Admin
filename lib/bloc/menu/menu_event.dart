import 'package:equatable/equatable.dart';

class MenuEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class DrawerEvent extends MenuEvent {
  final int type;
  DrawerEvent({required this.type});
}
