import 'package:equatable/equatable.dart';
import 'package:flutter_block_demo_practice/model/post_model.dart';
import 'package:flutter_block_demo_practice/utils/enums.dart';

class PostsState extends Equatable {
  final PostStatus postStatus;
  final List<PostModel> postList;
  final List<PostModel> tempPostList;
  final String message;
  final String searchMessage;

  PostsState(
      {this.postStatus = PostStatus.loading,
      this.postList = const <PostModel>[],
      this.tempPostList = const <PostModel>[],
      this.message = '',
      this.searchMessage =''});

  PostsState copyWith(
      {PostStatus? postStatus, List<PostModel>? postList, String? message,List<PostModel>? tempPostList,String? searchMessage}) {
    return PostsState(
      postStatus: postStatus ?? this.postStatus,
      postList: postList ?? this.postList,
      message: message ?? this.message,
      tempPostList: tempPostList ?? this.tempPostList,
      searchMessage: searchMessage ?? this.searchMessage,
    );
  }

  @override
  List<Object?> get props => [postStatus,postList,tempPostList,message,searchMessage];
}
