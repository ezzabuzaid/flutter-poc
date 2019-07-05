import 'package:learning_flutter/core/index.dart';

const URL = 'https://jsonplaceholder.typicode.com';

class PortalService {
  // Future<LoginModel> fetchPost() async {
  //   final response = await http.get('$URL/posts/1');
  //   if (response.statusCode == 200) {
  //     return LoginModel.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception('Failed to load post');
  //   }
  // }

  Future login(Map<String, dynamic> payload) async {
    return await http.post('$URL/posts/1', body: payload);
  }
}
