import 'package:bloc/bloc.dart';
import 'package:flutter_block_demo_practice/bloc/posts/posts_event.dart';
import 'package:flutter_block_demo_practice/bloc/posts/posts_state.dart';
import 'package:flutter_block_demo_practice/repository/post_repository.dart';
import 'package:flutter_block_demo_practice/utils/enums.dart';
import 'package:meta/meta.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostRepository postRepository = PostRepository();

  PostsBloc() : super(PostsState()) {
    on<PostFetched>(fetchPostApi);
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
}
