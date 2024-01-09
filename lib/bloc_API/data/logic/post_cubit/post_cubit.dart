import 'package:bloc/bloc.dart';
import 'package:flutterbloc/bloc_API/data/logic/post_cubit/post_state.dart';
import 'package:flutterbloc/bloc_API/data/models/post_model.dart';
import 'package:flutterbloc/bloc_API/data/repositories/post_repository.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostLoadingState()) {
    fetchPosts();
  }

  PostRepository postRepository = PostRepository();
  void fetchPosts() async {
    try {
      List<PostModel> posts = await postRepository.fetchPosts();
      emit(PostLoadedState(posts: posts));
    } catch (error) {
      emit(
        PostErrorState(
          error: error.toString(),
        ),
      );
    }
  }
}
