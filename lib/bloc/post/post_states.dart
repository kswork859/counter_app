import 'package:counter_app/models/post_model.dart';
import 'package:counter_app/utils/enums.dart';
import 'package:equatable/equatable.dart';

class PostStates extends Equatable {
  final PostStatus postStatus;
  final List<PostModel> postList;
  final String message;

  const PostStates({
    this.postStatus = PostStatus.loading,
    this.postList = const [],
    this.message = "",
  });

  PostStates copyWith({
    PostStatus? postStatus,
    List<PostModel>? postList,
    String? message,
  }) {
    return PostStates(
      postStatus: postStatus ?? this.postStatus,
      postList: postList ?? this.postList,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [postStatus, postList, message];
}
