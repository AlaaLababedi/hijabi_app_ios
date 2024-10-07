import 'package:dio/dio.dart';

import '../../../../core/constants/app_url.dart';
import '../dioClient.dart';
import '../models/user_model.dart';
/*
class AuthRepository {
  Future<void> login(UserModel user) async {
    var url = Uri.parse(AppUrl.login);
    var headers = _getHeaders();

    Map<String, dynamic> body = {
      'email': user.email,
      'password': user.password,
      'fcm_token': 'alalalaal',
    };
    http.Response response =
        await http.post(url, body: jsonEncode(body), headers: headers);
    if (response.statusCode == 200) {
      return;
    } else {
      _handleErrorResponse(response);
    }
  }

  void _handleErrorResponse(http.Response response) {
    if (response.statusCode == 400) {
      if (response.body.contains('INVALID_CREDENTIALS')) {
        throw Exception('INVALID_CREDENTIALS');
      } else if (response.body.contains('RESOURCE_ALREADY_EXISTS')) {
        throw Exception('RESOURCE_ALREADY_EXISTS');
      }
    } else if (response.statusCode == 422) {
      if (response.body
          .contains('The email field must be a valid email address.')) {
        throw Exception('INVALID_EMAIL');
      } else if (response.body
          .contains('The password field must be at least 8 characters.')) {
        throw Exception('INVALID_PASSWORD_LENGTH');
      } else if (response.body.contains('The name field is required.')) {
        throw Exception('The name field is required.');
      } else {
        throw Exception('INVALID_INPUT');
      }
    } else if (response.statusCode == 404) {
      if (response.body.contains('RESOURCE_NOT_FOUND')) {
        throw Exception('EMAIL_NOT_FOUND');
      }
    } else if (response.statusCode == 500) {
      throw Exception('SERVER_ERROR');
    } else {
      throw Exception('UNKNOWN_ERROR');
    }
  }

  Future<void> register(UserModel user) async {
    var url = Uri.parse(AppUrl.register);
    var headers = _getHeaders();

    Map<String, dynamic> body = {
      'name': user.name,
      'email': user.email,
      'password': user.password,
    };
    http.Response response =
        await http.post(url, body: jsonEncode(body), headers: headers);
    if (response.statusCode == 200) {
      return;
    } else {
      _handleErrorResponse(response);
    }
  }

  Map<String, String> _getHeaders() {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }
}*/
class AuthRepository {
  final DioClient dioClient = DioClient();

  Future<void> login(UserModel user) async {
    var url = AppUrl.login;
    Map<String, dynamic> body = {
      'email': user.email,
      'password': user.password,
      'fcm_token': 'alalalaal',
    };

    try {
      Response response = await dioClient.dio.post(url, data: body);
      if (response.statusCode == 200) {
        // النجاح
      }
    } on DioError catch (e) {
      // إذا كان هناك خطأ، يمكنك التعامل معه هنا أو تركه للمتحكم (controller)
      throw Exception(e.error);
    }
  }

  Future<void> register(UserModel user) async {
    var url = AppUrl.register;
    Map<String, dynamic> body = {
      'name': user.name,
      'email': user.email,
      'password': user.password,
    };

    try {
      Response response = await dioClient.dio.post(url, data: body);
      if (response.statusCode == 200) {
        // النجاح
      }
    } on DioError catch (e) {
      throw Exception(e.error);
    }
  }
}
