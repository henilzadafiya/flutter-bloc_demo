import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart%20';
import 'package:flutter_block_demo_practice/bloc/favourite_app/favourite_app_bloc.dart';
import 'package:flutter_block_demo_practice/bloc/favourite_app/favourite_app_event.dart';
import 'package:flutter_block_demo_practice/bloc/favourite_app/favourite_app_state.dart';
import 'package:flutter_block_demo_practice/model/favourite_item_model.dart';

class FavouriteAppScreen extends StatefulWidget {
  const FavouriteAppScreen({super.key});

  @override
  State<FavouriteAppScreen> createState() => _FavouriteAppScreenState();
}

class _FavouriteAppScreenState extends State<FavouriteAppScreen> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<FavouriteBlock>().add(FetchFavouriteList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite App"),
        actions: [
          BlocBuilder<FavouriteBlock, FavouriteItemStates>(
            builder: (context, state) {
              return Visibility(
                visible: state.tempfavouriteItemList.isNotEmpty ? true : false,
                child: IconButton(
                  onPressed: () {
                    context.read<FavouriteBlock>().add(DeleteItem());
                  },
                  icon: Icon(Icons.delete),
                  color: Colors.red,
                ),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<FavouriteBlock, FavouriteItemStates>(
          builder: (context, state) {
            switch (state.listStatus) {
              case ListStatus.loading:
                return Center(child: const CircularProgressIndicator());

              case ListStatus.failure:
                return const Text("Something went wrong");
              case ListStatus.success:
                return ListView.builder(
                  itemCount: state.favouriteItemList.length,
                  itemBuilder: (context, index) {
                    final item = state.favouriteItemList[index];
                    return Card(
                      child: ListTile(
                        leading: Checkbox(
                          value: state.tempfavouriteItemList.contains(item)
                              ? true
                              : false,
                          onChanged: (value) {
                            if (value!) {
                              context
                                  .read<FavouriteBlock>()
                                  .add(SelectItem(item: item));
                            } else {
                              context
                                  .read<FavouriteBlock>()
                                  .add(UnSelectItem(item: item));
                            }
                          },
                        ),
                        title: Text("${item.value}"),
                        trailing: IconButton(
                            onPressed: () {
                              FavouriteItemModel itemModel = FavouriteItemModel(
                                  id: item.id,
                                  value: item.value,
                                  isFavorite: item.isFavorite ? false : true);
                              context
                                  .read<FavouriteBlock>()
                                  .add(FavouriteItem(item: itemModel));
                            },
                            icon: Icon(item.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border)),
                      ),
                    );
                  },
                );
            }
          },
        ),
      ),
    );
  }
}
