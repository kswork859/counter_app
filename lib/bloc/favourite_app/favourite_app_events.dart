import 'package:counter_app/models/favourite_items_model.dart';
import 'package:equatable/equatable.dart';

abstract class FavouriteAppEvents extends Equatable {
  const FavouriteAppEvents();

  @override
  List<Object?> get props => [];
}

class FetchFavouriteList extends FavouriteAppEvents {}

class FavouriteItem extends FavouriteAppEvents {
  final FavouriteItemsModel item;

  const FavouriteItem({required this.item});
}

class SelectItem extends FavouriteAppEvents {
  final FavouriteItemsModel item;
  const SelectItem({required this.item});
}

class DeleteItem extends FavouriteAppEvents {}
