import 'package:bloc/bloc.dart';
import 'package:flutter_block_demo_practice/bloc/posts/posts_event.dart';
import 'package:flutter_block_demo_practice/bloc/posts/posts_state.dart';
import 'package:flutter_block_demo_practice/repository/post_repository.dart';
import 'package:flutter_block_demo_practice/utils/enums.dart';
import 'package:meta/meta.dart';

import '../../model/post_model.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  List<PostModel> tempPostList = [];

  PostRepository postRepository = PostRepository();

  PostsBloc() : super(PostsState()) {
    on<PostFetched>(fetchPostApi);
    on<SearchItem>(filterList);
  }

  void fetchPostApi(PostFetched event, Emitter<PostsState> emit) async {
    await postRepository.fetchPost().then(
      (value) {
        emit(state.copyWith(
            postStatus: PostStatus.success,
            message: 'Success',
            postList: value));
      },
    ).onError(
      (error, stackTrace) {
        print(error);
        print(stackTrace);
        emit(state.copyWith(
            postStatus: PostStatus.failure, message: error.toString()));
      },
    );
  }

  void filterList(SearchItem event, Emitter<PostsState> emit) {
    if (event.stSearch.isEmpty) {
      emit(state.copyWith(tempPostList: [] , searchMessage: ''));
    } else {
      // tempPostList = state.postList.where((element) => element.email.toString() == event.stSearch.toString()).toList();
      tempPostList = state.postList.where((element) => element.email.toString().toLowerCase().contains(event.stSearch.toLowerCase())).toList();
      if(tempPostList.isEmpty){
        emit(state.copyWith(tempPostList: tempPostList,searchMessage: 'No data Found'));
      } else {
        emit(state.copyWith(tempPostList: tempPostList,searchMessage: ''));
      }
    }
  }
}
