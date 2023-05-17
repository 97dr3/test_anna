import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class AddItemHomeEvent extends HomeEvent {
  @override
  List<Object> get props => [double.nan];
}

class RemoveItemHomeEvent extends HomeEvent {
  @override
  List<Object> get props => [double.nan];
}