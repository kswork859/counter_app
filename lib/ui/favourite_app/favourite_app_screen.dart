import 'package:counter_app/bloc/favourite_app/favourite_app_bloc.dart';
import 'package:counter_app/bloc/favourite_app/favourite_app_events.dart';
import 'package:counter_app/bloc/favourite_app/favourite_app_states.dart';
import 'package:counter_app/models/favourite_items_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteAppScreen extends StatefulWidget {
  const FavouriteAppScreen({super.key});
  @override
  State<FavouriteAppScreen> createState() => _FavouriteAppScreenState();
}

class _FavouriteAppScreenState extends State<FavouriteAppScreen> {
  @override
  initState() {
    super.initState();
    context.read<FavouriteAppBloc>().add(FetchFavouriteList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite Item"),
        actions: [
          IconButton(
            onPressed: () {
              context.read<FavouriteAppBloc>().add(DeleteItem());
            },
            icon: Icon(Icons.delete),
          ),
        ],
      ),
      body: BlocBuilder<FavouriteAppBloc, FavouriteAppStates>(
        builder: (context, state) {
          switch (state.listStatus) {
            case ListStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case ListStatus.failure:
              return Text("Some thing Went Wrong!");
            case ListStatus.success:
              return ListView.builder(
                itemCount: state.favouriteItemList.length,
                itemBuilder: (context, index) {
                  final item = state.favouriteItemList[index];
                  return Card(
                    child: ListTile(
                      leading: Checkbox(
                        value: item.isDeleting,
                        onChanged: (value) {
                          FavouriteItemsModel favouriteItem =
                              FavouriteItemsModel(
                                id: item.id,
                                value: item.value,
                                isDeleting: item.isDeleting ? false : true,
                                isFavourite: item.isFavourite,
                              );
                          context.read<FavouriteAppBloc>().add(
                            SelectItem(item: favouriteItem),
                          );
                        },
                      ),
                      title: Text(item.value.toString()),
                      trailing: IconButton(
                        onPressed: () {
                          FavouriteItemsModel favouriteItem =
                              FavouriteItemsModel(
                                id: item.id,
                                value: item.value,
                                isFavourite: item.isFavourite ? false : true,
                                isDeleting: item.isDeleting,
                              );
                          context.read<FavouriteAppBloc>().add(
                            FavouriteItem(item: favouriteItem),
                          );
                        },
                        icon: Icon(
                          item.isFavourite
                              ? Icons.favorite
                              : Icons.favorite_outline,
                        ),
                      ),
                    ),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
