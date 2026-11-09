import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:counter_app/models/post_model.dart';

class PostRepositroy {
  Future<List<PostModel>> fetchPost() async {
    try {
      final response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/comments"),
      );
      if (response.statusCode == 200) {
        final body = json.decode(response.body) as List;
        return body.map((e) {
          return PostModel(
            postId: e['postId'] as int,
            email: e['email'] as String,
            body: e['body'] as String,
            name: e['name'] as String,
          );
        }).toList();
      }
    } on SocketException {
      throw Exception('error while fetcting data');
    } on TimeoutException {
      throw Exception('timeout exception has occured');
    }
    throw Exception('error while fetcting data');
  }
}
