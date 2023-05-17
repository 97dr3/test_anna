import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  HomeBloc() : super(InitMainState()){
    on<AddItemHomeEvent>(addItem);
    on<RemoveItemHomeEvent>(removeItem);
  }

  int _itemCount = 0;
  List<String> _items = [];

  addItem(event, emit){
    _items.add("Item ${_itemCount++}");
    emit(AddItemHomeState(_items));
  }

  removeItem(event, emit){
    _items.remove(_items.last);
    _itemCount--;
    emit(AddItemHomeState(_items));
  }




}