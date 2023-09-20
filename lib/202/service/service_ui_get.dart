import 'dart:io';

import 'package:dio/dio.dart';
import 'package:exercise/202/service/post_model.dart';
import 'package:exercise/202/service/post_service.dart';
import 'package:flutter/material.dart';

class ServiceUiGet extends StatefulWidget {
  const ServiceUiGet({Key? key}) : super(key: key);

  @override
  _ServiceUiGetState createState() => _ServiceUiGetState();
}

class _ServiceUiGetState extends State<ServiceUiGet> {
  List<PostModel>? _posts;
  late final Dio _dio;
  final String baseUrl = "https://jsonplaceholder.typicode.com/";

  bool _loadingStatus = false;
  late PostService _postService;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _postService = PostService();
    _dio = Dio(BaseOptions(baseUrl: baseUrl));
    getItemsAdvanced();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          _loadingStatus
              ? const CircularProgressIndicator.adaptive()
              : const SizedBox.shrink()
        ],
      ),
      body: ListView.builder(
        itemCount: _posts?.length ?? 3,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemBuilder: (context, index) {
          return _posts == null ? Placeholder() : _buildPostCard(post: _posts?[index]);
        },
      ),
    );
  }

  void _changeLoadingStatus() {
    setState(() {
      _loadingStatus = !_loadingStatus;
    });
  }

  void getItems() async {
    _changeLoadingStatus();
    String path = "https://jsonplaceholder.typicode.com/posts";
    final response = await Dio().get(path);

    if (response.statusCode == HttpStatus.ok) {
      final postsJson = response.data;

      if (postsJson is List) {
        setState(() {
          _posts = postsJson.map((e) => PostModel.fromJson(e)).toList();
        });
      }
    }

    _changeLoadingStatus();
  }

  void getItemsAdvanced() async {
    _changeLoadingStatus();
    _posts = await _postService.getItems();

    _changeLoadingStatus();
  }
}

class _buildPostCard extends StatelessWidget {
  const _buildPostCard({
    super.key,
    required PostModel? post,
  }) : _post = post;

  final PostModel? _post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Card(
        child: ListTile(
          title: Text(_post?.title ?? "Null"),
          subtitle: Text(_post?.body ?? "Null"),
        ),
      ),
    );
  }
}
