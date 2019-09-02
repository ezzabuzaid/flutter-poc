import 'package:learning_flutter/app/core/http/index.dart';
import 'package:learning_flutter/app/pages/register/register.model.dart';

class _RegisterService {
 
  Future register(RegisterModel payload) async {
    // print(payload.toJson());
    // final response =await http.post('users', body: payload.toJson());
    // return Response.fromJson(response.body);
    return http.post('users', body: payload.toJson());
  }
}

final registerService = _RegisterService();
