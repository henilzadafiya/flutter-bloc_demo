import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart%20';
import 'package:flutter_block_demo_practice/bloc/posts/posts_bloc.dart';
import 'package:flutter_block_demo_practice/bloc/posts/posts_event.dart';
import 'package:flutter_block_demo_practice/bloc/posts/posts_state.dart';
import 'package:flutter_block_demo_practice/utils/enums.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<PostsBloc>().add(PostFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts APIs"),
      ),
      body: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
                hintText: 'Search With email', border: OutlineInputBorder()),
            onChanged: (value) {
              print(value);
              context.read<PostsBloc>().add(SearchItem(value));
            },
          ),
          Expanded(
            child: BlocBuilder<PostsBloc, PostsState>(
              builder: (context, state) {
                switch (state.postStatus) {
                  case PostStatus.loading:
                    return Center(child: CircularProgressIndicator());
                  case PostStatus.failure:
                    return Center(child: Text(state.message.toString()));
                  case PostStatus.success:
                    return state.searchMessage.isNotEmpty
                        ? Center(
                            child: Text(
                            state.searchMessage.toString(),
                          ))
                        : ListView.builder(
                            itemCount: state.tempPostList.isEmpty
                                ? state.postList.length
                                : state.tempPostList.length,
                            itemBuilder: (context, index) {
                              if (state.tempPostList.isNotEmpty) {
                                final item = state.tempPostList[index];
                                return Card(
                                  child: ListTile(
                                    title: Text(item.email.toString()),
                                    subtitle: Text(item.body.toString()),
                                  ),
                                );
                              } else {
                                final item = state.postList[index];
                                return Card(
                                  child: ListTile(
                                    title: Text(item.email.toString()),
                                    subtitle: Text(item.body.toString()),
                                  ),
                                );
                              }
                            },
                          );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
