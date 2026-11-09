import 'package:counter_app/bloc/post/post_bloc.dart';
import 'package:counter_app/bloc/post/post_events.dart';
import 'package:counter_app/bloc/post/post_states.dart';
import 'package:counter_app/utils/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PostBloc>().add(FetchPosts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("API POSTS")),
      body: BlocBuilder<PostBloc, PostStates>(
        builder: (context, state) {
          switch (state.postStatus) {
            case PostStatus.loading:
              return Center(child: CircularProgressIndicator());
            case PostStatus.failure:
              return Text(state.message.toString());
            case PostStatus.success:
              return ListView.builder(
                itemCount: state.postList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.postList[index].name.toString()),
                    trailing: Text(state.postList[index].email.toString()),
                    subtitle: Text(state.postList[index].body.toString()),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
