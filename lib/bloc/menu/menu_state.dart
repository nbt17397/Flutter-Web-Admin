import 'package:equatable/equatable.dart';

class MenuState extends Equatable {
  @override
  List<Object> get props => [];
}

class MenuInitial extends MenuState {}

class MenuLoading extends MenuState {}

class MenuSuccess extends MenuState {
  final int type;

  MenuSuccess({required this.type});
}

class MenuFailure extends MenuState {
  final String? error;

  MenuFailure({this.error});
}