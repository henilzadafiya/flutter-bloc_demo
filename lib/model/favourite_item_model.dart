import 'package:equatable/equatable.dart';

class FavouriteItemModel extends Equatable {
  final String id;
  final String value;
  final bool isDeleting;
  final bool isFavorite;

  FavouriteItemModel(
      {required this.id,
      required this.value,
      this.isDeleting = false,
      this.isFavorite = false});

  FavouriteItemModel copyWith(
      {String? id, String? value, bool? isDeleting, bool? isFavorite}) {
    return FavouriteItemModel(
        id: id ?? this.id,
        value: value ?? this.value,
        isDeleting: isDeleting ?? this.isDeleting,
        isFavorite: isFavorite ?? this.isFavorite);
  }

  @override
  List<Object?> get props => [id, value, isDeleting, isFavorite];
}
