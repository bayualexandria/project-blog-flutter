import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as Storage;
import 'package:login/repository/repo.dart';

class AuthService {
  Dio dio = Dio();
  Storage.FlutterSecureStorage storage = const Storage.FlutterSecureStorage();
  final repository = Repo().url;

  Future<String> login(String email, String password) async {
    Response response = await dio.post('$repository/login',
        data: {'email': email, 'password': password},
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }));
    print(response.data);
    await storage.write(key: 'email', value: response.data['email']);
    if (response.statusCode == 200) {
      return response.data['access_token'];
    } else {
      return response.data['message'];
    }
  }

  Future<void> logout(String token) async {
    Response response = await dio.post('$repository/logout',
        options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': 'Bearer $token',
            },
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }));
    deleteToken();
    return response.data;
  }

  Future<void> deleteToken() async {
    storage.delete(key: 'token');
    storage.deleteAll();
  }

  Future<void> persisteToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  Future<bool> hasToken() async {
    var value = await storage.read(key: 'token');
    if (value != null) {
      return true;
    }
    return false;
  }

  Future token() async {
    String? response = await storage.read(key: 'token');
    return response;
  }

  Future email() async {
    String? response = await storage.read(key: 'email');
    return response;
  }
}
