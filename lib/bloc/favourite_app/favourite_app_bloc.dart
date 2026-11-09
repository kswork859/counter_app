import 'package:counter_app/bloc/favourite_app/favourite_app_events.dart';
import 'package:counter_app/bloc/favourite_app/favourite_app_states.dart';
import 'package:counter_app/models/favourite_items_model.dart';
import 'package:counter_app/repository/favourite_repositroy.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteAppBloc extends Bloc<FavouriteAppEvents, FavouriteAppStates> {
  final FavouriteRepositroy _favouriteRepositroy;
  List<FavouriteItemsModel> favouriteList = [];

  FavouriteAppBloc(this._favouriteRepositroy)
    : super(const FavouriteAppStates()) {
    on<FetchFavouriteList>(_fetchList);
    on<FavouriteItem>(_toggleFavourite);
    on<SelectItem>(_selectItems);
    on<DeleteItem>(_deleteItems);
  }

  void _fetchList(
    FavouriteAppEvents events,
    Emitter<FavouriteAppStates> emit,
  ) async {
    favouriteList = await _favouriteRepositroy.fetchItem();
    emit(
      state.copyWith(
        favouriteItemList: List.from(favouriteList),
        listStatus: ListStatus.success,
      ),
    );
  }

  void _toggleFavourite(
    FavouriteItem events,
    Emitter<FavouriteAppStates> emit,
  ) {
    final index = favouriteList.indexWhere(
      (element) => element.id == events.item.id,
    );
    favouriteList[index] = events.item;

    emit(state.copyWith(favouriteItemList: List.from(favouriteList)));
  }

  void _selectItems(SelectItem events, Emitter<FavouriteAppStates> emit) {
    final index = favouriteList.indexWhere(
      (element) => element.id == events.item.id,
    );
    favouriteList[index] = events.item;

    emit(state.copyWith(favouriteItemList: List.from(favouriteList)));
  }

  void _deleteItems(DeleteItem events, Emitter<FavouriteAppStates> emit) {
    favouriteList.removeWhere((element) => element.isDeleting == true);
    emit(state.copyWith(favouriteItemList: List.from(favouriteList)));
  }
}
