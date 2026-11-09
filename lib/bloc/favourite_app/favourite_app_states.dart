import 'package:counter_app/models/favourite_items_model.dart';
import 'package:equatable/equatable.dart';

enum ListStatus { loading, success, failure }

class FavouriteAppStates extends Equatable {
  final List<FavouriteItemsModel> favouriteItemList;
  final ListStatus listStatus;

  const FavouriteAppStates({
    this.favouriteItemList = const [],
    this.listStatus = ListStatus.loading,
  });

  FavouriteAppStates copyWith({
    List<FavouriteItemsModel>? favouriteItemList,
    ListStatus? listStatus,
  }) {
    return FavouriteAppStates(
      favouriteItemList: favouriteItemList ?? this.favouriteItemList,
      listStatus: listStatus ?? this.listStatus,
    );
  }

  @override
  List<Object?> get props => [favouriteItemList, listStatus];
}
