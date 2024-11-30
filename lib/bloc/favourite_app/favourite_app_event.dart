import 'package:equatable/equatable.dart';

import '../../model/favourite_item_model.dart';

abstract class FavouriteAppEvents extends Equatable {
  const FavouriteAppEvents();

  @override
  List<Object> get props => [];
}

class FetchFavouriteList extends FavouriteAppEvents {}

class FavouriteItem extends FavouriteAppEvents {
  final FavouriteItemModel item;

  const FavouriteItem({required this.item});
}

class SelectItem extends FavouriteAppEvents {
  final FavouriteItemModel item;

  const SelectItem({required this.item});
}

class UnSelectItem extends FavouriteAppEvents {
  final FavouriteItemModel item;

  const UnSelectItem({required this.item});
}

class DeleteItem extends FavouriteAppEvents {

}