import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as Storage;
import 'package:login/repository/repo.dart';
import 'package:login/screens/user/model/user_model.dart';

class UserService {
  Dio dio = Dio();
  Storage.FlutterSecureStorage storage = const Storage.FlutterSecureStorage();
  final repository = Repo().url;

  Future<User> getUser() async {
    final token = await storage.read(key: 'token');
    final email = await storage.read(key: 'email');
    try {
      Response response = await dio.get('$repository/user/$email',
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
      print(response.data);
      User user = User.fromJson(response.data);
      return user;
    } catch (error) {
      print(error);
      throw Exception(error.toString());
    }
  }

  Future<Response> updateUser(String name) async {
    final token = await storage.read(key: 'token');
    final email = await storage.read(key: 'email');
    try {
      Response response = await dio.put('$repository/user/$email',
          data: {'name': name},
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
      // print(response.data);
      // User user = User.fromJson(response.data);
      return response;
    } catch (error) {
      print(error);
      throw Exception(error.toString());
    }
  }
}
