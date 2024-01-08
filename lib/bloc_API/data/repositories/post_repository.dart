
import 'package:dio/dio.dart';
import 'package:flutterbloc/bloc_API/data/models/post_model.dart';
import 'package:flutterbloc/bloc_API/data/repositories/api/api.dart';

class PostRepository {
  API api = API();

  Future<List<PostModel>> fetchPosts() async {
    try {
      Response response = await api.sendRequest.get("/posts");
      List<dynamic> postMaps = response.data;
      return postMaps.map((postMap) => PostModel.fromJson(postMap)).toList();
    } catch (error) {
      throw error;
    }
  }
}
