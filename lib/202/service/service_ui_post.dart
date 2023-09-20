import 'dart:io';

import 'package:dio/dio.dart';
import 'package:exercise/202/service/post_model.dart';
import 'package:exercise/202/service/post_service.dart';
import 'package:flutter/material.dart';

class ServiceUiPost extends StatefulWidget {
  const ServiceUiPost({Key? key}) : super(key: key);

  @override
  _ServiceUiPostState createState() => _ServiceUiPostState();
}

class _ServiceUiPostState extends State<ServiceUiPost> {
  late final Dio _dio;
  final String baseUrl = "https://jsonplaceholder.typicode.com/";
  bool _loadingStatus = false;
  late PostService _postService;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  final TextEditingController _userIdController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _postService = PostService();
    _dio = Dio(BaseOptions(baseUrl: baseUrl));
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
        body: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(label: Text("Title")),
              textInputAction: TextInputAction.next,
            ),
            TextField(
              controller: _bodyController,
              decoration: const InputDecoration(label: Text("Body")),
              textInputAction: TextInputAction.next,
            ),
            TextField(
              controller: _userIdController,
              decoration: const InputDecoration(label: Text("Userid")),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.phone,
              autofillHints: const [AutofillHints.telephoneNumber],
            ),
            TextButton(
                onPressed: _loadingStatus
                    ? null
                    : () {
                        if (_titleController.text.isNotEmpty &&
                            _bodyController.text.isNotEmpty &&
                            _userIdController.text.isNotEmpty) {
                          final model = PostModel(
                              body: _bodyController.text,
                              title: _titleController.text,
                              userId: int.tryParse(_userIdController.text));

                          _postItems(model);
                        }
                      },
                child: Text("Send"))
          ],
        ));
  }

  void _changeLoadingStatus() {
    setState(() {
      _loadingStatus = !_loadingStatus;
    });
  }

  void _postItems(PostModel model) async {
    _changeLoadingStatus();
    final succesful = await _postService.postItems(model);

    if (succesful) {
      print("Success");
    }
    _changeLoadingStatus();
  }
}
