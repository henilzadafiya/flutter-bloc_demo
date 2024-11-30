import 'package:equatable/equatable.dart';
import 'package:flutter_block_demo_practice/model/post_model.dart';
import 'package:flutter_block_demo_practice/utils/enums.dart';

class PostsState extends Equatable {
  final PostStatus postStatus;
  final List<PostModel> postList;
  final String message;

  PostsState(
      {this.postStatus = PostStatus.loading,
      this.postList = const <PostModel>[],
      this.message = ''});

  PostsState copyWith(
      {PostStatus? postStatus, List<PostModel>? postList, String? message}) {
    return PostsState(
      postStatus: postStatus ?? this.postStatus,
      postList: postList ?? this.postList,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [];
}
