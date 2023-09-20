import 'dart:io';

import 'package:dio/dio.dart';
import 'package:exercise/202/service/post_model.dart';

class PostService {
  final String baseUrl = "https://jsonplaceholder.typicode.com/";

  late Dio dio;

  PostService() {
    dio = Dio(BaseOptions(baseUrl: baseUrl));
  }

  Future<bool> postItems(PostModel model) async {
    final response = await dio.post("posts", data: model.toJson());
    print(response.statusCode);

    return response.statusCode == HttpStatus.created;
  }

  Future<List<PostModel>?> getItems() async {
    try {
      final response = await dio.get("posts");

      if (response.statusCode == HttpStatus.ok) {
        final postsJson = response.data;

        if (postsJson is List) {
          return postsJson.map((e) => PostModel.fromJson(e)).toList();
        }
      }
    } on Exception catch (e) {
      return null;
    }

    return null;
  }

  Future<bool> updateItem(int id, PostModel model) async {
    try {
      final response =
          await dio.post("${_PostServicePaths.posts.name}/$id", data: model.toJson());
      return response.statusCode == HttpStatus.ok;
    } on Exception catch (e) {
      return false;
    }
  }

    Future<bool> deleteItem(int id) async {
    try {
      final response =
          await dio.delete("${_PostServicePaths.posts.name}/$id");
      return response.statusCode == HttpStatus.ok;
    } on Exception catch (e) {
      return false;
    }
  }
}

enum _PostServicePaths { posts, comments }
