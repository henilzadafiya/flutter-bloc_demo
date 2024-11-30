import 'package:equatable/equatable.dart';
import 'package:flutter_block_demo_practice/model/favourite_item_model.dart';

enum ListStatus { loading, success, failure }

class FavouriteItemStates extends Equatable {
  final List<FavouriteItemModel> favouriteItemList;
  final List<FavouriteItemModel> tempfavouriteItemList;
  final ListStatus listStatus;

  FavouriteItemStates({this.tempfavouriteItemList = const [],
      this.favouriteItemList = const [],
      this.listStatus = ListStatus.loading});

  FavouriteItemStates copyWith(
      {List<FavouriteItemModel>? favouriteItemList, ListStatus? listStatus,List<FavouriteItemModel> ? tempfavouriteItemList}) {
    return FavouriteItemStates(
        favouriteItemList: favouriteItemList ?? this.favouriteItemList,
        listStatus: listStatus ?? this.listStatus,tempfavouriteItemList: tempfavouriteItemList ?? this.favouriteItemList);
  }

  @override
  List<Object?> get props => [favouriteItemList,listStatus,tempfavouriteItemList];
}
