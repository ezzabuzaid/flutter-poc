import 'package:learning_flutter/app/core/http.dart';
import 'package:learning_flutter/app/pages/portal/portal.model.dart';

class PortalService {
  // Future<LoginModel> fetchPost() async {
  //   final response = await http.get('$URL/posts/1');
  //   if (response.statusCode == 200) {
  //     return LoginModel.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception('Failed to load post');
  //   }
  // }

  Future login(LoginModel payload) {
    return http.post('portal/login', body: payload.toJson());
  }
}
