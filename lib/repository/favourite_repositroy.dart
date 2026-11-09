import 'package:counter_app/models/favourite_items_model.dart';

class FavouriteRepositroy {
  Future<List<FavouriteItemsModel>> fetchItem() async {
    await Future.delayed(const Duration(seconds: 3));
    return List.of(_generateList(10));
  }

  List<FavouriteItemsModel> _generateList(int length) {
    return List.generate(
      length,
      (index) => FavouriteItemsModel(id: index.toString(), value: "Item$index"),
    );
  }
}
