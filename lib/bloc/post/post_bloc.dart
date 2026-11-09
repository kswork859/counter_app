import 'package:counter_app/bloc/post/post_events.dart';
import 'package:counter_app/bloc/post/post_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:counter_app/repository/post_repositroy.dart';
import 'package:counter_app/utils/enums.dart';

class PostBloc extends Bloc<PostEvents, PostStates> {
  PostRepositroy postRepositroy = PostRepositroy();
  PostBloc(postRepositroy) : super(const PostStates()) {
    on<FetchPosts>(_fetchPosts);
  }

  void _fetchPosts(FetchPosts events, Emitter<PostStates> emit) async {
    await postRepositroy
        .fetchPost()
        .then((value) {
          emit(state.copyWith(postStatus: PostStatus.success, postList: value));
        })
        .onError((error, stackTrace) {
          emit(
            state.copyWith(
              postStatus: PostStatus.failure,
              message: error.toString(),
            ),
          );
        });
  }
}
