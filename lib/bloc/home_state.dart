import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class InitMainState extends HomeState {}

class AddItemHomeState extends HomeState {
  final List<String> items;
  const AddItemHomeState(this.items);

  @override
  List<Object> get props => [double.nan, items];
}