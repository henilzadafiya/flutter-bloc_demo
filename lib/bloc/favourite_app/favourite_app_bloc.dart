import 'package:flutter_bloc/flutter_bloc.dart%20';
import 'package:flutter_block_demo_practice/bloc/favourite_app/favourite_app_event.dart';
import 'package:flutter_block_demo_practice/bloc/favourite_app/favourite_app_state.dart';

import '../../model/favourite_item_model.dart';
import '../../repository/favourite_repository.dart';

class FavouriteBlock extends Bloc<FavouriteAppEvents, FavouriteItemStates> {
  FavoriteRepository favoriteRepository;
  List<FavouriteItemModel> favouriteList = [];
  List<FavouriteItemModel> tempFavouriteList = [];

  FavouriteBlock(this.favoriteRepository) : super(FavouriteItemStates()) {
    on<FetchFavouriteList>(_fetchList);
    on<FavouriteItem>(_addFavouriteItem);
    on<SelectItem>(_selectItem);
    on<UnSelectItem>(_unSelectItem);
    on<DeleteItem>(_deleteItem);
  }

  void _fetchList(FetchFavouriteList event,
      Emitter<FavouriteItemStates> emit) async {
    favouriteList = await favoriteRepository.fetchItem();
    emit(state.copyWith(
        favouriteItemList: List.from(favouriteList),
        listStatus: ListStatus.success));
  }

  void _addFavouriteItem(FavouriteItem event,
      Emitter<FavouriteItemStates> emit) async {
    final index = favouriteList.indexWhere(
          (element) => element.id == event.item.id,
    );

    if (event.item.isFavorite) {
      if (tempFavouriteList.contains(favouriteList[index])) {
        tempFavouriteList.remove(favouriteList[index]);
        tempFavouriteList.add(event.item);
      }
    } else {
      if (tempFavouriteList.contains(favouriteList[index])
      ) {
        tempFavouriteList.remove(favouriteList[index]);
        tempFavouriteList.add(event.item);
      }
    }

    favouriteList[index] = event.item;
    emit(state.copyWith(favouriteItemList: List.from(favouriteList),tempfavouriteItemList: List.from(tempFavouriteList)));
  }

  void _selectItem(SelectItem event, Emitter<FavouriteItemStates> emit) {
    tempFavouriteList.add(event.item);
    emit(state.copyWith(tempfavouriteItemList: List.from(tempFavouriteList)));
  }

  void _unSelectItem(UnSelectItem event, Emitter<FavouriteItemStates> emit) {
    tempFavouriteList.remove(event.item);
    emit(state.copyWith(tempfavouriteItemList: List.from(tempFavouriteList)));
  }

  void _deleteItem(DeleteItem event, Emitter<FavouriteItemStates> emit) {
    for (int i = 0; i < tempFavouriteList.length; i++) {
      favouriteList.remove(tempFavouriteList[i]);
    }
    tempFavouriteList.clear();

    emit(state.copyWith(
        favouriteItemList: List.from(favouriteList),
        tempfavouriteItemList: List.from(tempFavouriteList)));
  }
}
